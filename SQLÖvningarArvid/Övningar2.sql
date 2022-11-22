USE everyloop;

--SELECT DISTINCT ProductName FROM 
--		company.products
--	JOIN company.orders on company.products.Id = company.orders.ProductId
--	JOIN company.order_details on company.order_details.OrderId = company.orders.Id 
--	WHERE company.orders.ShipCity LIKE 'London'

--SELECT ShipCity, COUNT(DISTINCT ProductId) as [count] FROM 
--		company.orders
--	JOIN company.order_details on company.orders.Id = company.order_details.OrderId
--	JOIN company.products on ProductID = products.Id
--	GROUP BY ShipCity
--	ORDER BY [count] desc
--	--Till vilken stad har vi levererat flest unika produkter?
--	--Svar: Boise

--Av de produkter som inte längre finns I vårat sortiment, hur mycket har vi sålt för totalt till Tyskland?
-- 12047,50 SEK

--SELECT * FROM company.products

--SELECT ShipCountry, SUM(order_details.UnitPrice*order_details.Quantity) as TotalSoldAmount FROM 
--		company.orders
--		JOIN company.order_details on orders.Id = order_details.OrderId
--		JOIN company.products on order_details.ProductId = products.Id
--		WHERE products.Discontinued = 1
--		AND ShipCountry LIKE 'Germany'
--		GROUP BY ShipCountry

--4. För vilken produktkategori har vi högst lagervärde?
--Seafood

--SELECT CategoryName, SUM(UnitsInStock) AS Lagersaldo
--		FROM company.categories
--		JOIN company.products on categories.Id = products.CategoryId
--		GROUP BY CategoryName
--		ORDER BY Lagersaldo DESC

--5. Från vilken leverantör har vi sålt flest produkter totalt under sommaren 2013?
--Plutzer Lebensmittel[...]

--SELECT * FROM company.orders

--SELECT CompanyName, SUM (Quantity) AS SoldProducts FROM 
--	company.suppliers
--	JOIN company.products on suppliers.Id = SupplierId
--	JOIN company.order_details on products.Id = ProductId
--	JOIN company.orders on order_details.OrderId = orders.Id
--	WHERE orders.OrderDate >= '2013-06-01'
--	AND orders.OrderDate <= '2013-08-31'
--	GROUP BY CompanyName
--	ORDER BY SoldProducts DESC
	
	
	SELECT * FROM music.tracks

--Skriv sedan en select-sats som tar ut alla låtar från den lista som angivits i @playlist efter följande exempel:

--DECLARE @playlist VARCHAR(max) = 'Heavy Metal Classic';
--SELECT 
--	music.genres.[Name] AS Genre
--	, music.artists.[Name] AS Artist
--	, music.albums.Title AS Album
--	, music.tracks.[Name] AS Track
--	, music.tracks.Milliseconds/1000 AS [Length]
--	, music.tracks.Bytes/1000000 AS [Size]
--	, music.tracks.Composer FROM 
--	music.playlists
--	JOIN music.playlist_track on playlists.PlaylistId = playlist_track.PlaylistId
--	JOIN music.tracks on playlist_track.TrackId = tracks.TrackId
--	JOIN music.genres on tracks.GenreId = genres.GenreId
--	JOIN music.albums on tracks.AlbumId = albums.AlbumId
--	JOIN music.artists on albums.ArtistId = artists.ArtistId
--	WHERE playlists.[Name] LIKE @playlist

select * FROM music.media_types

--SELECT music.artists.Name AS Artist, SUM(music.tracks.Milliseconds) AS [TotalLength] FROM
--	music.tracks
--	JOIN music.media_types on tracks.MediaTypeId = media_types.MediaTypeId
--	JOIN music.albums on tracks.AlbumId = albums.AlbumId
--	JOIN music.artists on albums.ArtistId = artists.ArtistId
--	WHERE media_types.MediaTypeId != '3'
--	GROUP BY artists.Name
--	ORDER BY TotalLength DESC

--SELECT music.artists.Name AS Artist, AVG(music.tracks.Milliseconds) AS [AvgLength] FROM
--	music.tracks
--	JOIN music.albums on tracks.AlbumId = albums.AlbumId
--	JOIN music.artists on albums.ArtistId = artists.ArtistId
--	WHERE music.artists.Name LIKE 'Iron Maiden'
--	Group by artists.Name

--SELECT SUM(CAST(music.tracks.Bytes AS bigint)/1000000) AS TotalSize FROM 
--	music.tracks
--	JOIN music.media_types on tracks.MediaTypeId = media_types.MediaTypeId
--	WHERE media_types.MediaTypeId = 3


	


	
	