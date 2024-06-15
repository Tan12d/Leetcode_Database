with cte as(
select a.employee_id as t, b.employee_id as t1
from Employees a
left join Salaries b
on a.employee_id = b.employee_id
union
select a.employee_id, b.employee_id
from Employees a
right join Salaries b
on a.employee_id = b.employee_id
), cte1 as(
select t employee_id from cte where t1 is null
union 
select t1 employee_id from cte where t is null
)

select * 
from cte1
order by employee_id;