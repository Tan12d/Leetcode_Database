# Write your MySQL query statement below

# Solution-1

select * 
from Cinema
where id % 2 = 1
and description != "boring"
order by rating desc;



# Solution-2 

select * 
from Cinema
where id % 2 = 1
and 
id not in (select id
from Cinema 
where description = "boring")
order by rating desc;
