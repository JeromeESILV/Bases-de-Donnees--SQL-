drop database if exists Grossite;
create database Grossite;
use Grossite;

create TABLE Clients
(codeCL INT AUTO_INCREMENT NOT NULL,
 Magasin CHAR(25) NOT NULL,
  Magasin_Adresse VARCHAR(25) NOT NULL,
   Ville CHAR(25) NOT NULL,
    Code_Post INT NOT NULL,
     Telephone VARCHAR(15) NOT NULL,
      Categorie_Code CHAR(5) NOT NULL,
       PRIMARY KEY(codeCL));

create TABLE Rep
(codeR INT AUTO_INCREMENT NOT NULL,
 Nom CHAR(15) NOT NULL,
  Prenom CHAR(20) NOT NULL,
   Enbaucher DATE NOT NULL,
    Date_de_Depart Date,
     PRIMARY KEY(codeR));

create TABLE Factures
(codeF INT AUTO_INCREMENT NOT NULL,
 Date_Facture DATE NOT NULL,
  Nbr_Clients INT NOT NULL,
   Payer BOOLEAN NOT NULL,
    Num_Rep VARCHAR(5) NOT NULL,
     Montant_HT FLOAT(10) NOT NULL,
      codeCL INT NOT NULL
       codeR INT NOT NULL
        PRIMARY KEY(codeF)
         FOREIGN KEY(codeCL) REFERENCES Clients(codeCL)
          FOREIGN KEY(codeR) REFERENCES Rep(codeR));

create TABLE Categorie
(codeCAT INT AUTO_INCREMENT NOT NULL,
 Code CHAR(5) NOT NULL,
  Nom CHAR(25) NOT NULL,
   Taux_Remise FLOAT(6) NOT NULL,
    codeR INT NOT NULL,
     PRIMARY KEY(codeCAT)
      FOREIGN KEY(codeR) REFERENCES Rep(codeR)); /* redo this no relation to facture */