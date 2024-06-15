select user_id, time_stamp last_stamp
from Logins
where time_stamp in (select max(time_stamp)
from Logins
where year(time_stamp) = 2020
group by user_id
);