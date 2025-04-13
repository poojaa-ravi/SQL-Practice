# Write your MySQL query statement below
select e.reports_to as employee_id, m.name, count(e.reports_to) as reports_count, 
ROUND(avg(e.age)) as average_age
from employees e
join employees m on e.reports_to = m.employee_id
group by e.reports_to
having e.reports_to IS NOT NULL
order by employee_id