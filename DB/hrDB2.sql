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

?select * from tbl_board;

insert into tbl_board (bno, title,content,writer)
(select seq_board.nextval, title, content, writer
from tbl_board);

insert into tbl_board (bno, title,content,writer)
(select seq_board.nextval, title, content, writer
from tbl_board);