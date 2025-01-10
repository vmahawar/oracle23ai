with sales (dt,amount)
AS(
    values
    (date '2021-01-01',115),    (date '2021-02-01',215),    (date '2021-03-01',145),
    (date '2021-01-01',130),    (date '2021-02-01',105),    (date '2021-03-01',125),
    (date '2021-07-01',130),    (date '2021-12-01',105),    (date '2021-06-01',125)    
)
select 'Q' || to_char(dt,'Q') as Quarter
       ,round(avg(amount)) as avg_month
       ,max(amount) as max_month
       ,min(amount) as min_month
  from sales
  group by 'Q' || to_char(dt,'Q')
  having round(avg(amount)) > 10
  order by avg_month desc;



with sales (dt,amount)
AS(
    values
    (date '2021-01-01',115),    (date '2021-02-01',215),    (date '2021-03-01',145),
    (date '2021-01-01',130),    (date '2021-02-01',105),    (date '2021-03-01',125),
    (date '2021-07-01',130),    (date '2021-12-01',105),    (date '2021-06-01',125)    
)
select quarter, avg_month, max_month, min_month
from 
(
select quarter
       , round(avg(amount)) as avg_month,
       max(amount) as max_month,
       min(amount) as min_month
  from (
        select 'Q' || to_char(dt,'Q') as quarter
      ,amount from sales
      )
  group by quarter
)
where avg_month > 10
order by avg_month desc;



with sales (dt,amount)
AS(
    values
    (date '2021-01-01',115),    (date '2021-02-01',215),    (date '2021-03-01',145),
    (date '2021-01-01',130),    (date '2021-02-01',105),    (date '2021-03-01',125),
    (date '2021-07-01',130),    (date '2021-12-01',105),    (date '2021-06-01',125)    
)
select 'Q' || to_char(dt,'Q') as Quarter
       ,round(avg(amount)) as avg_month
       ,max(amount) as max_month
       ,min(amount) as min_month
  from sales
  group by 1
  having avg_month > 10
  order by avg_month desc;