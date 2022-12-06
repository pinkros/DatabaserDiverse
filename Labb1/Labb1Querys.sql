--CREATE DATABASE Labb1Db;

USE Labb1Db;

CREATE TABLE tbl_F�rfattare(
ID int IDENTITY(1,1) PRIMARY KEY,
F�rnamn nvarchar(max),
Efternamn nvarchar(max),
F�delsedatum date
);

CREATE TABLE tbl_B�cker(
ISBN nvarchar(13) PRIMARY KEY CHECK (ISBN NOT LIKE '%[^0-9]%'),
Titel nvarchar(max),
Spr�k nvarchar(max),
Pris int,
Utgivnings�r int,
F�rfattarID int,
FOREIGN KEY (F�rfattarID) REFERENCES tbl_F�rfattare(ID)
)

CREATE TABLE tbl_Butiker(
ID int IDENTITY(1,1) PRIMARY KEY,
Namn nvarchar(max),
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
Gata nvarchar(max),
Postnummer nvarchar(5) CHECK (Postnummer NOT LIKE '%[^0-9]%'),
Ort nvarchar(max)
)

CREATE TABLE tbl_Ordrar(
ID int IDENTITY(1,1) PRIMARY KEY,
KundID int,
ISBN nvarchar(13) CHECK (ISBN NOT LIKE '%[^0-9]%'),
ButiksID int,
Antal int,
OrderDatum date,
FOREIGN KEY (KundID) REFERENCES tbl_Kunder(ID),
FOREIGN KEY (ButiksID) REFERENCES tbl_Butiker(ID),
FOREIGN KEY (ISBN) REFERENCES tbl_B�cker(ISBN)
);
--DROP TABLE tbl_Ordrar;
--DROP TABLE tbl_LagerSaldo;
--DROP TABLE tbl_Butiker;
--DROP TABLE tbl_Kunder;
--DROP TABLE tbl_B�cker;
--DROP TABLE tbl_F�rfattare;

INSERT INTO tbl_Butiker (Namn, Gata, Postnummer, Ort) 
VALUES('Trosa Bokhandel AB', 'Torget 3', '61930', 'Trosa'),
('Hallmans Bokhandel', 'Kungsgatan 8', '45130', 'Uddevalla'),
('Ugglansbokhandel Stenstorp AB', 'Sollidsv�gen 7', '52161', 'Stenstorp');

INSERT INTO tbl_F�rfattare (F�rnamn, Efternamn, F�delsedatum)
VALUES('Till', 'Lindemann', '1963-01-04'),
('Robin', 'Hobb', '1952-03-05'),
('Philip','Pullman','1946-10-19'),
('Alan', 'Moore', '1953-11-18');

INSERT INTO tbl_B�cker(ISBN, Titel, Spr�k, Pris, Utgivnings�r, F�rfattarID)
VALUES('9783462045246', 'In stillen N�chten', 'Tyska', '340', '2013', '1'),
('9783462053326', '100 Gedichte', 'Tyska', '215', '2020', '1'),
('9780007562251', 'Assassin''s Apprentice', 'Engelska', '122', '2014', '2'),
('9780007585892', 'Fool''s Errand', 'Engelska', '136', '2014', '2'),
('9780008117450', 'Ship of Magic', 'Engelska', '148', '2015', '2'),
('9781407186108', 'Northern Lights', 'Engelska', '124', '2017', '3'),
('9781407186115', 'The Subtle Knife', 'Engelska', '124', '2017', '3'),
('9781407186122', 'The Amber Spyglass', 'Engelska', '113', '2017', '3'),
('9781401248192', 'Watchmen', 'Engelska', '255', '2014', '4'),
('9781779511195', 'V for Vendetta', 'Engelska', '282', '2020', '4');

--UPDATE tbl_B�cker
--SET Spr�k = 'Engelska'
--WHERE Titel LIKE 'V for Vendetta';

INSERT INTO tbl_LagerSaldo (ButiksID, ISBN, Antal)
VALUES(1,'9783462053326',2),
(1,'9783462045246',2),
(2,'9783462053326',1),
(1, '9780008117450',3),
(3, '9781407186108',5),
(3,'9781401248192',1),
(2,'9781779511195',2),
(3,'9781407186122',2),
(2,'9780007562251',4);

INSERT INTO tbl_Kunder(F�rnamn, Efternamn, Telefonnummer, Gata, Postnummer, Ort)
VALUES('Arvid','Leimar','0737531873','Bondeg�rdet 2','42433','Angered'),
('Divra','Ramiel','0626420762' ,'Adelsgatan 1','31322', 'Gladestad');

INSERT INTO tbl_Ordrar (KundID, ISBN, ButiksID, Antal, OrderDatum)
VALUES (1,9781779511195,2, 1, '2022-12-01'),
(2,9780008117450,1, 1, '2022-10-15');

SELECT * FROM tbl_Kunder


CREATE VIEW TitlarPerF�rfattare AS
SELECT 
tbl_F�rfattare.F�rnamn + ' ' + tbl_F�rfattare.Efternamn		AS Namn,
DATEDIFF(YEAR,tbl_F�rfattare.F�delsedatum,GETDATE())		AS �lder,
COUNT(DISTINCT tbl_B�cker.Titel)							AS B�cker,
SUM(tbl_B�cker.Pris * tbl_LagerSaldo.Antal)
															AS LagerV�rde
FROM tbl_F�rfattare
JOIN tbl_B�cker ON tbl_F�rfattare.ID = tbl_B�cker.F�rfattarID
JOIN tbl_LagerSaldo ON tbl_B�cker.ISBN = tbl_LagerSaldo.ISBN
GROUP BY tbl_F�rfattare.F�rnamn, tbl_F�rfattare.Efternamn, tbl_F�rfattare.F�delsedatum;

Select * from TitlarPerF�rfattare

