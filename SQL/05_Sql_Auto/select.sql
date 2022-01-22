/*1*/
SELECT targa, marca
FROM Auto where Cilindrata > 2000 and potenza > 120

/*2*/
SELECT p.Nome, a.Targa
FROM Auto a, Proprietari p
where Cilindrata > 2000 and potenza > 120and p.CodF=a.CodF

/*3*/
SELECT a.Targa, p.Nome
FROM Auto a, Proprietari p, Assicurazioni ass
WHERE (Cilindrata > 2000 or potenza > 120)and ass.Nome='SARA' and p.CodF=a.CodF and ass.CodAss=a.CodAss

/*4*/
SELECT a.Targa, p.Nome
FROM auto a, Proprietari p,Sinistro s, Assicurazioni ass, Autocoinvolte au
WHERE a.CodAss=ass.CodAss and p.CodF=a.CodF and au.CodS=s.CodS and au.Targa=a.Targa and ass.Nome='SARA' and s.Giorno='20/01/2002'

/*5*/
SELECT ass.Sede, ass.Nome, count(*)
FROM auto a, Assicurazioni ass
WHERE a.CodAss=ass.CodAss group by ass.Sede,ass.Nome

/*6*/
SELECT a.Targa, count(*)
FROM auto a, Autocoinvolte ass
WHERE a.Marca='Fiat'and a.Targa=ass.Targa group by ass.Targa

/*7*/
Select Au.Targa, A.Nome, sum(AC.ImportoDelDanno)
FROM AutoCoinvolte AC, Auto Au, Assicurazioni a
WHERE Au.Targa=AC.Targa and Au.CodAss=A.CodAss
GROUP BY Au,Targa, A.Nome
HAVING count(*) >1 

/*8*/
SELECT P.CodF, P.Nome
FROM Proprietari P, Auto A
WHERE P.CodF = A.CodF
GROUP BY P.CodF, P.Nome
HAVING count(*) >1

/*9*/
SELECT A.Targa
FROM Auto A
WHERE Not Exists ( SELECT *
FROM AutoCoinvolte AC, Sinistri S
WHERE A.Targa =AC.Targa and AC.CodS=S.CodS and S.data>'20/01/01')

 /*10*/
SELECT S.CodS
FROM Sinistri S
WHERE Not Exists ( SELECT *
FROM AutoCoinvolte AC, Auto A
WHERE A.Targa =AC.Targa and AC.CodS=S.CodS and A.Cilindrata<2000)