# Write your MySQL query statement below

with cte as(
    select player_id, min(event_date) as first_login
    from Activity
    group by player_id
)

select player_id, first_login
from cte;