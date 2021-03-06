CREATE DATABASE BOOK_DATABASE;
use BOOK_DATABASE;


CREATE TABLE PUBLISHER 
(
PNAME VARCHAR(20)PRIMARY KEY, 
PHONE  BIGINT (12), 
ADDRESS VARCHAR(30)
); 

DROP TABLE PUBLISHER;


INSERT INTO PUBLISHER VALUES ('MCGRAW-HILL',9989076587,'BANGALORE'); 
INSERT INTO PUBLISHER VALUES ('PEARSON', 9889076565, 'NEWDELHI'); 
INSERT INTO PUBLISHER VALUES ('RANDOM HOUSE', 7455679345,'HYDRABAD'); 
INSERT INTO PUBLISHER VALUES ('HACHETTE LIVRE', 8970862340,'CHENAI'); 
INSERT INTO PUBLISHER VALUES ('GRUPO PLANETA', 7756120238,'BANGALORE'); 




SELECT *FROM PUBLISHER;


CREATE TABLE BOOK 
(
BOOK_ID INT,
TITLE VARCHAR(30), 
PUB_YEAR VARCHAR(30), 
PNAME VARCHAR(30),
PRIMARY KEY(BOOK_ID),
FOREIGN KEY (PNAME) REFERENCES PUBLISHER (PNAME) ON DELETE CASCADE);



INSERT INTO BOOK VALUES (1,'DBMS','JAN-2017', 'MCGRAW-HILL'); 
INSERT INTO BOOK VALUES (2,'ADBMS','JUN-2016', 'MCGRAW-HILL'); 
INSERT INTO BOOK VALUES (3,'CN','SEP-2016', 'PEARSON'); 
INSERT INTO BOOK VALUES (4,'CG','SEP-2015','GRUPO PLANETA'); 
INSERT INTO BOOK VALUES (5,'OS','MAY-2016', 'PEARSON');


SELECT *FROM BOOK;

CREATE TABLE BOOK_AUTHORS 
(
AUTHOR_NAME VARCHAR(30), 
BOOK_ID INT, 
PRIMARY KEY (BOOK_ID, AUTHOR_NAME),
FOREIGN KEY (BOOK_ID)REFERENCES BOOK (BOOK_ID) ON DELETE CASCADE 
); 

INSERT INTO BOOK_AUTHORS VALUES ('NAVATHE', 1); 
INSERT INTO BOOK_AUTHORS VALUES ('NAVATHE', 2); 
INSERT INTO BOOK_AUTHORS VALUES ('TANENBAUM', 3); 
INSERT INTO BOOK_AUTHORS VALUES ('EDWARD ANGEL', 4); 
INSERT INTO BOOK_AUTHORS VALUES ('GALVIN', 5); 



SELECT *FROM BOOK_AUTHORS;

CREATE TABLE LIBRARY_BRANCH 
(
BRANCH_ID INT PRIMARY KEY, 
BRANCH_NAME VARCHAR(50), 
ADDRESS VARCHAR (50)); 

INSERT INTO LIBRARY_BRANCH VALUES (10,'RR NAGAR','BANGALORE'); 
INSERT INTO LIBRARY_BRANCH VALUES (11,'RNSIT','BANGALORE'); 
INSERT INTO LIBRARY_BRANCH VALUES (12,'RAJAJI NAGAR','BANGALORE'); 
INSERT INTO LIBRARY_BRANCH VALUES (13,'NITTE','MANGALORE'); 
INSERT INTO LIBRARY_BRANCH VALUES (14,'MANIPAL','UDUPI'); 



SELECT *FROM LIBRARY_BRANCH;

CREATE TABLE BOOK_COPIES 
(
NO_OF_COPIES INT, 
BOOK_ID INT,
BRANCH_ID INT,
PRIMARY KEY (BOOK_ID, BRANCH_ID),
FOREIGN KEY(BOOK_ID) REFERENCES BOOK (BOOK_ID) ON DELETE CASCADE, 
FOREIGN KEY (BRANCH_ID) REFERENCES LIBRARY_BRANCH (BRANCH_ID) ON DELETE CASCADE
); 

INSERT INTO BOOK_COPIES VALUES (10, 1, 10); 
INSERT INTO BOOK_COPIES VALUES (5, 1, 11); 
INSERT INTO BOOK_COPIES VALUES (2, 2, 12); 
INSERT INTO BOOK_COPIES VALUES (5, 2, 13); 
INSERT INTO BOOK_COPIES VALUES (7, 3, 14); 
INSERT INTO BOOK_COPIES VALUES (1, 5, 10); 
INSERT INTO BOOK_COPIES VALUES (3, 4, 11); 


SELECT *FROM BOOK_COPIES;

CREATE TABLE CARD 
(CARD_NO INT PRIMARY KEY); 

INSERT INTO CARD VALUES (100); 
INSERT INTO CARD VALUES (101); 
INSERT INTO CARD VALUES (102); 
INSERT INTO CARD VALUES (103); 
INSERT INTO CARD VALUES (104);


SELECT *FROM CARD;

CREATE TABLE BOOK_LENDING 
(
 DATE_OUT DATE, 
 DUE_DATE DATE, 
 BOOK_ID INT,
 BRANCH_ID INT,
 CARD_NO INT,
 PRIMARY KEY (BOOK_ID, BRANCH_ID, CARD_NO),
 FOREIGN KEY(BOOK_ID)REFERENCES BOOK (BOOK_ID) ON DELETE CASCADE, 
 FOREIGN KEY(BRANCH_ID)REFERENCES LIBRARY_BRANCH (BRANCH_ID) ON DELETE CASCADE, 
 FOREIGN KEY(CARD_NO) REFERENCES CARD (CARD_NO) ON DELETE CASCADE
);

INSERT INTO BOOK_LENDING VALUES ('2017-01-01','2017-01-01', 1, 10, 101); 
INSERT INTO BOOK_LENDING VALUES ('2017-01-11','2017-03-11', 3, 14, 101); 
INSERT INTO BOOK_LENDING VALUES ('2017-02-21','2017-04-21', 2, 13, 101); 
INSERT INTO BOOK_LENDING VALUES ('2017-03-15','2017-07-15', 4, 11, 101); 
INSERT INTO BOOK_LENDING VALUES ('2017-04-12','2017-05-12', 1, 11, 104); 


SELECT *FROM BOOK_LENDING;


# 1. Retrieve details of ALL books IN the library – id, title, NAME of publisher, AUTHORS, number of copies IN EACH branch, etc. 

SELECT B.BOOK_ID, B.TITLE, B.PNAME, A.AUTHOR_NAME, C.NO_OF_COPIES, L.BRANCH_ID 
FROM BOOK B, BOOK_AUTHORS A, BOOK_COPIES C, LIBRARY_BRANCH L 
WHERE B.BOOK_ID=A.BOOK_ID AND B.BOOK_ID=C.BOOK_ID AND L.BRANCH_ID=C.BRANCH_ID;

# 1. Get the particulars of borrowers who have borrowed more THAN 3 books, but FROM Jan 2017 TO Jun 2017. 

SELECT CARD_NO 
FROM BOOK_LENDING 
WHERE DATE_OUT BETWEEN '2017-01-01' AND '2017-07-01'
GROUP BY CARD_NO
HAVING COUNT(*)>3;

#2. DELETE a book IN BOOK table. UPDATE the contents of other TABLES TO reflect this DATA manipulation operation. 

DELETE FROM BOOK 
WHERE BOOK_ID=3;

SELECT *FROM BOOK;

#3. PARTITION the BOOK TABLE based ON YEAR of publication. Demonstrate its working WITH a SIMPLE query. 

CREATE VIEW V_PUBLICATION AS 
SELECT PUB_YEAR 
FROM BOOK;

SELECT *FROM V_PUBLICATION;

# 4. CREATE a VIEW of ALL books AND its number of copies that are currently available IN the Library. 

CREATE VIEW V_BOOKS AS 
SELECT B.BOOK_ID, B.TITLE, C.NO_OF_COPIES 
FROM BOOK B, BOOK_COPIES C, LIBRARY_BRANCH L 
WHERE B.BOOK_ID=C.BOOK_ID AND C.BRANCH_ID=L.BRANCH_ID;

SELECT *FROM V_BOOKS;
