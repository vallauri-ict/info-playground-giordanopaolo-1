Create table Proprietari(
	CodF int primary key identity(1,1),
	Nome varchar(50) not null,
	Residenza varchar(50) not null
)

Create table Assicurazioni(
	CodAss int primary key identity(1,1),
	Nome varchar(50) not null,
	Sede varchar(50) not null
)

Create table Auto(
	Targa varchar(7) primary key,
	Marca varchar(50) not null,
	Cilindrata int not null,
	Potenza int not null,
	CodF int FOREIGN KEY REFERENCES Proprietari(CodF),
	CodAss int FOREIGN KEY REFERENCES Assicurazioni(CodAss)
)



Create table Sinistro(
	CodS int primary key identity(1,1),
	Localita varchar(50) not null,
	Giorno date not null
)

Create table Autocoinvolte(
	CodS int FOREIGN KEY REFERENCES Sinistro(CodS),
	Targa varchar(7) FOREIGN KEY REFERENCES Auto(Targa),
	ImportoDelDanno int not null,
	primary key(CodS,Targa)
)