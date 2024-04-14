 -- 1 уровень сложности: Таблица - customers

-- 1.Вывести максимальный и минимальный credit_limit.

use homework;

select
	max(credit_limit) as max_credit,
	min(credit_limit) as min_credit
from customers;
 
 -- 2.Вывести покупателей у которых creditlimit выше среднего creditlimit.
 
 select
	cust_first_name as first_name,
	cust_last_name as last_name
from  customers
where credit_limit > (select avg(credit_limit) from customers);

-- 3.Найти кол/во покупателей имя которых начинается на букву 'D' и credit_limit больше 500.

select
	count(*) as count_of_customers
from customers
where cust_first_name like 'D%' and credit_limit > 500;


-- Таблица - order_items

-- 4.Найти среднее значение unit_price

select avg(unit_price) as unit_price
from order_items;

-- Таблицы - orderitems, productinformation

-- 5.Вывести имена продуктов(PRODUCT_NAME), кол/во(QUANTITY) которых меньше среднего.

select t1.PRODUCT_NAME, 
		t2.QUANTITY
from product_information t1
join order_items t2
on t1.product_id = t2.product_id
where QUANTITY < ( select avg(QUANTITY) from order_items t2 );


-- Таблицы - orders, customers

-- 6.Вывести имя и фамилию покупателя с максимальной общей суммой покупки(ORDER_TOTAL).

select t1.cust_first_name as first_name,
		t1.cust_last_name as last_name,
        t2.ORDER_TOTAL
from customers t1
join orders t2
on t1.customer_id = t2.customer_id
where ORDER_TOTAL = ( select max(ORDER_TOTAL) from orders t2 );
        

-- 7.Найти сумму общей суммы покупок(ORDER_TOTAL) всех женатых мужчин покупателей.

select sum(t1.ORDER_TOTAL) as Sum
from orders t1
join customers t2
on t1.customer_id = t2.customer_id
where t2.MARITAL_STATUS = "married"
and t2.Gender = "M";













