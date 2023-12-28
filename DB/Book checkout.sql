create table Book_checkout(
    book_name nvarchar2(300),
    author nvarchar2(100),
    loan_date date,
    Expected_return_date date,
    actual_return_date date,
    Late_fee_KRW number
);

--1
insert into book_checkout values(
    '죄와 벌',
    '톨스토이',
    to_date('2023:03:01 00:00:00', 'YYYY:MM:DD HH24:MI:SS'),
    to_date('2023:03:15 00:00:00', 'YYYY:MM:DD HH24:MI:SS'),
    to_date('2023:03:20 00:00:00', 'YYYY:MM:DD HH24:MI:SS'),
    500
);

--2
insert into book_checkout values(
    '해리포터와 마법사의 돌',
    'J.K.롤링',
    to_date('2023:04:10 00:00:00', 'YYYY:MM:DD HH24:MI:SS'),
    to_date('2023:04:24 00:00:00', 'YYYY:MM:DD HH24:MI:SS'),
    to_date('2023:04:23 00:00:00', 'YYYY:MM:DD HH24:MI:SS'),
    0
);

--3
insert into book_checkout values(
    '반지의 제왕',
    'J.R.R.톨킨',
    to_date('2023:05:15 00:00:00', 'YYYY:MM:DD HH24:MI:SS'),
    to_date('2023:05:29 00:00:00', 'YYYY:MM:DD HH24:MI:SS'),
    to_date('2023:05:29 00:00:00', 'YYYY:MM:DD HH24:MI:SS'),
    0
);

--4
insert into book_checkout values(
    '빨간 머리 앤',
    'L.M.몽고메리',
    to_date('2023:06:20 00:00:00', 'YYYY:MM:DD HH24:MI:SS'),
    to_date('2023:07:04 00:00:00', 'YYYY:MM:DD HH24:MI:SS'),
    null,
    null
);

--5
insert into book_checkout values(
    '산삼',
    '박완서',
    to_date('2023:07:10 00:00:00', 'YYYY:MM:DD HH24:MI:SS'),
    to_date('2023:07:24 00:00:00', 'YYYY:MM:DD HH24:MI:SS'),
    null,
    null
);

select * from book_checkout;
