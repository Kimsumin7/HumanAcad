create table customer_order_history(
    Order_Number number(7),
    customer_name nvarchar2(100),
    order_date date,
    product_name nvarchar2(100),
    quantity number(1),
    Product_price_KRW number,
    Order_amount_KRW number
);

--1
insert into customer_order_history values(
    '2023001',
    'È«±æµ¿',
    to_date('2023:03:05 00:00:00', 'YYYY:MM:DD HH24:MI:SS'),
    '³ëÆ®ºÏ',
    1,
    1200000,
    1200000
);

--2
insert into customer_order_history values(
    '2023002',
    '±è¿µÈñ',
    to_date('2023:03:05 00:00:00', 'YYYY:MM:DD HH24:MI:SS'),
    '½º¸¶Æ®Æù',
    2,
    800000,
    1600000
);

--3
insert into customer_order_history values(
    '2023003',
    '¹ÚÃ¶¼ö',
    to_date('2023:03:05 00:00:00', 'YYYY:MM:DD HH24:MI:SS'),
    'ÇìµåÆù',
    3,
    150000,
    450000
);

--4
insert into customer_order_history values(
    '2023004',
    'ÀÌÁöÈÆ',
    to_date('2023:03:05 00:00:00', 'YYYY:MM:DD HH24:MI:SS'),
    '¸¶¿ì½º',
    1,
    30000,
    30000
);

--5
insert into customer_order_history values(
    '2023005',
    '±è¹ÎÁö',
    to_date('2023:03:05 00:00:00', 'YYYY:MM:DD HH24:MI:SS'),
    'Å°º¸µå',
    1,
    50000,
    50000
);


select * from customer_order_history;