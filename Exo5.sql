drop database if exists School;
create database School;
use School;

create TABLE Class
(codeC INT AUTO_INCREMENT NOT NULL,
 C_Name CHAR(50),
  PRIMARY KEY(codeC));

create TABLE Student
(codeST INT AUTO_INCREMENT NOT NULL,
 Lname CHAR(25) NOT NULL,
  Fname CHAR(25) NOT NULL,
   DoB DATE NOT NULL,
    Student_Address VARCHAR(50) NOT NULL,
     Phone INT NOT NULL,
      codeC INT NOT NULL,
       PRIMARY KEY(codeST),
        FOREIGN KEY(codeC) REFERENCES Class(codeC));

create TABLE Sub
(codeSUB INT AUTO_INCREMENT NOT NULL,
 Wording CHAR(50),
 PRIMARY KEY(codeSUB));

create TABLE Homework
(codeH INT AUTO_INCREMENT NOT NULL,
 Due_Date DATE NOT NULL,
  Score INT CHECK(Score>=0 AND Score>=20),
   codeSUB INT NOT NULL,
    codeST INT NOT NULL,
     PRIMARY KEY(codeH),
      FOREIGN KEY(codeSUB) REFERENCES Sub(codeSUB),
       FOREIGN KEY(codeST) REFERENCES Student(codeST));

create TABLE Taught
(codeC INT NOT NULL,
 codeSUB INT NOT NULL,
  Nb_Hours INT NOT NULL,
   PRIMARY KEY(codeC, codeSUB),
    FOREIGN KEY(codeC) REFERENCES Class(codeC),
     FOREIGN KEY(codeSUB) REFERENCES Sub(codeSUB));