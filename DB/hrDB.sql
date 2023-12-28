select * from tab;
select * from locations;

desc employees;
desc job_history;

select * from countries;
select * from locations;

--회사관련 건물들의 거리 주소만 출력해 보자.
select street_address from locations;

--회사에 존재하는 모든 작업 아이디만 출력해보자.
select job_id from jobs;

--회사에 존재하는 모든 (직업)직무에 이름을 출력해보자.
select job_title from jobs;

--모든 사원의 이름과 성을 출력해 보자.
select first_name,last_name from employees;

--사원의 사번과 이메일을 출력해 보자.
select employee_id,email from employees;

--직업 이력에 있는 사원들의 사번, 직업시작일, 직업종료일을 출력해 보자.
select employee_id, start_date, end_date from job_history;

-- 직업별 직업명,최소,최대 급여를 출력해 보자.
select job_title, min_salary, max_salary from jobs;


select * from jobs;


--관리자가 없는 사원의 정보를 출력해보자.
select * from employees where manager_id is null;
select * from employees where manager_id is not null;

--커미션이 있는 사원의 정보를 출력해보자.
select * from employees where commission_pct is not null;

--부서를 배정받지 못한 사원을 출력해보자.
select * from employees where department_id is null;

--커미션이 있는 사원중 봉급이 10000이상인 사원의 정보를 출력해보자. where 절에 and 를 사용하여 두조건이 모두 맞을때만 동작하게 할 수 있다.
select * from employees where commission_pct is not null and salary>=10000;

select salary,salary+50 from employees;



--월급이 8000 초과 이면서 10000 미만인 사원의 정보를 출력해 보자.
select * from employees where salary>8000 and salary<10000;

--월급이 7000이하 이거나 10000초과인 사원의 정보를 출력해 보자.
select * from employees where salary<=7000 or salary>10000;

--부서가 80이 아닌 사원 정보를 출력해 보자.
select * from employees where department_id!=80;

--커미션을 받으면서 2008년 이전에 입사한 사원 정보를 출력해 보자.
select * from employees where hire_date<'2008-01-01' and commission_pct is not null;
select * from employees where hire_date<'2009-01-01' and commission_pct is not null;

--대륙 아이디가(REGION_ID) 1, 3, 4인 나라 정보를 출력해보자.
select * from countries where region_id=1 or region_id=3 or region_id=4;


--연봉이 8000보다 같거나 많고 10000보다 같거나 작은 사원 정보를 출력해 보자.
select * from employees where salary between 8000 and 10000;
select * from employees where salary >= 8000 and salary<=10000;

--연봉이 7000 미만 이거나 10000초과인 사원 정보를 출력해 보자.
select * from employees where salary<7000 or salary>10000;
select * from employees where salary not between 7000 and 10000;

--사원의 이름이 E~G로 시작하는 사원정보를 출력해 보자.
select * from employees where first_name between 'E' and 'H'
    and first_name != 'H';

-- 사원의 입사일이 2004년 5월 20일 ~ 2007년 10월 9일 이전 까지의 사원 정보를 출력해
select * from employees where hire_date between '2004-05-20' and '2007-10-10';


--사원의 봉급과 커미션비율을 이용하여 사원이 1년 동안 받는 전체 금액을 구해보자. 상위
--3가지 방법을 이용해서 풀어보자. 봉급 salary는 월급에 해당하고 커미션은 1년간 받은
--월급에 커미션 비율로 받는다.

--1) 사원이 1년 동안 받는 전체 금액
select salary, nvl2(commission_pct, commission_pct,0),salary*12+ 
salary*12*decode(commission_pct,null,0,commission_pct) from employees;


select * from employees;
select commission_pct from employees;
select commission_pct+1 from employees;  --1을 얻고 싶은 것 그래서 널을 0으로 바꿀려고 함
--함수 3가지 방법 nvl, nvl2, decode
select nvl(commission_pct, 0)+1 from employees;
select nvl2(commission_pct, 'notnull', 'strnull')from employees;
select nvl2(commission_pct, commission_pct, 0)+1 from employees;


select first_name, commission_pct,
    case
        when commission_pct <=0.1 then '하'
        when commission_pct <=0.2 then '중'
        when commission_pct > 0.2 then '상'
        when commission_pct is null then 'nul이다'
        else '선택받지 못한 데이터'
    end as PCT
from employees;

--문제1
select department_name,location_id department_city from departments;
select department_name, decode(location_id, 1500, 'SanFrancisco',
                               1700, 'Seattle',
                               2400, 'London', 'ETC CITY') as department_city
from departments;

--문제2
select job_id, salary,
    case
        when salary <= 10000 then 'LOW'
        when salary > 10000 then 'HIGH'
    end as sal_ary
from employees;

--문제3
select first_name,
    case
        when EXTRACT(YEAR FROM hire_date) < '2005' then '2005년 이전 입사'
        when EXTRACT(YEAR FROM hire_date) >= '2005' then '2005년 이후 입사'
        end as hire_date
from employees;

select * from employees
    where commission_pct = 0.1 or commission_pct = 0.25
                               or commission_pct = 0.2
                               or commission_pct = 0.3;

select * from employees where commission_pct in (0.1,0.25,0.2,0.3);

select * from employees where commission_pct not in (0.1,0.25,0.2,0.3);

select * from countries where region_id not in (1,3,4);


commit;

-- scott 문제 참고하여 여기서도 푸는거
select * from employees;
select first_name, email, job_id from employees;


select to_char(560, '$999,999'),
to_char(560, '$000,000') from dual;

--p.62~64
--문제 1
select concat(concat('a','b'),'c') from dual;

--문제2
select abs(salary -1000) from employees;

--문제3
select * from employees;
-- abs 함수 : 절대값 출력
select -10,abs(-10) from employees;

--floor 함수: 소수점 아래를 버림
select floor(1.000) from employees;

--round 함수: 소수점 반올림
select round(11.000), round(11.123,2) from employees;

--trunc 함수: 소수점 버림
select trunc(515.123),trunc(515.123,-1) from employees;

--mod 함수: 나머지 구하는 함수
select mod(7,2), mod(5,3) from employees;

--lower(소문자), upper(대문자), initcap(시작부분만 대문자로 변경)
select lower('HELLO world'), upper('HELLO world'), initcap('HELLO world') from employees;

--concat 함수: 문자열 합치기
select concat('he', 'llo')from employees;

--substr 함수: 부분문자열 추출
select substr('안녕 HELLO world', 2,4) from employees; 

--length 함수: 문자열 개수
select length('안녕 HELLO world') from employees;

--ltrim(왼쪽공백 삭제), rtrim(오른쪽공백 삭제), trim(양쪽공백 삭제)
select '|' || trim('    hello'), ltrim('    hello   '), rtrim('     hello') from employees;

--instr 함수: 특정 문자열의 위치를 찾음
select instr(upper('wo 안녕 HELLO world'), 'WO', 1, 2) from employees;

--months_between 함수: 두 날짜의 월차를 구함
select months_between(sysdate, sysdate + 60) from employees;

--add_month 함수: 월을 더함
select add_months(sysdate, 2) from employees;

--next_day 함수: 다음 요일의 날짜를 구함
select next_day(sysdate, 7) from employees;

--last_day 함수: 달의 마지막일을 구함
select last_day(sysdate) from employees;

--to_char 함수: 문자로 변환
select to_char(sysdate, 'YYYY/MM:dd HH24:MI:SS 입니다.') from employees;
select to_char(560, '$999,999'),
to_char(560, '$000,000') from employees;
select to_char(50) from employees;

--to_date 함수: 날짜형으로 변환
select to_date('1977:05:06 14:05:06', 'YYYY:MM:DD HH24:MI:SS') from employees;

--to_number 함수: 숫자형 변환
select to_number('1') from employees;


--반에서 가장 점수가 높은 학생
-- select MAX(점수) from 학생; -99
--반에서 가장 점수가 낮은 학생
-- select min(점수) from 학생; -19
--반의 학생 수
-- select count(점수) from 학생; -7

--각 반별 점수가 가장 높은 학생의 점수
-- select 반, max(점수) from 학생 group by 반;

--각 반별 점수가 가장 낮은 학생의 점수
-- select 반, min(점수) from 학생 group by 반;

--반의 학생수
-- select count(점수) from 학생;


select department_id from employees;

--null 값을 제외한 사원의 평균
select department_id, count(department_id), avg(salary)
from employees group by department_id;

--null로 문제가 발생할 수 있음, null 값이 없지만 만약 있다면 null처리를 해 주어야함
select count(department_id), count(nvl(department_id, 0))
from employees group by department_id;

--부서번호가 100보다 작은 데이터 중, 부서번호로 그룹, 그룹별 사원 평균봉급 출력해보기
select department_id, avg(salary) from employees where department_id < 100
group by department_id;


--avg : 검색된 그룹 평균을 반환
select department_id, avg(salary) avg_salary from employees
where department_id < 100 group by department_id
having avg(salary) >= 8000
order by avg_salary desc;


commit;


select sum(salary) from employees;


-- Date 8/2
select * from employees;
select * from departments;
select * from employees, departments;
select count(*) from employees, departments;

--사원의 부서 이름 출력 쿼리
select employees.first_name, department_name
from employees, departments
where employees.department_id = departments.department_id;
--출력 개수를 확인해보면 사원수가 107인데 조인 결과 106개가 된것을 확인할 수 있다.
select count(*) from employees, departments
where employees.department_id = departments.department_id;

select * from employees
where employees.department_id is null;

--
select employees.*, departments.*, nvl(departments.department_name, '대기중')
from employees, departments
where employees.department_id =departments.department_id(+);

--모든 사원정보와 해당 사원의 부서 정보를 모두 출력해 보자.
select * from employees, departments
where employees.department_id = departments.department_id;


--사원
select a.employee_id, a.first_name, a.manager_id,
b.employee_id, b.first_name, b.manager_id
from employees a, employees b
where a.manager_id=b.employee_id;

commit;

--1
select e1.employee_id, e1.manager_id
from employees e1
where e1.employee_id = 101;

--2
select e2.employee_id,e2.first_name -- 100,steven 출력
from employees e2
where e2.employee_id=100;


select e1.*,e2.*,e1.employee_id,e2.first_name
from employees e1, employees e2
where e1.manager_id=e2.employee_id;

-- outer join / left outer join / right outer join
select count(*) from employees;
select count(*) from employees, departments
where employees.department_id = departments.department_id;
--사원수가 107인데 한명의 부서번호 데이터에 null이 들어 있어서 106으로 나옴, 이럴땐 사원 테이블 기준으로 outer 조인 사용

--left outer join
select employees.department_id, employees.first_name, department_name 
from employees, departments
where employees.department_id = departments.department_id(+);


--ansi 표준 형태로 left outer 조인 sql을 작성하면 107개 출력, 정보 없는 사원도 출력됨
select employees.department_id, employees.first_name, department_name
from employees left outer join departments
on employees.department_id = departments.department_id;


--right outer join
select employees.department_id, employees.first_name, department_name
from employees, departments
where employees.department_id(+) = departments.department_id

--부서는 11개의 부서와 1개의 null
select distinct(employees.department_id) from employees;
--회사에 존재하는 전체 부서
select distinct(department_id) from departments;

--ansi표준형태의 right outer join문을 sql
select employees.department_id,employees.first_name,department_name
from employees right outer join departments
on employees.department_id =departments.department_id;

select employees.department_id,employees.first_name,department_name
from employees,departments
where employees.department_id(+) =departments.department_id(+);

select employees.department_id,employees.first_name,department_name
from employees full outer join departments --full outer join
on employees.department_id = departments.department_id;

-- area
select country_id from countries where region_id = 2;
select * from locations where country_id in ('AR', 'BR', 'CA', 'MX', 'US');

select * from locations where country_id in (
    select country_id from countries where region_id = 2
);

select * from locations where country_id in (
    select country_id from countries where region_id = 3
);

select REGION_ID from regions where REGION_NAME = 'Asia';

commit;

country_id =  JP CN AU SG ML
select country_id from countries where region_id(
    select REGION_ID from regions where REGION_NAME = 'Asia' );

select  * from location where country+id in (
    select country_id from countries where region_id{
        slelect country_id countries where RECION_NAME = 'Asiaa');
        
        
select salary from employees where salary <= any(30, 90, 170);
        
commit;

-- 아래 이거랑 아래아래를 합칠꺼임
select * from jobs
where job_id in ('AD_PRES', 'SA_MAN', 'IT_PROG')
order by min_salary;

-- 모든 사원의 급여가 3직종 중 어떤 직종과 같을지 출력
select * from employees;

select employees.employee_id,employees.salary, j.* 
from employees, (
    select * from jobs
    where job_id in ('AD_PRES', 'SA_MAN', 'IT_PROG')
    order by min_salary) j --j라고 별명을 붙인 것
--where employees.salary between j.min_salary and j.max_salary
where employees.salary >= j.min_salary and employees.salary < j.max_salary
order by employees.employee_id, min_salary;

commit;



