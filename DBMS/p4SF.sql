create database StudentFaculty;
use StudentFaculty;
show databases;

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
 
 
insert into faculty values(11,'Dr NV',02);
insert into faculty values(12,'Dr GS',01);
insert into faculty values(13,'Dr UV',02);
insert into faculty values(14,'Dr BJ',02);
insert into faculty values(15,'NM',01)
 
 
insert into student VALUES(101,'Yaseen','CS','JR',19);
insert into student VALUES(102,'Arbaz','CS','SR',20);
insert into student VALUES(103,'Abhishek','IS','SR',21);
insert into student VALUES(104,'Chirag','CS','JR',20);
insert into student VALUES(105,'Chiru','IS','SR',21);
select * from student;



insert into class values('OO_Java','09:15:00',407,11);
insert into class values('TFCS','09:15:00',402,12);
insert into class values('ADA','10:10:00',404,13);
insert into class values('DBMS','01:00:00',128,14);
insert into class values('OS','02:00:00',206,15);


insert into enrolled values(101,'OO_Java');
insert into enrolled values(102,'TFCS');
insert into enrolled values(103,'ADA');
insert into enrolled values(104,'DBMS');
insert into enrolled values(105,'OS');

/* Find the name of all the juniors(level - jr) who are enrolled in a class taught by somefname*/
select sname , fname from student s,enrolled e,class c, faculty f where s.snum = e.snum  OR e.cname = c.cname  and f.fid = c.fid and f.fname = "DR KV" AND s.lvl = "JR" group by f.fname;

 
