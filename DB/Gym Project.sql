create table member_history(
    member_id references members(member_id),
    start_date date,
    end_date date,
    trainer_id references trainers(trainer_id)
);

create table members(
    member_id number primary key,
    name varchar2(200),
    email varchar2(200),
    point number,
    phone varchar2(200)
);

create table trainers(
    trainer_id number primary key,
    trainer_name varchar2(200),
    career varchar2(200),
    phone_number varchar2(200),
    address varchar2(200),
    hire_date date
);

drop table member_history;
drop table members;
drop table trainers;

create table member_history(
    member_id number primary key,
    start_date date,
    end_date date,
    trainer_id references trainers(trainer_id),
    CONSTRAINT fk_members_member_id FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

create table members(
    member_id number primary key,
    name varchar2(200),
    email varchar2(200),
    point number,
    phone varchar2(200)
);

create table trainers(
    trainer_id number primary key,
    trainer_name varchar2(200),
    career varchar2(200),
    phone_number varchar2(200),
    address varchar2(200),
    hire_date date
);

commit;
