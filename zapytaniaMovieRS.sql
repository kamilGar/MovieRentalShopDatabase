SELECT CONCAT(k.imie, ' ', k.nazwisko) AS "Imię i nazwisko", f.tytul AS "Tytuł", s.opis AS Status,
z.data_wypozyczenia AS "Data wypożyczenia", z.termin_oddania AS "Termin oddania", 
z.data_oddania AS "Data oddania", z.doplata AS "Dopłata [PLN]"
FROM filmy f, zamowienia z, klienci k, statusy s
WHERE z.film=f.id
AND z.klient=k.id
AND z.status=s.id
AND s.opis='Oddane'
ORDER BY k.imie;

SELECT ROUND(AVG(cena), 2) AS "Średni koszt wypożyczenia filmu [PLN]", COUNT(*) AS "Liczba filmów w bazie"
FROM filmy;

INSERT INTO zamowienia (klient, film, status, data_wypozyczenia, termin_oddania, data_oddania, doplata)
VALUES('5','10','2','2022-06-25','2022-07-25',null,null);

INSERT INTO filmy (tytul, gatunek, kat_wiekowa, rok_wydania, cena) VALUES('Egzorcysta','1','3','1973','8');
INSERT INTO filmy (tytul, gatunek, kat_wiekowa, rok_wydania, cena) VALUES('The Thing','1','3','1982','10');

UPDATE klienci 
SET telefon='923662111'
WHERE UPPER(imie) = UPPER('Andrzej') and UPPER(nazwisko) = UPPER('Chojnacki') 

UPDATE klienci 
SET email='a_michalska@gmail.com'
WHERE UPPER(imie) = UPPER('Aleksandra') and UPPER(nazwisko) = UPPER('Michalska') 

