with cte as(
select concat(lat,",",lon)
from Insurance
group by concat(lat,",",lon)
having count(*) >1
), cte1 as(
select distinct a.*
from Insurance a
inner join
Insurance b
on a.tiv_2015 = b.tiv_2015 and a.tiv_2016 <> b.tiv_2016
where concat(a.lat,",",a.lon) not in (select *
								  from cte)
)

select round(sum(tiv_2016),2) as tiv_2016
from cte1;