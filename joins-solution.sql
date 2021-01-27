-- 1.  Get all customers and their addresses.

    SELECT *
    FROM "customers"
    JOIN "addresses" ON "addresses".customer_id = "customers".id;

    Results:
    1	Lisa	Bonet	2	555 Some Pl	Chicago	IL	60611	business	1
    1	Lisa	Bonet	1	1 Main St	Detroit	MI	31111	home	1
    2	Charles	Darwin	3	8900 Linova Ave	Minneapolis	MN	55444	home	2
    3	George	Foreman	4	PO Box 999	Minneapolis	MN	55334	business	3
    4	Lucy	Liu	6	934 Superstar Ave	Portland	OR	99999	business	4
    4	Lucy	Liu	5	3 Charles Dr	Los Angeles	CA	00000	home	4

-- 2.  Get all orders and their line items (orders, quantity and product).

    SELECT "products".description, "orders".order_date, "line_items".quantity
    FROM "products"
    JOIN "line_items" ON "products".id = "line_items".product_id
    JOIN "orders" ON "orders".id = "line_items".order_id;

    Results:
    toothbrush	2010-03-05	16
    nail polish - blue	2010-03-05	4
    can of beans	2010-03-05	2
    lysol	2012-02-08	3
    cheetos	2012-02-08	1
    diet pepsi	2016-02-07	6
    wet ones baby wipes	2011-03-04	4
    toothbrush	2011-03-04	7
    nail polish - blue	2011-03-04	2
    can of beans	2011-03-04	4
    lysol	2011-03-04	10
    cheetos	2011-03-04	3
    diet pepsi	2012-09-22	5
    wet ones baby wipes	2012-09-22	4
    toothbrush	2012-09-22	9
    nail polish - blue	2012-09-22	3
    can of beans	2012-09-22	6
    lysol	2012-09-23	3
    cheetos	2012-09-23	7
    diet pepsi	2012-09-23	1
    wet ones baby wipes	2012-09-23	2
    toothbrush	2012-09-23	4
    nail polish - blue	2012-09-23	7
    can of beans	2012-09-23	8
    lysol	2012-09-23	6
    cheetos	2012-09-23	9

-- 3.  Which warehouses have cheetos?

    SELECT "warehouse".warehouse, "products".description
    FROM "warehouse"
    JOIN "warehouse_product" ON "warehouse".id = "warehouse_product".warehouse_id
    JOIN "products" ON "products".id = "warehouse_product".product_id
    WHERE "products".description = 'cheetos';

    Results:
    delta	cheetos

-- 4.  Which warehouses have diet pepsi?

    SELECT "warehouse".warehouse, "products".description
    FROM "warehouse"
    JOIN "warehouse_product" ON "warehouse".id = "warehouse_product".warehouse_id
    JOIN "products" ON "products".id = "warehouse_product".product_id
    WHERE "products".description = 'diet pepsi';   

    Results:
    alpha	diet pepsi
    delta	diet pepsi
    gamma	diet pepsi


-- 5.  Get the number of orders for each customer. 
 
    SELECT COUNT("orders"), "customers".last_name, "customers".first_name
    FROM "customers"
    JOIN "addresses" ON "customers".id = "addresses".customer_id
    JOIN "orders" ON "addresses".id = "orders".address_id
    GROUP BY "customers".id;

    Results:
    3	Liu	Lucy
    1	Darwin	Charles
    5	Bonet	Lisa

-- 6.  How many customers do we have?

    SELECT COUNT(*) FROM "customers";

    Results: 
    4

-- 7.  How many products do we carry?

    SELECT COUNT(*) FROM "products";

    Results:
    7

-- 8.  What is the total available on-hand quantity of diet pepsi?

    SELECT SUM(on_hand), "products".description
    FROM "warehouse_product"
    JOIN "products" ON "products".id = "warehouse_product".product_id
    WHERE "products".description = 'diet pepsi'
    GROUP BY "products".id, "warehouse_product".on_hand;

    Results:
    3	diet pepsi
    88	diet pepsi
    1	diet pepsi  

