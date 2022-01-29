CREATE TRIGGER nuovaAuto
	ON [dbo].[Table]
	instead of INSERT
	AS BEGIN
		DECLARE @targa varchar(50)
		DECLARE @cilindrata int
		DECLARE @prezzo int
		DECLARE @modello varchar(50)
		DECLARE @colore varchar(50)
		DECLARE @marca varchar(50)
		DECLARE @alimentazione varchar(50)
		DECLARE @idProp int

		SET @targa = (SELECT targa FROM INSERTED)
		SET @cilindrata = (SELECT cilindrata FROM INSERTED)
		SET @prezzo = (SELECT prezzo FROM INSERTED)
		SET @modello = (SELECT modello FROM INSERTED)
		SET @colore = (SELECT colore FROM INSERTED)
		SET @marca = (SELECT marca FROM INSERTED)
		SET @alimentazione = (SELECT alimentazione FROM INSERTED)
		SET @idProp = (SELECT idProp FROM INSERTED)

		IF(@cilindrata < 900)
			SET @cilindrata = 900;
		IF(@cilindrata > 4500)
			SET @cilindrata = 4500;
		
		INSERT INTO [dbo].[Table]
			VALUES(@targa, @cilindrata, @prezzo, @modello, @colore, @marca, @alimentazione, @idProp)


	END
