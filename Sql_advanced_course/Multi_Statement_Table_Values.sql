USE Movies
GO

CREATE FUNCTION PeopleInYear
(
	@BirthYear INT,
	@Enddate INT
)
RETURNS @t TABLE
(
	PersonName VARCHAR(MAX),
	PersonDOB DATETIME,
	PersonJob VARCHAR(8)
)
AS 
BEGIN
	INSERT INTO @t
	SELECT
		DirectorName,
		DirectorDOB,
		'Director'
	FROM
		tblDirector
	WHERE
		YEAR(DirectorDOB) = @BirthYear
		