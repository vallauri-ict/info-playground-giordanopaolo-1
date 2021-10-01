/*8 Per ciascun museo di Londra, il numero di opere di artisti italiani ivi conservate*/
SELECT m.NomeM,count(*) as NumeroOpere
FROM Artisti a,Opere o, Musei m
WHERE a.Nazionalità='italiano'
AND a.NomeA=o.NomeA AND m.NomeM=o.NomeM
AND m.Città='Londra'
GROUP BY m.NomeM

/*9 Il nome dei musei di londra che non hanno opere di Tiziano*/
SELECT m.NomeM
FROM Musei m
WHERE m.Città='Londra'
AND NOT EXISTS(SELECT * 
			   FROM Opere o 
			   WHERE o.NomeA='Tiziano'
			   AND o.NomeM=m.NomeM)  /*devo collegarmi alla query esterna*/

/*10 Il nome dei musei di londra che hanno opere di Tiziano*/
SELECT m.NomeM
FROM Musei m
WHERE m.Città='Londra'
AND EXISTS(SELECT * 
			   FROM Opere o 
			   WHERE o.NomeA='Tiziano'
			   AND o.NomeM=m.NomeM)

/*11*/
SELECT A.NomeA, COUNT(*) as NumeroOpere
FROM Artisti a, Musei m, Opere o
WHERE a.NomeM='Galleria degli uffizzi'
AND a.NomeA=o.NomeA AND m.NomeM=o.NomeM 
group by A.NomeA

/*13*/
SELECT a.NomeA, o.Titolo
FROM Artisti a, Personaggi p, Opere o
WHERE a.Nazionalita='italiano'
AND p.Personaggio = null
AND p.Codice=o.Codice AND a.NomeA=o.NomeA 

/*14*/
SELECT m.NomeM
FROM Musei m
WHERE m.Città='Londra'
AND EXISTS(SELECT * 
			   FROM Opere o , Artisti a
			   WHERE (o.NomeA='Tiziano' or a.Nazionalita <> 'italiano')
			   AND o.NomeM=m.NomeM)

/*15*/