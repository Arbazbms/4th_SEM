#supplier database

create database supaa;
use supaa;

create table supplier(
	sid int,
    sname varchar(30),
    city varchar(30),
    primary key(sid)
);

insert into supplier values(10001,"Acme widget","bnagalore");
insert into supplier values(10002,"johns","kolkatta");
insert into supplier values(10003,"vimal","mumbai");
insert into supplier values(10004,"reliances","Delhi");



create table parts(
	pid int,
    pname varchar(30),
    color varchar(30),
    primary key(pid)
);

insert into parts values(20001,"Book","red");
insert into parts values(20002,"pen","red");
insert into parts values(20003,"pencil","green");
insert into parts values(20004,"mobile","green");
insert into parts values(20005,"charger","black");





create table catalog(
	sid int,
    pid int,
    cost int,
    primary key(sid,pid),
    foreign key(sid) references supplier(sid) on delete cascade,
    foreign key(pid) references parts(pid) on delete cascade

);

insert into catalog values(10001,20001,10);
insert into catalog values(10001,20002,10);
insert into catalog values(10001,20003,30);
insert into catalog values(10001,20004,10);
insert into catalog values(10001,20005,10);
insert into catalog values(10002,20001,10);
insert into catalog values(10002,20002,20);
insert into catalog values(10003,20003,30);
insert into catalog values(10004,20003,40);


//find the sid's of suppliers who supply some red or green parts.
select distinct supplier.sid from supplier,catalog,parts where catalog.pid = parts.pid AND catalog.sid = supplier.sid AND parts.color in('red','green');

//find the sid's of suppliers who supply some red parts or whose city is bangalore.
select distinct supplier.sid from supplier,catalog,parts where catalog.pid = parts.pid AND catalog.sid = supplier.sid AND parts.color in('red') OR supplier.city  in("bnagalore");

//find pairs of sid's such that the suppliers with the first sid charges more for some part than the supplier with the second sid
select s1.sid,s2.sid,p1.pid from supplier s1,supplier s2,catalog c1,catalog c2,parts p1
where s1.sid=c1.sid and s2.sid=c2.sid and p1.pid=c1.pid and p1.pid=c2.pid and c1.cost>c2.cost;



