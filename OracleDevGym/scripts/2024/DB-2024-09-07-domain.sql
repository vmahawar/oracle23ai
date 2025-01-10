create domain qz_lengths as integer
check (qz_lengths > 0);

drop table QZ_PRODUCT_DIMENSIONS;

create table qz_product_dimensions (
	product_id integer,
	height integer,
	width integer,
	depth integer
);


delete from QZ_PRODUCT_DIMENSIONS;
/* This must insert successfully */
insert into qz_product_dimensions values(1,2,3,4);

/* These must raise ORA-11534 */
insert into qz_product_dimensions values(2,-2,3,4);
insert into qz_product_dimensions values(3,2,-3,4);
insert into qz_product_dimensions values(4,2,3,-4);

PROMPT
PROMPT Option 1 -- Invalid
PROMPT 

alter table qz_product_dimensions
modify(height,width,depth) add domain qz_lengths;

PROMPT
PROMPT Option 2 -- Invalid
PROMPT 

alter table qz_product_dimensions
modify(height qz_lengths
      ,width qz_lengths
	  ,depth qz_lengths);

PROMPT
PROMPT Option 3 -- Valid
PROMPT 

alter table qz_product_dimensions
modify(height domain qz_lengths
      ,width domain qz_lengths
	  ,depth domain qz_lengths);	  

PROMPT
PROMPT Option 4 -- Valid
PROMPT 

alter table qz_product_dimensions
modify(height integer domain qz_lengths
      ,width integer domain qz_lengths
	  ,depth integer domain qz_lengths);	  

PROMPT
PROMPT Option 5
PROMPT 

alter table qz_product_dimensions
modify (height)
add domain qz_lengths;

alter table qz_product_dimensions
modify (width)
add domain qz_lengths;

alter table qz_product_dimensions
modify (depth)
add domain qz_lengths;