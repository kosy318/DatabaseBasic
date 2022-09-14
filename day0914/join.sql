# join: 두개 이상의 테이블이 공통 컬럼을 기준으로 결합하는 것
-- inner join
-- where: empid, fname, deptname
select e.empid, e.fname, d.deptname
from emp e, dept d
where e.deptid = d.deptid;

-- join ~ on
select e.empid, e.fname, d.deptname
from emp e join dept d
on e.deptid = d.deptid;

-- join ~ using(ANSI)
select e.empid, e.fname, d.deptname
from emp e join dept d
using (deptid); -- 양쪽 테이블의 공통커럼

-- where: empid, fname, deptname, jobtitle
select empid, fname, deptname, jobtitle
from emp e, dept d, job j
where e.deptid = d.deptid
and e.jobid = j.jobid
order by 1;

-- join ~ on
select empid, fname, deptname, jobtitle
from emp e join dept d
on e.deptid = d.deptid
join job j
on e.jobid = j.jobid
order by 1;

-- 이름이 Adam인 직원의 부서명
select fname, deptname
from emp e join dept d
on e.deptid = d.deptid
where fname = 'Adam';

-- 부서별 관리 직원의 이름
select deptname, fname
from emp e join dept d
on e.deptid = d.deptid
and e.mgrid = d.mgrid
group by deptname;

-- 부서별 도시 이름
select deptname, city
from emp e join dept d
on e.deptid = d.deptid
join loc l
on d.locid = l.locid
group by deptname;

# self join: 동일한 테이블에 대해 조인하는 경우
-- 모든 직원들의 상사 이름
select e1.empid, e1.fname, e2.fname
from emp e1, emp e2
where e1.mgrid = e2.empid;

# outer join: left나 right를 써서 null값을 가지고 있지 않은 쪽을 고름
select e.empid, e.fname, d.deptname
from emp e left join dept d -- left: null 값을 가지고있지 않은 쪽
on e.deptid = d.deptid;

-- empid, fname, deptname, city
select e.empid, e.fname, d.deptname, c.city
from emp e left join dept d
on e.deptid = d.deptid
left join loc c
on d.locid = c.locid;

-- deptid, deptname, manager name
select d.deptid, deptname, fname
from dept d left join emp e
on d.mgrid = e.empid;

-- 자신의 매니저 salary가 15000이상인 직원의 id, 직원이름, 매니저이름, 매니저 salary
select e.empid, e.fname, m.fname, m.salary
from emp e join emp m
on e.mgrid = m.empid
and m.salary >= 15000;