--CREATE DATABASE DjurDb;

USE DjurDb;

CREATE TABLE DjurTbl(
	[Id] int NOT NULL PRIMARY KEY,
	[Namn] nvarchar(max) NOT NULL
);


INSERT INTO DjurTbl([Id], [Namn])
VALUES 
	(1, 'Hamster'),
	(2, 'Hund'),
	(3, 'Katt'),
	(4, 'Kanin');


SELECT * FROM DjurTbl WHERE 'Namn' = '%';


DROP TABLE DjurTbl;


