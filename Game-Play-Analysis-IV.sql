# Write your MySQL query statement below

WITH players AS(
    SELECT player_id, DATEDIFF(LEAD(event_date) OVER (PARTITION BY player_id
    ORDER BY event_date), event_date) as diff, RANK() OVER(PARTITION BY player_id ORDER BY event_date) AS dates FROM activity)

SELECT ROUND(COUNT(player_id)/(SELECT COUNT(DISTINCT player_id) FROM Activity),2) AS fraction
FROM players
WHERE diff = 1 AND dates = 1;
