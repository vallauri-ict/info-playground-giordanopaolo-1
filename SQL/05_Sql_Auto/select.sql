SELECT targa, marca
FROM Auto where Cilindrata > 2000 and potenza > 120

SELECT p.Nome, a.Targa
FROM Auto a, Proprietari p
where Cilindrata > 2000 and potenza > 120and p.CodF=a.CodF

SELECT a.Targa, p.Nome
FROM Auto a, Proprietari p, Assicurazioni ass
WHERE (Cilindrata > 2000 or potenza > 120)and ass.Nome='SARA' and p.CodF=a.CodF and ass.CodAss=a.CodAss

SELECT a.Targa, p.Nome
FROM auto a, Proprietari p,Sinistro s, Assicurazioni ass, Autocoinvolte au
WHERE a.CodAss=ass.CodAss and p.CodF=a.CodF and au.CodS=s.CodS and au.Targa=a.Targa and ass.Nome='SARA' and s.Giorno='20/01/2002'

SELECT ass.Sede, ass.Nome, count(*)
FROM auto a, Assicurazioni ass
WHERE a.CodAss=ass.CodAss group by ass.Sede,ass.Nome

/*6*/
SELECT a.Targa, count(*)
FROM auto a, Autocoinvolte ass, Sinistro s
WHERE a.Marca='Fiat'and a.Targa=ass.Targa and s.CodS=ass.CodS group by ass.Targa
