Create table Musei(
	NomeM varchar(50) primary key,
	Citta varchar(50) not null
)

Create table Artisti(
	NomeA varchar(50) primary key,
	Nazionalita varchar(50) not null
)

Create table Opere(
	Codice int primary key,
	Titolo varchar(50) not null,
	NomeM varchar(50) FOREIGN KEY ([NomeM]) REFERENCES [Musei],
	NomeA varchar(50) FOREIGN KEY ([NomeA]) REFERENCES [Artisti]
)

Create table Personaggi(
	Personaggio varchar(50) primary key,
	Codice int FOREIGN KEY ([Codice]) REFERENCES [Opere]
)