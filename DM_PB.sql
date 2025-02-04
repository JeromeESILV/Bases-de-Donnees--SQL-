drop database if exists CliniqueVeterinaire;
create database CliniqueVeterinaire;
use CliniqueVeterinaire;

create TABLE Proprietaire
(nump INT AUTO_INCREMENT NOT NULL,
 nomp CHAR(20) NOT NULL,
  prenomp CHAR(20) NOT NULL,
   adresse VARCHAR(25) NOT NULL,
    cp INT NOT NULL,
     ville CHAR(25) NOT NULL,
      tel INT NOT NULL,
       PRIMARY KEY(nump));

create TABLE Race
(numr INT AUTO_INCREMENT NOT NULL,
 nomr CHAR(20),
  poids FLOAT(6),
   PRIMARY KEY(numr));

create TABLE Animal
(numa INT AUTO_INCREMENT NOT NULL,
 noma CHAR(20) NOT NULL,
  datenaissa DATE NOT NULL,
   tatouage BIT NOT NULL,
    nump INT NOT NULL,
     numr INT NOT NULL,
      PRIMARY KEY(numa),
       FOREIGN KEY(nump) REFERENCES Proprietaire(nump),
        FOREIGN KEY(numr) REFERENCES  Race(numr));

create TABLE Veterinaire
(numv INT AUTO_INCREMENT NOT NULL,
 nomv CHAR(20),
  prenomv CHAR(20),
   telv INT NOT NULL,
    PRIMARY KEY(numv));

create TABLE Consultation
(Numc INT AUTO_INCREMENT NOT NULL,
 datec DATE NOT NULL,
  heurec TIME NOT NULL,
   prixc FLOAT NOT NULL,
    numa INT NOT NULL,
     numv INT NOT NULL,
      PRIMARY KEY(Numc),
       FOREIGN KEY(numa) REFERENCES Animal(numa),
        FOREIGN KEY(numv) REFERENCES Veterinaire(numv));

create TABLE Medicament
(numm INT AUTO_INCREMENT NOT NULL,
 nomm CHAR(20),
  prixm FLOAT,
   PRIMARY KEY(numm));
   
create TABLE Prescrire
(Numc INT NOT NULL,
 numm INT NOT NULL,
  PRIMARY KEY(Numc, numm),
   FOREIGN KEY(Numc) REFERENCES Consultation(Numc),
    FOREIGN KEY(numm) REFERENCES Medicament(numm),
     posologie VARCHAR(150));

create TABLE Soin
(nums INT NOT NULL,
 noms CHAR(20) NOT NULL,
  natures VARCHAR(100) NOT NULL, 
   tarifs FLOAT,
    PRIMARY KEY(nums));

create TABLE Pratiquer
(Numc INT NOT NULL,
 nums INT NOT NULL,
  PRIMARY KEY(Numc, nums),
   FOREIGN KEY(Numc) REFERENCES Consultation(Numc),
    FOREIGN KEY(nums) REFERENCES Soin(nums));