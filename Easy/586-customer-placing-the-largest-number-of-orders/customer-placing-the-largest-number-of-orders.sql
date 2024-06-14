with cte as(
select customer_number, count(*) cnt
from Orders
group by customer_number
order by count(*) desc
limit 1
)

select customer_number 
from cte;
