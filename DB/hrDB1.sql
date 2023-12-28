create SEQUENCE testSequence;

select testSequence.nextval from dual;

select testSequence.currval from dual;

drop sequence testSequence;

commit;

--hr table understand
--2000�⿡ �Ի��ؼ� �ְ��ӱ��� 10000�� �Ѵ� �������� ���ϰ� �ִ� ����� ����Ͻÿ�.
select first_name,job_id,salary, hire_date
from employees
where to_char(hire_date,'yyyy') >= 2000
and job_id in (select job_id from jobs where max_salary > 10000);


--�Ŵ����� �̸��� MICHAEL�� �μ��� ����Ͻÿ�.
select * from departments where manager_id in (select employee_id
from employees where upper(first_name) like '%MICHAEL%');

--3. ������ �����ӱ��� ��� 105�� ����� �ӱݺ��� ���� ������ ����Ͻÿ�.
select * from jobs where min_salary < (select salary from employees where employee_id = 105);

--4. �����ּҿ� ����ǥ�ð� �ִ� ����� ����Ͻÿ�.
SELECT * FROM employees WHERE email LIKE '%_%';

--5. ��� �̸��� �ش� ����� �Ŵ��� �̸��� ����Ͻÿ�.
select e1.first_name Employee, e2.first_name Manager
from employees e1, employees e2 where e1.manager_id = e2.employee_id;

--6. 30�� �μ��� �Ի��� ����� ���� �������� ����Ͻÿ�.
select to_char(hire_date, 'yyyy'), count(*) from employees
where department_id = 30 group by to_char(hire_date, 'yyyy');

--7. �� �μ��� �������� ������� �� �������� ���غ���.
select department_id as department, job_id as job, sum(salary) as TotalSalary
from employees
group by department_id, job_id
order by department_id, job_id;

--8. ������ �����ӱݰ� �ְ��ӱ� ������ ������ ������ ����� �̸��� �������� ����Ͻÿ�.
select * from employees;
select * from jobs;

--SELECT e.first_name, j.job_title
--FROM employees AS e
--JOIN jobs AS j ON e.job_id = j.job_id
--WHERE e.salary BETWEEN j.min_salary AND j.max_salary
--ORDER BY e.first_name;

--select e.first_name, j.job_title from employees as e, jobs as j
--where e.salary between j.min_salary and j.max_salary
--order by first_name;

select first_name, job_title from employees e, jobs j
where salary between min_salary and max_salary order by first_name;

commit;

--9. Ŀ�̼��� ���� ����� ���� ���� ����� ���� ������� ����Ͻÿ�.
select count(commission_pct) NoEmployeesWithCommission,
count(*) - count(commission_pct) NoEmployeesWithoutCommssion
from employees;


--10. 2�� 28�Ͽ� �Ի��� ����� �̸�, ������, �μ����� ����Ͻÿ�.
select first_name, job_title, department_name
from employees e, jobs j, departments d
where e.job_id = j.job_id and e.department_id = d.department_id
and to_char(hire_date, 'ddmm') = '2302';


--11. �����ӱ��� 10000���� ���� ������ ���λ����� ����Ͻÿ�.
select * from jobs where min_salary > 10000;


--12. 2002��~2005�� ���̿� �Ի��� ����� �̸��� �Ի����� ����Ͻÿ�.
select first_name, hire_date from employees
where to_char(hire_date, 'YYYY') between 2002 and 2005 order by hire_date;


--13. IT Programmer�̰ų� Sales Man�� ����� �̸��� �Ի����� ����Ͻÿ�.
select first_name, hire_date
from employees where job_id in ('IT_PROG', 'SA_MAN');



--14. 2008�� 1�� 1�� ���Ŀ� �Ի��� ����� ����Ͻÿ�.
SELECT * FROM employees WHERE hire_date >= '2008-01-01';


--15. ����� 150~160���� ����� ����Ͻÿ�.
select * from employees;
select * from employees where employee_id in (150,160);



select first_name, salary, commission_pct, hire_date
from employees where salary <10000;


SELECT JOB_TITLE, MAX_SALARY-MIN_SALARY DIFFERENCE FROM JOBS WHERE MAX_SALARY
BETWEEN 10000 AND 20000;


SELECT FIRST_NAME, SALARY, ROUND(SALARY, -3) FROM EMPLOYEES;


select * from jobs order by job_title DESC;

SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES WHERE FIRST_NAME LIKE 'S%' OR
LAST_NAME LIKE 'S%';


select * from employees where to_char(hire_date, 'MON') = 'MAY';

SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT IS NULL AND SALARY BETWEEN 5000
AND 10000 AND DEPARTMENT_ID=30;


SELECT FIRST_NAME, HIRE_DATE, LAST_DAY(HIRE_DATE)+1 FROM EMPLOYEES;

SELECT FIRST_NAME, HIRE_DATE, FLOOR((SYSDATE-HIRE_DATE)/365)FROM EMPLOYEES;



SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE TO_CHAR(HIRE_DATE,
'YYYY')=2001;


SELECT INITCAP(FIRST_NAME), INITCAP(LAST_NAME) FROM EMPLOYEES;


select initcap(first_name), initcap(last_name) from employees;


select job_title, substr(job_title, 1, instr(job_title || ' ', ' ')-1) from jobs;

select first_name, last_name from employees where instr(last_name, 'B' )>3 ;

select upper(first_name), lower(email) from employees where upper(first_name) = 
upper(email);


select upper(first_name), lower(email) from employees where upper(first_name) =
upper(email);


SELECT * FROM EMPLOYEES WHERE TO_CHAR(HIRE_DATE,'YYYY')=TO_CHAR(SYSDATE,
'YYYY');

select sysdate - to_date('01-jan-2011') from DUAL;

SELECT SYSDATE - to_date('01-jan-2011') FROM DUAL;

SELECT SYSDATE - TO_DATE('2011-01-01', 'YYYY-MM-DD') FROM DUAL;


select to_char(hire_date, 'MM'), count (*) from employees
where to_char(hire_date, 'YYYY') = to_char(sysdate, 'YYYY')
group by to_char(hire_date, 'MM');

select manager_id, count(*) from employees group by manager_id;

select employee_id, max(end_date) from job_history group by employee_id;


select count(*) from employees where to_char(hire_date, 'DD') > 15;


select country_id, count(*) from locations group by country_id;


SELECT DEPARTMENT_ID, AVG(SALARY) FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL GROUP BY DEPARTMENT_ID;


select job_id, count(*), sum(salary), max(salary)-min(salary) salary
from employees group by job_id;


select job_id, avg(salary) from employees
group by job_id having avg(salary) > 10000;


select to_char(hire_date, 'YYYY') from employees
group by to_char(hire_date, 'YYYY') having count(employee_id) > 10;


select department_id from employees where commission_pct is not null
group by department_id having count(commission_pct)>5;


select employee_id from job_history group by employee_id having count(*) > 1;

select job_id from job_history where end_date-start_date > 100
group by job_id having count(*) > 3;


select department_id, to_char(hire_date, 'YYYY'), count(employee_id)
from employees
group by department_id, to_char(hire_date, 'YYYY') order by department_id;


select distinct department_id
from employees
group by department_id, manager_id having count(employee_id) > 5;


SELECT DEPARTMENT_ID, TO_CHAR(HIRE_DATE,'YYYY'), COUNT(EMPLOYEE_ID)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, TO_CHAR(HIRE_DATE, 'YYYY') ORDER BY DEPARTMENT_ID;


UPDATE EMPLOYEES SET SALARY = 8000 WHERE EMPLOYEE_ID = 115 AND SALARY < 6000;

INSERT INTO EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL,
PHONE_NUMBER, HIRE_DATE,JOB_ID, SALARY, DEPARTMENT_ID)
VALUES (207, 'ANGELA', 'SNYDER','ANGELA','215 253 4737', SYSDATE, 'SA_MAN',
12000, 80);

commit;

DELETE FROM DEPARTMENTS WHERE DEPARTMENT_ID=20;


UPDATE EMPLOYEES SET JOB_ID= 'IT_PROG'
WHERE EMPLOYEE_ID=110 AND DEPARTMENT_ID=10 AND NOT JOB_ID LIKE 'IT%';


delete from departments where department_id = 20;

update employees set employees.job_id = 'IT_PROG'
where employees_id = 110 and department_id=10 and job_id like 'IT';

SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID = 115;





SELECT FIRST_NAME, COUNTRY_NAME FROM EMPLOYEES JOIN DEPARTMENTS
USING(DEPARTMENT_ID)
JOIN LOCATIONS USING( LOCATION_ID)
JOIN COUNTRIES USING ( COUNTRY_ID);

commit;
