--Declaring a cursor
DECLARE FilmCursor CURSOR
	FOR SELECT FilmID,FilmName,FilmReleaseDate FROM tblFilm

OPEN FilmCursor
	FETCH NEXT FROM FilmCursor	

	WHILE @@FETCH_STATUS = 0 
		FETCH NEXT FROM FilmCursor	

CLOSE FilmCursor
DEALLOCATE FilmCursor


--Going through backwards

DECLARE FilmCursor CURSOR SCROLL
	FOR SELECT FilmID,FilmName,FilmReleaseDate FROM tblFilm

OPEN FilmCursor
	FETCH LAST FROM FilmCursor	

	WHILE @@FETCH_STATUS = 0 
		FETCH PRIOR FROM FilmCursor	

CLOSE FilmCursor
DEALLOCATE FilmCursor

--Moving a Cursor Non-sequantially

DECLARE FilmCursor CURSOR SCROLL
	FOR SELECT FilmID,FilmName,FilmReleaseDate FROM tblFilm

OPEN FilmCursor
	FETCH ABSOLUTE 10 FROM FilmCursor	

	WHILE @@FETCH_STATUS = 0 
		FETCH RELATIVE 10 FROM FilmCursor	

CLOSE FilmCursor
DEALLOCATE FilmCursor

--backwards
DECLARE FilmCursor CURSOR SCROLL
	FOR SELECT FilmID,FilmName,FilmReleaseDate FROM tblFilm

OPEN FilmCursor
	FETCH ABSOLUTE -10 FROM FilmCursor	

	WHILE @@FETCH_STATUS = 0 
		FETCH RELATIVE -10 FROM FilmCursor	

CLOSE FilmCursor
DEALLOCATE FilmCursor

--Reading Values into Variables
