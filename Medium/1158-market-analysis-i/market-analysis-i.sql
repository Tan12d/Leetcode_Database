with cte as(
select a.user_id, if(year(order_date) = 2019, count(*), 0) as cnt
from Users a
left join 
Orders b
on a.user_id = b.buyer_id
group by a.user_id, order_date
),cte1 as(
select user_id, sum(cnt) as orders_in_2019
from cte
group by user_id
)

select a.user_id as buyer_id, join_date, orders_in_2019
from cte1 a
left join
Users b
on a.user_id = b.user_id;