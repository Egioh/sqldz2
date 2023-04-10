/*Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
Чем NULL отличается от 0?*/

create database store;
use store;
create table sales
(
id int auto_increment primary key,
order_date date not null,
count_product int not null
);
insert into  sales (order_date, count_product) values
('2020-01-01', 156),
('2020-01-02', 180),
('2020-01-03', 21),
('2020-01-04', 124),
('2020-01-05', 341);

alter table sales add order_size varchar(30);

update sales
set order_size =
	case 
		when count_product < 100 then 'маленький заказ'
		when count_product >= 100 and count_product <= 300 then 'средний заказ'
		else 'большой заказ'
	end
where id>0;

create table orders
(
id int auto_increment primary key, 
employee_id varchar(10),
amount float, 
order_status varchar(20)
);

insert into orders (employee_id, amount, order_status) values
('e03',15.00,'open'),
('e01', 15.50,'open'),
('e05',100.70,'closed'),
('e02',22.18,'open'),
('e04',9.50,'canceled');

#Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status:
#OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED -  «Order is cancelled»
select 
	case
		when order_status = 'open' then 'Order is in open state'
        when order_status = 'closed' then 'Order is closed'
        else 'Order is cancelled'
	end as full_order_status
from orders;

