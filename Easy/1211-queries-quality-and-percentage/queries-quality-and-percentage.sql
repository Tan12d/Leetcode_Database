# Write your MySQL query statement below

with cte as (
select query_name,
round(avg(rating/position),2) as quality, count(rating) c1
from Queries
group by query_name
), cte1 as (
select query_name, count(rating) c
from Queries
group by query_name, rating
having rating <3
)

select cte.query_name,
cte.quality,
round(sum(ifnull(((c/c1)*100),0)),2) as poor_query_percentage
from cte
left join cte1
on cte.query_name = cte1.query_name
group by cte.query_name
having cte.query_name is not null;