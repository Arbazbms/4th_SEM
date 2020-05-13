create database bank_h_t1;
use bank_h_t1;
create table Branch(
branch_name varchar(30),
branch_city varchar(10),
asssets real,
primary key (branch_name));

insert into Branch values("SBI_Chamrajpet","Bangalore",50000),("SBI_ResidencyRoad","Bangalore",10000),("SBI_ShivajiRoad","Bombay",20000),("SBI_ParliamentRoad","Delhi",10000),("SBI_Jantarmantar","Delhi",20000);

create table BankAccount(
accno int,
branch_name varchar(30),
balance real,
primary key(accno),
foreign key(branch_name) references Branch(branch_name));

insert into BankAccount values(1,"SBI_Chamrajpet",2000),(2,"SBI_ResidencyRoad",5000),(3,"SBI_ShivajiRoad",6000),(4,"SBI_ParliamentRoad",9000),(5,"SBI_Jantarmantar",8000),(6,"SBI_ShivajiRoad",4000),(8,"SBI_ResidencyRoad",4000),(9,"SBI_ParliamentRoad",3000),(10,"SBI_ResidencyRoad",5000),(11,"SBI_Jantarmantar",2000);

create table BankCustomer(
customer_name varchar(30),
customer_street varchar(30),
customer_city varchar(10),
primary key (customer_name));



insert into BankCustomer values("Avinash","Bull temple road","Bangalore"),("Dinesh","Bannergatta road","Bangalore"),("Mohan","National college road","Bangalore"),("Nikil","Akbar road","Delhi"),("Ravi","Prithviraj road","Delhi");



create table Depositer(
customer_name varchar(30),
accno int,
primary key(customer_name,accno),
foreign key(customer_name) references BankCustomer(customer_name),
foreign key(accno) references BankAccount(accno));

insert into Depositer values("Avinash",1),("Dinesh",2),("Nikil",4),("Ravi",5),("Avinash",8),("Nikil",9),("Dinesh",10),("Nikil",11);

create table borrower (
customer_name varchar(20),
loan_number int primary key,
foreign key(customer_name) references BankCustomer(customer_name)
);
drop table borrower;
insert into borrower values 
("Avinash",1),("Dinesh",2),("Mohan",3),("Nikil",4),("Ravi",5);

create table Loan(
loan_number int,
branch_name varchar(30),
amount real,
primary key(loan_number),
foreign key (branch_name) references Branch(branch_name),
foreign key (loan_number) references borrower(loan_number));

drop table Loan;
insert into Loan values(1,"SBI_Chamrajpet",1000),(2,"SBI_ResidencyRoad",2000),(3,"SBI_ShivajiRoad",3000),(4,"SBI_ParliamentRoad",4000),(5,"SBI_Jantarmantar",5000);

/*Find Find all the customers who have at least two deposits at the same branch (Ex. ‘SBI_ResidencyRoad’).*/
select c.customer_name
from BankCustomer c where exists(
									select d.customer_name,count(d.customer_name)
                                    from depositer d,BankAccount ba
                                    where d.accno=ba.accno and c.customer_name=d.customer_name and ba.branch_name="SBI_ResidencyRoad"
                                    group by d.customer_name
                                    having count(d.customer_name)>=2);
                                    

/*Find all the customers who have an account at all the branches located in a specific city (Ex. Delhi). */
select BC.customer_name from BankCustomer BC where not exists(
	select branch_name from Branch where branch_city = 'Delhi'
	where branch_name not in(
    select BA.branch_name from Depositer D, BankAccount BA
	where D.accno = BA.accno and BC.customer_name = D.customer_name)
);


/*Demonstrate how you delete all account tuples at every branch located in a specific city (Ex. Bomay).*/
delete from bankAccount where branchname IN (select branchname from branch where branch_city = "BOMBAY");
		
/*2.	FIND ALL CUSTOMERS HAVING A LAON, AN ACCOUNT OR BOTH AT THE BANK*/
(SELECT CUSTOMER_NAME FROM depositer ) UNION (SELECT CUSTOMER_NAME FROM BORROWER);


/*4.	THE ANNUAL INTEREST PAYMENTS ARE MADE AND ALL BRANCHES ARE TO BE INCREASED BY 5%.*/
UPDATE ACCOUNT SET BALANCE=BALANCE *1.05;

select * from Depositor;		

/*3.	CREATE A VIEW WHICH GIVES EACH BRANCH THE SUM OF THE AMOUNT OF ALL THE LOANS AT THE BRANCH*/
CREATE VIEW BRANCH_TOTAL_LOAN (BRANCH_NAME, TOTAL_LOAN) AS SELECT BRANCH_NAME, SUM(AMOUNT) FROM LOAN GROUP BY BRANCH_NAME;
select * from BRANCH_TOTAL_LOAN;



