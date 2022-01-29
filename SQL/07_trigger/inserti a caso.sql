INSERT INTO [dbo].[Table]
			VALUES('AA111AA', 5, 20000, 'A3', 'Blu', 'AUDI', 'Elettrica', 1)
			
INSERT INTO [dbo].[Table]
			VALUES('BB222BB', 80000, 12000, 'A4', 'Rossa', 'Dacia', 'Legno', 2)

UPDATE [Table]
			SET prezzo = 20 WHERE targa='BB222BB'