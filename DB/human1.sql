
 create table do(
   do_id NUMBER NOT NULL,
   do_name VARCHAR2(200)
);
INSERT INTO do (do_id, do_name) VALUES (1002, '서울');
INSERT INTO do (do_id, do_name) VALUES (1051, '부산'); 
INSERT INTO do (do_id, do_name) VALUES (1053, '대구');
INSERT INTO do (do_id, do_name) VALUES (1032, '인천');
INSERT INTO do (do_id, do_name) VALUES (1062, '광주');
INSERT INTO do (do_id, do_name) VALUES (1042, '대전');
INSERT INTO do (do_id, do_name) VALUES (1052, '울산');
INSERT INTO do (do_id, do_name) VALUES (1044, '세종');
INSERT INTO do (do_id, do_name) VALUES (1031, '경기');
INSERT INTO do (do_id, do_name) VALUES (1033, '강원');
INSERT INTO do (do_id, do_name) VALUES (1043, '충북');
INSERT INTO do (do_id, do_name) VALUES (1041, '충남');
INSERT INTO do (do_id, do_name) VALUES (1063, '전북');
INSERT INTO do (do_id, do_name) VALUES (1061, '전남');
INSERT INTO do (do_id, do_name) VALUES (1054, '경북');
INSERT INTO do (do_id, do_name) VALUES (1055, '경남');
INSERT INTO do (do_id, do_name) VALUES (1064, '제주');


create table si(
   si_id NUMBER  NOT NULL,
   si_name VARCHAR2(200),
   do_id NUMBER
);
INSERT INTO si (si_id, si_name, do_id) VALUES (2001, '서울특별시', 1002);
INSERT INTO si (si_id, si_name, do_id) VALUES (2002, '부산광역시', 1051);
INSERT INTO si (si_id, si_name, do_id) VALUES (2003, '대구광역시', 1053);
INSERT INTO si (si_id, si_name, do_id) VALUES (2004, '인천광역시', 1032);
INSERT INTO si (si_id, si_name, do_id) VALUES (2005, '광주광역시', 1062);
INSERT INTO si (si_id, si_name, do_id) VALUES (2006, '대전광역시', 1042);
INSERT INTO si (si_id, si_name, do_id) VALUES (2007, '울산광역시', 1052);
INSERT INTO si (si_id, si_name, do_id) VALUES (2008, '세종특별자치시', 1044);
INSERT INTO si (si_id, si_name, do_id) VALUES (2009, '고양시', 1031);
INSERT INTO si (si_id, si_name, do_id) VALUES (2010, '광명시', 1031);
INSERT INTO si (si_id, si_name, do_id) VALUES (2011, '평택시', 1031);
INSERT INTO si (si_id, si_name, do_id) VALUES (2012, '화성시', 1031);
INSERT INTO si (si_id, si_name, do_id) VALUES (2013, '파주시', 1031);
INSERT INTO si (si_id, si_name, do_id) VALUES (2014, '용인시', 1031);
INSERT INTO si (si_id, si_name, do_id) VALUES (2015, '의정부시', 1031);
INSERT INTO si (si_id, si_name, do_id) VALUES (2016, '수원시', 1031);
INSERT INTO si (si_id, si_name, do_id) VALUES (2017, '김포시', 1031);
INSERT INTO si (si_id, si_name, do_id) VALUES (2018, '성남시', 1031);
INSERT INTO si (si_id, si_name, do_id) VALUES (2019, '천안시', 1041);
INSERT INTO si (si_id, si_name, do_id) VALUES (2020, '아산시', 1041);
INSERT INTO si (si_id, si_name, do_id) VALUES (2021, '청주시', 1043);
INSERT INTO si (si_id, si_name, do_id) VALUES (2022, '창원시', 1055);
INSERT INTO si (si_id, si_name, do_id) VALUES (2023, '포항시', 1054);
INSERT INTO si (si_id, si_name, do_id) VALUES (2024, '경주시', 1054);
INSERT INTO si (si_id, si_name, do_id) VALUES (2025, '강릉시', 1033);
INSERT INTO si (si_id, si_name, do_id) VALUES (2026, '속초시', 1033);
INSERT INTO si (si_id, si_name, do_id) VALUES (2027, '원주시', 1033);
INSERT INTO si (si_id, si_name, do_id) VALUES (2028, '여수시', 1061);
INSERT INTO si (si_id, si_name, do_id) VALUES (2029, '목포시', 1061);
INSERT INTO si (si_id, si_name, do_id) VALUES (2030, '전주시', 1063);


create table center(
   center_id NUMBER NOT NULL,
   center_name VARCHAR2(200),
   street_address VARCHAR2(200),
   si_id NUMBER
);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (1, '본사', '평창동', 2001);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3001, '강남점', '역삼동', 2001);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3002, '강남구청점', '논현동', 2001);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3003, '서울역점', '동자동', 2001);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3004, '서울교대점', '서초동', 2001);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3005, '청담점', '청담동', 2001);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3006, '신림점', '신림동', 2001);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3007, '이태원점', '이태원동', 2001);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3008, '부산송정점', '송정동', 2002);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3009, '부산황령점', '대연동', 2002);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3010, '원동점', '안락동', 2002);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3011, '부산엄궁점', '엄궁동', 2002);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3012, '대구수성점', '수성동', 2003);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3013, '대구태전점', '태전동', 2003);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3014, '대구진천점', '진천동', 2003);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3015, '부평점', '부평동', 2004);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3016, '인천구월점', '구월동', 2004);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3017, '신흥점', '신흥동', 2004);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3018, '광주산정점', '산정동', 2005);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3019, '전남대점', '용봉동', 2005);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3020, '광주월산점', '월산동', 2005);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3021, '대전터미널점', '용전동', 2006);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3022, '대전센트럴점', '대흥동', 2006);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3023, '울산병영점', '남외동', 2007);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3024, '울산호계점', '신천동', 2007);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3025, '세종나성점', '나성동', 2008);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3026, '세종시청점', '대평동', 2008);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3027, '정발산점', '장항동', 2009);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3028, '탄현점', '탄현동', 2009);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3029, '고양삼송점', '동산동', 2009);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3030, '광명역점', '광명동', 2010);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3031, '광명소하점', '소하동', 2010);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3032, '송탄점', '송탄동', 2011);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3033, '평택서정점', '서정동', 2011);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3034, '화성봉담점', '기안동', 2012);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3035, '병점점', '병점동', 2012);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3036, '파주교하점', '동파동', 2013);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3037, '금릉역점', '금촌동', 2013);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3038, '용인보정점점', '보정동', 2014);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3039, '용인상현점', '상현동', 2014);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3040, '의정부민락점', '민락동', 2015);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3041, '의정부제일점', '의정부동', 2015);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3042, '수원터미널점', '권선동', 2016);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3043, '동수원점', '인계동', 2016);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3044, '김포구래점', '구래동', 2017);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3045, '김포장기점', '장기동', 2017);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3046, '성남단대점', '금광동', 2018);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3047, '성남점', '태평동', 2018);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3048, '천안신부점', '신부동', 2019);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3049, '천안원성점', '원성동', 2019);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3050, '아산점', '온천동', 2020);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3051, '청주터미널점', '가경동', 2021);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3052, '청주용암점', '용암동', 2021);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3053, '연희동점', '연희동', 2022);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3054, '포항대잠점', '대잠동', 2023);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3055, '경주동국대점', '석장동', 2024);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3056, '강릉교동점', '교동', 2025);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3057, '굿모닝마트속초점', '조양동', 2026);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3058, '원주점', '무실동', 2027);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3059, '여수점', '학동', 2028);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3060, '목포점', '용당동', 2029);
INSERT INTO center (center_id, center_name, street_address, si_id) VALUES (3061, '전주점', '서노송동', 2030);


   create table category(
   category_id NUMBER NOT NULL,
   category_name VARCHAR2(200),
   center_id number
);

INSERT INTO category (category_id, category_name, center_id) VALUES (4001, '요가',3034);
INSERT INTO category (category_id, category_name, center_id)VALUES (4002, '헬스', 3054);
INSERT INTO category (category_id, category_name, center_id)VALUES (4003, '필라테스', 1);
INSERT INTO category (category_id, category_name, center_id)VALUES (4004, '크로스핏', 3001);
INSERT INTO category (category_id, category_name, center_id)VALUES (4005, '요가', 3025);
INSERT INTO category (category_id, category_name, center_id)VALUES (4006, '헬스', 3011);
INSERT INTO category (category_id, category_name, center_id)VALUES (4007, '필라테스', 3009);
INSERT INTO category (category_id, category_name, center_id)VALUES (4008, '크로스핏', 3027);
INSERT INTO category (category_id, category_name, center_id)VALUES (4009, '요가', 3019);
INSERT INTO category (category_id, category_name, center_id)VALUES (4010, '헬스', 3033);



create table jobs(
   job_id number NOT NULL,
   job_title varchar2(200),
   min_salary number,
   max_salary number
);

INSERT INTO jobs (job_id, job_title, min_salary, max_salary)VALUES (5001, '대표', 9000000, 9000000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)VALUES (5002, '센터장', 3000000, 5000000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES (5003, '사원', 250000, 800000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES (5004, '계약직', 80000, 150000);



create table employees(
   employee_id number NOT NULL,
   name varchar2(200),
   email varchar2(200),
   phone varchar2(200),
   salary number,
   commission_pct number,
   job_id number,
   center_id number
);
INSERT INTO employees (employee_id, name, email, phone, salary, commission_pct, job_id, center_id) VALUES (6001, '유영기', 'yougki@email.com', '010-2748-5380', 5000000, 50000, 5002, 3034);
INSERT INTO employees (employee_id, name, email, phone, salary, commission_pct, job_id, center_id) VALUES (6002, '전소민', 'somin@email.com', '010-4584-1657', 4000000, 40000, 5002, 3054);
INSERT INTO employees (employee_id, name, email, phone, salary, commission_pct, job_id, center_id) VALUES (6003, '제갈원숙', 'wonsuk@email.com', '010-1111-1234', 9000000, 90000.1, 5001, 1);
INSERT INTO employees (employee_id, name, email, phone, salary, commission_pct, job_id, center_id) VALUES (6004, '황보대원', 'daewon@email.com', '010-1234-1555', 800000, 80000, 5003, 3001);
INSERT INTO employees (employee_id, name, email, phone, salary, commission_pct, job_id, center_id) VALUES (6005, '서동근', 'dongkun@email.com', '010-9456-8453', 80000, 800, 5004, 3025);
INSERT INTO employees (employee_id, name, email, phone, salary, commission_pct, job_id, center_id) VALUES (6006, '배기용', 'kiyoung@email.com', '010-5665-7563', 500000, 5000, 5003, 3011);
INSERT INTO employees (employee_id, name, email, phone, salary, commission_pct, job_id, center_id) VALUES (6007, '남보경', 'bokyung@email.com', '010-1597-7324', 3000000, 30000, 5002, 3009);
INSERT INTO employees (employee_id, name, email, phone, salary, commission_pct, job_id, center_id) VALUES (6008, '홍광현', 'kwanghyun@email.com', '010-1572-4865', 250000, 250, 5003, 3027);
INSERT INTO employees (employee_id, name, email, phone, salary, commission_pct, job_id, center_id) VALUES (6009, '오샘나', 'samna@email.com', '010-6548-7328', 150000, 150, 5004, 3019);
INSERT INTO employees (employee_id, name, email, phone, salary, commission_pct, job_id, center_id) VALUES (6010, '심햇살', 'sunshine@email.com', '010-9999-8888', 100000, 100, 5004, 3033);




create table job_history(
   job_history_id number NOT NULL,
   hire_date date,
   end_date date,
   job_id number,
   employee_id number,
   category_id number
);
INSERT INTO job_history (job_history_id, hire_date, end_date, job_id, employee_id, category_id) VALUES(7001, TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-03-01', 'YYYY-MM-DD'), 5001, 6003, 4001);
INSERT INTO job_history (job_history_id, hire_date, end_date, job_id, employee_id, category_id) VALUES(7002, TO_DATE('2023-02-15', 'YYYY-MM-DD'), TO_DATE('2023-04-15', 'YYYY-MM-DD'), 5002, 6001, 4002);
INSERT INTO job_history (job_history_id, hire_date, end_date, job_id, employee_id, category_id) VALUES(7003, TO_DATE('2023-03-20', 'YYYY-MM-DD'), TO_DATE('2023-05-20', 'YYYY-MM-DD'), 5002, 6002, 4003);
INSERT INTO job_history (job_history_id, hire_date, end_date, job_id, employee_id, category_id) VALUES(7004, TO_DATE('2023-05-05', 'YYYY-MM-DD'), TO_DATE('2023-07-05', 'YYYY-MM-DD'), 5002, 6007, 4004);
INSERT INTO job_history (job_history_id, hire_date, end_date, job_id, employee_id, category_id) VALUES(7005, TO_DATE('2023-06-10', 'YYYY-MM-DD'), TO_DATE('2023-08-10', 'YYYY-MM-DD'), 5003, 6004, 4005);
INSERT INTO job_history (job_history_id, hire_date, end_date, job_id, employee_id, category_id) VALUES(7006, TO_DATE('2023-07-25', 'YYYY-MM-DD'), TO_DATE('2023-09-25', 'YYYY-MM-DD'), 5003, 6006, 4006);
INSERT INTO job_history (job_history_id, hire_date, end_date, job_id, employee_id, category_id) VALUES(7007, TO_DATE('2023-09-03', 'YYYY-MM-DD'), TO_DATE('2023-11-03', 'YYYY-MM-DD'), 5003, 6008, 4007);
INSERT INTO job_history (job_history_id, hire_date, end_date, job_id, employee_id, category_id) VALUES(7008, TO_DATE('2023-10-15', 'YYYY-MM-DD'), TO_DATE('2023-12-15', 'YYYY-MM-DD'), 5004, 6005, 4008);
INSERT INTO job_history (job_history_id, hire_date, end_date, job_id, employee_id, category_id) VALUES(7009, TO_DATE('2023-11-30', 'YYYY-MM-DD'), TO_DATE('2024-01-30', 'YYYY-MM-DD'), 5004, 6009, 4009);
INSERT INTO job_history (job_history_id, hire_date, end_date, job_id, employee_id, category_id) VALUES(7010, TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_DATE('2024-03-10', 'YYYY-MM-DD'), 5004, 6010, 4010);

commit;

drop table do;
drop table si;
drop table center;
drop table category;
drop table jobs;
drop table employees;
drop table job_history;


select *
from job_history;
commit;

select * from employees;

//////
drop table tbl_board;
create table tbl_board (
bno number,
title varchar2(200) not null,
content varchar2(4000) not null,
writer varchar2(50) not null,
regdate date default sysdate,
viewcnt number default 0
);

?
alter table tbl_board add constraint pk_board primary key(bno);

create sequence seq_board;

?

insert into tbl_board (bno, title,content,writer)
values (seq_board.nextval,'제목','내용','user00');

?

update tbl_board set title= '수정된 제목',content =
'수정된 내용', writer='user01'
where bno = 1;

commit;

delete tbl_board where bno = 1;

select * from tbl_board;

insert into tbl_board (bno, title,content,writer)
(select seq_board.nextval, title, content, writer
from tbl_board);

insert into tbl_board (bno, title,content,writer)
(select seq_board.nextval, title, content, writer
from tbl_board);

//////네이버바 만들어보기
drop table board;
CREATE TABLE board (
bGroupKind VARCHAR2(255),
bId NUMBER PRIMARY KEY,
bName VARCHAR2(255) NOT NULL,
bTitle VARCHAR2(255) NOT NULL,
bContent VARCHAR2(4000) NOT NULL,
bEtc VARCHAR2(4000) NULL,
bWriteTime DATE DEFAULT sysdate,
bUpdateTime DATE DEFAULT null,
bHit NUMBER DEFAULT 0,
bGroup NUMBER,
bStep NUMBER,
bIndent NUMBER,
bDelete VARCHAR2(1) DEFAULT 'Y',
bLike NUMBER DEFAULT 0,
bDislike NUMBER DEFAULT 0
);

commit;
DESC board;
ALTER TABLE board ADD image_path VARCHAR(255);

select * from board;

insert into board (bId, bGroupKind, bTitle,bContent,bName)
values (seq_board.nextval,'q','q','q', 'name');

insert into board (bId, bGroupKind, bTitle,bContent,bName)
values (seq_board.nextval,'q2','q2','q2', 'name2');

INSERT INTO board (bId, bName, bTitle, bContent,bHit, bLike
VALUES (bId.nextval, dbTest, 자유게시판, dbTest,0,0);

CREATE TABLE board (
bGroupKind VARCHAR2(255),
bId NUMBER PRIMARY KEY,
bName VARCHAR2(255) NOT NULL,
bTitle VARCHAR2(255) NOT NULL,
bContent VARCHAR2(4000) NOT NULL,
bEtc VARCHAR2(4000) NULL,
bWriteTime DATE DEFAULT sysdate,
bUpdateTime DATE DEFAULT null,
bHit NUMBER DEFAULT 0,
bGroup NUMBER,
bStep NUMBER,
bIndent NUMBER,
bDelete VARCHAR2(1) DEFAULT 'Y',
bLike NUMBER DEFAULT 0,
bDislike NUMBER DEFAULT 0
);
create sequence bId;
commit;
--INSERT INTO board (bId, bName, bTitle, bContent,bHit, bLike)
--VALUES(bId.nextval, #{bName}, #{bTitle}, #{bContent},0,0);
INSERT INTO board (bId, bName, bTitle, bContent,bHit, bLike)
VALUES(bId.nextval, a, a, a,0,0);
INSERT INTO board (bName, bTitle, bContent, bHit, bLike)
VALUES('a', 'a', 'a', 0, 0);
select * from board;
INSERT INTO board (
    bGroupKind, bId, bName, bTitle, bContent, bGroup
) VALUES (
    '자유게시판', bId_seq.nextval, '테스트', 'DB에서 테스트', '테스트', bId_seq.nextval
);

commit;
drop table tbl_reply;
select * from tbl_reply;
-- tbl_reply 테이블 생성
create table tbl_reply (
    rno number,
    bno number not null,
    replytext varchar2(2000) not null,
    replyer varchar2(50) not null,
    regdate date default sysdate,
    updatedate date default sysdate
);

-- tbl_reply 테이블의 기본키(PK) 제약 조건 추가
alter table tbl_reply add constraint pk_reply primary key (rno);
-- tbl_board 테이블의 기본키(PK) 제약 조건 추가
ALTER TABLE tbl_board ADD CONSTRAINT pk_board PRIMARY KEY (bno);

-- tbl_reply 테이블의 외래키(FK) 제약 조건 추가
alter table tbl_reply add constraint fk_board_reply
foreign key (bno) references tbl_board(bno);

-- tbl_reply 시퀀스 생성
CREATE SEQUENCE seq_reply;

-- tbl_reply 테이블의 rno 열에 대한 시퀀스 연결
CREATE TRIGGER trg_reply
BEFORE INSERT ON tbl_reply
FOR EACH ROW
BEGIN
    SELECT seq_reply.NEXTVAL INTO :NEW.rno FROM DUAL;
END;