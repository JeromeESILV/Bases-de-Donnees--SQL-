drop database if exists fest;
create database fest;
use fest;

create TABLE Lieu
(codeL INT AUTO_INCREMENT NOT NULL, /* Alais */
 nom_lieu CHAR(20) NOT NULL,
  numm_rue VARCHAR(20) NOT NULL,
   factures INT NOT NULL,
    PRIMARY KEY(codeL)); 

create TABLE Concert
(codeC INT AUTO_INCREMENT NOT NULL,
 C_name CHAR(25) NOT NULL,
  C_date DATE NOT NULL,
   codeL INT NOT NULL,
    PRIMARY KEY(codeC),
     FOREIGN KEY(codeL) REFERENCES Lieu(codeL)); /* link Concert to lieu */

create TABLE Chef_O
(codeCO INT AUTO_INCREMENT NOT NULL,
 CO_Lname CHAR(25) NOT NULL,
  CO_Fname CHAR(25) NOT NULL,
   CO_DoB DATE NOT NULL,
    CO_Nationality CHAR(30) NOT NULL,
     Cachet FLOAT(12,2) NOT NULL,
      Comments VARCHAR(200),
      PRIMARY KEY(codeCO));

create TABLE Solliste
(codeS INT AUTO_INCREMENT NOT NULL,
 S_Lname CHAR(25) NOT NULL,
  S_Fname CHAR(25) NOT NULL,
   S_DoB DATE NOT NULL,
    S_Nationality CHAR(30) NOT NULL,
     PRIMARY KEY(codeS));

create TABLE Oeuvre
(codeO INT AUTO_INCREMENT NOT NULL,
 O_name CHAR(25) NOT NULL,
  O_duration INT(3) NOT NULL, 
   codeC INT NOT NULL, 
    codeCO INT NOT NULL,
     PRIMARY KEY(codeO), 
      FOREIGN KEY(codeC) REFERENCES Concert(codeC),
       FOREIGN KEY(codeCO) REFERENCES Chef_O(codeCO));
       
create TABLE Interpreter
(codeS INT NOT NULL,
 codeO INT NOT NULL,
  PRIMARY KEY(codeS, codeO),
   FOREIGN KEY(codeS) REFERENCES Solliste(codeS),
    FOREIGN KEY(codeO) REFERENCES Oeuvre(codeO));