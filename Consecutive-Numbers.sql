# Write your MySQL query statement below
select distinct a.num as ConsecutiveNums from logs a
join logs b  On a.id = b.id+1 and a.num = b.num
join logs c On a.id = c.id+2 and a.num = c.num