drop table if exists qz_order_details;
drop table if exists qz_orders;
drop table if exists qz_customers;
create table if not exists qz_customers
(cust_id integer primary key,
 customer varchar2(20 char) not null UNIQUE
 );

drop table if exists qz_orders;
create table if not exists qz_orders
(
    order_id integer primary key,
    cust_id references qz_customers(cust_id) not null,
    order_date date not null,
    order_month as (extract(month from order_date))
);

drop table if exists qz_order_details;
create table if not exists qz_order_details
(
    order_dtl_id integer generated always as identity primary key,
    order_id references qz_orders(order_id) not null,
    item varchar2(20 char) not null,
    qty integer not null,
    unit_price number(8,2) not null,
    ext_price as (qty * unit_price),
    is_discounted boolean default false not null
);

create or replace view qz_customer_orders_by_month as
select c.cust_id, c.customer, o.order_month, sum(d.ext_price) as totals
from
    qz_customers c
    join qz_orders o on c.cust_id = o.cust_id
    join qz_order_details d on o.order_id = d.order_id
group by c.cust_id, c.customer,o.order_month;

insert into qz_customers(cust_id,customer)
values(1,'abc'),(2,'xyz'),(3,'qrs');

insert into qz_orders(order_id, cust_id, order_date)
values
    (1,1,to_date('2024-05-15','YYYY-MM-DD')),(2,1,to_date('2024-06-01','YYYY-MM-DD')),
    (3,2,to_date('2024-06-03','YYYY-MM-DD')),(4,2,to_date('2024-06-05','YYYY-MM-DD')),
    (5,3,to_date('2024-06-07','YYYY-MM-DD')),(6,3,to_date('2024-06-11','YYYY-MM-DD'));

insert into qz_order_details(order_id,item,qty,unit_price)
values
    (1,'gaming laptop',7,1500),(1,'mouse',7,75),(1,'keyboard',7,45),
    (2,'gaming laptop',4,1500),(2,'mouse',4,75),(2,'keyboard',4,45),
    (3,'gaming laptop',4,1500),(3,'mouse',4,75),(3,'keyboard',4,45),        
    (4,'gaming laptop',6,1500),(4,'mouse',6,75),(4,'keyboard',6,45),
    (5,'gaming laptop',3,1500),(5,'mouse',3,75),(5,'keyboard',3,45),        
    (6,'gaming laptop',2,1500),(6,'mouse',2,75),(6,'keyboard',2,45);

commit;            


PROMPT
PROMPT ************** Setup Ends ****************
PROMPT

PROMPT
PROMPT ************** Test Starts ****************
PROMPT

select value from v$NLS_PARAMETERS
where parameter = 'NLS_DATE_FORMAT';

alter session set NLS_DATE_FORMAT = 'yyyy-mm-dd';

select value from v$NLS_PARAMETERS
where parameter = 'NLS_DATE_FORMAT';

Prompt calling 2024-jun-29-Setup.sql Setup script
@2024-jun-29-setup.sql;

Prompt Customer Monthly Totals Before Applying Volume Discount
select customer, order_month, totals
from qz_customer_orders_by_month;

set serveroutput on;

BEGIN
    dbms_output.put_line('***************Option 1****************');
    update QZ_ORDER_DETAILS d
    set 
        d.unit_price = d.unit_price * 0.85,
        d.is_discounted = true
    where
        d.qty > 5
        and not d.is_discounted
        and d.order_id in (select o.order_id 
                             from qz_orders o 
                            where (o.order_month, o.cust_id) in (select c.order_month, c.cust_id 
                                                                   from qz_customer_orders_by_month c 
                                                                   where c.totals > 10000));
EXCEPTION
    when others then
        rollback;
        dbms_output.put_line(sqlerrm);
end;
/

Prompt Customer Monthly Totals After Applying Discount
select customer,order_month,totals
from qz_customer_orders_by_month;

rollback;

BEGIN
    dbms_output.put_line('***************Option 2****************');
    update QZ_ORDER_DETAILS d
    set 
        d.unit_price = d.unit_price * 0.85,
        d.is_discounted = true
    where
        d.qty > 5
        and exists (
            select 'Order in a month where customer orders exceed 10,000'
            from 
                qz_orders o
                join qz_customer_orders_by_month c
                    on o.cust_id = c.cust_id and o.order_month = c.order_month
            where o.order_id = d.order_id 
            and c.totals > 10000);
EXCEPTION
    when others then
        rollback;
        dbms_output.put_line(sqlerrm);
end;
/

Prompt Customer Monthly Totals After Applying Discount
select customer,order_month,totals
from qz_customer_orders_by_month;

rollback;

BEGIN
    dbms_output.put_line('***************Option 3****************');
    update QZ_ORDER_DETAILS d
    set 
        d.unit_price = d.unit_price * 0.85,
        d.is_discounted = true
    from qz_orders o
         join qz_customer_orders_by_month c
         on o.cust_id = c.cust_id and o.order_month = c.order_month
         where d.order_id = o.order_id
           and c.totals > 10000
           and d.qty > 5
           and not d.is_discounted;
EXCEPTION
    when others then
        rollback;
        dbms_output.put_line(sqlerrm);
end;
/

Prompt Customer Monthly Totals After Applying Discount
select customer,order_month,totals
from qz_customer_orders_by_month;

rollback;

-- BEGIN
--     dbms_output.put_line('***************Option 4****************');
--     update QZ_ORDER_DETAILS d
--     set 
--         d.unit_price = d.unit_price * 0.85,
--         d.is_discounted = true
--     where d.qty > 5
--           and not d.is_discounted
--      from qz_orders o
--           join qz_customer_orders_by_month c
--                on o.cust_id = c.cust_id and o.order_month = c.order_month
--     where d.order_id = o.order_id
--           and c.totals > 10000;
-- EXCEPTION
--     when others then
--         rollback;
--         dbms_output.put_line(sqlerrm);
-- end;
-- /

-- Prompt Customer Monthly Totals After Applying Discount
-- select customer,order_month,totals
-- from qz_customer_orders_by_month;

BEGIN
    dbms_output.put_line('***************Option 5****************');
    update (
        select d.unit_price, d.is_discounted
        from qz_order_details d
            join qz_orders o on d.order_id = o.order_id
            join qz_customer_orders_by_month c
                on o.cust_id = c.cust_id and o.order_month = c.order_month
        where c.totals > 10000
            and d.qty > 5
            and not d.is_discounted)
    set 
        unit_price = unit_price * 0.85,
        is_discounted = true;
EXCEPTION
    when others then
        rollback;
        dbms_output.put_line(sqlerrm);
end;
/

rollback;

Prompt Customer Monthly Totals After Applying Discount
select customer,order_month,totals
from qz_customer_orders_by_month;

-- BEGIN
--     dbms_output.put_line('***************Option 6****************');
--     update qz_order_details d
--     join qz_orders o on d.order_id = o.order_id
--     join qz_custome_orders_by_month c
--     on o.cust_id = c.cust_id and o.order_month = c.order_month
--     set 
--         unit_price = unit_price * 0.85,
--         is_discounted = true
--     where c.totals > 10000
--       and d.qty > 5
--       and not d.is_discounted;        
-- EXCEPTION
--     when others then
--         rollback;
--         dbms_output.put_line(sqlerrm);
-- end;
-- /

Prompt Customer Monthly Totals After Applying Discount
select customer,order_month,totals
from qz_customer_orders_by_month;

rollback;

Prompt Customer Monthly Totals After Applying Discount
select customer,order_month,totals
from qz_customer_orders_by_month;

-- BEGIN
--     dbms_output.put_line('***************Option 7****************');
--     update qz_order_details d
--     set 
--         unit_price = unit_price * 0.85,
--         is_discounted = true
--     join qz_orders o on d.order_id = o.order_id
--     join qz_custome_orders_by_month c
--         on o.cust_id = c.cust_id and o.order_month = c.order_month        
--     where c.totals > 10000
--       and d.qty > 5
--       and not d.is_discounted;        
-- EXCEPTION
--     when others then
--         rollback;
--         dbms_output.put_line(sqlerrm);
-- end;
-- /

Prompt Customer Monthly Totals After Applying Discount
select customer,order_month,totals
from qz_customer_orders_by_month;

rollback;

Prompt Customer Monthly Totals After Applying Discount
select customer,order_month,totals
from qz_customer_orders_by_month;

BEGIN
    dbms_output.put_line('***************Option 8****************');
    merge into qz_order_details t
    using (select d.order_dtl_id, d.qty, d.unit_price, d.is_discounted
          from qz_order_details d
          join qz_orders o on d.order_id = o.order_id
          join qz_customer_orders_by_month c
          on o.cust_id = c.cust_id and o.order_month = c.order_month
          where c.totals > 10000
    ) s on (s.order_dtl_id = t.order_dtl_id)
    when matched then
        update set
            t.unit_price = t.unit_price * 0.85,
            t.is_discounted = true
        where s.qty > 5 and not s.is_discounted;
EXCEPTION
    when others then
        rollback;
        dbms_output.put_line(sqlerrm);
end;
/

Prompt Customer Monthly Totals After Applying Discount
select customer,order_month,totals
from qz_customer_orders_by_month;

rollback;

Prompt Customer Monthly Totals After Applying Discount
select customer,order_month,totals
from qz_customer_orders_by_month;

PROMPT
PROMPT ************** Test Ends ****************
PROMPT
