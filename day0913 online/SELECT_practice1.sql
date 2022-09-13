create database scottdb
default character set utf8mb3 collate utf8mb3_general_ci;

use scottdb; -- 사용할 db 지정
desc emp;

####### select 기본
# 1. select
SELECT empid, fname, deptid
from emp;

SELECT deptid, deptname
from dept;

SELECT * -- * : 모든 컬럼
from dept;

# 2. distinct /all : 중복제거
SELECT distinct deptid
from emp;

SELECT all deptid -- all은 default
from emp;

SELECT distinct deptid, jobid
from emp;

# 3. order by : 정렬
SELECT empid, fname, jobid
from emp
order by 2; -- select 되는 컬럼 기준
-- order by jobid desc; -- 정렬 기준 안주면 기본이 오름차순

-- 입사일 오름차순, 연봉 높은 순(내림차순)
SELECT empid, fname, hdate, salary
from emp
order by hdate, salary desc;

# 4. where : 조건
SELECT empid, fname, deptid
from emp
where deptid = 50
order by fname;

-- 입사일이 '2005-05-05' 이후인 레코드
SELECT empid, fname, hdate
from emp
where hdate > '2005-05-05';

-- jobid가 'IT_PROG'인 레코드
select empid, fname, jobid
from emp
where jobid='IT_PROG';

-- 사번이 127, 130, 178인 레코드
select *
from emp
where empid = 127
or empid = 130
or empid = 178;

-- 50번 부서 이상의 직원 중 연봉이 8000이상인 레코드
select *
from emp
where deptid >= 50
and salary >= 8000;

# 5. alias: 컬럼명에 별칭
select empid as "사번", fname 이름, salary 연봉, salary * 1.1 "새 연봉"
from emp;

# 6. 산술연산자, 논리연산자(and, or, not)

# 7. 데이터 조작어: between, like, in, is
# between A and B: A와 B 사이
-- 입사일이 2005-03-11 ~ 2005-05-31 사이인
select empid, lname, hdate
from emp
where hdate between '2005-03-11' and '2005-05-31'
order by hdate;

-- like: 유사검색(%: 글자 내용이나 길이와 무관)
-- fname이 'A'로 시작하는 레코드
select empid, fname
from emp
where fname like 'A%';

-- fname에 'e'가 들어가는 레코드
select empid, fname
from emp
where fname like '%e%';

-- lname이 'A'로 시작하고 총 4글자인 레코드
-- _: _한 개가 한 글자 의미
select empid, lname
from emp
where lname like'A___';

-- in(== or)
-- 사번이 127, 130, 178인 레코드
select *
from emp
where empid in (127, 130, 178);

-- not
select empid, fname, deptid
from emp
where deptid not in (40, 50, 60)
order by deptid;

-- is: null값 비교할 때 사용
select empid, fname
from emp
where deptid is null;

-- 커미션을 받는 직원들 정보
select *
from emp
where comm is not null;

#### function ####
# 1. 집계함수: max, min, avg, sum, count
-- 50 번 부서의 연봉 평균, 연봉 합계 
select avg(salary) 연봉평균, sum(salary) 연봉합계, count(empid) 인원수
from emp
where deptid = 90;

# 2. 숫자관련 함수
select ceil(8.9), round(123.567, 2), floor(2.5); -- 올림, 반올림, 내림

select empid 사번, fname 이름, round(salary*1.123, 1) 새연봉
from emp;

# 3. 문자 관련 함수
select empid 사번, concat(fname, ' ', lname) 이름
from emp;

select empid, fname, replace(fname, 'a', 'x')
from emp;

select fname, substr(fname, 1, 2) -- 첫번째 글자부터 2글자
from emp;

# 4. 날짜 관련 함수
select now(), sysdate(), curdate(), curtime()
from dual;

# 5. null check 함수
select comm, if(comm, 1, 0) "if", ifnull(comm, 'none') "ifnull", coalesce(comm, 'nope') "coalesce"
from emp;

-- coalesce(a, b, c, ...): a, b, c중에서 null이 아닌 최초의 값 리턴