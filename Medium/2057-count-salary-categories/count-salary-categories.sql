# Write your MySQL query statement below

with cte as(
select account_id,
case 
when income<20000 then "Low Salary" 
when income between 20000 and 50000 then "Average Salary"
else "High Salary"
end as category
from Accounts
),cte1 as (
select "Low Salary" as category
union all
select "Average Salary" as category
union all
select "High Salary" as category
),cte2 as (
select account_id, a.category
from cte1 a
left join
cte b
on a.category = b.category
)

select distinct category, 
case 
when category="Low Salary" then (select count(*) from cte2 where category = "Low Salary" and account_id is not null) 
when category="Average Salary" then (select count(*) from cte2 where category = "Average Salary" and account_id is not null)
else (select count(*) from cte2 where category = "High Salary" and account_id is not null)
end as accounts_count
from cte2;