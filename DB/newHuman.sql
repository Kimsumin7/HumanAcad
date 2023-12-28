select * from tbl_reply;
select * from human;

select * from board
where bId > 0 order by bGroup desc, bStep asc;

insert into board (
    select * from board
    );
insert * from board;    
INSERT INTO board (bGroupKind, bId, bName, bTitle, bContent, bEtc, bWriteTime, bUpdateTime, bHit, bGroup, bStep, bIndent, bDelete, bLike, bDislike)
SELECT
bGroupKind,
bId.nextval,
bName,
bTitle,
bContent,
bEtc,
bWriteTime,
bUpdateTime,
bHit,
bGroup,
bStep,
bIndent,
bDelete,
bLike,
bDislike
FROM board;

commit;

select * from board;


INSERT INTO board (
    bGroupKind, bId, bName, bTitle, bContent, bEtc, bWriteTime,
    bUpdateTime, bHit, bGroup, bStep, bIndent, bDelete, bLike, bDislike
)
SELECT
    bGroupKind, bId, bName, bTitle, bContent, bEtc, bWriteTime,
    bUpdateTime, bHit, bGroup, bStep, bIndent, bDelete, bLike, bDislike
FROM board;

commit;

select * from board
where bId > 0 order by bGroup desc, bStep asc;

--bgroupkind, searchKind, searchWord, perpageNum, page
select * from board
where bgroupkind like '%'||'공지사항'||'%'
and bcontent like'%'||'1'||'%'
--where bgroupkind like '%'||'bgroupkind'||'%'
--and bcontent like'%'||'searchKind'||'%'
order by bGroup desc, bStep asc;


--perpageNum 10, page 2
select rowNum,board. * from board
where bgroupkind like '%'||'공지사항'||'%'
and bcontent like'%'||''||'%'
order by bGroup desc, bStep asc;

select rowNum,board. * from board
where bgroupkind like '%'||'공지사항'||'%'
and bcontent like'%'||''||'%' and rownum<20
order by bGroup desc, bStep asc;

select rowNum,board. * from board
where rowNum <10;
select rowNum, board.*from board
where rowNum>10;

select * from board;

--2번째 페이지 데이터 10개만 보는
select b.* from
    (select rownum rn,a.* from
        (select board. * from board
        where bgroupkind like '%'||'공지사항'||'%'
        and bcontent like'%'||''||'%'
        order by bGroup desc, bStep asc)
        a where rownum<=10*2 --보여줄 페이지 마지막 데이터 번호 2는 현재페이지 10은 perpage
        ) b where rn>(2-1)*10;

select * from board;
--오라클 11버전에는 limit를 지원하지 않아서 상단처럼 구현했음, 하지만 최신 
--오라클은 limit를 지원함. 상담의 복잡한 sql을 간단하게 만들어서 게시판 페이지 기능을 완성해 보자

drop table board;
drop sequence bId;

CREATE TABLE tbl_reply (
bId NUMBER ,
rId NUMBER ,
replyer VARCHAR2(255) NOT NULL,
replytext VARCHAR2(4000) NOT NULL,
regdate DATE DEFAULT sysdate,
updatedate DATE DEFAULT null,

rGroup NUMBER,
rStep NUMBER DEFAULT 0,
rIndent NUMBER DEFAULT 0,
rDelete VARCHAR2(1) DEFAULT 'Y'

);
create sequence bId increment by 1 start with 1;
commit;
select * from board;
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
bStep NUMBER DEFAULT 0,
bIndent NUMBER DEFAULT 0,
bDelete VARCHAR2(1) DEFAULT 'Y',
bLike NUMBER DEFAULT 0,
bDislike NUMBER DEFAULT 0
);

DROP SEQUENCE bId;
create sequence bId increment by 1 start with 1 nocache;

drop table board;
select * from board;
commit;
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
bStep NUMBER DEFAULT 0,
bIndent NUMBER DEFAULT 0,
bDelete VARCHAR2(1) DEFAULT 'Y',
bLike NUMBER DEFAULT 0,
bDislike NUMBER DEFAULT 0
);
select * from tbl_reply;



select * from tbl_attach;

create table tbl_attach(
fullName varchar2(150) not null,
bId NUMBER ,
bno NUMBER, 
regdate date default sysdate
);

drop table tbl_attach;

select * from tbl_attach;

commit;

select * from board;




create table users(
    username varchar2(30) not null,
    password varchar2(100) not null,
    enabled integer not null -- 아이디 사용여부 0이면 사용 불가 1이면 사용가능
);

insert into users values('user','1111',0);
insert into users values('member','1111',1);
insert into users values('admin','1111',1);
commit;

//user table은 사용자 정보를 저장함
create table authorities(
    username varchar2(30) not null,
    authority varchar2(50) not null
);

insert into authorities values('user','ROLE_MEMBER');
insert into authorities values('member','ROLE_MEMBER');
insert into authorities values('admin','ROLE_MEMBER');
insert into authorities values('admin','ROLE_ADMIN');
commit;



//익명
drop table anonymous;

CREATE TABLE anonymous (
aGroupKind VARCHAR2(255),
aId NUMBER PRIMARY KEY,
aName VARCHAR2(255) NOT NULL,
aTitle VARCHAR2(255) NOT NULL,
aContent VARCHAR2(4000) NOT NULL,
aEtc VARCHAR2(4000) NULL,
aWriteTime DATE DEFAULT sysdate,
aUpdateTime DATE DEFAULT null,
aHit NUMBER DEFAULT 0,
aGroup NUMBER,
aStep NUMBER DEFAULT 0,
aIndent NUMBER DEFAULT 0,
aDelete VARCHAR2(1) DEFAULT 'Y',
aLike NUMBER DEFAULT 0,
aDislike NUMBER DEFAULT 0
);

create sequence aId increment by 1 start with 1 nocache;

INSERT INTO anonymous (aGroupKind, aId, aName, aTitle, aContent, aEtc, aWriteTime, aUpdateTime, aHit, aGroup, aStep, aIndent, aDelete, aLike, aDislike)
SELECT
aGroupKind,
aId.nextval,
aName,
aTitle,
aContent,
aEtc,
aWriteTime,
aUpdateTime,
aHit,
aGroup,
aStep,
aIndent,
aDelete,
aLike,
aDislike
FROM anonymous;

commit;

select * from anonymous;



//익명2
drop table unknown;
CREATE TABLE unknown (
    uGroupKind varchar2(255) default '익명',
    id number primary key,
    uName varchar2(255) not null,
    uTitle varchar2(255) not null,
    uContent varchar2(4000) not null,     
    uWriteTime date default sysdate,
    uUpdateTime date default null,
    uHit number default 0,
    uGroup number,
    uStep number default 0,
    uIndent number default 0,
    uDelete varchar2(1) default 'Y', 
    uLike number default 0, 
    uDislike number default 0
);

drop sequence uboard;
create sequence uboard increment by 1 start with 1;

drop table ureply;
create table ureply (
    urId number,
    id number,
    rPw varchar2(255) not null,
    replytext varchar2(2000) not null,
    replyer varchar2(255) not null,
    regdate date default sysdate,
    updatedate date default null,
    rGroup NUMBER,
    rStep NUMBER default 0,
    rIndent NUMBER default 0,
    rDelete VARCHAR2(1) DEFAULT 'Y'
);

drop sequence reply; 
create sequence reply increment by 1 start with 1;

commit;
select urId, id, rPw, replytext, replyer, rGroup, rStep, rIndent from ureply;

--    insert into ureply (urId, id, rPw, replytext, replyer, rGroup, rStep, rIndent)
--    values (reply.nextval, #{id}, #{rPw}, #{replytext}, #{replyer}, #{rGroup}, #{rStep}, #{rIndent})


insert into ureply (urId, id, rPw, replytext, replyer, rGroup, rStep, rIndent)
    values (4, 1, 1111, 'loll', 0, 0, 0, 0);
    
select * from unknown;
select * from ureply;    
commit;

select * from tbl_attach;
drop table tbl_attach;
create table tbl_attach(
    fullName varchar2(255),
    bId number,
    regdate date default sysdate    
);

select * from attach;
create table attach(
    fullName varchar2(255),
    id number,
    regdate date default sysdate    
);


--희주언니가 하던거
drop table hire;
drop SEQUENCE seq_hId;
create SEQUENCE seq_hId increment by 1 start with 1;

create table hire(
    hId number,
    hName NVARCHAR2(2000), -- 회사명
    hTitle NVARCHAR2(2000), --제목
    hjob NVARCHAR2(2000), --내용 이거 그냥 종류로 할까봐
    career NVARCHAR2(2000), --경력
    education NVARCHAR2(2000), --학력
    salary NVARCHAR2(2000), --급여
    location NVARCHAR2(2000), --지역
    type NVARCHAR2(2000), -- 근무 형태
    time NVARCHAR2(2000), --근무 시간
    hireToday date default sysdate, --디데이 계산할라고
    starDate date, --모집 마감일
    endDate date, --모집 마감일
    hHit NUMBER DEFAULT 0,
    pDelete VARCHAR2(1) DEFAULT 'Y'
);
select * from hire;
commit;

insert into hire (hId, hTitle, hName, hjob, career, education, salary, location, type, time, starDate,endDate )
    values (seq_hId.nextval,'JAVA개발/컨텐츠개발/Frontend/Backend개발/모바일앱개발 채용','(주)폴리인스퍼레이션','회사소개1','경력직','학력무관','100만원','서울','정규직','주 5일(월~금) 08:30~17:30',to_date('2023-11-11','YYYY-MM-DD'),to_date('2023-12-11','YYYY-MM-DD'));
insert into hire (hId, hTitle,hName, hjob, career, education, salary, location, type, time, starDate,endDate )
    values (seq_hId.nextval,'무전단말/ 웹솔루션/ 안드로이드 개발자 모집','아이디스파워텔(주)','회사소개2','신입.경력','학력무관','회사내규에따름 - 면접 후 결정','천안','정규직','주 5일(월~금) 08:30~17:30',to_date('2023-11-12','YYYY-MM-DD'),to_date('2023-12-12','YYYY-MM-DD'));
insert into hire (hId, hTitle, hName, hjob, career, education, salary, location, type, time, starDate,endDate )
    values (seq_hId.nextval,'응용프로그램 프론트엔드 개발 및 마켓팅웹 관리','(주)시정','프론트엔드/관리','신입','학력무관','회사내규에따름 - 면접 후 결정','수원','정규직','주 5일(월~금) 08:30~17:30',to_date('2023-11-13','YYYY-MM-DD'),to_date('2023-12-13','YYYY-MM-DD'));
insert into hire (hId, hTitle, hName, hjob, career, education, salary, location, type, time, starDate,endDate )
    values (seq_hId.nextval,'백엔드 개발자 채용','(주)퍼플아카데미','백엔드','경력5~10년','석사졸업 이상','회사내규에 따름','서울','정규직','주 5일(월~금) 08:30~17:30',to_date('2023-11-14','YYYY-MM-DD'),to_date('2023-12-14','YYYY-MM-DD'));
insert into hire (hId, hTitle, hName, hjob, career, education, salary, location, type, time, starDate,endDate )
    values (seq_hId.nextval,'(서버)Nods.js 벡엔드 개발자 경력직 채용','지티윈스','백엔드','경력 3년이상','학력무관','면접 후 결정','경기 용인시','정규직','주 5일(월~금)',to_date('2023-11-14','YYYY-MM-DD'),to_date('2024-01-12','YYYY-MM-DD'));
insert into hire (hId, hTitle, hName, hjob, career, education, salary, location, type, time, starDate,endDate )
    values (seq_hId.nextval,'2024년 신협중앙회(IT직군) 신입직원 채용공고','신협중앙회','IT개발/관리','신입','학력무관','면접 후 결정','서울','정규직','주 5일(월~금)',to_date('2023-11-14','YYYY-MM-DD'),to_date('2024-12-18','YYYY-MM-DD'));
insert into hire (hId, hTitle, hName, hjob, career, education, salary, location, type, time, starDate, endDate )
    values (seq_hId.nextval,'웹 퍼블리셔 경력자 채용','(주)오토스테이','프론트/웹퍼블리셔','경력6~10년','학력무관','면접 후 결정','서울','계약직(1년)','주 5일(월~금)',to_date('2023-12-12','YYYY-MM-DD'),to_date('2024-01-31','YYYY-MM-DD'));
insert into hire (hId, hTitle, hName, hjob, career, education, salary, location, type, time, starDate, endDate )
    values (seq_hId.nextval,'IT 개발자 신입사원 모집','주식회사무궁화인포메이션테크놀로지','개발/관리','신입','대졸(4년제)이상','면접 후 결정','서울','정규직(수습 3개월)','주 5일(월~금) 09:00~18:00',to_date('2023-12-04','YYYY-MM-DD'),to_date('2024-01-02','YYYY-MM-DD'));
insert into hire (hId, hTitle, hName, hjob, career, education, salary, location, type, time, starDate, endDate )
    values (seq_hId.nextval,'프론트엔드(React-Native) 1명 모집','레이라 주식회사','프론트엔드','신입/경력 5년 이하','학력무관(예정자 가능)','회사내규에 따름','서울','정규직','주 5일(월~금) 09:00~18:00',to_date('2023-12-04','YYYY-MM-DD'),to_date('2024-01-02','YYYY-MM-DD'));




drop table partner;

create SEQUENCE seq_partner increment by 1 start with 1;

create table partner(
    pId number,
    pHit NUMBER DEFAULT 0,
    pTitle NVARCHAR2(2000), --제목
    pContent NVARCHAR2(2000), --내용
    username NVARCHAR2(255), --닉네임 -->로그인 할 때 정한 닉네임 FK
    personnel number, --모집 인원
    progress NVARCHAR2(255), --진행방식
    stack NVARCHAR2(255), --기술 스택
    pPosition NVARCHAR2(255), --모집 포지션
    pContact NVARCHAR2(255), --연락 방법
    expectDate NVARCHAR2(255), --예상 기간
    startDate date, --프로젝트 시작일
    writeDate date default sysdate,
    endDate date, --모집 마감일
    pDelete VARCHAR2(1) DEFAULT 'Y'
);

insert into partner (pId, pTitle, pContent, username, personnel, progress, stack, pPosition, pContact, expectDate, startDate )
    values (seq_partner.nextval,'함께 iOS 앱 출시/업데이트할 팀원 모셔요!','안녕하세요!

이직 준비 중인 1년차 iOS 앱 개발자입니다.

iOS 앱 출시 및 실제 서비스 운영을 목표로 팀 프로젝트를 진행하고 있어요.

iOS 개발자 팀원님을 모시려고 해요! 읽어보시고 마음에 드신다면 연락주세요!



1. 프로젝트 간단 소개
익명으로 소통할 수 있는 채팅 앱입니다.

채팅 기반 소통 앱이라는 프로덕트/도메인에 관심 있으신 분이라면 얼마든지 환영해요!



현재 팀원 소개

백엔드: 2명

iOS: 1명 (PM, 기획 겸)



2. 프로젝트 기능 설명
- 로그인/회원가입

- 실시간 채팅 매칭 기능

- 채팅방 목록 기능

- 커뮤니티 기능

- 프로필 기능

- 사용자 신고/차단 기능

등.



더 자세한 기능과 기획은 노션으로 준비되어있어요.



3. 프로젝트 모집 인원
iOS 개발자(1명)



Tuist, UIKit, RxSwift, ReactorKit 등 사용해요.

잘 모르더라도 함께 공부하며 개발할 의지가 있는 분이면 좋아요!



취준생, 현업 상관 없어요!



4. 협업 툴
Jira와 Slack, Figma를 사용하고 있어요.



팀 내 작업 스케줄링은 Jira로 관리해요.

개발 팀의 경우 Github과 Jira를 연동하여 개발 상황에 맞춰 Slack에 자동으로 공유되도록 세팅되어 있어요.



5. 프로젝트 기간 및 진행 상황
2월 26일에 앱 출시를 목표로 하고 있어요.

이후 서비스 운영하며 유지보수할 계획이에요.



6. 프로젝트 특이사항
프로덕트 중점으로 서비스 개발 및 운영해보며 실 사용자 대응 경험을 쌓아 포폴로 삼으면 좋겠다는 생각이에요.

같은 경험을 원하시는 분들이면 더 좋을 것 같아요!','후닝',1,'online','figma','ios','https://open.kakao.com/o/sboQjUXf', 2, to_date('2024-01-02','YYYY-MM-DD'));

insert into partner (pId, pTitle, pContent, username, personnel, progress, stack, pPosition, pContact, expectDate, startDate )
    values (seq_partner.nextval,'사이드 프로젝트 - 뇌휴식','안녕하세요?

금융앱의 부가서비스라는 기획을 바탕으로한 가상의 서비스를 제작하고자 합니다.
 

아이디어 배경
최근 금융서비스(은행,카드)는 슈퍼앱 도입을 통해 많은 사용자를 끌어모으고 있습니다.

하지만 그에 비해 앱 사용시간은 한달 동안 총 15분 정도를 보이고 있습니다.

그 이유로는 특정한 목적이 있을때 사용하는 금융앱의 특성 때문으로 보입니다.

사용 시간을 늘릴 수 없다면 사용하지 않는 시간을 활용하자

앱의 비사용 시간을 활용할 수 있는 서비스를 도입하고자 합니다.

최근 스마트폰의 사용과 숏폼 영상의 과도한 시청으로 인해 많은 이들의 뇌건강에 적신호가 오고 있습니다.

이러한 문제를 완하 위한 스마트폰 비사용을 권장하는 앱들이 출시되었고

이들은 게이미피게이션을 통해 스마트폰 비사용 시간에 비례한 보상을 제공하고 있습니다.

이를 금융앱의 비사용 시간동안 활용할 수 있는 부가서비스를 제공하고자 합니다.

금융앱을 사용할 일이 없을때에는 스마트폰의 사용시간을 줄여 뇌건강과 보상을 챙기고

이를 통해 사용자들의 앱의 활용도를 높여보자는 취지로 기획하게 되었습니다.

금융앱이다, 비사용시간을 활용한다 말하였지만 이는 가상의 기획이기에

실질적으로 제작하고자 하는 서비스는 스마트폰의 비사용 시간을 기록하는 앱 입니다.

기능
- 뇌휴식 사용시간 타이머 설정
- 설정한 시간동안 분당 포인트 제공
- 타이머 활성중 다른앱을 사용하거나 앱을 벗어나면 경고 메시지 또는 포인트 초기화
디자인
- 타이머 설정, 타이머 활성 등 간단하게 동작되는 애니메이션을 출력 하고자 합니다.
 

2. 회의 진행/모임 방식 
 

- 일주일에 1회 수요일 오후 9시에 진행 하고자 합니다.
- 온라인으로 진행할 예정이며 게더로 참여 해주시면 됩니다.

 

 

3. 그외
 

- 포트폴리오로 사용할 서비스를 제작 하고자 합니다.
- 2달이라는 짧은 기간에 집중해서 적극적으로 참여 해주실수 있는 팀원을 모십니다.
- 현업, 취준생, 학생 상관없이 참여하실수 있지만 프로젝트 진행에 차질이 없을 정도의 실력을 가지신 분을 찾습니다.

궁금한점이 있으시면, 아래로 연락주세요!','후아암',3,'offline','kotlin','android', 'https://open.kakao.com/o/scyBsBAd', 4, to_date('2024-01-02','YYYY-MM-DD'));

insert into partner (pId, pTitle, pContent, username, personnel, progress, stack, pPosition, pContact, expectDate, startDate )
    values (seq_partner.nextval,'게임 교육 시장을 선도할 분들을 모집합니다.','Peace Of Game


이런 일을 하게 돼요.
Peace of Game에서는 리그오브레전드 사이드 모드에서 시작하여 교육 서비스까지 개발하고 제공합니다.

현재 아이디어 구상은 완료 단계이고 팀원 모집 후 개발을 시작합니다.

처음엔 사이드 프로젝트로 시작하여 합을 맞추고 나아가 공동 창업까지 생각하고 있습니다.

부담없이 연락주세요.

https://arnulfo5384.softr.app





이런 분과 함께 하고 싶어요.
자신의 의견을 피력할 수 있는 사람과 함께하고 싶습니다.
게임을 좋아하고, 게임 관련 직군에 관심이 있는 사람과 함께하고 싶습니다.
아이디어는 넘치는데 아직 같이 할 팀원을 구하지 못한 사람과 함께하고 싶습니다.
창업에 관심이 있는 사람과 함께하고 싶습니다.
위의 사항 중 하나라도 해당되면 저희는 당신을 환영합니다.





이런 분이면 더 좋아요.
경기도 성남에 있는 사무실에 출근할 수 있으면 더 좋습니다.




모집 인원
(마감)프론트 -1명

백엔드 -1명

디자이너 -1명





우리 팀이 일하는 방식
Peace of Game에서는 리그오브레전드 사이드 모드에서 시작하여 교육 서비스까지 개발하고 제공합니다.

그 과정에서 자신이 모르는 것이 있으면 빠르게 학습해내고 문제를 해결합니다.

개발을 배운적이 없어도 문제 해결에 개발이 필요하면 배워서 문제를 해결합니다.

어떤 문제에 당면했을 때 팀원들은 항상 자신의 의견을 피력하고

모든 팀원은 그 의견을 신뢰하고 올바른 방향인지 계속 생각하고 조율하며 나아갑니다.





우리 팀의 목표
2월까지 초기 유저 1만 명을 목표로 하고 있습니다.

2월부터 4월까지 안정화 시키고 4월에 있는 정부지원사업에서 입상을 하는 것입니다.

정부 지원을 기반으로 교육 대한 범위를 늘려나가며 기업의 가치를 높입니다.

현재 한국 게임 시장은 약 20조의 가치를 지닙니다.

Peace Of Game은 한국 게임 시장의 1%를 차지하겠습니다.





저희 Peace Of Game과 함께할 분들을 찾습니다.','기븐',4,'on/offline','js','backend', 'https://open.kakao.com/o/sfTmfxYf', 1, to_date('2023-12-14','YYYY-MM-DD'));

insert into partner (pId, pTitle, pContent, username, personnel, progress, stack, pPosition, pContact, expectDate, startDate )
    values (seq_partner.nextval,'[프론트/디자이너/기획자] - 팀 프로젝트로 웹 개발 같이하실 팀원 구해요.','간단 소개
안녕하세요. 신입 백엔드 개발자를 희망하는 30대 개발자입니다.

저는 React.js 및 Java, SrpingBoot 관련 국비 수업을 이수하면서 팀 프로젝트를 경험한 적이 있습니다.

이번 웹 개발을 통해 포트폴리오를 완성하고 취업전선에 공격적으로 뛰어들고 싶은 목표가 있습니다.



프로젝트 주제
회의를 통해 진행 예정



프로젝트 일정
최대 2개월(약 60일)



모집인원
프론트 1명 / 디자이너 1명 / 기획자 1명





저 또한 경험이 적어 서로가 자유롭게 의견을 나누면서 진행했으면 좋겠습니다.



궁금하신 점이 있다면 언제든지 연락주셔도 됩니다.

지원하실때 간단한 소개 부탁드리겠습니다.



감사합니다.','선비',3,'on/offline','js','planner','https://open.kakao.com/o/s5pb9EYf', 2,to_date('2023-12-15','YYYY-MM-DD'));
insert into partner (pId, pTitle, pContent, username, personnel, progress, stack, pPosition, pContact, expectDate, startDate )
    values (seq_partner.nextval,'[사이드 프로젝트] 운동이나 골프 좋아하시는 디자이너 한 분 기다립니다','간단 소개
안녕하세요 저는 골프와 운동을 좋아하는 20대 개발자입니다

스타트업에서 5년동안 (팀원, 팀장)을 맡아서 개발한 경험을 가지고 있습니다

좋아하는 것을 일로 만들고 싶습니다 (좋아하지 않는 것을 돈 때문에 하고 싶지는 않습니다)

그리고 색다른 경험을 좋아합니다



프로젝트 주제
골프 & 운동 관련



프로젝트 목표
비슷한 취미나 흥미를 가진 다른 사람들에게 가치 전달하는 것이 목표입니다



프로젝트 일정
프로젝트를 주로 참여 해주실 수 있는 분을 구하고 있습니다



프로젝트 소개와 개설 이유
평소에 운동을 좋아했었는데 골프라는 스포츠에 빠지게 되고

아이디어가 떠올라서 프로젝트를 한번 해보면 좋겠다고 생각했습니다

또한 기술 발전 속도가 빠르다 보니 새로운 기술을 통하여 다른 앱들 보다 더 좋은 가치를

전달해줄 수 있다는 생각이 들어 개설하게 되었습니다


궁금하신 점이 있으시다면 언제든지 물어보세요 항상 열려있습니다

더 자세한 설명은 대화를 통해서 전달 드리도록 하겠습니다

 

감사합니다','그린',1,'on/offline','figma','designer','https://open.kakao.com/o/s0lRYyYf', 12, to_date('2024-01-01','YYYY-MM-DD'));
insert into partner (pId, pTitle, pContent, username, personnel, progress, stack, pPosition, pContact, expectDate, startDate )
    values (seq_partner.nextval,'[프론트] "폴더" 글로벌 패션 커뮤니티 함께 창업하실 개발자 모십니다.','AI를 활용하여 자동화된 콘텐츠를 생성하여 대량의 유저를 확보
패션정보를 공유하는 커뮤니티를 만들어가는 프로젝트 입니다.


프로젝트 주제



AI 를 이용한 패션 커뮤니티를 운영하는 웹 서비스를 만들고 있습니다. 자세한 사항은 팀 첫 미팅에서 설명해 드리도록 하겠습니다.



프로젝트 목표

배포 및 실제 서비스 운영을 목표로 하고 있음.

실제 문제들을 함께 고민하고 먼저 해결하려는 의지를 가지고 계신분이였으면 좋겠습니다.



프로젝트 일정

기존 팀원들과 함께 기획, 디자인, 백엔드 AI 연동 은 완료 되어 있는 상태 입니다.

따라서 2~3주 안에 프로젝트를 실제로 런칭할 계획을 가지고 있습니다.



프로젝트소개



팀 폴더는 AI 기술을 활용하여 자동화된 콘텐츠 생성을 통해 유저를 확보하고, 패션 정보를 공유하는 커뮤니티를 성장시키고자합니다.



온라인 미디어를 통해 패션 정보를 알게 되는 경우 대부분 출처 및 정보를 정확하게 알 수 있지만

영화, 드라마, 예능, 콘서트, 직촬 등 의 경우는 한탐을 찾아야 겨우 발견하거나 못차는 경우가 허다합니다.

아직은 기술적인 한계로 인해 바로 찾기는 어렵지만 집단지성을 이용한다면 보다 쉽게 정보를 제공 받을 수 있지 않을까?

생각하게 되어 기획 하게 되었습니다.','워어닌',3,'on/offline','nextjs','frontend', 'https://open.kakao.com/o/sivlfcgf', 3, to_date('2024-01-01','YYYY-MM-DD'));
insert into partner (pId, pTitle, pContent, username, personnel, progress, stack, pPosition, pContact, expectDate, startDate )
    values (seq_partner.nextval,'For Fun에서 두번째 프로덕트를 만드실 개발자분을 모집해요','팀소개

안녕하세요! For fun은 각자의 재능을 모아 멋진? 프로젝트를 만들어내는 팀입니다. For fun의 첫번째 프로덕트,사주로 매칭하는 ‘그날의 분위기 그분’을 1차 베포후 많은 커플들을 매칭 시켰답니다. 이번엔 두번째 새로운 소개팅 프로덕트를 준비중이에요. 어디까지 장난일지 모르게 재밌게 프로젝트를 만들어 보고 싶으신 분들이라면 누구나 환영해요







서비스 간단 소개

혹시 자연스럽게 천천히 상대방을 알아가고 싶은 분들이 계신가요? 정말 그 사람의 조건보다도, 그 사람의 가치관, 즉 세계관이 중요한 분들이라면 스윗모먼트가 새로운 경험을 제공해드리겠습니다. 삶 속에서 때로는 사랑이 예상치 못한 순간에 찾아온답니다. 그리고 그 찰나의 순간이 인생에서 가장 중요한 경험일 수도 있다고 생각해요. 스윗모먼트는 이런 삶의 가치를 중요하게 생각하는 분들을 위한 서비스입니다.



당신이 어떤 음악을 좋아하는지, 어떤 영화를 좋아하는지, 그리고 어떤 순간이 인생에서 큰 영감이 되었는지, 이런 것들을 우리에게 공유해주세요. 스윗모먼트가 당신과 잘 어울리는 사람을 찾아드릴게요.



이 한 가지만 기억해주세요. 스윗모먼트의 만남을 통해서, 찰나의 순간에 사랑에 빠질 수 있다는 사실을?



???♀? 이런 분이 필요해요.

프론트앤드 개발자



피그마,노션으로 협업 가능하신 분

피그마로 협업 가능하신분

기술스택 : 제안해주세요.





"새로운 팀원은은 언제나 환영이야"





? 모집 기간 : - 12/24 일요일까지



? For Fun은 매주 일요일 저녁 중 1회 디스코드로 모임을 진행합니다.','땅콩이',2,'online','react','frontend', 'https://open.kakao.com/o/sA2VPRie', 3, to_date('2024-01-07','YYYY-MM-DD'));
insert into partner (pId, pTitle, pContent, username, personnel, progress, stack, pPosition, pContact, expectDate, startDate )
    values (seq_partner.nextval,'프로젝트를 함께하실 디자이너 기획자분을 모집합니다!','현재 저희는 디자이너1 백엔드3 프론트엔드3 으로 구성되어 있습니다. 기획자에 부재가 크게 느껴져 이렇게 모집을 하게 되었습니다. 주제와 관한 설명은 카톡 주신다면 설명드리도록 하고 저희는 연차 실력의 여부를 신경쓰지 않습니다. 되도록이면 저희와 함께 뜻을 맞추어 이탈없이 할 수 있는 분이라면 환영입니다.!!','신간',6,'offline','spring','planer','https://open.kakao.com/o/sDIZngYf', 2, to_date('2023-12-31','YYYY-MM-DD'));

insert into partner (pId, pTitle, pContent, username, personnel, progress, stack, pPosition, pContact, expectDate, startDate )
    values (seq_partner.nextval,'비대면 주문 서비스 "위오더"와 함께하실 분을 모집합니다.','1. 프로젝트의 시작 동기
 

2024년도 지원사업에 지원할 예정입니다(ex. 예비창업패키지).

단순히 사이드 프로젝트로 끝내는 게 아니라 사업화로 연결할 예정이며 함께 지원사업에 참여할 마케터분을 모집합니다.

 

스타벅스를 시작으로 많은 프렌차이즈 카페에서 출시한 사이렌 오더 기능을 개인 카페나, 식당들에서도 이용할 수 있게 만드는 것이 목표입니다.

사용자가 앱을 다운받아야만 사용할 수 있는 기존의 상품들과 달리 웹기반이기 때문에 별도의 앱을 설치할 필요 없이

웹 주소를 통해 가맹점에서 QR코드, 인스타그램 등에 링크를 등록하는 것으로 간단하게 고객이 접근할 수 있다는 접근성에 대한 장점이 있습니다.

초기에는 소규모 업체들에 부담이 되는 부분들을 개선해 나가는 것을 목표로 잡고 이후에는 회의나 가맹점의 요청 사항들을 받아 하나씩 기능을 추가해 나갈 계획입니다.



1차 가맹점별 웹 사이트 제공 - 수요조사 및 초기 고객 확보

(개발 기능 : 카카오 알림톡, 가맹점 메뉴 등록을 위한 가맹점주 페이지, 가맹점주가 선택할 수 있는 3가지 정도의 메뉴 디자인)



2차 PG결제 연동을 통한 비대면 결제 지원

(PG결제 연동, 가맹점주 페이지를 통한 매출 통계등의 내역, 더욱 다양한 종류의 메뉴 디자인)

 

소규모 개인 카페와 식당들부터 작은 규모의 프렌차이즈들을 타깃으로 생각하고 있습니다.

 

  

2. 회의 진행/모임 방식 
  

주 1회를 기본으로 추가로 소통이 필요하다면 협의 후 추가하는 방식으로 진행할 계획입니다.

 

기본적으로 온라인을 우선으로 Google Meet을 통해 진행할 예정이며,

필요에 따라 서로 소통해 추가적인 온라인 회의나 오프라인 회의를 진행할 계획입니다.

 

 

3. 그외 
단순히 사이드 프로젝트를 만드는 것이 아닌 같이 2024년도 지원사업을 함께할 분을 모집하고 있습니다.

많은 참여 부탁드립니다.



관심있으신 분은 오픈톡으로 연락 주세요!','오늘도화이팅',1,'on/offline','ts','designer','https://open.kakao.com/o/sFW2GPXf', 5, to_date('2023-12-31','YYYY-MM-DD'));
    
insert into partner (pId, pTitle, pContent, username, personnel, progress, stack, pPosition, pContact, expectDate, startDate )
    values (seq_partner.nextval,'[사이드 프로젝트] 앱 비사용시간 체크','안녕하세요?

금융앱의 부가서비스라는 기획을 바탕으로한 가상의 서비스를 제작하고자 합니다.

 

- 왜 이 프로덕트를 만드시고 싶은지 적어주세요 
최근 금융서비스(은행,카드)는 슈퍼앱 도입을 통해 많은 사용자를 끌어모으고 있습니다.

하지만 그에 비해 앱 사용시간은 한달 동안 총 15분 정도를 보이고 있습니다.

그 이유로는 특정한 목적이 있을때 사용하는 금융앱의 특성 때문으로 보입니다.



사용 시간을 늘릴 수 없다면 사용하지 않는 시간을 활용하자



앱의 비사용 시간을 활용할 수 있는 서비스를 도입하고자 합니다.



최근 스마트폰의 사용과 숏폼 영상의 과도한 시청으로 인해 많은 이들의 뇌건강에 적신호가 오고 있습니다.

이러한 문제를 완하 위한 스마트폰 비사용을 권장하는 앱들이 출시되었고

이들은 게이미피게이션을 통해 스마트폰 비사용 시간에 비례한 보상을 제공하고 있습니다.

이를 금융앱의 비사용 시간동안 활용할 수 있는 부가서비스를 제공하고자 합니다.

금융앱을 사용할 일이 없을때에는 스마트폰의 사용시간을 줄여 뇌건강과 보상을 챙기고

이를 통해 사용자들의 앱의 활용도를 높여보자는 취지로 기획하게 되었습니다.



금융앱이다, 비사용시간을 활용한다 말하였지만 이는 가상의 기획이기에

실질적으로 제작하고자 하는 서비스는 스마트폰의 비사용 시간을 기록하는 앱 입니다.



기능
뇌휴식 사용시간 타이머 설정
설정한 시간동안 분당 포인트 제공
타이머 활성중 다른앱을 사용하거나 앱을 벗어나면 경고 메시지 또는 포인트 초기화


디자인
- 타이머 설정, 타이머 활성 등 간단하게 동작되는 애니메이션을 출력 하고자 합니다.
 

2. 회의 진행/모임 방식 
 

- 1주에 몇번정도 회의나 모임을 진행할 계획인가요? 

일주일에 1회 수요일 오후 9시에 진행 하고자 합니다.

 

- 온/오프라인 회의 진행시 진행방식을 적어주세요 

온라인으로 진행할 예정이며 게더로 참여 해주시면 됩니다.

 

 

3. 그외 자유기재 
모집인원

개발 0/2

디자인 0/2

서버 0/1

 

포트폴리오로 사용할 서비스를 제작 하고자 합니다.



2달이라는 짧은 기간에 집중해서 적극적으로 참여 해주실수 있는 팀원을 모십니다.

(곧 연말과 새해로 바쁠건데 이를 핑계로 빠지지 않으실분.. ㅠ)



현업, 취준생, 학생 상관없이 참여하실수 있지만 프로젝트 진행에 차질이 없을 실력을 가지신 분을 찾습니다.

(나중에 “할줄 모르는데요” 라고 하시면 안되요..ㅠ)



지원을 원하시는 분은 아래로 지원 부탁드립니다!','후아암',9,'online','flutter','android','https://open.kakao.com/o/scyBsBAd', 2, to_date('2023-12-31','YYYY-MM-DD'));


commit;

--- 게시판 테이블
DROP SEQUENCE bId;
create sequence bId increment by 1 start with 1 nocache;

drop table board;
commit;
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
bStep NUMBER DEFAULT 0,
bIndent NUMBER DEFAULT 0,
bDelete VARCHAR2(1) DEFAULT 'Y',
bLike NUMBER DEFAULT 0,
bDislike NUMBER DEFAULT 0
);
INSERT INTO board (bGroupKind, bId, bName, bTitle, bContent, bEtc, bWriteTime, bUpdateTime, bHit, bGroup, bStep, bIndent, bDelete, bLike, bDislike)
SELECT
bGroupKind,
bId.nextval,
bName,
bTitle,
bContent,
bEtc,
bWriteTime,
bUpdateTime,
bHit,
bId.currval,
bStep,
bIndent,
bDelete,
bLike,
bDislike
FROM board;
--- 게시판 답글
drop table tbl_reply;
drop sequence seq_reply;

CREATE TABLE tbl_reply (
bId NUMBER ,
rId NUMBER ,
replyer VARCHAR2(255) NOT NULL,
replytext VARCHAR2(4000) NOT NULL,
regdate DATE DEFAULT sysdate,
updatedate DATE DEFAULT null,

rGroup NUMBER,--bgroup
rStep NUMBER DEFAULT 0,
rIndent NUMBER DEFAULT 0,
rDelete VARCHAR2(1) DEFAULT 'Y'
);
create sequence seq_reply increment by 1 start with 1;
commit;

select *
from board;

select *
from tbl_reply;

select * from tbl_reply where rId=rId order by rGroup desc,rStep asc;
---업로드 테이블
drop table tbl_attach;
create table tbl_attach(
fullName varchar2(150) not null,
bId number not null,
regdate date default sysdate
);

--- 시큐리티 테이블
select * from authorities;
select * from users;
commit;
drop table users;

create table users(

    username varchar2(30) not null,

    password varchar2(100) not null,

    enabled integer not null -- 아이디 사용여부 0이면 사용 불가 1이면 사용가능

);

commit;

drop table authorities;

create table authorities( --권한

    username varchar2(30) not null,

    authority varchar2(50) not null

);

insert into authorities values('user11','ROLE_MEMBER');
commit;

--파트너 게시판
drop table partner;
select * from partner;
create SEQUENCE seq_partner increment by 1 start with 1;
create table partner(
    pId number,
    pHit NUMBER DEFAULT 0,
    pTitle NVARCHAR2(2000), --제목
    pContent NVARCHAR2(2000), --내용
    username NVARCHAR2(255), --닉네임 -->로그인 할 때 정한 닉네임 FK
    personnel number, --모집 인원
    progress NVARCHAR2(255), --진행방식
    stack NVARCHAR2(255), --기술 스택
    pPosition NVARCHAR2(255), --모집 포지션
    pContact NVARCHAR2(255), --연락 방법
    expectDate NVARCHAR2(255), --예상 기간
    startDate date, --프로젝트 시작일
    writeDate date default sysdate,
    endDate date, --모집 마감일
    pDelete VARCHAR2(1) DEFAULT 'Y'
);
commit;
insert into partner (pId, pTitle, pContent, nickName, personnel, progress, stack, pPosition, startDate )
    values (seq_partner.nextval,'hi','hi','hh',6,'온라인','java','프론트엔드',to_date('2023-12-12','YYYY-MM-DD'));
insert into partner (pId, pTitle, pContent, nickName, personnel, progress, stack, pPosition, startDate )
    values (seq_partner.nextval,'부럽당','부럽당','자몽',3,'오프라인','spring','백엔드',to_date('2023-12-13','YYYY-MM-DD'));
insert into partner (pId, pTitle, pContent, nickName, personnel, progress, stack, pPosition, startDate )
    values (seq_partner.nextval,'졸려','졸려','망고',4,'온/오프라인','javaScript','백엔드',to_date('2023-12-14','YYYY-MM-DD'));
insert into partner (pId, pTitle, pContent, nickName, personnel, progress, stack, pPosition, startDate )
    values (seq_partner.nextval,'마 도랐나!','마 도랐나','지연',8,'온/오프라인','javaScript','기획자',to_date('2023-12-15','YYYY-MM-DD'));
insert into partner (pId, pTitle, pContent, nickName, personnel, progress, stack, pPosition, startDate )
    values (seq_partner.nextval,'화장실이 어딘가요..?','마라탕 먹었더니 배 아파요..ㅜ','철수',2,'온라인','react','프론트엔드',to_date('2023-12-01','YYYY-MM-DD'));
insert into partner (pId, pTitle, pContent, nickName, personnel, progress, stack, pPosition, startDate )
    values (seq_partner.nextval,'공원으로 다 모여','떡잎방범대','짱구',4,'오프라인','react','디자이너',to_date('2023-12-15','YYYY-MM-DD'));
    
    insert into partner (pId, pTitle, pContent, nickName, personnel, progress, stack, pPosition, startDate )
    values (seq_partner.nextval,'공원으로 다 모여','떡잎방범대','짱구',4,'오프라인','react','디자이너',to_date('2023-12-15','YYYY-MM-DD'));
    insert into partner (pId, pTitle, pContent, nickName, personnel, progress, stack, pPosition, startDate )
    values (seq_partner.nextval,'공원으로 다 모여','떡잎방범대','짱구',4,'오프라인','react','디자이너',to_date('2023-12-15','YYYY-MM-DD'));
insert into partner (pId, pTitle, pContent, nickName, personnel, progress, stack, pPosition, startDate )
    values (seq_partner.nextval,'공원으로 다 모여','떡잎방범대','짱구',4,'오프라인','react','디자이너',to_date('2023-12-15','YYYY-MM-DD'));
insert into partner (pId, pTitle, pContent, nickName, personnel, progress, stack, pPosition, startDate )
    values (seq_partner.nextval,'공원으로 다 모여','떡잎방범대','짱구',4,'오프라인','react','디자이너',to_date('2023-12-15','YYYY-MM-DD'));
insert into partner (pId, pTitle, pContent, nickName, personnel, progress, stack, pPosition, startDate )
    values (seq_partner.nextval,'공원으로 다 모여','떡잎방범대','짱구',4,'오프라인','react','디자이너',to_date('2023-12-15','YYYY-MM-DD'));
select * from partner;
commit;

--고용게시판
drop table hire;
drop SEQUENCE seq_hId;
create SEQUENCE seq_hId increment by 1 start with 1;

create table hire(
    hId number,
    hName NVARCHAR2(2000), -- 회사명
    hTitle NVARCHAR2(2000), --제목
    hjob NVARCHAR2(2000), --내용 이거 그냥 종류로 할까봐
    career NVARCHAR2(2000), --경력
    education NVARCHAR2(2000), --학력
    salary NVARCHAR2(2000), --급여
    location NVARCHAR2(2000), --지역
    type NVARCHAR2(2000), -- 근무 형태
    time NVARCHAR2(2000), --근무 시간
    hireToday date default sysdate, --디데이 계산할라고
    starDate date, --모집 마감일
    endDate date, --모집 마감일
    hHit NUMBER DEFAULT 0,
    pDelete VARCHAR2(1) DEFAULT 'Y'
);
select * from hire;
commit;

insert into hire (hId, hTitle, hName, hjob, career, education, salary, location, type, time, starDate,endDate )
    values (seq_hId.nextval,'JAVA개발/컨텐츠개발/Frontend/Backend개발/모바일앱개발 채용','(주)폴리인스퍼레이션','회사소개1','경력직','학력무관','100만원','서울','정규직','주 5일(월~금) 08:30~17:30',to_date('2023-11-11','YYYY-MM-DD'),to_date('2023-12-11','YYYY-MM-DD'));
insert into hire (hId, hTitle,hName, hjob, career, education, salary, location, type, time, starDate,endDate )
    values (seq_hId.nextval,'무전단말/ 웹솔루션/ 안드로이드 개발자 모집','아이디스파워텔(주)','회사소개2','신입.경력','학력무관','회사내규에따름 - 면접 후 결정','천안','정규직','주 5일(월~금) 08:30~17:30',to_date('2023-11-12','YYYY-MM-DD'),to_date('2023-12-12','YYYY-MM-DD'));
insert into hire (hId, hTitle, hName, hjob, career, education, salary, location, type, time, starDate,endDate )
    values (seq_hId.nextval,'응용프로그램 프론트엔드 개발 및 마켓팅웹 관리','(주)시정','프론트엔드/관리','신입','학력무관','회사내규에따름 - 면접 후 결정','수원','정규직','주 5일(월~금) 08:30~17:30',to_date('2023-11-13','YYYY-MM-DD'),to_date('2023-12-13','YYYY-MM-DD'));
insert into hire (hId, hTitle, hName, hjob, career, education, salary, location, type, time, starDate,endDate )
    values (seq_hId.nextval,'백엔드 개발자 채용','(주)퍼플아카데미','백엔드','경력5~10년','석사졸업 이상','회사내규에 따름','서울','정규직','주 5일(월~금) 08:30~17:30',to_date('2023-11-14','YYYY-MM-DD'),to_date('2023-12-14','YYYY-MM-DD'));
insert into hire (hId, hTitle, hName, hjob, career, education, salary, location, type, time, starDate,endDate )
    values (seq_hId.nextval,'(서버)Nods.js 벡엔드 개발자 경력직 채용','지티윈스','백엔드','경력 3년이상','학력무관','면접 후 결정','경기 용인시','정규직','주 5일(월~금)',to_date('2023-11-14','YYYY-MM-DD'),to_date('2024-01-12','YYYY-MM-DD'));
insert into hire (hId, hTitle, hName, hjob, career, education, salary, location, type, time, starDate,endDate )
    values (seq_hId.nextval,'2024년 신협중앙회(IT직군) 신입직원 채용공고','신협중앙회','IT개발/관리','신입','학력무관','면접 후 결정','서울','정규직','주 5일(월~금)',to_date('2023-11-14','YYYY-MM-DD'),to_date('2024-12-18','YYYY-MM-DD'));
insert into hire (hId, hTitle, hName, hjob, career, education, salary, location, type, time, starDate, endDate )
    values (seq_hId.nextval,'웹 퍼블리셔 경력자 채용','(주)오토스테이','프론트/웹퍼블리셔','경력6~10년','학력무관','면접 후 결정','서울','계약직(1년)','주 5일(월~금)',to_date('2023-12-12','YYYY-MM-DD'),to_date('2024-01-31','YYYY-MM-DD'));
insert into hire (hId, hTitle, hName, hjob, career, education, salary, location, type, time, starDate, endDate )
    values (seq_hId.nextval,'IT 개발자 신입사원 모집','주식회사무궁화인포메이션테크놀로지','개발/관리','신입','대졸(4년제)이상','면접 후 결정','서울','정규직(수습 3개월)','주 5일(월~금) 09:00~18:00',to_date('2023-12-04','YYYY-MM-DD'),to_date('2024-01-02','YYYY-MM-DD'));
insert into hire (hId, hTitle, hName, hjob, career, education, salary, location, type, time, starDate, endDate )
    values (seq_hId.nextval,'프론트엔드(React-Native) 1명 모집','레이라 주식회사','프론트엔드','신입/경력 5년 이하','학력무관(예정자 가능)','회사내규에 따름','서울','정규직','주 5일(월~금) 09:00~18:00',to_date('2023-12-04','YYYY-MM-DD'),to_date('2024-01-02','YYYY-MM-DD'));





//스터디
drop table study;
CREATE TABLE study (
    sGroupKind VARCHAR2(255),
    sId NUMBER PRIMARY KEY,
    sName VARCHAR2(255) NOT NULL,
    sTitle VARCHAR2(255) NOT NULL,
    sContent VARCHAR2(4000) NOT NULL, 
    sEtc VARCHAR2(4000) NULL,
    sWriteTime DATE DEFAULT sysdate,
    sUpdateTime DATE DEFAULT null,
    sHit NUMBER DEFAULT 0,
    sGroup NUMBER,
    sStep NUMBER DEFAULT 0,
    sIndent NUMBER DEFAULT 0,
    sDelete VARCHAR2(1) DEFAULT 'Y', 
    sLike NUMBER DEFAULT 0, 
    sDislike NUMBER DEFAULT 0
);

create sequence sId increment by 1 start with 1 nocache;

select * from study_reply;
select * from study;

drop sequence seq_study_reply;
-------스터디 댓글 테이블
drop table study_reply;

CREATE TABLE study_reply (
sId NUMBER ,
sRId NUMBER ,
sReplyer VARCHAR2(255) NOT NULL,
sReplytext VARCHAR2(4000) NOT NULL,
sRegdate DATE DEFAULT sysdate,
sUpdatedate DATE DEFAULT null,

sGroup NUMBER,
sStep NUMBER DEFAULT 0,
sIndent NUMBER DEFAULT 0,
sDelete VARCHAR2(1) DEFAULT 'Y'

);
create sequence seq_study_reply increment by 1 start with 1;
commit;

create table study_attach(
    fullName varchar2(255),
    sid number,
    regdate date default sysdate    
);

---익명테이블
drop table unknown;
CREATE TABLE unknown (
    uGroupKind varchar2(255) default '익명',
    id number primary key,
    uName varchar2(255) not null,
    uTitle varchar2(255) not null,
    uContent varchar2(4000) not null,     
    uWriteTime date default sysdate,
    uUpdateTime date default null,
    uHit number default 0,
    uGroup number,
    uStep number default 0,
    uIndent number default 0,
    uDelete varchar2(1) default 'Y', 
    uLike number default 0, 
    uDislike number default 0
);

drop sequence uboard;
create sequence uboard increment by 1 start with 1;

select * from unknown;
select * from ureply;

drop table ureply;
create table ureply (
    urId number,
    id number,
    rPw varchar2(255) not null,
    replytext varchar2(2000) not null,
    replyer varchar2(255) not null,
    regdate date default sysdate,
    updatedate date default null,
    rGroup NUMBER,
    rStep NUMBER default 0,
    rIndent NUMBER default 0,
    rDelete VARCHAR2(1) DEFAULT 'Y'
);

drop sequence reply; 
create sequence reply increment by 1 start with 1;

drop table attach;
create table attach(
    fullName varchar2(255),
    id number,
    regdate date default sysdate    
);
commit;
