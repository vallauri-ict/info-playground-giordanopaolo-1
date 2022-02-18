CREATE PROCEDURE [dbo].[Procedure]
	@Classe Varchar(3)
AS
	SELECT * From studenti s where s.classe=@Classe
	SELECT TOP 1 s.Nome, s.cognome, s.telefono From studenti s where s.classe=@Classe order by s.età ASC
RETURN 0
