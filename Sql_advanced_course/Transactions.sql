-- Comditionally committing or rolling back

DECLARE @IronMan INT

BEGIN TRAN AddIronMan3

INSERT INTO TBLFILM (Filmname, FilmReleaseDate)
VALUES ('Iron Man 3', '2013-04-25')
 
SELECT @IronMan = COUNT(*) FROM TBLFILM WHERE FilmName = 'Iron Man 3'

IF @IronMan > 1
	BEGIN
		ROLLBACK TRAN AddIronMan3
		PRINT 'Iron Man is alreadt exist'
	END
ELSE
	BEGIN
		COMMIT TRAN AddIronMan3
		PRINT 'Iron Man 3 is added to database'
	END


--Using Error Handling
BEGIN TRY
	BEGIN TRAN AddIm

	INSERT INTO tblFilm(FilmName,FilmReleaseDate)
	VALUES ('Iron Man 3', '2013-04-25')

	UPDATE tblFilm
	SET	FilmDirectorID = 4
	WHERE FilmName = 'Iron Man 3'

	COMMIT TRAN AddIm
END TRY
BEGIN CATCH
	ROLLBACK TRAN AddIm
	PRINT 'Adding Iron Man 3 failed - chech the data type'
END CATCH

SELECT * FROM tblFilm WHERE FilmName = 'Iron Man 3'
 

--Nested Transactions basics
BEGIN TRAN Tran1

	PRINT @@TRANCOUNT

		SAVE TRAN Tran2
			
			PRINT @@TRANCOUNT

		COMMIT TRAN Tran2

		PRINT @@TRANCOUNT

COMMIT TRAN Tran1