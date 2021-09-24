CREATE TABLE [dbo].[Volo] (
    IdVolo    int NOT NULL primary key identity,
    GiornoSett  VARCHAR (50) NULL,
    TipoAereo  VARCHAR (50) NULL,
    AraArr  VARCHAR (50) NULL,
    CittaArr  VARCHAR (50) NULL,
	OraPart  VARCHAR (50) NULL,
    CittaPart INT          NULL
);