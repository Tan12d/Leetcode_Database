# Write your MySQL query statement below

with cte as(
    select d.name as Department, 
    e.name as Employee, 
    salary as Salary,
    dense_rank() over(partition by departmentId order by salary desc) as Rank_
    from Employee e left join Department d
    on e.departmentId = d.id
)

select Department, Employee, Salary 
from cte 
where Rank_ = 1;