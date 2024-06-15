with cte as(
select id, people, lead(id) over(order by id) l1, lead(people) over(order by id) p1, lead(id,2) over(order by id) l2, lead(people,1) over(order by id) p2
from Stadium
),cte1 as(
select id, people, lag(id) over(order by id) l1, lag(people) over(order by id) p1, lag(id,2) over(order by id) l2, lag(people,1) over(order by id) p2
from Stadium
),cte3 as(
select a.id
from cte a
left join
cte1 b
on a.id = b.id
where (a.people >= 100 or b.people>=100) and (a.p1 >= 100 or b.p1>=100) and (a.p2 >= 100 or b.p2>=100)
),cte4 as(
select id, lead(id) over(order by id) l3, lead(id,2) over(order by id) l4
from cte3
), cte5 as (
select id, lag(id) over(order by id) l3, lag(id,2) over(order by id) l4
from cte3
),cte6 as(
select distinct a.id,a.l3, a.l4
from cte4 a
left join
cte5 b
on a.l3 is not null and a.l4 is not null and b.l3 is not null and b.l4 is not null
where a.l3 = (a.id+1) and a.l4 = (a.id+2)
),cte7 as(
select id from cte6
union
select l3 from cte6
union
select l4 from cte6
)

select a.id, visit_date, people
from Stadium a
right join 
cte7 b
on a.id = b.id
order by visit_date;