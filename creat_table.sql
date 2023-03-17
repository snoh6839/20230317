CREATE TABLE customers (
    cus_no INT(5)
	 ,customer_name VARCHAR(50)
	 ,customer_age INT(3)
	 ,customer_gender CHAR(1)
    ,CONSTRAINT pk_customers PRIMARY KEY (cus_no)
);