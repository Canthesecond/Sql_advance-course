USE Movies
GO

DECLARE @NameList VARCHAR(MAX)
SET @NameList = ' '

SELECT
	@NameList= @NameList + ActorName + ', '  --+CHAR(10) TO LIST THEM ONE AFTER ANOTHER
											 -- +CHAR(13) TO LIST THEM ONE AFTER ANOTHER WITH THE BLANK	
FROM 
	tblActor

WHERE
ActorDOB >= 1970