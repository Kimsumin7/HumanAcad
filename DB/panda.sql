create table panda(
    name NVARCHAR2(30),
    age number(3),
    birth_heigh number(3,1),
    birth date
);

insert into panda values ('푸바오',3,16.5,to_date('2020:07:20 00:00:00', 'YYYY:MM:DD HH24:MI:SS'));
insert into panda values ('러바오',10,18.6,to_date('2012:07:28 00:00:00', 'YYYY:MM:DD HH24:MI:SS'));
insert into panda values ('아이바오',10,17.4,to_date('2013:07:13 00:00:00', 'YYYY:MM:DD HH24:MI:SS'));

commit;

select * from panda