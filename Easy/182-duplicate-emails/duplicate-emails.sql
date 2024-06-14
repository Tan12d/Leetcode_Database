# Write your MySQL query statement below

with cte as (
    select email, count(email) as cnt
    from Person
    group by email
)

select email 
from cte 
where cnt > 1;