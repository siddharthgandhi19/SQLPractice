Suppose you have the following tables in your database:
products table: contains information about various products, including product_id, product_name, category_id, and supplier_id.
categories table: contains information about the categories of products, including category_id and category_name.
suppliers table: contains information about the suppliers of the products, including supplier_id and supplier_name.
order_items table: contains information about the items ordered by customers, including order_id, product_id, and quantity.
Your goal is to retrieve the following information for all products that have been ordered at least once:
Product name
Category name
Supplier name
Total quantity of the product ordered across all order


create table products(
	product_id INT PRIMARY KEY,
	product_name VARCHAR(50),
	category_id INT,
		FOREIGN KEY (category_id) REFERENCES categories(category_id),
	supplier_id INT,
	FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
	)

	INSERT INTO products VALUES (101,'Wheat','201','301')
	
	INSERT INTO products VALUES (102,'Soya Oil','202','303')

	select * from products

create table categories (
	category_id INT PRIMARY KEY,
	category_name VARCHAR(50)
) 

insert into categories Values (201,'Grains Merchant')
insert into categories Values (202,'Packaging Food')
insert into categories Values (203,'Oil Merchant')
insert into categories Values (204,'Internet Provider')

select * from categories

create table suppliers(		
		supplier_id INT PRIMARY KEY,
		supplier_name VARCHAR(50)
) 

INSERT INTO suppliers VALUES (301, 'Jain And Sons')
INSERT INTO suppliers VALUES (302, 'ITC LIMITED')
INSERT INTO suppliers VALUES (303, 'Adani')
INSERT INTO suppliers VALUES (304, 'Reliance')
INSERT INTO suppliers VALUES (305, 'Jio')
INSERT INTO suppliers VALUES (306, 'IOCL')

select * from suppliers

create table orders(
	order_id INT PRIMARY KEY,
	product_id INT ,
	FOREIGN KEY (product_id) REFERENCES products(product_id),
	quantity INT
)

insert into orders values (401,101,50)
insert into orders values (402,102,70)
select * from orders




select
 products.product_name As 'Product Name',
 categories.category_name As 'Category Name',
 suppliers.supplier_name As 'Supplier Name',
 SUM (orders.quantity) As 'Total Quantity'

 from

 products

 INNER JOIN categories ON products.category_id = categories.category_id
 INNER JOIN suppliers ON products.supplier_id = suppliers.supplier_id
 INNER JOIN orders ON products.product_id = orders.product_id

 group by products.product_name, categories.category_name, suppliers.supplier_name
 having
 (orders.quantity)>0;


