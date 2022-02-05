BEGIN TRANSACTION tr

	Insert into [Table] values ('Neri',3500.00)
	SAVE TRANSACTION Punto1

	Insert into [Table] values ('Viola',2300.00)
	SAVE TRANSACTION Punto2

	Select * from [Table]

	Insert into [Table] values ('Marrone',1000.00)
	SAVE TRANSACTION Punto3

	Select * from [Table]
	ROLLBACK TRANSACTION Punto2

	Select * from [Table]

COMMIT;

EXEC Bonifico 100,1,2
