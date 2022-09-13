# 0. emp테이블의 모든 레코드
select *
from emp;

# 1.직원의 id가 158인 레코드의 fname,lname,phone 검색
select fname, lname, phone
from emp
where empid = 158;

# 2. fname이 ‘D’로 시작하는 직원의 id와 이름,부서ID 검색
select empid, fname, deptid
from emp
where fname like 'D%';

# 3. 부서번호가 30인 사원들의 사번과 fname, jobid, salary,deptid 출력
select empid, fname, jobid, salary, deptid
from emp
where deptid = 30;

# 4. comm이 0.2이상인 사원의 사번과 fname,comm 출력
select empid, fname, comm
from emp
where comm >= 0.2;

# 5. 입사일이 1999년 12월31일 이후인 직원의 사원의 사번과 fname,입사일 출력
   -- (입사일로 오름차순 정렬)
select empid, fname, hdate
from emp
where hdate > '1999-12-31'
order by hdate;

# 6. 부서번호가 20에서 50번 사이의 직원이름과 부서ID를 검색
   -- (부서id로 오름차순 정렬)
select fname, deptid
from emp
where deptid between 20 and 50
order by deptid;

# 7.  부서번호가 없는 직원의 id와 email, fname 검색
select empid, email, fname
from emp
where deptid is null;

# 8. jobid가 'ST_CLERK' ,'SA_MAN','SA_REP'인 직원의 id와 이름,  jobid
select empid, fname, jobid
from emp
where jobid in ('ST_CLERK' ,'SA_MAN','SA_REP');

# 9.  전화번호가 650으로 시작하는 직원의 id와 이름,부서ID, 전화번호 검색
select empid, fname, deptid, phone
from emp
where phone like '650%';

# 10. comm이 null이 아닌 직원 중 그 값이 0.3 이상인 레코드(comm으로 정렬)
select *
from emp
where comm is not null
and comm >= 0.3
order by comm;

# 11. 아래와 같이 출력 되도록 Query 작성
      -- 사번               업무        
      -- 101   The Job of Steven King is AD_PRES.
select empid 사번, concat('The Job of ', fname, ' ', lname, ' is ', jobid, '.') 업무
from emp;

# 12. salary가 높은 상위 5명
select *
from emp
order by salary desc
limit 5;

# 13. 입사일 순으로 사원 정보 정렬(오래된 순으로)
select *
from emp
order by hdate;

# 14. 부서 ID가 40번이 아닌 부서에 속한 직원 들 중 SALARY가 20000이상인 레코드
select *
from emp
where deptid != 40
and salary >= 20000;

# 15. empid, fname, salary, 10% 증가된 salary(새연봉) :
    -- 새연봉 순으로 정렬
select empid, fname, salary, salary*1.1 새연봉
from emp
order by 새연봉;

# 16. hdate가 '1999/12/15'에서 '1999/12/31' 사이의 직원의 
    -- 사번,전화번호, jobid, salary
select empid 사번, phone 전화번호, jobid, salary
from emp
where hdate between '1999-12-15' and '1999-12-31';
    
# 17. comm이 null이 아닌 직원 중 empid, fname, phone, comm,
-- comm * 1.2(new commission,소수점 2자리 반올림) 
-- new commission으로 내림차순 정렬
select empid, fname, phone, comm, round(comm*1.2, 2) "new commission"
from emp
where comm is not null
order by `new commission` desc;