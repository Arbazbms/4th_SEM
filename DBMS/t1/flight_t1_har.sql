 create database flight_t1_har;
 use flight_t1_har;
 
create table employee(
	eid int,
    ename varchar(20),
    salary int,
    primary key(eid)
);

create table aircraft (
aid int,
    aname varchar(20),
    cruising_range int,
    primary key(aid)
);


create table certified(
	eid int,
    aid int,
    primary key(eid,aid),
foreign key(eid) references employee(eid),
foreign key(aid) references aircraft(aid)
);

create table flights(
flno int,
frm varchar(15),
dest varchar(15),
distance int,
departs timestamp default '2005-05-13 17:15:31',
arrives timestamp default '2005-05-13 17:15:31',
price int,
primary key (flno));


show tables;

insert into employee values(701,'A',50000),(702,'B',100000),(703,'C',150000),
(704,'D',90000),(705,'E',40000),(706,'F',60000),(707,'G',90000);

insert into aircraft values(101,'747',3000),(102,'Boeing',900),(103,'647',800),
(104,'Dreamliner',10000),(105,'Boeing',3500),(106,'707',1500),(107,'Dream', 120000);

insert into certified values(701,101),(701,102),(701,106),(701,105),(702,104),(703,104),
(704,104),(702,107),(703,107),(704,107),(702,101),(703,105),(704,105),(705,103);
select * from certified;


insert into flights values(101,'Bangalore','Delhi',2500,'2005-05-13 07:15:31','2005-05-13 17:15:31',5000),
(102,'Bangalore','Lucknow',3000,'2005-05-13 07:15:31','2005-05-13 11:15:31',6000),
(103,'Lucknow','Delhi',500,'2005-05-13 12:15:31',' 2005-05-13 17:15:31',3000),
(107,'Bangalore','Frankfurt',8000,'2005-05-13 07:15:31','2005-05-13 22:15:31',60000),
(104,'Bangalore','Frankfurt',8500,'2005-05-13 07:15:31','2005-05-13 23:15:31',75000),
(105,'Kolkata','Delhi',3400,'2005-05-13 07:15:31','2005-05-13 09:15:31',7000);

select * from flights;


/*viii.	Find the names of aircraft such that all pilots certified to operate them have salaries more than Rs.80,000.*/
select distinct a.aname
from aircraft a,certified c,employee e
where c.aid = a.aid and c.eid = e.eid and
e.salary > 80000;


/*ix.	For each pilot who is certified for more than three aircrafts, find the eid and the maximum cruising range of the aircraft for which she or he is certified.*/
select max(a.cruising_range),e.eid
from aircraft a,employee e,certified c
where a.aid = c.aid and c.eid = e.eid
group by c.eid
having count(c.aid) > 3;


/*x.	Find the names of pilots whose salary is less than the price of the cheapest route from Bangalore to Frankfurt*/
select e.ename
from employee e
where e.salary < (select min(price)
from flights where frm = "Bangalore" and
dest = "Frankfurt"
 );


/*xii.	Find the names of pilots certified for some Boeing aircraft.*/
select distinct e.ename 
from employee e,aircraft a,certified c
where a.aname like "Boeing%" and 
a.aid = c.aid and e.eid = c.eid;


/*xiii.	Find the aids of all aircraft that can be used on routes from Bangalore to Frankfurt.*/
SELECT A.aid
FROM Aircraft A
WHERE A.cruising_range >( SELECT MIN(F.distance)
			FROM Flights F
			WHERE F.frm = "Bangalore" AND F.dest = "Frankfurt" );


/*xv.	Print the name and salary of every non-pilot whose salary is more than the average salary for pilots.*/

SELECT E.ename, E.salary
FROM Employee E
WHERE E.eid NOT IN( SELECT DISTINCT C.eid
 FROM Certified C )
AND E.salary >( SELECT AVG(E1.salary)
 FROM Employee E1
 WHERE E1.eid IN
( SELECT DISTINCT C1.eid
 FROM Certified C1 )); 
 
 


