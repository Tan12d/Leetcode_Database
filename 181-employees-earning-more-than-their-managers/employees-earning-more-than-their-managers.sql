select a.name Employee
from Employee a
left join
Employee b
on a.managerId = b.id
where a.salary > b.salary;