create table human(
    name NVARCHAR2(30),
    age number(3),
    height number(4,1),
    brithday date
);

INSERT into human values('ȫ�泲', 31, 156.4, to_date('2001:02:03 00:00:00', 'YYYY:MM:DD HH24:MI:SS'));
INSERT into human values('ȫ�濵', 30, 173.2, to_date('2000:12:21 00:00:00', 'YYYY:MM:DD HH24:MI:SS'));
INSERT into human values('ȫ���', 21, 143.5, to_date('2011:04:07 00:00:00', 'YYYY:MM:DD HH24:MI:SS'));

commit;

select * from human;


