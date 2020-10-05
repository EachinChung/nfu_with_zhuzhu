create database nfu;

use nfu;

create table user
(
    id       int unsigned not null primary key,
    name     varchar(15)  not null,
    password char(94)     not null,
    room_id  int          not null,
    email    varchar(255) not null,
    open_id  char(28),
    jw_pwd varchar(255)
);

create table bus_user
(
    user_id        int unsigned not null primary key,
    alipay_user_id varchar(20)  not null,
    id_card        varchar(20)  not null,
    avatar         varchar(100) not null,
    bus_session    varchar(50)
);

create table dormitory
(
    id       int      not null primary key,
    building char(15) not null,
    floor    char(2)  not null,
    room     int      not null
);

create table electric
(
    id      bigint unsigned primary key auto_increment,
    room_id int  not null,
    value   float,
    date    date not null,
    index room_id (room_id)
);

create table total_achievements
(
    user_id                   int unsigned not null primary key,
    get_credit                int          not null,
    selected_credit           int          not null,
    average_achievement       float        not null,
    average_achievement_point float        not null,
    foreign key (user_id) references user (id) on delete cascade on update cascade
);

create table achievement
(
    id                           bigint unsigned primary key auto_increment,
    user_id                      int unsigned not null,
    school_year                  int          not null,
    semester                     tinyint      not null,
    course_type                  varchar(20)  not null,
    subdivision_type             varchar(20)  not null,
    course_name                  varchar(50)  not null,
    course_id                    varchar(50)  not null,
    credit                       float        not null,
    achievement_point            float        not null,
    final_achievements           float        not null,
    total_achievements           float        not null,
    midterm_achievements         float        not null,
    practice_achievements        float        not null,
    peacetime_achievements       float        not null,
    resit_exam_achievement_point float        null,
    index course_id (course_id),
    foreign key (user_id) references user (id) on delete cascade on update cascade
);

create table class_schedule
(
    id               bigint unsigned not null primary key auto_increment,
    user_id          int unsigned    not null,
    school_year      int             not null,
    semester         tinyint         not null,
    subdivision_type varchar(20)     not null,
    course_name      varchar(50)     not null,
    course_id        varchar(50)     not null,
    credit           float           not null,
    teacher          json            not null,
    classroom        char(25)        not null,
    weekday          tinyint         not null,
    start_node       tinyint         not null,
    end_node         tinyint         not null,
    start_week       tinyint         not null,
    end_week         tinyint         not null,
    index course_id (course_id),
    foreign key (user_id) references user (id) on delete cascade on update cascade
);

create table ticket_order
(
    id            int unsigned not null primary key auto_increment,
    user_id       int unsigned not null,
    bus_ids       int          not null,
    bus_order_id  int          null,
    passenger_ids json         not null,
    order_id      char(20)     not null,
    order_type    tinyint      not null,
    order_time    datetime     not null,
    order_state   tinyint      not null,
    ticket_date   date         not null,
    index user_id (user_id),
    unique index order_id (order_id),
    foreign key (user_id) references user (id) on delete cascade on update cascade
);

create table profession
(
    id         int unsigned not null primary key,
    profession varchar(50)  null
);

create table college
(
    id      int unsigned not null primary key,
    college varchar(50)  null
);

create table profile
(
    user_id       int unsigned not null primary key,
    grade         int unsigned not null,
    college_id    int unsigned not null,
    profession_id int unsigned not null,
    direction     varchar(50)  null,
    foreign key (college_id) references college (id) on delete cascade on update cascade,
    foreign key (profession_id) references profession (id) on delete cascade on update cascade,
    foreign key (user_id) references user (id) on delete cascade on update cascade
);

INSERT INTO nfu.bus_user (user_id, alipay_user_id, id_card)
VALUES (172017006, '2088222005848391', '445224199901053011');
INSERT INTO nfu.bus_user (user_id, alipay_user_id, id_card)
VALUES (172017076, '2088022640684011', '440107199908300621');
INSERT INTO nfu.bus_user (user_id, alipay_user_id, id_card)
VALUES (172017093, '2088722493895197', '440402199812129094');
INSERT INTO nfu.bus_user (user_id, alipay_user_id, id_card)
VALUES (172017119, '2088912822600633', '440882199709296517');
INSERT INTO nfu.bus_user (user_id, alipay_user_id, id_card)
VALUES (172017132, '2088422491788926', '440982199901220622');
INSERT INTO nfu.bus_user (user_id, alipay_user_id, id_card)
VALUES (172017160, '2088522015348378', '440402199810059061');
INSERT INTO nfu.bus_user (user_id, alipay_user_id, id_card)
VALUES (172017231, '2088122863294290', '440811199803012829');
INSERT INTO nfu.bus_user (user_id, alipay_user_id, id_card)
VALUES (172017316, '2088022680660983', '450821199809032817');
INSERT INTO nfu.bus_user (user_id, alipay_user_id, id_card)
VALUES (172017477, '2088422556604938', '441521199809280813');
INSERT INTO nfu.bus_user (user_id, alipay_user_id, id_card)
VALUES (172017533, '2088422481782688', '441426199804030010');
INSERT INTO nfu.bus_user (user_id, alipay_user_id, id_card)
VALUES (172017549, '2088912241137912', '445122199901010013');
INSERT INTO nfu.bus_user (user_id, alipay_user_id, id_card)
VALUES (172017561, '2088402751356421', '441521199811168839');