-- PK(Primary Key)
-- 고유식별자
-- 테이블에서 반드시 하나만 존재해야 하며, NULL 값을 가질 수 없다.
-- 테이블 간의 관계를 맺는 데 중요한 역할을 한다.
-- 
-- FK(Foreign Key)
-- FK는 한 테이블에서 다른 테이블의 PK를 참조하는 필드다.
-- 이를 통해 두 테이블 간의 관계를 맺을 수 있다.
-- FK는 다른 테이블의 PK와 일치해야 하며,
-- 일치하지 않을 경우 데이터베이스에서 에러가 발생한다.
-- 
-- Unique Key는 테이블에서 중복된 값을 허용하지 않는 필드다.
-- Unique Key는 테이블 내에 중복된 값을 방지하기 위해 사용되며,
-- 하나 이상의 필드로 구성될 수 있다.
-- 
-- PK와 Unique의 차이
-- PK는 테이블에서 행의 고유성을 보장하고,
-- Unique Key는 중복된 값을 방지하기 위한 또 다른 유니크 제약 조건이다.
-- 
-- PK와 Unique의 공통점
-- 둘 다 데이터베이스에서 데이터의 무결성을 보장하는 데 사용된다.