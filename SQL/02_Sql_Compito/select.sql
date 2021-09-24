/*1 - Citta in cui si può partire per Roma*/
SELECT DISTINCT CittaPart from Volo where CittaArr = 'Roma' ORDER BY CittaPart

/*2 - AEREOPORTI IN CUI NON È NOTO IL NUMERO DI PISTE */
SELECT Citta, Nazione FROM Aereoporto WHERE NumPiste IS NULL ORDER BY Nazione,Citta

/*3 - PER OGNI VOLO MISTO(SIA MERCI CHE PASSEGGERI) DAMMI IL CODICE VOLO E  DATI DI TRASPOSTO*/
SELECT A.TipoAereo, V.IdVolo FROM Aereo A, Volo V WHERE V.TipoAereo = A.TipoAereo AND A.TipoAereo = 'misto'