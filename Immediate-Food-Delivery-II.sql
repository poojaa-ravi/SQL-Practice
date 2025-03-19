# Write your MySQL query statement below
WITH first_orders AS (
    SELECT customer_id, 
           order_date = customer_pref_delivery_date AS is_on_time
    FROM delivery
    WHERE order_date = (
        SELECT MIN(order_date) 
        FROM delivery d2 
        WHERE d2.customer_id = delivery.customer_id
    )
)
SELECT ROUND(SUM(is_on_time) / COUNT(*) *100, 2) AS immediate_percentage
FROM first_orders;