CREATE PROCEDURE [dbo].[Bonifico]
	@importo float = 0,
	@contoSorgente int,
	@contoDestinazione int
AS
	if(@contoDestinazione=@contoSorgente)
		return -2;
	BEGIN TRANSACTION
	INSERT INTO Movimenti(Importo,data,Tipo,CdConto)
		VALUES(@importo,GETDATE(),'P',@contoSorgente)
	if(@@ERROR<>0)
		BEGIN
			ROLLBACK
				RAISERROR('Errore durante il prelievo',16,1)
				return -1;
		END
	INSERT INTO Movimenti(Importo,data,Tipo,CdConto)
	VALUES(@importo,GETDATE(),'V',@contoDestinazione)

	if(@@ERROR<>0)
	BEGIN
		ROLLBACK
		RAISERROR('Errore durante il versamento',16,2)
		return -1;
	END
	-- STEP 4: If we reach this point, the commands completed successfully
	COMMIT
RETURN 0
