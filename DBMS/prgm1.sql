create database 1BM19CS401;
use 1BM19CS401;



create table person(driver_id varchar(10),
name varchar(20),
address varchar(30),
primary key(driver_id)
);
desc person;
insert into person values('A01', 'richard', 'BANGALORE');
insert into person values('A02', 'pradeep', 'ashok nagar');
insert into person values('A03', 'Smith', 'NR COLONY');
insert into person values('A04', 'venu', 'hanumanthnagar');
insert into person values('A05', 'jhon', 'rajajinagar');
select * from person;





create table car(reg_num varchar(10),model varchar(10),year int,primary key(reg_num));
desc car;
insert into car values('KA052250', 'indica', 1990);
insert into car values('KA031181', 'lancer', 1957);
insert into car values('KA095477', 'toyota', 1998);
insert into car values('KA053408', 'indica', 1990);
insert into car values('KA041702', 'Audi', 1990);
select * from car;




create table owns(driver_id varchar(10),reg_num varchar(10),primary key(driver_id,reg_num),foreign key(driver_id)references person(driver_id),
foreign key(reg_num)references car(reg_num));
desc owns;
insert into owns values("A01", 'KA052250');
insert into owns values("A02", 'KA053408');
insert into owns values("A03", 'KA031181');
insert into owns values("A04", 'KA095477');
insert into owns values("A04", 'KA041702');
select * from owns;





create table accident(report_num int,accident_date date,location varchar(30),primary key(report_num));
desc accident;
insert into accident values(11, '2013-01-01', 'mysore road');
insert into accident values(12, '2014-02-02','south end circle');
insert into accident values(13, '2013-01-21', 'bull temple date');
insert into accident values(14, '2018-02-17', 'mysore road');
insert into accident values(15, '2015-03-04', 'kanakapura road');
select * from accident;






create table participated(
	driver_id varchar(10),
    reg_num varchar(10),
    report_num int,
    damage_amount int,
    primary key(driver_id,reg_num, report_num),
    foreign key(driver_id) references person(driver_id),
    foreign key(reg_num) references car(reg_num),
    foreign key(report_num) references accident(report_num)
    );

desc participated;
select * from participated;

insert into participated values('A01', 'KA052250', 11, 10000);
insert into participated values('A02', 'KA053408', 12, 50000);
insert into participated values('A03', 'KA095477', 13, 25000);
insert into participated values('A04', 'KA031181', 14, 3000);
insert into participated values('A05', 'KA041702', 15, 5000);



update participated set damage_amount =25000 where reg_num ='KA053408' AND  report_num = 12;
select * from participated;
desc participated;

select count(distinct driver_id) CNT from participated, accident where participated.report_num  = accident.report_num AND accident_date like '%18';

select count(distinct driver_id) CNT from participated a, accident b where
a.report_num=b.report_num and b.accident_date like '%18';






























































select * from ACCIDENT;
update ACCIDENT set report_num = 111 where report_num = 1;

desc owns;

insert into owns values('&driver_id','&reg_num');
select * from owns;

desc participated;

insert into participated values('&driver_id','&reg_num','&report_num','&damage_amount');

select * from PARTICIPATED

select * from participated
order by damage_amount;
commit;

select avg(damage_amount) from participated;
delete from participated where damage_amount<avg(damage_amount);

delete from participated
where damage_amount < 14897.2;

select * from participated;

SELECT name from person,participated
where damage_amount > 14897.2, driver_id = driver_id;
select * from car;
select * from accident;
select max(damage_amount) from participated;

update participated set damage_amount = 25000 where reg_num = 'KA057894' and report_num = 12;


 select count(report_num) CNT from car c,participated p where c.reg_num=p.reg_num and
model='BMW';create database 1BM19CS401;
use 1BM19CS401;



create table person(driver_id varchar(10),
name varchar(20),
address varchar(30),
primary key(driver_id)
);
desc person;
insert into person values('A01', 'richard', 'BANGALORE');
insert into person values('A02', 'pradeep', 'ashok nagar');
insert into person values('A03', 'Smith', 'NR COLONY');
insert into person values('A04', 'venu', 'hanumanthnagar');
insert into person values('A05', 'jhon', 'rajajinagar');
select * from person;





create table car(reg_num varchar(10),model varchar(10),year int,primary key(reg_num));
desc car;
insert into car values('KA052250', 'indica', 1990);
insert into car values('KA031181', 'lancer', 1957);
insert into car values('KA095477', 'toyota', 1998);
insert into car values('KA053408', 'indica', 1990);
insert into car values('KA041702', 'Audi', 1990);
select * from car;




create table owns(driver_id varchar(10),reg_num varchar(10),primary key(driver_id,reg_num),foreign key(driver_id)references person(driver_id),
foreign key(reg_num)references car(reg_num));
desc owns;
insert into owns values("A01", 'KA052250');
insert into owns values("A02", 'KA053408');
insert into owns values("A03", 'KA031181');
insert into owns values("A04", 'KA095477');
insert into owns values("A04", 'KA041702');
select * from owns;





create table accident(report_num int,accident_date date,location varchar(30),primary key(report_num));
desc accident;
insert into accident values(11, '2013-01-01', 'mysore road');
insert into accident values(12, '2014-02-02','south end circle');
insert into accident values(13, '2013-01-21', 'bull temple date');
insert into accident values(14, '2018-02-17', 'mysore road');
insert into accident values(15, '2015-03-04', 'kanakapura road');
select * from accident;






create table participated(
	driver_id varchar(10),
    reg_num varchar(10),
    report_num int,
    damage_amount int,
    primary key(driver_id,reg_num, report_num),
    foreign key(driver_id) references person(driver_id),
    foreign key(reg_num) references car(reg_num),
    foreign key(report_num) references accident(report_num)
    );

desc participated;
select * from participated;

insert into participated values('A01', 'KA052250', 11, 10000);
insert into participated values('A02', 'KA053408', 12, 50000);
insert into participated values('A03', 'KA095477', 13, 25000);
insert into participated values('A04', 'KA031181', 14, 3000);
insert into participated values('A05', 'KA041702', 15, 5000);



update participated set damage_amount =25000 where reg_num ='KA053408' AND  report_num = 12;
select * from participated;
desc participated;

select count(distinct driver_id) CNT from participated, accident where participated.report_num  = accident.report_num AND accident_date like '%18';

select count(distinct driver_id) CNT from participated a, accident b where
a.report_num=b.report_num and b.accident_date like '%18';






























































select * from ACCIDENT;
update ACCIDENT set report_num = 111 where report_num = 1;

desc owns;

insert into owns values('&driver_id','&reg_num');
select * from owns;

desc participated;

insert into participated values('&driver_id','&reg_num','&report_num','&damage_amount');

select * from PARTICIPATED

select * from participated
order by damage_amount;
commit;

select avg(damage_amount) from participated;
delete from participated where damage_amount<avg(damage_amount);

delete from participated
where damage_amount < 14897.2;

select * from participated;

SELECT name from person,participated
where damage_amount > 14897.2, driver_id = driver_id;
select * from car;
select * from accident;
select max(damage_amount) from participated;

update participated set damage_amount = 25000 where reg_num = 'KA057894' and report_num = 12;


 select count(report_num) CNT from car c,participated p where c.reg_num=p.reg_num and
model='BMW';
