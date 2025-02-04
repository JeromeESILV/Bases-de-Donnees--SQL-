drop database if exists gestcom;
create database gestcom;
use gestcom;

create table client
(codeC int auto_increment not null,
 nomc varchar(20) not null,
  primary key(codeC));

create table commande
(numm int not null,
 datecom datetime,
  codec int not null,
   primary key(numm),
    foreign key(codeC) references client(codeC));

create table produit
(refp char(6) not null,
 designation varchar(25),
  primary key(refp));

create table concerner
(refp char(6) not null,
 numm int not null,
  quantitecom int,
   primary key(refp, numm),
    foreign key(refp) references produit(refp),
     foreign key(numm) references commande(numm));