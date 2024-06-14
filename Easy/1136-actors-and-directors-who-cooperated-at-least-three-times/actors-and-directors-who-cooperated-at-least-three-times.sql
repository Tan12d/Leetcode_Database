with cte as(
select concat(actor_id,',',director_id)
from ActorDirector
group by concat(actor_id,',',director_id)
having count(*)>=3
)

select distinct actor_id, director_id
from ActorDirector
where concat(actor_id,',',director_id) in (
select *
from cte);