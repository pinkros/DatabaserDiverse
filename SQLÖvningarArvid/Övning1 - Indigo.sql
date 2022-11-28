USE everyloop;

-- Ta ut data (select) fr�n tabellen GameOfThrones p� s�dant s�tt att ni f�r ut en 
--kolumn �Title� med titeln samt en kolumn �Episode� som visar episoder och s�songer
-- i formatet �S01E01�, �S01E02�, osv. Tips: kolla upp funktionen format()
--SELECT * into GameOfThrones2 from GameOfThrones;
--SELECT Title
--	,FORMAT (Season, ('S0#')) + FORMAT (EpisodeInSeason, ('\E00')) AS 'Episode'
--FROM GameOfThrones2;

--Uppdatera (kopia p�) tabellen user och s�tt username f�r alla anv�ndare s� den blir de 2 f�rsta bokst�verna i f�rnamnet, 
--och de 2 f�rsta i efternamnet (ist�llet f�r 3+3 som det �r i orginalet). Hela anv�ndarnamnet ska vara i sm� bokst�ver.

--SELECT * INTO Users2 FROM Users;
--SELECT * FROM Users2;

--UPDATE Users2
--SET UserName=(LOWER(SUBSTRING(FirstName, 1, 2)) + LOWER(SUBSTRING(LastName, 1, 2)));

--Uppdatera (kopia p�) tabellen airports s� att alla null-v�rden 
--i kolumnerna Time och DST byts ut mot �-�
--SELECT * INTO Airports2 FROM Airports;
--SELECT * FROM Airports2;

--UPDATE Airports2
--SET [Time] = '-'
--WHERE [Time] IS NULL;

--Ta bort de rader fr�n (kopia p�) tabellen Elements d�r �Name� 
--�r n�gon av f�ljande: 'Erbium', 'Helium', 'Nitrogen', 'Platinum', 
--'Selenium', samt alla rader d�r �Name� 
--b�rjar p� n�gon av bokst�verna d, k, m, o, eller u.

--SELECT * INTO Elements2 FROM [Elements];

--SELECT * FROM Elements2;

--DELETE FROM Elements2 
--	WHERE [Name] = 'Erbium' 
--		OR [Name] = 'Helium' 
--		OR [Name] = 'Nitrogen' 
--		OR [Name] = 'Platinum' 
--		OR [Name] = 'Selenium'
--		OR [Name] LIKE 'd%'
--		OR [Name] LIKE 'k%'
--		OR [Name] LIKE 'm%'
--		OR [Name] LIKE 'o%'
--		OR [Name] LIKE 'u%';



--Skapa en ny tabell med alla rader fr�n tabellen Elements. 
--Den nya tabellen ska inneh�lla �Symbol� och �Name� fr�n orginalet, 
--samt en tredje kolumn med v�rdet �Yes� f�r de rader d�r �Name� b�rjar 
--med bokst�verna i �Symbol�, och �No� f�r de rader d�r de inte g�r det.
--Ex: �He� -> �Helium� -> �Yes�, �Mg� -> �Magnesium� -> �No�.

--SELECT Symbol, [Name] INTO Elements3 FROM [Elements];

--SELECT * FROM Elements3;

--ALTER TABLE Elements3
--ADD NameSybol varchar(3);

--UPDATE Elements3
--SET NameSybol = 'Yes'
--WHERE [Name] like Symbol + '%';

--UPDATE Elements3
--SET NameSybol = 'No'
--WHERE NameSybol IS NULL;

--Kopiera tabellen Colors till Colors2, men skippa kolumnen �Code�. 
--G�r sedan en select fr�n Colors2 som ger samma resultat som du 
--skulle f�tt fr�n select * from Colors; 
--(Dvs, �terskapa den saknade kolumnen fr�n RGBv�rdena i resultatet).

--SELECT * FROM Colors2;
----SELECT * INTO Colors2 FROM Colors;


----ALTER TABLE Colors2
----DROP COLUMN Code;

--ALTER TABLE Colors2
--ADD Code nvarchar(max);


--SELECT
--	[Name],
--	Red,
--	Green,
--	Blue,
--	CONVERT(VARBINARY(1),Red) + CONVERT(VARBINARY(1),Green) + CONVERT(VARBINARY(1),Blue)
--	 AS Code
--FROM Colors2;

--SELECT

--FROM Colors2;

--Kopiera kolumnerna �Integer� och �String� fr�n tabellen �Types� 
--till en ny tabell. G�r sedan en select fr�n den nya 
--tabellen som ger samma resultat som du skulle f�tt fr�n select * from 
--types;

--SELECT [Integer], String INTO Types2 FROM [Types];

--SELECT * FROM [Types];

--DECLARE @d DATETIME = '2018-12-31';
--DECLARE @h DATETIME = '09:00:00';
--SELECT 
--	[Integer], 
--	FORMAT ((CAST(([Integer]) AS FLOAT)/100), '0.##') as [Float]
--	,String
--	,CAST( DATEADD(day, [Integer], @d) + DATEADD(minute, [Integer], @h) AS datetime2(7)) AS [DateTime]
--	,[Integer]%2 AS [Bool]
--FROM Types2;

