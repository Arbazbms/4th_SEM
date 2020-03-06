create database StudentFaculty;
use StudentFaculty;

create table student(
	snum int not null,
    sname varchar(30),
    major varchar(30),
    lvl varchar(30),
    age int,
    primary key(snum)
);



create table faculty(
	fid int not null,
    fname varchar(30),
    deptid int,
    primary key(fid)
);

create table class (
	cname varchar(30),
    meetsat time,
    room varchar(30),
    fid int not null,
    primary key(cname),
    foreign key(fid) references faculty(fid)
);

create table enrolled (
	snum int not null,
    cname varchar(30),
    primary key(snum, cname),
    foreign key(snum) references student(snum) on delete cascade,
    foreign key(cname) references class(cname) on delete cascade
);


 show tables;
 drop table student;
 
 
