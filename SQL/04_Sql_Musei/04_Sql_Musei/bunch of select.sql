/*10*/
Select * from Musei m
where m.Citta='London'
and not exists (SELECT * from Opere o
where o.NomeM=m.NomeM and o.NomeA<>'Tiziano')
/*11*/
Select a.NomeA, COUNT(*)as NOPere from Musei m,Artisti a, Opere o
where o.NomeM='galleria degli uffizi' GROUP by a.NomeA

/*12*/
select m.NomeM from Musei m, Artisti a, Opere o
where a.NomeA=o.NomeA and o.NomeA=a.NomeA and a.Nazionalita='italiano' 
group by o.NomeM having count(*)>19

/*13*/
SELECT * from Personaggi p, Artisti a, Opere o
where a.NomeA=o.NomeA and o.Codice=p.Personaggio and a.Nazionalita='italiano' and o.Codice not in(select p.Codice from Personaggi p)

/*14*/
SELECT m.NomeM from Musei m, Artisti a, Opere o
where o.NomeA=a.NomeA and exists (select * from Musei m where m.NomeM=o.NomeM and a.Nazionalita<>'italiano' and o.NomeA='Tiziano')

/*15*/
SELECT distinct m.NomeM, a.Nazionalita, COUNT(*) from Musei m, Artisti a, Opere o
where m.NomeM=o.NomeM and o.NomeA=a.NomeA 
group by m.NomeM, a.Nazionalita