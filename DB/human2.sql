select * from tbl_reply;
select * from human;

select * from board
where bId > 0 order by bGroup desc, bStep asc;

insert into board (
    select * from board
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


select * from board where 1=1 and bDelete='Y' order by bGroup desc, bStep asc OFFSET (?-1)*? ROWS FETCH NEXT ? ROWS ONLY

select * from v$version;