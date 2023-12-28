DROP TABLE EMP;--�̹� ������� ���̺��� ������ ����� ������� �߰���
CREATE TABLE EMP(
EMPNO NUMBER(4), ENAME VARCHAR2(10), JOB VARCHAR2(9),
MGR NUMBER(4), HIREDATE DATE, SAL NUMBER(7,2), COMM NUMBER(7,2),
DEPTNO NUMBER(2)
);
DROP TABLE DEPT;
CREATE TABLE DEPT(
DEPTNO NUMBER(2), DNAME VARCHAR2(14) , LOC VARCHAR2(13)
) ;
DROP TABLE BONUS;
CREATE TABLE BONUS(
ENAME VARCHAR2(10), JOB VARCHAR2(9), SAL NUMBER, COMM NUMBER
);
DROP TABLE SALGRADE;
CREATE TABLE SALGRADE(
GRADE NUMBER, LOSAL NUMBER, HISAL NUMBER
);


-- dept talble
INSERT INTO DEPT VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES(20,'REASEARCH','DALLAS');
INSERT INTO DEPT VALUES(30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES(40,'OPERATIONS','BOSTON');


-- emp table
INSERT INTO EMP VALUES(7369,'SMITH','CLERK',7902,to_date('1980:12:17
00:00:00','YYYY:MM:DD HH24:MI:SS'),800,NULL,20);
25
INSERT INTO EMP VALUES(7499,'ALLEN','SALESMAN',7698,to_date('1981:02:20
00:00:00','YYYY:MM:DD HH24:MI:SS'),1600,300,30);
INSERT INTO EMP VALUES(7521,'WARD','SALESMAN',7698,to_date('1981:02:22
00:00:00','YYYY:MM:DD HH24:MI:SS'),1250,500,30);
INSERT INTO EMP VALUES(7566,'JONES','MANAGER',7839,to_date('1981:04:02
00:00:00','YYYY:MM:DD HH24:MI:SS'),2975,NULL,20);
INSERT INTO EMP VALUES(7654,'MARTIN','SALESMAN',7698,to_date('1981:09:28
00:00:00','YYYY:MM:DD HH24:MI:SS'),1250,1400,30);
INSERT INTO EMP VALUES(7698,'BLAKE','MANAGER',7839,to_date('1981:05:01
00:00:00','YYYY:MM:DD HH24:MI:SS'),2850,NULL,30);
INSERT INTO EMP VALUES(7782,'CLARK','MANAGER',7839,to_date('1981:06:09
00:00:00','YYYY:MM:DD HH24:MI:SS'),2450,NULL,10);
INSERT INTO EMP VALUES(7788,'SCOTT','ANALYST',7566,to_date('1987:07:13
00:00:00','YYYY:MM:DD HH24:MI:SS'),3000,NULL,20);
INSERT INTO EMP VALUES(7839,'KING','PRESIDENT',NULL,to_date('1981:11:17
00:00:00','YYYY:MM:DD HH24:MI:SS'),5000,NULL,10);
INSERT INTO EMP VALUES(7844,'TURNER','SALESMAN',7698,to_date('1981:09:08
00:00:00','YYYY:MM:DD HH24:MI:SS'),1500,0,30);
INSERT INTO EMP VALUES(7876,'ADAMS','CLERK',7788,to_date('1987:07:13
00:00:00','YYYY:MM:DD HH24:MI:SS'),1100,NULL,20);
INSERT INTO EMP VALUES(7900,'JAMES','CLERK',7698,to_date('1981:12:03
00:00:00','YYYY:MM:DD HH24:MI:SS'),950,NULL,30);
INSERT INTO EMP VALUES(7902,'FORD','ANALYST',7566,to_date('1981:12:03
00:00:00','YYYY:MM:DD HH24:MI:SS'),3000,NULL,20);
INSERT INTO EMP VALUES(7934,'MILLER','CLERK',7782,to_date('1982:01:23
00:00:00','YYYY:MM:DD HH24:MI:SS'),1300,NULL,10);

--������� table
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);

commit;

-- �߰� ����Ǯ��
desc emp;

select * from emp;

select * from dept;

select ename from emp;

select deptno from dept;

select mgr,sal,comm from emp;

select dname, loc from dept;

select grade, losal from salgrade;

select job from emp;

select DISTINCT deptno from emp;

select case when job='SALESMAN' then sal*1.15
            when job = 'MANAGER' then sal*1.1
            else sal*1.05 end as upgradeSalary
form emp;

select empno, ename, mgr, sal from emp ORDER BY mgr asc, deptno asc;

select * from emp where ename between 'E' and 'H' and ename!='H';

select * from emp where hiredate between '1980.05.20' and '1981.10.10' ;

select * from emp where hiredate>'1983.01.01' or job = 'SALEMAN';

select * from emp where not deptno = 20;

select * from emp where mgr is null;

select * from emp where job like '%A%';

commit;

select * from emp where ename like '_____';

select * from emp where job like '%N';

select * form emp where ename like '%A%';

select * from emp where ename like 'S%';

select * from emp where mgr in (7782,2902,2698,7566);

select  * from emp where comm in (0,500,1400);

select * from emp where deptno not in (40,10,20);

select * from emp order by mgr desc;

select empno, ename, mgr, sal from emp ORDER BY mgr asc, deptno asc;

select * from emp order by deptno asc, empno asc;

select empno||'����� ����� �����ڰ�'||mgr||'��� �Դϴ�.' FROM emp;

select nvl(mgr, 9999) from emp;

select nvl2(mgr, mgr, 9999) from emp;

select decode(mgr, null, 9999, mgr) from emp;

select nvl(comm, 0) from emp;

select * from emp where sal>800 and sal<1000;

select * from emp where deptno=20 and job ='MANAGER;';

select * from emp where deptno=20 or job = 'MANAGER';

commit;




--27. �߰� ���� Ǯ��
select length(dname) from dept;

select count(ename) from emp where length(ename) >=6;

select lower(ename) from emp;

select sysdate+1 from dual;

select sysdate-hiredate as days from emp;

select MONTHS_BETWEEN(SYSDATE, hiredate) as month from emp;

--�Ի��� ���� ������ ���� ����غ���.
select floor(MONTHS_BETWEEN(sysdate, hiredate)) as months from emp;
--floor: �Ҽ��� ������ ����, months_between: systae�� hiredate�� �� ��¥�� ������ ����
select next_day ( add_months(sysdate,3) ,7) from dual;

--���ú��� 3������ ���ƿ��� ����� ��¥�� ����� ����.
select MONTHS_BETWEEN(sysdate, hiredate)/12 as years from emp;


--���� �ð� ��ü�� ��XXXX-xX-XX XX:XX:XX���� ���ڿ��� ����� ����.
select add_months(hiredate, 18) from emp;


--��2020-6-7 22:12:11���� �ð� �����ͷ� ����� ����� ����.
select to_date('2020-6-7 22:12:11 YYYY:MM:DD HH24:MI:SS') from dual;

--20�� �μ��� Ŀ�̼��� �޴� ����Ǽ��� ����� ����.
select count(comm) from emp where deptno = 20;

--job�� CLERK�� ����� ��� �޿��� ����� ����.
select avg(sal) from emp where job = 'CLERK';

--������� �޴� Ŀ�̼��� ������ ����غ���.


--������� �޴� �ִ� �ּ� ������ ����� ����.


--�μ��� �޿� ����� ���غ���. --�޿��� Ŀ�̼��� �޴� ����� ���� ����غ���.


--�޿��� 2000�̻��� �μ��� ������� ����� ����.


--�μ��� ��� �޿��� 1700�̻��� �μ���ȣ�� ��ձ޿��� ����Ͻÿ�.


--1200�̻��� �޿��� �޴� ������� �μ��� ��� �޿��� 1900�̻��� �μ���ȣ�� ��ձ޿��� ����Ͻÿ�.


--��å�� PRESIDENT �� �ƴ� ����� ���� �μ��� �޿� ���� 6000�̻��� �μ��� �޿����� ��� �Ͻÿ�.


--20�� 30 �μ����� �ִ� �޿��� �޴� ����� �ִ� �޿��� ����� ����.



commit;

select sum(salary) form employees;







create table BTable(
    BNO number(10),
    BKind nvarchar2(30),
    BName nvarchar2(30),
    BArea nvarchar2(30),
    GNo number(10)
);

create table GTable(
    GNo number(10),
    GPrice number(10)
);

insert into BTable values(1, '������', '���õ', '����', 1);
insert into BTable values(2, 'û����', '������', 'ȫ����', 3);
insert into BTable values(3, 'û����', '���¼�', '�ֹ���', 2);
insert into BTable values(4, '������', '������', '�����', 2);
insert into BTable values(5, 'û����', '���û', '��â��', 1);
insert into BTable values(6, '������', '������', '������', 3);
insert into BTable values(7, '������', '���¼�', '�븲��', 1);
insert into BTable values(8, 'û����', '�ϸ�õ', 'û�㵿', 2);

insert into GTable values(1, '30000');
insert into GTable values(2, '25000');
insert into GTable values(3, '20000');
commit;

-- Date 8/2
select * from BTable;
select * from GTable;
-- cross join
select * from BTable, GTable;
-- equi join
select * from BTable,GTable
where BTable.gno = gtable.gno;

select * from GTable a, GTable b; 

commit;













