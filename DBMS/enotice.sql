create database eNotice;
use eNotice;
show tables;

create table admin(
	admin_id int not null AUTO_INCREMENT,
    user varchar(255),
    pass varchar(255),
    name varchar(255),
    a_id varchar(80),
    number bigint(255),
    primary key(admin_id)
);

insert into admin values(1,'admin@gmail.com','admin','hod','1234',1234567899);
select * from admin;
delete from admin where admin_id = 2;

create table cont_info(
	admin_id int not null,
    clg_name text,
    clg_email text,
    clg_phone bigint(255),
    primary key(admin_id),
    foreign key(admin_id) references admin(admin_id) on delete cascade
);
insert into cont_info value(1,'bmsce', 'bms@bmsce.ac.in',1234567899);
select * from cont_info;
delete from cont_info where admin_id = 1;

create table msg(
	admin_id int not null,
    hod_msg text,
    prin_msg text,
    date datetime,
    primary key(admin_id),
    foreign key(admin_id) references admin(admin_id) on delete cascade
);
select * from msg;


create table public_notifications(
	admin_id int not null,
    title varchar(130),
    link varchar(130),
    date datetime,
	primary key(admin_id),
    foreign key(admin_id) references admin(admin_id) on delete cascade
);
select * from public_notifications;
insert into public_notifications values(1,'ii','ii.in',now());

create table user(
	id int not null auto_increment,
    name varchar(60),
    email varchar(80),
    pass varchar(100),
    usn varchar(60),
    sem int,
    mobile bigint(40),
    gender varchar(40),
    image varchar(50),
    dob datetime,
    primary key(id)
);
 
 insert into user values('','virat','virat@gmail.com','123456789', '1BM19CS111', 4, 1234567899, 'male', 'high-tech-background', now());
select * from user;

create table notice(
	notice_id int not null auto_increment,
    user varchar(70),
    subject varchar(100),
    Description text,
    Date datetime,
    primary key(notice_id)
);

drop table notice;
