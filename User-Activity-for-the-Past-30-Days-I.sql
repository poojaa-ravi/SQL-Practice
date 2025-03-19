# Write your MySQL query statement below
select activity_date as day, count(distinct user_id) as active_users
from activity 
group by 1
having DATEDIFF('2019-07-27', activity_date) < 30 AND activity_date <= DATE('2019-07-27');