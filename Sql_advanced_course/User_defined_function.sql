USE Movies
GO

ALTER FUNCTION longdate
(
	@FullDate AS DATETIME
)
RETURNS VARCHAR(MAX)
AS 
BEGIN
	RETURN
		
		DATENAME(DW,@FullDate) +' ' +
		DATENAME(D,@FullDate) +
		CASE
			WHEN DAY(@FullDate) IN (1,21,31) THEN 'st'
			WHEN DAY(@FullDate) IN (2,22) THEN 'nd'
			WHEN DAY(@FullDate) IN (3,23) THEN 'rd'
		ELSE 'th'


		END +' '+
		
		DATENAME(M,@FullDate) + ' '+
		DATENAME(YY,@FullDate) + ' '

	

END