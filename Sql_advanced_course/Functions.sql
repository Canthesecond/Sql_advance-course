SELECT
	FilmName,
	UPPER(FilmName) AS up_filmnames,
	DATENAME(M,FilmReleaseDate) AS released_month,
	DATENAME(DW,FilmReleaseDate) AS released_day,
	DATEDIFF(YYYY,FilmReleaseDate,GETDATE()) AS released_date_diff

FROM
	tblFilm