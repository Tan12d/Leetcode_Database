# Write your MySQL query statement below

with ct as(
select distinct a.reports_to, b.name
from
Employees a
left join
Employees b
on a.reports_to = b.employee_id
where a.reports_to is not null
), cte as(
select employee_id, reports_to, age
from Employees
where reports_to is not null
), cte1 as(
select reports_to, count(*) reports_count, round(avg(age),0) average_age
from cte
group by reports_to
)

select cte1.reports_to as employee_id, ct.name, reports_count, average_age
from cte1
left join 
ct
on cte1.reports_to=ct.reports_to
order by cte1.reports_to;