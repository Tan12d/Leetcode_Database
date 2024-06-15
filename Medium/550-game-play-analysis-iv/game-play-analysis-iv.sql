# Write your MySQL query statement below

with cte as(
select player_id, event_date, row_number() over(partition by player_id order by event_date) as rnk
from Activity
group by player_id,event_date
), cte1 as (
select player_id, min(event_date) fst
from Activity
group by player_id
), cte2 as (
select player_id, event_date as sec
from cte
where rnk=2
),cte3 as (
select distinct a.player_id, fst, ifnull(sec,0) as sec, datediff(ifnull(sec,0), fst) as val
from cte1 a
left join 
cte2 b
on a.player_id = b.player_id
)

select round((count(*)/(select count(distinct player_id) from Activity)),2) as fraction
from cte3
where val=1;