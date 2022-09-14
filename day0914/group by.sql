use scottdb;

# 함수

## group by
-- 1. 부서별 연봉 평균
-- select avg(salary), deptid
-- from emp;

select deptid 부서, round(avg(salary), 1) 연봉평균
from emp
where deptid is not null
group by deptid
having round(avg(salary), 1) >= 7000 -- group by로 나눈 그룹에 대한 조건 적용
order by deptid;

-- 2. jobid별 인원수(5명 이상인 부서만), 연봉 평균. 인원수 오름차순 정렬, 연봉 내림차순
select jobid, count(*) 인원수, round(avg(salary)) 연봉
from emp
group by jobid
having 인원수 >= 5
order by 인원수, 연봉 desc;

-- 3. 부서 별 동일 직무를 가진 직원의 deptid, jobid, fname, 인원수, 연봉평균
-- group by 사용시에 select절에 나오는 컬럼은 집계함수를 제외하고 모두 group by절에 나와줘야함
select deptid, jobid, fname, count(*) 인원수, round(avg(salary))
from emp
group by deptid, jobid
order by deptid;