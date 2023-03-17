-- CREATE TABLE customers (
--     cus_no INT(5)
-- 	 ,customer_name VARCHAR(50) NOT NULL
-- 	 ,customer_age INT(3) NOT NULL
-- -- 	 ,customer_gender CHAR(1)
-- 	 ,customer_gender ENUM('F','M')
-- 	 ,signup_date DATE NOT NULL
-- 	 ,withdrawal_date DATE
--     ,CONSTRAINT pk_customers PRIMARY KEY (cus_no)
-- );

-- COMMIT;

-- ALTER TABLE customers ADD COLUMN adress VARCHAR(300);
-- SHOW FULL COLUMNS FROM customers;

-- COMMIT;

-- ALTER TABLE customers 
-- ADD COLUMN street_address VARCHAR(100),
-- ADD COLUMN city VARCHAR(50),
-- ADD COLUMN state_province VARCHAR(50),
-- ADD COLUMN postal_code VARCHAR(20),
-- ADD COLUMN country VARCHAR(50);
-- 주소 쪼개서 넣기

-- ALTER TABLE customers ALTER COLUMN adress VARCHAR(400);
-- 작은 숫자로는 변경 불가능

-- ALTER TABLE customers DROP COLUMN adress;
-- SHOW FULL COLUMNS FROM customers;
-- ALTER TABLE customers ADD COLUMN adress VARCHAR(200);
-- SHOW FULL COLUMNS FROM customers;

-- COMMIT;
