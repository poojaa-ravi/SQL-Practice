# Write your MySQL query statement below
select DISTINCT products.product_id, IFNULL(current_prices.new_price,10) as price
from products

LEFT JOIN 

(select product_id, new_price
from products
where (product_id, change_date) IN 

(select product_id, MAX(change_date) as change_date
from products
where change_date <= '2019-08-16'
group by product_id)
) current_prices

ON products.product_id = current_prices.product_id
