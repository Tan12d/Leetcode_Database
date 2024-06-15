# Write your MySQL query statement below

with cte as(
    select managerId , count(managerId) as cnt
    from Employee 
    group by managerId
    having managerId is not null
)

select name
from Employee 
where id in (
    select managerId
    from cte 
    where cnt >= 5
);