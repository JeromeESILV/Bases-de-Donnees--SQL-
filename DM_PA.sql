drop database if exists Partie_A;
create database Partie_A;
use Partie_A;

Table Client
codeC
Nom
Prenom
Tel
Fax
Email
Website
Adresse
Commentaire*

Table Technicien
codeT
Nom
Niv_Qualif
Taux_Horaire
Tel
Pays
Zone_Regionale

Table Tech_Domaine
codeTD
Nom
Commentaire

Table Interventions 0,1 <=> 0,1 Client 1,1 <=Rel=> 0,n Tehnicien
codeI
Date
Temps
Commentaire
Motif
Prix