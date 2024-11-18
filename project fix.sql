CREATE TABLE table_sales as

select 
s.sales_key,
s.order_date,
p.product_key,
p."name" as product_names,
p.category as product_category,
p.subcategory as product_subcategory,
r.reseller_key,
r."name"  as reseller_name,
r.bussiness_type as reseller_type,
r.city as reseller_city,
r.state_province as reseller_sate_province,
r.country as reseller_country,
sp.employee_key,
sp."name" as employee_names,
sp.title as employee_titles,
sp.upn as employee_upn,
cast(s.quantity  as numeric) as quantity_sales,
CAST(REPLACE(REPLACE(s.sales , '$', ''), ',', '') AS NUMERIC(10, 2)) AS sales_price,
CAST(REPLACE(REPLACE(s.cost, '$', ''), ',', '') AS NUMERIC(10, 2)) AS production_cost
from sales s 
join product p 
using (product_key)
join reseller r 
using(reseller_key)
join sales_person sp 
using(employee_key)
order by sales_key

-- Bagaimana performa profit pada perusahaan ritel sepeda ? 
-- 1. Peforma keseluruhan
select 
sum(sales_price) as total_sales,
sum(production_cost) as total_prod_cost,
sum(sales_price) - sum(production_cost) as Profit,
(SUM(sales_price) - SUM(production_cost)) * 100.0 / SUM(sales_price) AS profit_margin
from table_sales


-- 2. Peforma tiap bulan
select 
extract(year from order_date) as year_order,
extract(month from order_date) as month_order,
sum(quantity_sales) as total_qantity,
sum(sales_price) as total_sales,
sum(production_cost) as total_prod_cost,
sum(sales_price) - sum(production_cost) as Profit,
(SUM(sales_price) - SUM(production_cost)) * 100.0 / SUM(sales_price) AS profit_margin
from table_sales
group by 1,2
order by 1,2

select * from table_sales
-- Bagaimana performa penjualan tiap sales person di perusahaan ritel sepeda?
-- 1. Peforma keseluruhan
select
employee_key,
employee_names,
sum(sales_price) as total_sales,
sum(production_cost) as total_prod_cost,
sum(sales_price) - sum(production_cost) as Profit,
(SUM(sales_price) - SUM(production_cost)) * 100.0 / SUM(sales_price) AS profit_margin
from table_sales
group by 1,2
order by employee_key

-- 1. peforma sales_person di bandingkan dengan target
with  sales_employee as (
select
employee_names,
sum(sales_price) as total_sales
from table_sales
group by 1
),

sales_target as (
select
sp."name" ,
sum(CAST(REPLACE(REPLACE(t.target_value, '$', ''), ',', '') AS NUMERIC(10, 2))) AS target_value
from "target" t 
join sales_person sp 
on t.employee_key = sp.employee_key 
group by 1)

select
employee_names,
total_sales,
target_value,
total_sales - target_value as target_tidak_tercapai
from sales_employee as se
left join sales_target as st
on se.employee_names = st.name

-- Bagaimana performa penjualan di tiap negara
-- penjualan keseluruhan
select 
reseller_country,
sum(quantity_sales) as total_qantity,
sum(sales_price) as total_sales,
sum(production_cost) as total_prod_cost,
sum(sales_price) - sum(production_cost) as Profit,
(SUM(sales_price) - SUM(production_cost)) * 100.0 / SUM(sales_price) AS profit_margin
from table_sales
group by 1
order by profit_margin


-- penjualan tiap bulan
select 
reseller_country,
extract(year from order_date) as year_order,
extract(month from order_date) as month_order,
sum(quantity_sales) as total_qantity,
sum(sales_price) as total_sales,
sum(production_cost) as total_prod_cost,
sum(sales_price) - sum(production_cost) as Profit,
(SUM(sales_price) - SUM(production_cost)) * 100.0 / SUM(sales_price) AS profit_margin
from table_sales
group by 1,2,3
order by profit_margin







-- Bagaimana performa penjualan tiap reseller di perusahaan ritel sepeda?
-- 1. peforma keseluruhan
select
reseller_key,
reseller_name,
reseller_type,
sum(sales_price) as total_sales,
sum(production_cost) as total_prod_cost,
sum(sales_price) - sum(production_cost) as Profit,
(SUM(sales_price) - SUM(production_cost)) * 100.0 / SUM(sales_price) AS profit_margin
from table_sales
group by 1,2,3

-- 1. perbandingan peforma reseller yang profit negative dengan positive
with table_1 as (select
reseller_key,
reseller_name,
reseller_type,
sum(sales_price) as total_sales,
sum(production_cost) as total_prod_cost,
sum(sales_price) - sum(production_cost) as Profit,
(SUM(sales_price) - SUM(production_cost)) * 100.0 / SUM(sales_price) AS profit_margin
from table_sales
group by 1,2,3),

table_2 as (select reseller_key,
case
when profit_margin < 0 then 'negative reseller'
else 'positive reseller'
end as status_reseller
from table_1)

select status_reseller,
count(reseller_key) jumlah_reseller
from table_2 
group by 1

-- Bagaimana performa penjualan tiap sales person di perusahaan ritel sepeda?
-- total profit tiap sales
select 
employee_names,
sum(sales_price) as total_sales,
sum(production_cost) as total_prod_cost,
sum(sales_price) - sum(production_cost) as Profit,
(SUM(sales_price) - SUM(production_cost)) * 100.0 / SUM(sales_price) AS profit_margin
from table_sales ts 
group by 1

-- perbandingan target dengan penjualan
with  sales_employee as (
select
employee_names,
extract(year from order_date) as year_order,
extract(month from order_date) as month_order,
sum(sales_price) as total_sales
from table_sales
group by 1,2,3
),

sales_target as (
select
sp."name" ,
extract(year from t.target_month) as year_order,
extract(month from t.target_month) as month_order,
sum(CAST(REPLACE(REPLACE(t.target_value, '$', ''), ',', '') AS NUMERIC(10, 2))) AS target_value
from "target" t 
join sales_person sp 
on t.employee_key = sp.employee_key 
group by 1,2,3)

select
employee_names,
se.year_order,
se.month_order,
total_sales,
target_value
from sales_employee as se
left join sales_target as st
on se.employee_names = st.name and se.year_order = st.year_order and se.month_order = st.month_order;

-- tiap bulan sales person
with  sales_employee as (
select
employee_names,

sum(sales_price) as total_sales
from table_sales
group by 1
),

sales_target as (
select
sp."name" ,
sum(CAST(REPLACE(REPLACE(t.target_value, '$', ''), ',', '') AS NUMERIC(10, 2))) AS target_value
from "target" t 
join sales_person sp 
on t.employee_key = sp.employee_key 
group by 1)

select
employee_names,
total_sales,
target_value,
total_sales - target_value as target_tidak_tercapai
from sales_employee as se
left join sales_target as st
on se.employee_names = st.name

-- Bagaimana performa penjualan product ?
-- keseluruhan
select 
product_key,
product_names,
product_category,
product_subcategory,
sum(sales_price) as total_sales,
sum(production_cost) as total_prod_cost,
sum(sales_price) - sum(production_cost) as profit,
(SUM(sales_price) - SUM(production_cost)) * 100.0 / SUM(sales_price) AS profit_margin
from table_sales ts 
group by 1,2,3,4

-- mancari product yang profitnya negative
with table_1 as (select 
product_key,
product_names,
product_category,
product_subcategory,
sum(sales_price) as total_sales,
sum(production_cost) as total_prod_cost,
sum(sales_price) - sum(production_cost) as profit,
(SUM(sales_price) - SUM(production_cost)) * 100.0 / SUM(sales_price) AS profit_margin
from table_sales ts 
group by 1,2,3,4),

table_2 as (select product_names,
case when profit < 0 then 'negatif'
else 'positif'
end as product_status_profit
from table_1)

select 
product_status_profit,
count(*) as jumlah_product
from table_2
group by 1

-- per category
select 
product_category,
sum(sales_price) as total_sales,
sum(production_cost) as total_prod_cost,
sum(sales_price) - sum(production_cost) as profit,
(SUM(sales_price) - SUM(production_cost)) * 100.0 / SUM(sales_price) AS profit_margin
from table_sales ts 
group by 1
order by profit DESC

-- per subcategory
select 
product_subcategory,
product_category,
sum(sales_price) as total_sales,
sum(production_cost) as total_prod_cost,
sum(sales_price) - sum(production_cost) as profit,
(SUM(sales_price) - SUM(production_cost)) * 100.0 / SUM(sales_price) AS profit_margin
from table_sales ts 
group by 1,2
order by profit ASC


--product premium
with table_1 as (select 
product_key,
product_names,
product_category,
sales_price / quantity_sales as harga_jual_product
from table_sales ts 
group by 1,2,3,4)

select 
product_key,
product_names,
round(avg(harga_jual_product),2) as avg_harga_jual_product
from table_1
group by 1,2
order by avg_harga_jual_product DESC
