# Write your MySQL query statement below

select s.student_id, s.student_name, s1.subject_name, count(e.subject_name) as attended_exams 
from students s cross join subjects s1
left join examinations e
on s.student_id=e.student_id and e.subject_name=s1.subject_name
group by s.student_id, s1.subject_name 
order by s.student_id, s1.subject_name;