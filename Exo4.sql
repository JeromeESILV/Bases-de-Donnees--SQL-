drop database if exists Exo4;
create database Exo4;
use Exo4;

/* First Layer all parent elements connects to nothing */
create TABLE Semaine
(codeSEM INT AUTO_INCREMENT NOT NULL,
 Debut_Semaine DATE NOT NULL,
  PRIMARY KEY(codeSEM));

create TABLE Client
(codeC INT AUTO_INCREMENT NOT NULL,
 Raison_Sociale CHAR(200) NOT NULL,
  Adresse_Client CHAR(200) NOT NULL,
   Telephone INT NOT NULL,
    Email CHAR(50) NOT NULL,
     PRIMARY KEY(codeC));

create TABLE Services
(codeSER INT AUTO_INCREMENT NOT NULL,
 Libelle CHAR(100) NOT NULL,
  PRIMARY KEY(codeSER));

/* 2nd layer child elements that connect directly to parents and may have their own children */
create TABLE Salaire
(codeSAL INT AUTO_INCREMENT NOT NULL,
 Nom CHAR(50) NOT NULL,
  Prenom CHAR(50) NOT NULL,
   Fonction CHAR(75) NOT NULL,
    codeSER INT NOT NULL,
     PRIMARY KEY(codeSAL),
      FOREIGN KEY(codeSER) REFERENCES Services(codeSER));

create TABLE Project
(codeP INT AUTO_INCREMENT NOT NULL,
 Intitule CHAR(50) NOT NULL,
  Debut DATE NOT NULL,
   Fin_Theo DATE NOT NULL,
    Jours_Hommes VARCHAR(25)NOT NULL,
     codeC INT NOT NULL, /* DECLARE KECOLUMNS FOR FOREIGN KEYS */
      codeSAL INT NOT NULL,
       PRIMARY KEY(codeP),
        FOREIGN KEY(codeC) REFERENCES Client(codeC),
         FOREIGN KEY(codeSAL) REFERENCES Salaire(codeSAL));

/* Connection layer, links tables that are parents to each other as an intermeadiary may contain values (basically a psuedo table) */
create TABLE Realiser
(codeSEM INT NOT NULL,
 codeSAL INT NOT NULL,
  codeP INT NOT NULL,
   Heures INT NOT NULL,
    PRIMARY KEY(codeSEM, codeSAL, codeP),
     FOREIGN KEY(codeSEM) REFERENCES Semaine(codeSEM),
      FOREIGN KEY(codeSAL) REFERENCES Salaire(codeSAL),
       FOREIGN KEY(codeP) REFERENCES Project(codeP));

create TABLE Travailler
(codeSAL INT NOT NULL,
 codeP INT NOT NULL,
  Affectation DATE NOT NULL,
   PRIMARY KEY(codeSAL, codeP),
    FOREIGN KEY(codeSAL) REFERENCES Salaire(codeSAL),
     FOREIGN KEY(codeP) REFERENCES Project(codeP));