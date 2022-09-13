# RDBMS & SQL

- 관계형(Relational) 데이터 시스템
- 테이블 기반(Table based)의 DBMS
  - 데이터를 테이블 단위로 관리
    - 하나의 테이블은 여러 개의 컬럼(Column)으로 구성.
  - 중복 데이터를 최소화 시킴
    - 같은 데이터가 여러 컬럼 또는 테이블에 존재 했을 경우, 데이터를 수정 시 문제가 발생할 가능성이 높아짐. - 정규화
  - 여러 테이블에 분산되어 있는 데이터를 검색 시 테이블 간의 관계(join)를 이용하여 필요하 데이터를 검색.

### RDBMS의 저장 구조

- Table

## SQL

### SQL(Structured Query Language)

- Database에 있는 정보를 사용할 수 있도록 지원하는 언어
- 모든 DBMS에서 사용 가능.
- 대소문자는 구별하지 않음(단, 데이터의 대소문자는 구분)

### DCL, DDL, DML

SQL 구문은 DCL, DDL, DML로 구분하며, 아래와 같은 종류가 있따.<br>

<table>
<tr><td>문장</td><td>설명</td></tr>
<tr><td>INSERT</td><td rowspan="3">DML(Data Manipulation Language)이라 부르며, 개별적으로 Database 테이블에서 새로운 행을 입력하고, 기존의 행을 변경하고 제거한다.</td></tr>
<tr><td>UPDATE</td></tr>
<tr><td>DELETE</td></tr>
<tr><td>SELECT</td><td>Database로부터 Data를 검색합니다. SELECT 역시 DML로 분류된다.</td></tr>
<tr><td>CREATE</td><td rowspan="4">DDL(Data Definition Language)이라 부르며, 테이블로부터 데이터 구조를 생성, 변경, 제거한다.</td></tr>
<tr><td>ALTER</td></tr>
<tr><td>DROP</td></tr>
<tr><td>RENAME</td></tr>
<tr><td>COMMIT</td><td rowspan="2">DML 명령문으로 수행한 변경을 관리한다.</td></tr>
<tr><td>ROLLBACK</td></tr>
<tr><td>GRANT</td><td rowspan="2">DCL(Data Control Language)이라 부르며, Database와 그 구조에 대한 접근 권한을 제공하거나 제거한다.</td></tr>
<tr><td>REVOKE</td></tr>
</table>

## DDL(Data Definition Language)

<b>DML.sql</b>

### SQL 종류

- DDL(Data Definition Language) : 데이터 정의어
  - 데이터베이스 객체(table, view, index, ...)의 구조를 정의.
  - 테이블을 생성, 커럶 추가, 타입변경, 제약조건 지정, 수정 등.

<table>
<tr><td>SQL문</td><td>설명</td></tr>
<tr><td>create</td><td>데이터베이스 객체를 생성</td></tr>
<tr><td>drop</td><td>데이터베이스 객체를 삭제</td></tr>
<tr><td>alter</td><td>기존에 존재하는 데이터베이스 객체를 수정</td></tr>
</table>

### 데이터베이스 생성

```
create database 데이터베이스명;
```

```
create database 데이터베이스명
default character set 값
collate 값;
```

- Character set은 각 문자가 컴퓨터에 저장될 때 어떠한 '코드'로 저장될 지에 대한 규칙의 집합을 의미
- Collation은 특정 문자 셋에 의해 데이터베이스에 저장된 값들을 비교 검색하거나 정렬 등의 작업을 위해 문자들을 서로 '비교'할 때 사용하는 규칙들의 집합을 의미

<br>

- 다국어 처리(utf8mb3) : dbtest 생성

```
create database dbtest
default character set utf8mb3 collate utf8mb3_general_ci;
```

- 이모지 문자까지 처리.

```
create database dbtest
default character set utf8mb4 collate utf8mb4_general_ci;
```

### 데이터베이스 변경

```
alter database  데이터베이스명
default character set 값 collate 값;
```

- dbtest의 character set, collate 변경

```
alter database dbtest
default character set utf8mb4 collate utf8mb4_general_ci;
```

### 데이터베이스 삭제

```
drop database 데이터베이스명;
```

- 이름이 'dbtest'인 데이터베이스 삭제

```
drop database dbtest;
```

데이터베이스 사용

```
use 데이터베이스명;
```

- 이름이 'ssafydb'인 데이터베이스 사용

```
use ssafydb;
```

### table 생성

```
create table table_name(
    column_name1 Type [optional attributes],
    column_name2 Type,
    .
    column_nameN Type,
);
```

- optional attributes
  - NOT NULL: 각 행은 해당 열의 값을 포함해야 하며, null값은 허용되지 않음.
  - DEFAULT value: 값이 전달되지 않을 때 추가되는 기본값 설정.
  - UNSIGNED: Type이 숫자인 경우만 해당되며 숫자가 0 또는 양수로 제한됨.
  - AUTO INCREMENT: 새 코드가 추가 될 때마다 필드 값을 자동으로 1증가시킴.
  - PRIMARY KEY: 테이블에서 행을 고유하게 식별하기 위해 사용. PRIMARY KEY 설정이 있는 열은 일반적으로 ID번호이며 AUTO INCREMENT와 같이 사용되는 경우가 많음.

<br>

- 제약 조건
  - 컬럼에 저장될 데이터의 조건을 설정하는 것.
  - 제약 조건을 설정하면 조건에 위배되는 데이터는 저장 불가.
  - 테이블 생성시 컬럼에 직접 지정하거나 constraint로 지정, 또는 ALTER를 이용하여 설정가능.

<table>
<tr>제약 조건<td></td><td>description</td></tr>
<tr><td>NOT NULL</td><td>컬럼에 NULL값을 저장할 수 없고, 반드시 쿼리문을 이용하여 값을 지정.</td></tr>
<tr><td>UNIQUE</td><td>컬럼에 중복된 값을 저장할 수 없음. NULL값은 허용.</td></tr>
<tr><td>PRIMARY KEY</td><td>컬럼에 중복된 값을 저장할 수 없고, NULL값도 허용하지 않음.<br>주로 ROW를 구분하기 위한 유일한 값을 지정할 때 사용.<br>'기본키'라고도 부름.</td></tr>
<tr><td>FOREIGN KEY</td><td>특정 테이블의 PK컬럼에 저장되어 있는 값만 저장.<br>'참조키', '외래키'라고도 부름. NULL값은 허용<br>references를 이용하여 어떤 컬럼에 어떤 데이터를 참조하는지 반드시 지정.</td></tr>
<tr><td>DEFAULT</td><td>NULL값이 들어올 경우 기본 설정되는 값을 지정.</td></tr>
<tr><td>CHECK</td><td>값의 범위나 종류를 지정.<br>MYSQL 8.0.16부터 사용 가능. (이전 버전의 경우 설정은 되나 적용이 안됨)</td></tr>
</table>

- ER Diagram(ERD)
  - 개체 타입과 관계 타입을 기본 개념으로 현실 세계를 개념적으로 표현하는 방법.

## DML(Data Manipulation Language)

<b>DML.sql</b>

### SQL 종류

- DML(Data Manipulation Language) : 데이터 조작어
  - Data 조작기능
  - 테이블의 레코드를 CRUD(Create, Retrieve, Update, Delete)

<table>
<tr><td>SQL문</td><td>설명</td></tr>
<tr><td>insert(C)</td><td>데이터베이스 객체에 데이터를 입력</td></tr>
<tr><td>select(R)</td><td>데이터베이스 객체에서 데이터를 조회</td></tr>
<tr><td>update(U)</td><td>데이터베이스 객체에 데이터를 수정</td></tr>
<tr><td>delete(D)</td><td>데이터베이스 객체에 데이터를 삭제</td></tr>
</table>

### INSERT

```
INSERT INTO table_name
VALUES(col_val1, col_val2, col_val3, ... , col_valN);
```

```
INSERT INTO table_name(col_name1, col_name2, col_name3, ... ,col_nameN)
VALUES(col_val1, col_val2, col_val3, ... , col_valN);
```

```
INSERT INTO table_name(col_name1, col_name2, col_name3, ... , col_nameN)
VALUES(col_val1, col_val2, col_val3, ... , col_valN),
        (col_val1, col_val2, col_val3, ... , col_valN);
```

### UPDATE

```
UPDATE table_name
SET col_name1=col_val1, [col_name2=col_val2, ..., col_nameN=col_valN]
WHERE conditions;
```

- WHERE절의 conditions(조건)에 만족하는 레코드의 값을 변경
- 주의: WHERE절을 생략하면 모든 데이터가 바뀐다.

### DELETE

```
DELETE from table_name
WHERE conditions;
```

- WHERE절의 conditions(조건)에 만족하는 레코드의 값을 삭제.
- 주의: WHERE절을 생략하면 모든 데이터가 삭제된다.

### SELECT

<b>Select.sql</b>

- SELECT clause와 FROM clause는 필수.

```
SELECT *|{[ALL|DISTINCT] column|expression[alias], ...}
FROM table_name;
```

<table>
<tr><td>select clause</td><td>description</td></tr>
<tr><td>*</td><td>FROM 절에 나열된 테이블에서 모든 열을 선택.</td></tr>
<tr><td>ALL</td><td>선택된 모든 행을 반환. ALL이 default(생략 가능).</td></tr>
<tr><td>DISTINCT</td><td>선택된 모든 행중에 중복 행 제거.</td></tr>
<tr><td>column</td><td>FROM 절에 나열된 테이블에서 지정된 열을 선택.</td></tr>
<tr><td>expression</td><td>표현식은 값으로 인식되는 하나 이상의 값, 연산자 및 SQL 함수의 조합을 뜻함.</td></tr>
<tr><td>alias</td><td>별칭.</td></tr>
</table>

alias

```
SELECT column_name1 as "alias1", column_name2 alias2, ...;
```

사칙연산 사용 가능<br><br>

CASE

```
CASE exp1 WHEN exp2 THEN exp3
        [WHEN exp4 THEN exp5]
            ...
        ELSE exp6]
END
```

- WHERE clause: 조건에 만족하는 행을 검색

```
SELECT *|{[ALL|DISTINCT] column|expression[alias], ...}
FROM table_name
WHERE conditions;
```

AND, OR, NOT 사용 가능<br><br>

IN

```
SELECT column_name
FROM table_name
WHERE column_name in (val1, val2, val3, ...);
```

BETWEEN

```
WHERE salary >= 6000
and salary <= 10000;
```

```
WHERE salary BETWEEN 6000 and 10000;
```

NULL 비교 : IS NULL, IS NOT NULL<br><br>

LIKE(wild card: %, \_).<br><br>

- ORDER BY clause: 정렬(default: ASC)

```
SELECT *|{[ALL|DISTINCT] column|expression[alias], ...}
FROM table_name
WHERE conditions
ORDER BY col_name1[ASC|DESC][, col_name2, ...];
```

## DCL(Data Control Language)

### SQL 종류

- DCL(Data Control Language) : 데이터 제어어
  - DB, Table의 접근권한이나 CRUD 권한을 정의
  - 특정 사용자에게 테이블의 검색권한 부여/금지등

<table>
<tr><td>SQL문</td><td>설명</td></tr>
<tr><td>grant</td><td>데이터베이스 객체에 권한을 부여</td></tr>
<tr><td>revoke</td><td>데이터베이스 객체 권한 취소</td></tr>
</table>

## TCL(Transaction Control Language)

### SQL 종류

- TCL(Transaction Control Language) : 트랜잭션 제어어
  - transaction이란 데이터베이스의 논리적 연산 단위

<table>
<tr>SQL문<td></td><td>설명</td></tr>
<tr><td>commit</td><td>실행한 Query를 최종적으로 적용</td></tr>
<tr><td>rollback</td><td>실행한 Query를 마지막 commit전으로 최소시켜 데이터를 복구</td></tr>
</table>

## Data Type

### table 생성

- 문자형 데이터 타입

<table>
<tr><td>데이터 유형</td><td>정의</td></tr>
<tr><td><b>CHAR[(M)]</b></td><td>고정 길이를 갖는 문자열을 저장.<br>M은 1~255(2^8 - 1)<br>CHAR(20)인 컬럼에 10자만 저장을 하더라도 20자 만큼의 기억장소를 차지</td></tr>
<tr><td><b>VARCHAR[(M)]</b></td><td>가변 길이를 갖는 문자열을 저장.<br>M은 1~65535(2^16 - 1)<br>VARCHAR(20)인 컬럼에 10자만 저장을 하면 실제로도 10자 만큼의 기억장소를 차지</td></tr>
<tr><td>TINYTEXT[(M)]</td><td>최대 255(2^8 - 1)byte</td></tr>
<tr><td><b>TEXT[(M)]</b></td><td>최대 65535(2^16 - 1)byte</td></tr>
<tr><td>MEDIUMTEXT[(M)]</td><td>최대 16777215(2^24 - 1)byte</td></tr>
<tr><td>LONGTEXT[(M)]</td><td>최대 (2^32 - 1)byte</td></tr>
<tr><td>ENUM('value1', 'value2', ...)</td><td>열거형. 정해진 몇가지의 값들 중 하나만 저장<br>최대 65535개의 개별 값을 가질 수 있고 내부적으로 정수 값으로 표현된다.</td></tr>
<tr><td>SET('value1', 'value2', ...)</td><td>집합형. 정해진 몇가지의 값들 중 여러 개를 저장<br>최대 64개의 요소로 구성될 수 있고, 내부적으로는 정수 값이다.</td></tr>
</table>

- 숫자형 데이터 타입
<table>
<tr><td>데이터 유형</td><td>바이트</td><td>정의</td></tr>
<tr><td>BIT[(M)]</td><td>1</td><td>비트 값 유형. M은 값 당 비트 수를 나타내며 1에서 64 사이의 값을 나타냄.</td></tr>
<tr><td>BOOL, BOOLEAN</td><td></td><td>이 유형은 TINYINT(1)의 동의어. 0은 false, 0이 아닌 값은 true로 간주</td></tr>
<tr><td>TINYINT[(M)]</td><td>1</td><td>(signed)-128 ~ 127<br>(unsigned)0 ~ 255(2^8)</td></tr>
<tr><td>SMALLINT[(M)]</td><td>2</td><td>(signed)-327658 ~ 32767<br>(unsigned)0 ~ 65535(2^16)</td></tr>
<tr><td>MEDIUMINT[(M)]</td><td>3</td><td>(signed)-8388608 ~ 8388607<br>(unsigned)0 ~ 2^24</td></tr>
<tr><td><b>INT[(M)]</b></td><td>4</td><td>(signed)-2147483648 ~ 2147483647<br>(unsigned)0 ~ 2^32</td></tr>
<tr><td>BIGINT[(M)]</td><td>8</td><td>(signed)-2^63 ~ 2^63-1<br>(unsigned)0 ~ 2^64</td></tr>
<tr><td>FLOAT[(M, D)]</td><td>4</td><td>(signed)-3.402823466E+38 ~ 1.175494351E-38<br>(unsigned)1.175494351E-38 ~ 3.402823466E+38</td></tr>
<tr><td>DOUBLE[(M, D)]<br>DOUBLEPRECISION[(M, D)]<br>REAL[(M, D)]</td><td>8</td><td>(signed)-1.7976931348623157E+908 ~ 2.2250738585072014E-308<br>(unsigned)2.2250738585072014E-308 ~ 1.7976931348623157E+308</td></tr>
<tr><td>FLOAT(p)</td><td></td><td>부동 소수점 숫자. p는 비트 정밀도를 가리키지만, MySQL은 결과 데이터 타입으로 FLOAT 또는 DOUBLE을 사용할 지를 결정할 때에만 이 값을 사용한다.</td></tr>
<tr><td>DECIMAL[(M[, D])]</td><td>길이+1</td><td>묶음 고정 소수점 숫자<br>M은 전체 자릿수(Precision: 정밀도), D는 소수점 뒷 자리수(Scale: 배율)<br><br>- DECIMAL(5)의 경우: -99999 ~ 99999<br>- DECIMAL(5, 1)의 경우: -9999.9 ~ 9999.9<br>- DECIMAL(5, 2)의 경우: -999.99 ~ 999.99<br><br>최대 65자리까지 지원</td></tr>
<tr><td>DEC[(M[, D])]<br>NUMERIC[(M[, D])]<br>FIXED(M[, D])]</td><td></td><td>DECIMAL과 동의어다. FIXED 동의어는 다른 데이터베이스 시스템과의 호환을 위해서 사용하는 것이다.</td></tr>
</table>

- 날짜형 데이터 타입
<table>
<tr><td>데이터 유형</td><td>바이트</td><td>정의</td></tr>
<tr><td>DATE</td><td>3</td><td>YYYY-MM-DD('1001-01-01' ~ '9999-12-31')</td></tr>
<tr><td>TIME</td><td>3</td><td>HH:MM:SS('-838:59:59' ~ '838:59:59')</td></tr>
<tr><td><b>DATETIME</b></td><td>8</td><td>YYYY-MM-DD HH:MM:SS('1001-01-01 00:00:00' ~ '9999-12-31 23:59:59')</td></tr>
<tr><td><b>TIMESTAMP[(M)]</b></td><td>4</td><td>1970-01-01 ~ 2038-01-19 03:14:07까지 지원(1970-01-01 00:00:00를 0으로 해서 1초 단위로 표기)<br>Index가 더 빠르게 생성.</td></tr>
<tr><td>YEAR[(2|4)]</td><td>1</td><td>2와 4를 지정할 수 있으며, 2인 경우에 값의 범위는 70 ~ 69, 4인 경우에는 1970 ~ 2069이다</td></tr>
</table>

- 이진 데이터 타입
<table>
<tr><td>데이터 유형</td><td>정의</td></tr>
<tr><td>BINARY[(M)]</td><td>CHAR유형과 유사하지만 이진 바이트 문자열을 이진이 아닌 문자열로 저장.<br>M은 바이트 단위의 열 길이를 나타냄.</td></tr>
<tr><td>VARBINARY[(M)]</td><td>VARCHAR유형과 유사하지만 이진 바이트 문자열을 이진이 아닌 문자열로 저장.<br>M은 바이트 단위의 열 길이를 나타냄.</td></tr>
<tr><td>TINYBLOB[(M)]</td><td>이진 데이터 타입. 최대 (2^8 -1)byte</td></tr>
<tr><td>BLOB[(M)]</td><td>이진 데이터 타입. 최대 (2^16 -1)byte</td></tr>
<tr><td>MEDIUMBLOB[(M)]</td><td>이진 데이터 타입. 최대 (2^24 -1)byte</td></tr>
<tr><td>LONGBLOB[(M)]</td><td>이진 데이터 타입. 최대 (2^32 -1)byte</td></tr>
</table>
