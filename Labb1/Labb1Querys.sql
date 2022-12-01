CREATE DATABASE Labb1Db;

USE Labb1Db;

CREATE TABLE tbl_Författare(
ID int IDENTITY(1,1) PRIMARY KEY,
Förnamn nvarchar(max),
Efternamn nvarchar(max),
Födelsedatum datetime2
);

CREATE TABLE tbl_Böcker(
ISBN nvarchar(13) PRIMARY KEY CHECK (ISBN NOT LIKE '%[^0-9]%'),
Titel nvarchar(max),
Språk nvarchar(max),
Pris int,
Utgivningsdatum datetime,
FörfattarID int,
FOREIGN KEY (FörfattarID) REFERENCES tbl_Författare(ID)
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
FOREIGN KEY (ISBN) REFERENCES tbl_Böcker(ISBN),
PRIMARY KEY(ButiksID, ISBN)
)

CREATE TABLE tbl_Kunder(
ID int IDENTITY(1,1) PRIMARY KEY,
Förnamn nvarchar(max),
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


CREATE VIEW TitlarPerFörfattare AS
SELECT 
Namn AS tbl_Författare.Förnamn + ' ' + tbl_Författare.Efternamn,


FROM tbl_Författare	;