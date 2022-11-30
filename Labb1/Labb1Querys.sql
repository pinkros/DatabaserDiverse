CREATE DATABASE Labb1Db;

USE Labb1Db;

--CREATE TABLE tbl_Författare(
--ID int IDENTITY(1,1) PRIMARY KEY,
--Förnamn nvarchar(max),
--Efternamn nvarchar(max),
--Födelsedatum datetime
--);

--CREATE TABLE tbl_Böcker(
--ISBN nvarchar(13) PRIMARY KEY,
--Titel nvarchar(max),
--Språk nvarchar(max),
--Pris int,
--Utgivningsdatum datetime,
--FOREIGN KEY (FörfattarID) REFERENCES tbl_Författare(ID)
--)

CREATE TABLE tbl_Butiker(
ID int IDENTITY(1,1) PRIMARY KEY,
Namn nvarchar(max),
Stad nvarchar(max),
Gata nvarchar(max),
Postnummer nvarchar(5),
Ort nvarchar(max)
)
