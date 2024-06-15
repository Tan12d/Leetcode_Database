# Write your MySQL query statement below

with cte as (
select date_format(trans_date, "%Y-%m") as month_year, country, count(state) trans_count, sum(amount) trans_total_amount
from Transactions
group by month_year, country
), cte1 as (
select date_format(trans_date, "%Y-%m") as month_year, country, count(state) approved_count, sum(amount) approved_total_amount
from Transactions
group by month_year, country, state
having trim(state) = 'approved'
)

select a.month_year as month, a.country, trans_count, coalesce(approved_count,0) as approved_count, trans_total_amount, coalesce(approved_total_amount,0) as approved_total_amount
from cte a
left join 
cte1 b
on a.month_year = b.month_year and a.country = b.country or
(a.country is null and b.country is null);