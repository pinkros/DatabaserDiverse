CREATE DATABASE Labb1Db;

USE Labb1Db;

--CREATE TABLE tbl_F�rfattare(
--ID int IDENTITY(1,1) PRIMARY KEY,
--F�rnamn nvarchar(max),
--Efternamn nvarchar(max),
--F�delsedatum datetime
--);

--CREATE TABLE tbl_B�cker(
--ISBN nvarchar(13) PRIMARY KEY,
--Titel nvarchar(max),
--Spr�k nvarchar(max),
--Pris int,
--Utgivningsdatum datetime,
--FOREIGN KEY (F�rfattarID) REFERENCES tbl_F�rfattare(ID)
--)

CREATE TABLE tbl_Butiker(
ID int IDENTITY(1,1) PRIMARY KEY,
Namn nvarchar(max),
Stad nvarchar(max),
Gata nvarchar(max),
Postnummer nvarchar(5),
Ort nvarchar(max)
)
