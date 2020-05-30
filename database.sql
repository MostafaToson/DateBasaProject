DROP database library;
create database library;
use library;
CREATE TABLE Members (
  idmember INT NOT NULL PRIMARY KEY,
  memberName VARCHAR(45) NULL,
  birthDate DATE NULL,
  gender VARCHAR(45) NULL,
  address VARCHAR(45) NULL
  );
  select * from Members;
 
  CREATE TABLE Books (
  idbook INT NOT NULL PRIMARY KEY,
  title VARCHAR(45) NULL,
  ISBN decimal NULL,
  price decimal NULL,
  datePublished date NULL,
  idauthor INT NOT NULL,
  idpublisher INT NOT NULL
  );
   select * from books;
   
  CREATE TABLE Author (
  idauthor INT NOT NULL PRIMARY KEY,
  authorName VARCHAR(45) NULL
  );
  
  CREATE TABLE Publisher (
  idpublisher INT NOT NULL PRIMARY KEY,
  publisherName VARCHAR(45) NULL
  );
  select * from publisher;
  
  CREATE TABLE Borrowed (
  idborrowed INT NOT NULL PRIMARY KEY,
  takenDate date NULL,
  broughtDate date NULL,
  idmember INT NOT NULL,
  idbook INT NOT NULL
  );
  
  select * from borrowed;
  
  alter table Books add foreign key (idauthor) references Author(idauthor);
  alter table Books add foreign key (idpublisher) references Publisher(idpublisher);
  alter table Borrowed add foreign key (idmember) references Members(idmember);
  alter table Borrowed add foreign key (idbook) references Books(idbook);
  /*insert information*/
  Insert into Members Values (1, "Mostafa Toson", "2000/11/25" , "Male" , "Cairo");
  Insert into Members Values (2, "Mohamed Ali", "2000/11/25" , "Male" , "Aswan");
  Insert into Members Values (3, "Kareem Ahmed", "2010/07/7" , "Male" , "Damanhour");
  Insert into Members Values (4, "Mariam Hassan", "1997/3/25" , "Female" , "Cairo");
  Insert into Members Values (5, "Alaa Mohammed", "1999/11/20" , "Female" , "Tanta");
  
  Insert into Author Values (1001, "Lucas Ellerbroek" );
  Insert into Author Values (1002, "Elizabeth Tasker");
  Insert into Author Values (1003, "Ismail Ibn Kathir");
  
  Insert into Publisher Values (10001, "Akashic Books");
  Insert into Publisher Values (10002, "Dzanc Books");
  Insert into Publisher Values (10003, "Graywolf Press");
  
  Insert into Books Values (101, "Planet Hunters", 456100 , 152 ,"1970/08/9" , 1001, 10001);
  Insert into Books Values (102, "The Planet Factory", 845120 , 250,"1880/05/7" , 1002, 10003);
  Insert into Books Values (103, "The beginning and the end", 206545 ,500, "1525/4/6" , 1003 , 10001);
  Insert into Books Values (104, "prophet's stories" , 020515 ,350, "1950/12/25" , 1001 , 10002);
  Insert into Books Values (105, "Shawos Map", 982040 , 265 ,"1950/12/25" , 1002, 10001);

  Insert into Borrowed Values (5001, "2010/07/31", "2010/08/14", 2, 103);
  Insert into Borrowed Values (5002, "2015/09/11", "2015/09/25", 5, 104);
  Insert into Borrowed Values (5003, "2015/09/25", "2015/10/09", 5, 102);
  Insert into Borrowed Values (5004, "2020/04/04", "2020/04/18", 3, 101);
 
 
  
  
  /*select statements*/
  SELECT * FROM Members ;
  SELECT memberName, gender, address FROM Members ;
  SELECT CONCAT(title,':',datePublished) , idpublisher FROM Books;
  SELECT CONCAT(title,':',datePublished) As "Description",  idpublisher FROM Books ;
  SELECT idmember, memberName, LEFT(birthDate, 4) AS "year of birth" FROM Members ;
  SELECT * FROM Members WHERE gender = "Female" ;
  SELECT * FROM Members WHERE gender = "female" AND address = "Cairo" ; 
  SELECT * FROM Members WHERE gender = "female" OR address = "Cairo" ; 
  SELECT publisherName, idpublisher FROM publisher ORDER BY publisherName ;
  SELECT publisherName, idpublisher FROM publisher ORDER BY publisherName DESC ;
  SELECT publisherName, idpublisher FROM publisher ORDER BY publisherName, idpublisher ;
  SELECT DISTINCT publisherName FROM publisher ;
  SELECT COUNT( idbook ) FROM Books ;
  SELECT MAX(price) FROM Books ;
  SELECT MIN(price) FROM Books ;
  SELECT SUM(price) FROM Books ;
  SELECT SUM(price) FROM Books WHERE idpublisher >= 10002 ;
  SELECT gender FROM Members GROUP BY gender ;
  SELECT gender , COUNT(gender) AS "Total genders" FROM Members GROUP BY gender ;
  SELECT * FROM Members LIMIT 2 ;
  SELECT * FROM Members LIMIT 1, 3  ;
  
  /* 	Select Statements using Sub Query	*/
  SELECT title FROM Books WHERE idpublisher IN (SELECT MIN(idpublisher) FROM  publisher);
  SELECT broughtDate FROM Borrowed WHERE idbook IN (SELECT idbook FROM Books WHERE price > 300 ); 
  SELECT a.idpublisher, a.publisherName, b.price FROM Publisher a, Books b WHERE a.idpublisher = b.idpublisher AND b.price >250;
  
  /*	 Select Statements using Count and Group	*/
  SELECT idauthor, COUNT(*) FROM Books GROUP BY idauthor ORDER BY 2 ;
  SELECT gender, COUNT(*) FROM Members GROUP BY gender ORDER BY 2 DESC;
  
  /* 	Select Statements using Different Joins		*/
  SELECT Books.title, Author.authorname FROM Books INNER JOIN Author ON Books.idauthor = Author.idauthor;
  SELECT Books.price, Borrowed.idborrowed FROM Books LEFT JOIN Borrowed ON Books.idbook = Borrowed.idbook;
  SELECT Books.ISBN, Borrowed.idborrowed FROM Books RIGHT JOIN Borrowed ON Books.idbook = Borrowed.idbook;
  SELECT Books.datePublished, Publisher.publisherName FROM Books INNER JOIN Publisher ON Books.idpublisher = Publisher.idpublisher; 
  SELECT Borrowed.takenDate, Members.memberName FROM Borrowed CROSS JOIN Members ON Members.idmember = Borrowed.idmember;
  
  /* 	Insert Statement 	*/
  INSERT INTO Members (idmember, memberName, address) VALUES (6, "MohamedWalled", "Tanta");
  INSERT INTO Author (idauthor ,authorName) VALUES (1004, "Miguel de Cervantes") ;
  INSERT INTO Publisher (idpublisher, publisherName) VALUES (10004, "Dzanc Books") ;
  INSERT INTO Books (idbook, title, price ,idauthor , idpublisher) VALUES (106 , "Don Quixote" , 425 ,1004 ,10004 );
  INSERT INTO Borrowed (idborrowed ,takenDate ,broughtDate ,idmember , idbook) VALUES (5005 , "2020/3/3", "2020/3/17" , 5 , 106) ;
  
  /* 	Update Statement	*/
  UPDATE Members SET memberName = "Kareem" WHERE idmember = 2;
  UPDATE Books SET title = "Pharaonic history" WHERE idbook = 103 ;
  UPDATE Books SET price = 420 WHERE idbook = 101;
  UPDATE Publisher SET publisherName = "Pramids Books" WHERE idpublisher = 10003;
  UPDATE Author SET authorName = "Abn Khaldon" WHERE idauthor = 1002 ;
  
	/* 	Delete Statement	*/
  DELETE FROM Members WHERE idmember = 1 ;
  DELETE FROM Borrowed WHERE idborrowed = 5001;
  DELETE FROM Borrowed WHERE idborrowed = 5003;
  DELETE FROM Books WHERE idbook = 103;
  DELETE FROM Members WHERE idmember = 2 ;

  

  
