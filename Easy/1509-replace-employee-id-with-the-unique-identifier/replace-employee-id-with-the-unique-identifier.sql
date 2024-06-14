/* Write your PL/SQL query statement below */

select unique_id,name from EmployeeUNI e right outer join Employees e1 on e.id=e1.id;