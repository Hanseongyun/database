-- 주석
#주석

-- DDL (데이터 정의어)
-- 데이터베이스, 테이블, 인덱스, 사용자를 정의하는데 사용되는 언어

-- CREATE: 구조를 생성하는 명령어
-- CREATE 생성할구조 구조이름 [... 구조 정의];			대소문자 구분이 없음 (명령어는 대문자로)

-- 데이터베이스 생성
CREATE DATABASE practice_sql;
-- 특정 데이터베이스 사용		  스크립트언어: 무조건 한줄만 실행함 위에 적은 내용 실행안됨
USE practice_sql;		#SQL 데이터베이스 실행시 반드시 먼저 실행(ctrl+enter)하고 시작

-- 테이블 생성
CREATE TABLE example_table (
	-- VARCHAR(문자열길이): 가변길이 문자열 / 인덱스 사용 가능
	string_column VARCHAR(100), 	# 콤마(,) 꼭 적을것
    -- TEXT: 장문의 문자열 / 인덱스 사용 불가능
	text_column TEXT,
    -- INT: 정수
    int_column INT,
    -- DOUBLE: 실수
    double_clolumn DOUBLE,
    -- FLOAT: 실수
    float_clolumn FLOAT,
    -- BOOLEAN: 논리형		tinyint - TRUE면 1 FALSE면 0이 저장
    boolean_column BOOLEAN,
    -- DATE: 날짜		
    date_column DATE,
    -- DATETIME: 날짜 및 시간
    datetime_column DATETIME
);
-- 연습시에는 root계정 사용, 원래는 사용자계정 여러개 생성후 각각의 권한부여 후 이용함(보안을 위해) 
-- 사용자 생성		
-- CREATE USER '사용자명'@'접속IP' IDENTIFIED BY '비밀번호';
CREATE USER 'developer'@'localhost' IDENTIFIED BY 'P!ssw0rd';	# 로컬호스트(내컴퓨터)

-- 생성된 사용자 보기
USE mysql;
SELECT * FROM user;

-- DROP: 데이터 구조를 삭제하는 명령어

-- 테이블 삭제
DROP TABLE example_table;

-- 데이터 베이스 삭제
DROP DATABASE practice_sql;

-- ALTER: 데이터 구조를 변경하는 명령어

-- 테이블 컬럼 추가
ALTER TABLE example_table 
ADD added_column INT;

-- 테이블 컬럼 삭제
ALTER TABLE example_table
DROP COLUMN added_column;

-- 테이블 컬럼 타입 수정
ALTER TABLE example_table
MODIFY COLUMN string_column VARCHAR(200);

-- 테이블 컬럼 이름 수정(타입도 변경가능)
ALTER TABLE example_table
CHANGE string_column varchar_column VARCHAR(200);




