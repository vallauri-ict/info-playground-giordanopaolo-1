/* 1 - Selezionare nome e il salario degli impiegati con più di 50 anni */
SELECT nome, salario FROM Impiegato
where eta>50

/* 2 - Le informazioni di acquisti di item 2*/
Select * from Acquisti
where item=2

/* 3 - nome titolo salariodei programmatori con salario > 1400*/
Select nome, titolo, salario from Impiegato
where titolo='Programmatore' and salario > 1400

/* 4 - nome di tutti i programmatori e analisti*/
Select nome from Impiegato
where titolo='Programmatore' or titolo='analista'

/* 5 - le diverse atà degli impiegati*/
select eta from Impiegato

/* 6 - stipendio medio degli impiegati*/
select AVG(salario)
from Impiegato

/* 7 - tutti i dati degli impiegati ordinati per salario dal maggiore al minore*/
select * from Impiegato
order by salario desc

/* 8 - tutti i dati degli impiegati ordinati per salario ed eta dal maggiore al minore*/
select * from Impiegato
order by salario desc, 
eta desc

/* 9 - tutti i dati degli specifici impiegati*/
select * from Impiegato
where nome in ('Pippo', 'Ciko')

/* 10 - tutti i dati degli specifici impiegati tranne alcuni specificati*/
select * from Impiegato
where nome not in ('Pippo', 'Ciko')

/* 11 - tutti i dati degli impiegati compresi tra 20 e 30*/
select * from Impiegato
where eta between 20 and 30

/* 12 - per ogni acquisto il nome del cliente e il prezzo del prodotto*/
select a.prezzo, c.nome from Acquisti a, Cliente c
where a.idCliente = c.IdCliente