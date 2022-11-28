USE everyloop;

-- Ta ut data (select) från tabellen GameOfThrones på sådant sätt att ni får ut en 
--kolumn ’Title’ med titeln samt en kolumn ’Episode’ som visar episoder och säsonger
-- i formatet ”S01E01”, ”S01E02”, osv. Tips: kolla upp funktionen format()
--SELECT * into GameOfThrones2 from GameOfThrones;
--SELECT Title
--	,FORMAT (Season, ('S0#')) + FORMAT (EpisodeInSeason, ('\E00')) AS 'Episode'
--FROM GameOfThrones2;

--Uppdatera (kopia på) tabellen user och sätt username för alla användare så den blir de 2 första bokstäverna i förnamnet, 
--och de 2 första i efternamnet (istället för 3+3 som det är i orginalet). Hela användarnamnet ska vara i små bokstäver.

--SELECT * INTO Users2 FROM Users;
--SELECT * FROM Users2;

--UPDATE Users2
--SET UserName=(LOWER(SUBSTRING(FirstName, 1, 2)) + LOWER(SUBSTRING(LastName, 1, 2)));

--Uppdatera (kopia på) tabellen airports så att alla null-värden 
--i kolumnerna Time och DST byts ut mot ’-’
--SELECT * INTO Airports2 FROM Airports;
--SELECT * FROM Airports2;

--UPDATE Airports2
--SET [Time] = '-'
--WHERE [Time] IS NULL;

--Ta bort de rader från (kopia på) tabellen Elements där ”Name” 
--är någon av följande: 'Erbium', 'Helium', 'Nitrogen', 'Platinum', 
--'Selenium', samt alla rader där ”Name” 
--börjar på någon av bokstäverna d, k, m, o, eller u.

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



--Skapa en ny tabell med alla rader från tabellen Elements. 
--Den nya tabellen ska innehålla ”Symbol” och ”Name” från orginalet, 
--samt en tredje kolumn med värdet ’Yes’ för de rader där ”Name” börjar 
--med bokstäverna i ”Symbol”, och ’No’ för de rader där de inte gör det.
--Ex: ’He’ -> ’Helium’ -> ’Yes’, ’Mg’ -> ’Magnesium’ -> ’No’.

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

--Kopiera tabellen Colors till Colors2, men skippa kolumnen ”Code”. 
--Gör sedan en select från Colors2 som ger samma resultat som du 
--skulle fått från select * from Colors; 
--(Dvs, återskapa den saknade kolumnen från RGBvärdena i resultatet).

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

--Kopiera kolumnerna ”Integer” och ”String” från tabellen ”Types” 
--till en ny tabell. Gör sedan en select från den nya 
--tabellen som ger samma resultat som du skulle fått från select * from 
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

