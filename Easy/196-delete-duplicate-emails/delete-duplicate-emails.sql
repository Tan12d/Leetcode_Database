# Write your MySQL query statement below

with cte as(
    select id, email, row_number() over(partition by email order by id) as em
    from Person
)

delete from Person
where id in
(
select id
from cte 
where em>1
);