# Write your MySQL query statement below

with cte as (
 select requester_id, count(requester_id) as cnt
 from RequestAccepted
 group by requester_id
 ), cte1 as (
 select accepter_id, count(accepter_id) as cnt
 from RequestAccepted
 group by accepter_id
 ), cte2 as (
 select * 
 from cte
 union all
 select * 
 from cte1
 ), cte3 as (
 select requester_id, sum(cnt) as cnt_
 from cte2
 group by requester_id
 )
 
 select requester_id as id, cnt_ as num
 from cte3
 order by num desc
 limit 1;