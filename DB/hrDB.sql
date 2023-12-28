select * from tab;
select * from locations;

desc employees;
desc job_history;

select * from countries;
select * from locations;

--ȸ����� �ǹ����� �Ÿ� �ּҸ� ����� ����.
select street_address from locations;

--ȸ�翡 �����ϴ� ��� �۾� ���̵� ����غ���.
select job_id from jobs;

--ȸ�翡 �����ϴ� ��� (����)������ �̸��� ����غ���.
select job_title from jobs;

--��� ����� �̸��� ���� ����� ����.
select first_name,last_name from employees;

--����� ����� �̸����� ����� ����.
select employee_id,email from employees;

--���� �̷¿� �ִ� ������� ���, ����������, ������������ ����� ����.
select employee_id, start_date, end_date from job_history;

-- ������ ������,�ּ�,�ִ� �޿��� ����� ����.
select job_title, min_salary, max_salary from jobs;


select * from jobs;


--�����ڰ� ���� ����� ������ ����غ���.
select * from employees where manager_id is null;
select * from employees where manager_id is not null;

--Ŀ�̼��� �ִ� ����� ������ ����غ���.
select * from employees where commission_pct is not null;

--�μ��� �������� ���� ����� ����غ���.
select * from employees where department_id is null;

--Ŀ�̼��� �ִ� ����� ������ 10000�̻��� ����� ������ ����غ���. where ���� and �� ����Ͽ� �������� ��� �������� �����ϰ� �� �� �ִ�.
select * from employees where commission_pct is not null and salary>=10000;

select salary,salary+50 from employees;



--������ 8000 �ʰ� �̸鼭 10000 �̸��� ����� ������ ����� ����.
select * from employees where salary>8000 and salary<10000;

--������ 7000���� �̰ų� 10000�ʰ��� ����� ������ ����� ����.
select * from employees where salary<=7000 or salary>10000;

--�μ��� 80�� �ƴ� ��� ������ ����� ����.
select * from employees where department_id!=80;

--Ŀ�̼��� �����鼭 2008�� ������ �Ի��� ��� ������ ����� ����.
select * from employees where hire_date<'2008-01-01' and commission_pct is not null;
select * from employees where hire_date<'2009-01-01' and commission_pct is not null;

--��� ���̵�(REGION_ID) 1, 3, 4�� ���� ������ ����غ���.
select * from countries where region_id=1 or region_id=3 or region_id=4;


--������ 8000���� ���ų� ���� 10000���� ���ų� ���� ��� ������ ����� ����.
select * from employees where salary between 8000 and 10000;
select * from employees where salary >= 8000 and salary<=10000;

--������ 7000 �̸� �̰ų� 10000�ʰ��� ��� ������ ����� ����.
select * from employees where salary<7000 or salary>10000;
select * from employees where salary not between 7000 and 10000;

--����� �̸��� E~G�� �����ϴ� ��������� ����� ����.
select * from employees where first_name between 'E' and 'H'
    and first_name != 'H';

-- ����� �Ի����� 2004�� 5�� 20�� ~ 2007�� 10�� 9�� ���� ������ ��� ������ �����
select * from employees where hire_date between '2004-05-20' and '2007-10-10';


--����� ���ް� Ŀ�̼Ǻ����� �̿��Ͽ� ����� 1�� ���� �޴� ��ü �ݾ��� ���غ���. ����
--3���� ����� �̿��ؼ� Ǯ���. ���� salary�� ���޿� �ش��ϰ� Ŀ�̼��� 1�Ⱓ ����
--���޿� Ŀ�̼� ������ �޴´�.

--1) ����� 1�� ���� �޴� ��ü �ݾ�
select salary, nvl2(commission_pct, commission_pct,0),salary*12+ 
salary*12*decode(commission_pct,null,0,commission_pct) from employees;


select * from employees;
select commission_pct from employees;
select commission_pct+1 from employees;  --1�� ��� ���� �� �׷��� ���� 0���� �ٲܷ��� ��
--�Լ� 3���� ��� nvl, nvl2, decode
select nvl(commission_pct, 0)+1 from employees;
select nvl2(commission_pct, 'notnull', 'strnull')from employees;
select nvl2(commission_pct, commission_pct, 0)+1 from employees;


select first_name, commission_pct,
    case
        when commission_pct <=0.1 then '��'
        when commission_pct <=0.2 then '��'
        when commission_pct > 0.2 then '��'
        when commission_pct is null then 'nul�̴�'
        else '���ù��� ���� ������'
    end as PCT
from employees;

--����1
select department_name,location_id department_city from departments;
select department_name, decode(location_id, 1500, 'SanFrancisco',
                               1700, 'Seattle',
                               2400, 'London', 'ETC CITY') as department_city
from departments;

--����2
select job_id, salary,
    case
        when salary <= 10000 then 'LOW'
        when salary > 10000 then 'HIGH'
    end as sal_ary
from employees;

--����3
select first_name,
    case
        when EXTRACT(YEAR FROM hire_date) < '2005' then '2005�� ���� �Ի�'
        when EXTRACT(YEAR FROM hire_date) >= '2005' then '2005�� ���� �Ի�'
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

-- scott ���� �����Ͽ� ���⼭�� Ǫ�°�
select * from employees;
select first_name, email, job_id from employees;


select to_char(560, '$999,999'),
to_char(560, '$000,000') from dual;

--p.62~64
--���� 1
select concat(concat('a','b'),'c') from dual;

--����2
select abs(salary -1000) from employees;

--����3
select * from employees;
-- abs �Լ� : ���밪 ���
select -10,abs(-10) from employees;

--floor �Լ�: �Ҽ��� �Ʒ��� ����
select floor(1.000) from employees;

--round �Լ�: �Ҽ��� �ݿø�
select round(11.000), round(11.123,2) from employees;

--trunc �Լ�: �Ҽ��� ����
select trunc(515.123),trunc(515.123,-1) from employees;

--mod �Լ�: ������ ���ϴ� �Լ�
select mod(7,2), mod(5,3) from employees;

--lower(�ҹ���), upper(�빮��), initcap(���ۺκи� �빮�ڷ� ����)
select lower('HELLO world'), upper('HELLO world'), initcap('HELLO world') from employees;

--concat �Լ�: ���ڿ� ��ġ��
select concat('he', 'llo')from employees;

--substr �Լ�: �κй��ڿ� ����
select substr('�ȳ� HELLO world', 2,4) from employees; 

--length �Լ�: ���ڿ� ����
select length('�ȳ� HELLO world') from employees;

--ltrim(���ʰ��� ����), rtrim(�����ʰ��� ����), trim(���ʰ��� ����)
select '|' || trim('    hello'), ltrim('    hello   '), rtrim('     hello') from employees;

--instr �Լ�: Ư�� ���ڿ��� ��ġ�� ã��
select instr(upper('wo �ȳ� HELLO world'), 'WO', 1, 2) from employees;

--months_between �Լ�: �� ��¥�� ������ ����
select months_between(sysdate, sysdate + 60) from employees;

--add_month �Լ�: ���� ����
select add_months(sysdate, 2) from employees;

--next_day �Լ�: ���� ������ ��¥�� ����
select next_day(sysdate, 7) from employees;

--last_day �Լ�: ���� ���������� ����
select last_day(sysdate) from employees;

--to_char �Լ�: ���ڷ� ��ȯ
select to_char(sysdate, 'YYYY/MM:dd HH24:MI:SS �Դϴ�.') from employees;
select to_char(560, '$999,999'),
to_char(560, '$000,000') from employees;
select to_char(50) from employees;

--to_date �Լ�: ��¥������ ��ȯ
select to_date('1977:05:06 14:05:06', 'YYYY:MM:DD HH24:MI:SS') from employees;

--to_number �Լ�: ������ ��ȯ
select to_number('1') from employees;


--�ݿ��� ���� ������ ���� �л�
-- select MAX(����) from �л�; -99
--�ݿ��� ���� ������ ���� �л�
-- select min(����) from �л�; -19
--���� �л� ��
-- select count(����) from �л�; -7

--�� �ݺ� ������ ���� ���� �л��� ����
-- select ��, max(����) from �л� group by ��;

--�� �ݺ� ������ ���� ���� �л��� ����
-- select ��, min(����) from �л� group by ��;

--���� �л���
-- select count(����) from �л�;


select department_id from employees;

--null ���� ������ ����� ���
select department_id, count(department_id), avg(salary)
from employees group by department_id;

--null�� ������ �߻��� �� ����, null ���� ������ ���� �ִٸ� nulló���� �� �־����
select count(department_id), count(nvl(department_id, 0))
from employees group by department_id;

--�μ���ȣ�� 100���� ���� ������ ��, �μ���ȣ�� �׷�, �׷캰 ��� ��պ��� ����غ���
select department_id, avg(salary) from employees where department_id < 100
group by department_id;


--avg : �˻��� �׷� ����� ��ȯ
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

--����� �μ� �̸� ��� ����
select employees.first_name, department_name
from employees, departments
where employees.department_id = departments.department_id;
--��� ������ Ȯ���غ��� ������� 107�ε� ���� ��� 106���� �Ȱ��� Ȯ���� �� �ִ�.
select count(*) from employees, departments
where employees.department_id = departments.department_id;

select * from employees
where employees.department_id is null;

--
select employees.*, departments.*, nvl(departments.department_name, '�����')
from employees, departments
where employees.department_id =departments.department_id(+);

--��� ��������� �ش� ����� �μ� ������ ��� ����� ����.
select * from employees, departments
where employees.department_id = departments.department_id;


--���
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
select e2.employee_id,e2.first_name -- 100,steven ���
from employees e2
where e2.employee_id=100;


select e1.*,e2.*,e1.employee_id,e2.first_name
from employees e1, employees e2
where e1.manager_id=e2.employee_id;

-- outer join / left outer join / right outer join
select count(*) from employees;
select count(*) from employees, departments
where employees.department_id = departments.department_id;
--������� 107�ε� �Ѹ��� �μ���ȣ �����Ϳ� null�� ��� �־ 106���� ����, �̷��� ��� ���̺� �������� outer ���� ���

--left outer join
select employees.department_id, employees.first_name, department_name 
from employees, departments
where employees.department_id = departments.department_id(+);


--ansi ǥ�� ���·� left outer ���� sql�� �ۼ��ϸ� 107�� ���, ���� ���� ����� ��µ�
select employees.department_id, employees.first_name, department_name
from employees left outer join departments
on employees.department_id = departments.department_id;


--right outer join
select employees.department_id, employees.first_name, department_name
from employees, departments
where employees.department_id(+) = departments.department_id

--�μ��� 11���� �μ��� 1���� null
select distinct(employees.department_id) from employees;
--ȸ�翡 �����ϴ� ��ü �μ�
select distinct(department_id) from departments;

--ansiǥ�������� right outer join���� sql
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

-- �Ʒ� �̰Ŷ� �Ʒ��Ʒ��� ��ĥ����
select * from jobs
where job_id in ('AD_PRES', 'SA_MAN', 'IT_PROG')
order by min_salary;

-- ��� ����� �޿��� 3���� �� � ������ ������ ���
select * from employees;

select employees.employee_id,employees.salary, j.* 
from employees, (
    select * from jobs
    where job_id in ('AD_PRES', 'SA_MAN', 'IT_PROG')
    order by min_salary) j --j��� ������ ���� ��
--where employees.salary between j.min_salary and j.max_salary
where employees.salary >= j.min_salary and employees.salary < j.max_salary
order by employees.employee_id, min_salary;

commit;



