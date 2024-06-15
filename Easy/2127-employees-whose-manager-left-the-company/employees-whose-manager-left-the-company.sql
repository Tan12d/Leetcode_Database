# Write your MySQL query statement below

with cte as(
    select distinct employee_id
    from Employees
), cte1 as (
    select employee_id, manager_id
    from Employees
    where salary < 30000
)

select employee_id 
from cte1
where manager_id is not null 
and manager_id not in (
    select employee_id
    from cte
)
order by employee_id;