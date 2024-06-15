select person_name
from
(
select person_name, weight, sum(weight) over(order by turn) as T
from Queue
order by turn) t
where T<=1000
order by T desc
limit 1;