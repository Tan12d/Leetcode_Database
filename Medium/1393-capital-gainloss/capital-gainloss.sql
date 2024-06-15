with cte as(
select stock_name, operation, sum(price) as price
from Stocks
group by stock_name, operation
),cte1 as (
select stock_name,
(case when operation = "Buy" then price end) as "Buy"
from cte
group by stock_name, operation
), cte2 as (
select stock_name,
(case when operation = "Sell" then price end) as "Sell"
from cte
group by stock_name, operation
)

select a.stock_name, (Sell-Buy) as capital_gain_loss
from cte1 a
left join 
cte2 b
on a.stock_name = b.stock_name
where Buy is not null and Sell is not null;