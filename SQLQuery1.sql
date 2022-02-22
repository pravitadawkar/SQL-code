create table salesman(salesman_id int primary key, name varchar(20),city varchar(20),commission float);
select * from salesman;
insert into salesman(salesman_id,name,city,commission)values(5001,'James Hoog','New York',0.15),
(5002,'Nail Knite','Paris',0.13);
insert into salesman(salesman_id,name,city,commission)values(5005,'Pit Alex','London',0.11),
(5006,'Mc Lyon','Paris',0.14),
(5007,'Paul Adam','Rome',0.13),
(5003,'Lauson Hen','San Jose',0.12);
select * from salesman;


create table customer(customer_id int primary key, cust_name varchar(20), city varchar(25),
grade int,salesman_id int foreign key references salesman(salesman_id));
select * from customer;
insert into customer(customer_id, cust_name, city,grade,salesman_id)values(3002,'Nick Rimando','New York',100,5001),
(3007,'Brad Davis','New York',200,5001),
(3005,'Graham Zusi','California',200,5002),
(3008,'Julian Green','London',300,5002),
(3004,'Fabian Johnson','Paris',300,5006),
(3009,'Geoff Cameron','Berlin',100,5003),
(3003,'Jozy Altidor','Moscow',200,5007);
select * from customer;


create table orders(ord_no int primary key ,purch_amt float, ord_date varchar(30),
customer_id int foreign key references customer(customer_id),
salesman_id int foreign key references salesman(salesman_id));
select * from orders;
insert into orders(ord_no,purch_amt,ord_date,customer_id,salesman_id)values
(70001,150.5,'2012-10-05',3005,5002);
insert into orders(ord_no,purch_amt,ord_date,customer_id,salesman_id)values
(70009,227.5,'2012-09-10',3007,5005);
insert into orders(ord_no,purch_amt,ord_date,customer_id,salesman_id)values
(70002,65.5,'2012-10-05',3002,5001);
insert into orders(ord_no,purch_amt,ord_date,customer_id,salesman_id)values
(70004,110.5,'2012-08-17',3009,5003);
insert into orders(ord_no,purch_amt,ord_date,customer_id,salesman_id)values
(70007,948.5,'2012-09-10',3005,5002);
insert into orders(ord_no,purch_amt,ord_date,customer_id,salesman_id)values
(70005,2400.5,'2012-07-27',3007,5001);
insert into orders(ord_no,purch_amt,ord_date,customer_id,salesman_id)values
(70008,5760,'2012-09-10',3002,5001);

select * from orders;

--From the above tables write a SQL query using joins to find the salesperson and 
--customer who belongs to same city. Return Salesman, cust_name and city. 

SELECT customer.cust_name,salesman.name, salesman.city
FROM salesman, customer WHERE salesman.city = customer.city;

--from the above tables write sql to find the salamans,customr he handel .return customer_name,city,salesman,commition..
select C.cust_name,S.name,C.city,S.commission from customer AS C INNER JOIN salesman AS S ON S.salesman_id=C.salesman_id;

--from above table write query ord details ,return cust_name,ord_no,ord_date,purch_amt,grade,salesman,commission
select O.ord_no,O.ord_date,O.purch_amt,C.cust_name,C.grade,S.name,S.commission from customer AS C JOIN salesman AS S 
ON S.salesman_id=C.salesman_id JOIN orders AS O ON S.salesman_id=O.salesman_id;
 
 --From the above tables write a SQL query to find those orders where order amount 
 --exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.
 select O.ord_no,O.purch_amt,C.cust_name,C.city from orders AS O INNER JOIN customer AS C ON C.customer_id=O.customer_id 
 WHERE O.purch_amt BETWEEN 500 AND  2000;
 
 --From the above tables write a SQL query to display the cust_name, customer city, grade, Salesman, salesman city. 
 --The result should be ordered by ascending on customer_id 
 select C.customer_id, C.cust_name,C.city,C.grade,S.name,S.city from customer AS C LEFT JOIN salesman AS S ON  S.salesman_id=C.salesman_id 
  ORDER BY C.customer_id;

 --Write a SQL statement to make a list in ascending order for the salesmen 
 --who works either for one or more customer or not yet join under any of the customers. 
 select S.name,C.cust_name from salesman AS S LEFT JOIN customer AS C ON S.salesman_id=C.salesman_id ORDER BY S.name;

 --Write a SQL statement to make a report with customer name, city, order no., order date, purchase amount 
 --for those customers from the existing list who placed one or more orders or which order(s) 
 --have been placed by the customer who is not on the list. 
 select C.cust_name,C.city,O.ord_no,O.ord_date,O.purch_amt from customer AS C RIGHT JOIN  orders AS O ON C.customer_id=O.customer_id;
 
 --OR==
 select C.cust_name,C.city,O.ord_no,O.ord_date,O.purch_amt from customer AS C LEFT JOIN  orders AS O ON C.customer_id=O.customer_id;
 
 