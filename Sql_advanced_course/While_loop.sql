DECLARE @Numfilms AS INT
DECLARE @Oscarwins AS INT
DECLARE @Counter AS INT

SET @Oscarwins = (SELECT MAX(FilmOscarWins) FROM tblFilm)
SET @Counter = 0

WHILE @Counter <= @Oscarwins
BEGIN
		SET @Numfilms=
		(SELECT COUNT(*) FROM tblFilm
		WHERE FilmOscarWins = @Counter)

	PRINT CAST(@Numfilms AS VARCHAR(3)) + ' have won' + CAST(@counter AS VARCHAR(2))
 + 'Oscars.'

 SET @Counter = @Counter + 1

END



-- Break the loop if the movie number is 0 

DECLARE @Numfilms AS INT
DECLARE @Oscarwins AS INT
DECLARE @Counter AS INT

SET @Oscarwins = (SELECT MAX(FilmOscarWins) FROM tblFilm)
SET @Counter = 0

WHILE @Counter <= @Oscarwins
BEGIN
		SET @Numfilms=
		(SELECT COUNT(*) FROM tblFilm WHERE FilmOscarWins = @Counter)
		IF @Numfilms = 0
		BREAK

	PRINT CAST(@Numfilms AS VARCHAR(3)) + ' have won' + CAST(@counter AS VARCHAR(2))
 + 'Oscars.'

 SET @Counter = @Counter + 1
END

