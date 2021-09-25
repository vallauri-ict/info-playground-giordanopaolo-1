/*2*/
SELECT Titolo FROM Film
WHERE Regista='Fellini' AND AnnoProduzione>1960

/*3*/
SELECT Titolo, Durata FROM Film
WHERE Nazionalita='JP' OR (Nazionalita='FR' AND AnnoProduzione>1990)

/*4*/
SELECT Titolo FROM Film
WHERE Nazionalita='FR' OR (Nazionalita='JP' AND Nazionalita>1990)

/*5*/
SELECT f.Titolo FROM Film f
WHERE f.Regista=(SELECT f1.Regista FROM Film f1 WHERE f1.Titolo='Casablanca')

/*6*/
SELECT DISTINCT f.Titolo,f.Genere
FROM Film f, Proiezione p
WHERE f.CodFilm=p.CodFilm AND P.DataProiezione='25/12/2004'

/*7*/
SELECT f.Titolo,f.Genere
FROM Film f, Sale s, Proiezione p
WHERE F.CodFilm=P.CodFilm AND S.CodSala=P.CodSala AND S.Citta='Napoli'

/*8*/
SELECT DISTINCT s.Nome 
FROM Sale s, Proiezione p, Attori a, Recita r
WHERE s.Citta='Napoli' AND S.CodSala=P.CodSala AND P.DataProiezione='25/12/2004' AND a.CodAttore=r.CodAttore AND a.Nome='William' AND r.CodFilm=p.CodFilm

/*9 - Il titolo dei film in cui recita M. Mastroianni oppure S.Loren*/
SELECT DISTINCT  F.Titolo
FROM Film f, Attori a, Recita r
WHERE f.CodFilm=r.CodFilm AND a.CodAttore=R.CodAttore AND (a.Nome IN('Mastroianni', 'Loren'))

/*10 - Il titolo dei film in cui recitano M. Mastroianni e S.Loren*/
SELECT *
FROM Attori A, Film F, Recita R
WHERE R.CodFilm=F.CodFilm AND A.CodAttore=R.CodAttore AND A.Nome='Loren' AND F.CodFilm IN 
(SELECT F.CodFilm FROM Attori A, Film F, Recita R
WHERE R.CodFilm=F.CodFilm AND A.CodAttore=R.CodAttore AND A.Nome='Mastroianni')

/*12 - Per ogni film che è stato proiettato a Pisa nel gennaio 2005, il titolo del film e il nome della sala.*/
SELECT F.Titolo,S.Nome FROM Film F, Sale S,Proiezione P
WHERE F.CodFilm=P.CodFilm AND P.CodSala=S.CodSala AND S.Citta='Pisa' AND P.DataProiezione BETWEEN '01/01/2005' AND '31/01/2005'