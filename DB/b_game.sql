create table b_game(
    match_date date,
    game_area nvarchar2(30),
    team1 nvarchar2(30),
    team2 nvarchar2(30),
    team1_score number(1),
    team2_score number(1),
    winning_team nvarchar2(30)
);


--desc 명령으로 테이블에 어떤 열이 정의되어 있는지 알 수 있다.
desc b_game

insert into b_game values(
    to_date('2023:07:26 00:00:00', 'YYYY:MM:DD HH24:MI:SS'),
    '수원', 'LG 트윈스','kt wiz',3,4,'kt wiz'
);

insert into b_game values(
    to_date('2023:03:05 00:00:00', 'YYYY:MM:DD HH24:MI:SS'),
    '수원', 'LG 트윈스','kt wiz',3,4,'kt wiz'
);


select * from b_game;