use dvv223;


create or replace table labl (Date date not null, Open double, High double, Low double, Close double, Volume long, OpenInt double);
load data local infile "/home/data/MT/dataset2/ndq1/labl.us.txt" 
into table labl fields terminated by ',' enclosed by '"' lines terminated by '\n' ignore 1 rows;

create or replace table bwld (Date date not null, Open double, High double, Low double, Close double, Volume long, OpenInt double);
load data local infile "/home/data/MT/dataset2/ndq1/bwld.us.txt" 
into table bwld fields terminated by ',' enclosed by '"' lines terminated by '\n' ignore 1 rows;

create or replace table mgcd (Date date not null, Open double, High double, Low double, Close double, Volume long, OpenInt double);
load data local infile "/home/data/MT/dataset2/ndq1/mgcd.us.txt" 
into table mgcd fields terminated by ',' enclosed by '"' lines terminated by '\n' ignore 1 rows;





#If we want to see all the dates which gave the same maximum percentage change remove 'distinct'


create temporary table labl_stock (value double);
insert into labl_stock(
select abs(open-close)/open*100 from labl);

select distinct(l.Date) as MaxChange 
from labl l where abs(l.open-l.close)/l.open*100=
(select max(value) from labl_stock);

drop table labl_stock;

create temporary table bwld_stock (value double);
insert into bwld_stock(
select abs(open-close)/open*100 from bwld);

select distinct(l.Date) as MaxChange 
from bwld l where abs(l.open-l.close)/l.open*100=
(select max(value) from bwld_stock);

drop table bwld_stock;

create temporary table mgcd_stock (value double);
insert into mgcd_stock(
select abs(open-close)/open*100 from mgcd);

select distinct(l.Date) as MaxChange 
from mgcd l where abs(l.open-l.close)/l.open*100=
(select max(value) from mgcd_stock);

drop table mgcd_stock;

#Without creating temporary table
select Date from labl
where abs(open-close)/open*100=(
select max(abs(open-close)/open*100) as MaxChange from labl);

select Date from bwld
where abs(open-close)/open*100=(
select max(abs(open-close)/open*100) as MaxChange from bwld);

select Date from mgcd
where abs(open-close)/open*100=(
select max(abs(open-close)/open*100) as MaxChange from mgcd);

