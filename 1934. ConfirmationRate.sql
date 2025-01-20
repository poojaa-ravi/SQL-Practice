--Write your MySQL query statement below
with r_cte as( 
    select user_id, ROUND(SUM(
        CASE
            when action = 'confirmed' THEN 1
            else 0
        END) /COUNT(*), 2) as conf_rate
        from confirmations
        group by user_id
        order by null
    )

select s.user_id, IFNULL(r.conf_rate, 0) as confirmation_rate
from signups s
left join r_cte r on s.user_id = r.user_id;
