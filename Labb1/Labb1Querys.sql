CREATE DATABASE Labb1Db;

USE Labb1Db;

CREATE TABLE tbl_F�rfattare(
ID int IDENTITY(1,1) PRIMARY KEY,
F�rnamn nvarchar(max),
Efternamn nvarchar(max),
F�delsedatum datetime2
);

CREATE TABLE tbl_B�cker(
ISBN nvarchar(13) PRIMARY KEY CHECK (ISBN NOT LIKE '%[^0-9]%'),
Titel nvarchar(max),
Spr�k nvarchar(max),
Pris int,
Utgivningsdatum datetime,
F�rfattarID int,
FOREIGN KEY (F�rfattarID) REFERENCES tbl_F�rfattare(ID)
)

CREATE TABLE tbl_Butiker(
ID int IDENTITY(1,1) PRIMARY KEY,
Namn nvarchar(max),
Stad nvarchar(max),
Gata nvarchar(max),
Postnummer nvarchar(5) CHECK (Postnummer NOT LIKE '%[^0-9]%'),
Ort nvarchar(max)
)

CREATE TABLE tbl_LagerSaldo(
ButiksID int,
ISBN nvarchar(13),
Antal int,
FOREIGN KEY (ButiksID) REFERENCES tbl_Butiker(ID),
FOREIGN KEY (ISBN) REFERENCES tbl_B�cker(ISBN),
PRIMARY KEY(ButiksID, ISBN)
)

CREATE TABLE tbl_Kunder(
ID int IDENTITY(1,1) PRIMARY KEY,
F�rnamn nvarchar(max),
Efternamn nvarchar(max),
Telefonnummer nvarchar(25) CHECK (Telefonnummer NOT LIKE '%[^0-9]%'),
Stad nvarchar(max),
Gata nvarchar(max),
Postnummer nvarchar(5) CHECK (Postnummer NOT LIKE '%[^0-9]%'),
Ort nvarchar(max)
)

CREATE TABLE tbl_orbrar(
ID int IDENTITY(1,1),
KundID int,
ISBN int,
ButiksID int,
Antal int
)


CREATE VIEW TitlarPerF�rfattare AS
SELECT 
Namn AS tbl_F�rfattare.F�rnamn + ' ' + tbl_F�rfattare.Efternamn,


FROM tbl_F�rfattare	;