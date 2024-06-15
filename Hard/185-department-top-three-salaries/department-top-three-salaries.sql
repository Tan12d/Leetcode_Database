# Write your MySQL query statement below

with cte as (
select a.id, a.name, a.salary, a.departmentId, d.name as dept,
dense_rank() over(partition by departmentId order by salary desc) as rnk
from Employee a
left join Department d
on a.departmentId = d.id
)

select dept as Department, name as Employee, Salary
from cte
where rnk >=1 and rnk<=3
;