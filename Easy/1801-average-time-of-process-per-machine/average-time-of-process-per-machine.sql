# Write your MySQL query statement belo

# select a.machine_id, round(avg(b.timestamp-a.timestamp),3) as processing_time
# from activity a join activity b on
# a.machine_id=b.machine_id and a.process_id=b.process_id 
# where a.activity_type='start' and b.activity_type='end'
# group by a.machine_id;


# a1 b1
# a2 b2

# ((b1-a1)+(b2-a2))/2
# ((b1+b2)-(a1+a2))/2

select machine_id, round(
((sum(case when activity_type='end' then timestamp end)-sum(case when activity_type='start' then timestamp end))/count(distinct process_id))
,3) as processing_time
from activity 
group by machine_id