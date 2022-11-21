--CREATE DATABASE KeysDemoDb;

--USE KeysDemoDb;

CREATE TABLE CountriesTbl
	(
		ID int		PRIMARY KEY NOT NULL,
		[Name] nvarchar(100),
		[Population] int
	)

CREATE TABLE CitiesTbl
(
		ID int			PRIMARY KEY NOT NULL,
		CountryId int	FOREIGN KEY REFERENCES CountriesTbl(Id),
		[Name] nvarchar(100),
		[Population] int
);

SELECT * FROM CitiesTbl;
SELECT * FROM CountriesTbl;

INSERT INTO CountriesTbl (ID, [Name], [Population]) VALUES (1, 'Sweden', 10);
INSERT INTO CountriesTbl (ID, [Name], [Population]) VALUES (2, 'Denmark', 7);
INSERT INTO CountriesTbl (ID, [Name], [Population]) VALUES (3, 'Finland', 6);
INSERT INTO CountriesTbl (ID, [Name], [Population]) VALUES (4, 'Norway', 5);
INSERT INTO CountriesTbl (ID, [Name], [Population]) VALUES (5, 'Iceland', 1);

INSERT INTO CitiesTbl (ID, CountryId, [Name], [Population]) VALUES (1, 1, 'Gothenburg', 500000);
INSERT INTO CitiesTbl (ID, CountryId, [Name], [Population]) VALUES (2, 1, 'Trosa', 12000);
INSERT INTO CitiesTbl (ID, CountryId, [Name], [Population]) VALUES (3, 2, 'Aarhus', 40000);
INSERT INTO CitiesTbl (ID, CountryId, [Name], [Population]) VALUES (4, 2, 'Kerteminde', 500000);
INSERT INTO CitiesTbl (ID, CountryId, [Name], [Population]) VALUES (5, 3, 'Vaasa', 500000);
INSERT INTO CitiesTbl (ID, CountryId, [Name], [Population]) VALUES (6, 3, 'Loviisa', 500000);
INSERT INTO CitiesTbl (ID, CountryId, [Name], [Population]) VALUES (7, 4, 'Bergen', 500000);
INSERT INTO CitiesTbl (ID, CountryId, [Name], [Population]) VALUES (8, 5, 'Reykjavik', 500000);


DROP TABLE CitiesTbl;
DROP TABLE CountriesTbl;
