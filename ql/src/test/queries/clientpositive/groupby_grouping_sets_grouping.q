CREATE TABLE T1(key INT, value INT) STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH '../../data/files/groupby_groupingid.txt' INTO TABLE T1;

explain
select key, value, `grouping__id`, grouping(key), grouping(value)
from T1
group by rollup(key, value);

select key, value, `grouping__id`, grouping(key), grouping(value)
from T1
group by rollup(key, value);

explain
select key, value, `grouping__id`, grouping(key), grouping(value)
from T1
group by cube(key, value);

select key, value, `grouping__id`, grouping(key), grouping(value)
from T1
group by cube(key, value);

explain
select key, value
from T1
group by cube(key, value)
having grouping(key) = 1;

select key, value
from T1
group by cube(key, value)
having grouping(key) = 1;

explain
select key, value, grouping(key)+grouping(value) as x
from T1
group by cube(key, value)
having grouping(key) = 1 OR grouping(value) = 1
order by x desc, case when x = 1 then key end;

select key, value, grouping(key)+grouping(value) as x
from T1
group by cube(key, value)
having grouping(key) = 1 OR grouping(value) = 1
order by x desc, case when x = 1 then key end;

set hive.cbo.enable=false;

explain
select key, value, `grouping__id`, grouping(key), grouping(value)
from T1
group by rollup(key, value);

select key, value, `grouping__id`, grouping(key), grouping(value)
from T1
group by rollup(key, value);

explain
select key, value, `grouping__id`, grouping(key), grouping(value)
from T1
group by cube(key, value);

select key, value, `grouping__id`, grouping(key), grouping(value)
from T1
group by cube(key, value);

explain
select key, value
from T1
group by cube(key, value)
having grouping(key) = 1;

select key, value
from T1
group by cube(key, value)
having grouping(key) = 1;

explain
select key, value, grouping(key)+grouping(value) as x
from T1
group by cube(key, value)
having grouping(key) = 1 OR grouping(value) = 1
order by x desc, case when x = 1 then key end;

select key, value, grouping(key)+grouping(value) as x
from T1
group by cube(key, value)
having grouping(key) = 1 OR grouping(value) = 1
order by x desc, case when x = 1 then key end;
