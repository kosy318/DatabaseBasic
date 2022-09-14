# subquery
-- 연봉이 제일 낮은 사람의 이름
select fname, min(salary)
from emp;

select fname, min(salary)
from emp
where salary = (
	select min(salary)
    from emp
);

-- 회사 전체 평균 연봉보다 많이 받는 직원 정보
select empid, lname, salary
from emp
where salary > (
	select avg(salary)
    from emp
)
order by salary;

-- 30번 부서 직원 연봉과 같은 금액을 받는 직원 정보
select empid, fname, salary
from emp
where salary in (
	select salary
    from emp
    where deptid = 30
)
order by salary;

-- Seattle에 있는 부서 정보
select deptid, deptname
from dept
where locid = (
	select locid
    from loc
    where city = 'Seattle'
);

-- 업무명이 Programmer인 직원들 정보
select empid, fname
from emp
where jobid = (
	select jobid
    from job
    where jobtitle = 'Programmer'
);

-- 미국에 근무하는 직원들의 평균 연봉보다 많이 받는 직원 정보
select empid, fname, salary
from emp
where salary > (
	select avg(salary)
    from emp e join dept d
    on e.deptid = d.deptid
    join loc l
    on d.locid = l.locid
    where countryid = 'US'
);