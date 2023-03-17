CREATE TABLE customers (
    cus_no INT(5)
	 ,customer_name VARCHAR(50) NOT NULL
	 ,customer_age INT(3) NOT NULL
-- 	 ,customer_gender CHAR(1)
	 ,customer_gender ENUM('F','M')
	 ,signup_date DATE NOT NULL
	 ,withdrawal_date DATE
    ,CONSTRAINT pk_customers PRIMARY KEY (cus_no)
);

