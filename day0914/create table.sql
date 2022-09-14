# table creation & constraint
-- 1. table 생성: inline
create table test1(
	`id` int primary key,
	`email` varchar(20) unique,
	`name` varchar(10) not null
);

select * from test1;

drop table test1;

-- 2. outline 방식
create table test2(
	id int,
	email varchar(20) unique,
    name varchar(10) not null,
    constraint test2_pk primary key(id) -- 제약조건
);

-- 3. after creation(테이블 만들고 나서)
create table test3(
	id int,
	email varchar(20) unique,
    name varchar(10) not null
);

alter table test3 add constraint test3_pk primary key(id);

-- emp(empid)
alter table emp add constraint emp_pk primary key(empid);

-- dept(deptid)
alter table dept add constraint dept_pk primary key(deptid);

-- job(jobid)
alter table job add constraint job_pk primary key(jobid);

-- loc(locid)
alter table loc add constraint loc_pk primary key(locid);

-- foreign key(다른 곳의 컬럼을 참조하는 컬럼). null 허용
-- emp(deptid는 dept테이블의 deptid를 참조)
alter table emp
add constraint emp_fk_deptid foreign key(deptid)
references dept(deptid);

-- emp(jobid) -> job(jobid)
alter table emp
add constraint emp_fk_jobid foreign key(jobid)
references job(jobid);

-- dept(locid) -> loc(locid)
alter table dept
add constraint dept_fk_locid foreign key(locid)
references loc(locid);

desc dept;
insert into dept values(280, 'ssafy', 900, 1000);

select *
from dept
where deptid = 280;

-- emp(mgrid) -> emp(empid)
alter table emp
add constraint emp_fk_mgrid foreign key(mgrid)
references emp(empid);

## view: 가상 테이블. 물리적으로 존재하지 않고 뷰를 만들 때 사용된 query만 저장됨
create or replace view emp2
as select empid, fname, d.deptid, deptname, hdate, email
from emp e left join dept d
on e.deptid = d.deptid
order by empid;

select * from emp2;
insert into emp2 values(
	207,
    'harry',
    1999,
    'Marketing',
    sysdate(),
    'HARRY'
);

desc emp2;