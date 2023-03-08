CREATE TABLE gatunek
(
  id serial NOT NULL,
  nazwa character varying(15) NOT NULL,
  CONSTRAINT gatunek_pkey PRIMARY KEY (id)
);

CREATE TABLE kat_wiekowa
(
  id serial NOT NULL,
  kategoria character varying(15) NOT NULL,
  CONSTRAINT kat_wiekowa_pkey PRIMARY KEY (id)
);

  CREATE TABLE statusy
(
  id serial NOT NULL,
  opis character varying(15) NOT NULL,
  CONSTRAINT statusy_pkey PRIMARY KEY (id)
);
  
  CREATE TABLE filmy
(
  id serial NOT NULL,
  tytul character varying(150) NOT NULL,
  gatunek integer NOT NULL,
  kat_wiekowa integer NOT NULL,
  rok_wydania integer,
  cena integer,
  CONSTRAINT filmy_pkey PRIMARY KEY (id),
  CONSTRAINT fk_filmy_gatunek FOREIGN KEY (gatunek)
      REFERENCES gatunek (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_filmy_kat_wiekowa FOREIGN KEY (kat_wiekowa)
      REFERENCES kat_wiekowa (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE klienci
(
  id serial NOT NULL,
  imie character varying(150) NOT NULL,
  nazwisko character varying(150) NOT NULL,
  telefon integer NOT NULL,
  email character varying(150),
  CONSTRAINT klienci_pkey PRIMARY KEY (id)
);

CREATE TABLE zamowienia
(
  id serial NOT NULL,
  klient integer NOT NULL,
  film integer NOT NULL,
  status integer,
  data_wypozyczenia timestamp(2) without time zone,
  termin_oddania timestamp(2) without time zone,
  data_oddania timestamp(2) without time zone,
  doplata integer,	
  CONSTRAINT zamowienia_pkey PRIMARY KEY (id),
  CONSTRAINT fk_zamowienia_filmy FOREIGN KEY (film)
      REFERENCES filmy (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_zamowienia_statusy FOREIGN KEY (status)
      REFERENCES statusy (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_zamowienia_klienci FOREIGN KEY (klient)
      REFERENCES klienci (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

insert into gatunek (nazwa) values ('Horror');
insert into gatunek (nazwa) values ('Akcja');
insert into gatunek (nazwa) values ('Komedia');
insert into gatunek (nazwa) values ('Romans');
insert into gatunek (nazwa) values ('Thriller');
insert into gatunek (nazwa) values ('Kryminał');
insert into gatunek (nazwa) values ('Animowany');
insert into gatunek (nazwa) values ('Katastroficzny');
insert into gatunek (nazwa) values ('Dokument');
insert into gatunek (nazwa) values ('Przygodowy');
insert into gatunek (nazwa) values ('Dramat');

insert into statusy (opis) values('Rezerwacja');
insert into statusy (opis) values('Wypozyczone');
insert into statusy (opis) values('Przetrzymane');
insert into statusy (opis) values('Oddane');

insert into kat_wiekowa (kategoria) values('+7');
insert into kat_wiekowa (kategoria) values('+12');
insert into kat_wiekowa (kategoria) values('+16');
insert into kat_wiekowa (kategoria) values('+18');

commit;

insert into filmy (tytul, gatunek, kat_wiekowa, rok_wydania, cena) values('Forrest Gump','11','2','1994','10');
insert into filmy (tytul, gatunek, kat_wiekowa, rok_wydania, cena) values('Matrix','2','2','1999','12');
insert into filmy (tytul, gatunek, kat_wiekowa, rok_wydania, cena) values('Shrek','7','1','2001','8');
insert into filmy (tytul, gatunek, kat_wiekowa, rok_wydania, cena) values('Frozen','7','1','2013','8');
insert into filmy (tytul, gatunek, kat_wiekowa, rok_wydania, cena) values('Titanic','4','2','1997','10');
insert into filmy (tytul, gatunek, kat_wiekowa, rok_wydania, cena) values('Incepcja','5','2','2010','12');
insert into filmy (tytul, gatunek, kat_wiekowa, rok_wydania, cena) values('Kac Vegas','3','3','2009','10');
insert into filmy (tytul, gatunek, kat_wiekowa, rok_wydania, cena) values('Piraci z Karaibów','10','2','2003','10');
insert into filmy (tytul, gatunek, kat_wiekowa, rok_wydania, cena) values('The Shining','1','3','1980','8');
insert into filmy (tytul, gatunek, kat_wiekowa, rok_wydania, cena) values('Godzilla','8','2','2014','12');
insert into filmy (tytul, gatunek, kat_wiekowa, rok_wydania, cena) values('Leon zawodowiec','6','2','1994','8');

insert into klienci (imie, nazwisko, telefon, email) values('Adrian', 'Wasilewski','098233645','a_wasilewski@gmail.com');
insert into klienci (imie, nazwisko, telefon, email) values('Rafał','Madej','663923044','r_madej@gmail.com');
insert into klienci (imie, nazwisko, telefon, email) values('Lena','Szewczyk','020383847','l_szewczyk@wp.pl');
insert into klienci (imie, nazwisko, telefon, email) values('Kornelia','Wójtowicz','000444263','k_wojtowicz@o2.pl');
insert into klienci (imie, nazwisko, telefon, email) values('Andrzej', 'Chojnacki','923334753','a_chojnacki@gmail.com');
insert into klienci (imie, nazwisko, telefon, email) values('Aleksandra','Michalska','525747433','a_michalska@o2.pl');
insert into klienci (imie, nazwisko, telefon, email) values('Marta','Jankowska','57532456','m_jankowska@gmail.com');
insert into klienci (imie, nazwisko, telefon, email) values('Cezary','Jankowski','555031000','c_jankowski@wp.pl');
insert into klienci (imie, nazwisko, telefon, email) values('Wiktoria','Zielińska','666333789','w_zielinska@gmail.com');
insert into klienci (imie, nazwisko, telefon, email) values('Piotr','Witkowski','632000321','p_witkowski@gmail.com');

insert into zamowienia (klient, film, status, data_wypozyczenia, termin_oddania, data_oddania, doplata)
values('2','2','4','2016-11-05','2016-12-05','2016-11-22',null);
insert into zamowienia (klient, film, status, data_wypozyczenia, termin_oddania, data_oddania, doplata)
values('5','4','3','2017-12-25','2018-01-25','2018-02-10','10');
insert into zamowienia (klient, film, status, data_wypozyczenia, termin_oddania, data_oddania, doplata)
values('1','1','4','2018-01-05','2018-02-05','2018-11-22',null);
insert into zamowienia (klient, film, status, data_wypozyczenia, termin_oddania, data_oddania, doplata)
values('7','5','1','2022-06-06','2021-07-06',null,null);
insert into zamowienia (klient, film, status, data_wypozyczenia, termin_oddania, data_oddania, doplata)
values('9','3','4','2018-04-01','2018-05-01','2018-05-01',null);
insert into zamowienia (klient, film, status, data_wypozyczenia, termin_oddania, data_oddania, doplata)
values('10','4','4','2019-11-05','2019-12-05','2019-11-23',null);
insert into zamowienia (klient, film, status, data_wypozyczenia, termin_oddania, data_oddania, doplata)
values('8','8','4','2019-01-02','2019-02-02','2019-01-22',null);
insert into zamowienia (klient, film, status, data_wypozyczenia, termin_oddania, data_oddania, doplata)
values('3','6','2','2022-06-21','2022-07-21',null,null);
insert into zamowienia (klient, film, status, data_wypozyczenia, termin_oddania, data_oddania, doplata)
values('4','7','4','2020-11-04','2020-12-04','2020-11-25',null);
insert into zamowienia (klient, film, status, data_wypozyczenia, termin_oddania, data_oddania, doplata)
values('6','9','4','2016-03-05','2016-04-05','2016-04-02',null);
insert into zamowienia (klient, film, status, data_wypozyczenia, termin_oddania, data_oddania, doplata)
values('2','10','1','2022-07-10','2022-08-10',null,null);
insert into zamowienia (klient, film, status, data_wypozyczenia, termin_oddania, data_oddania, doplata)
values('6','11','3','2018-12-05','2019-01-05','2019-02-28','20');
insert into zamowienia (klient, film, status, data_wypozyczenia, termin_oddania, data_oddania, doplata)
values('7','10','4','2017-01-29','2017-03-01','2017-02-22',null);

commit;

CREATE OR REPLACE VIEW "v_filmy" ("Tytul", "Gatunek", "Rok wydania", "Kategoria wiekowa", "Cena [PLN]") AS 
  select f.tytul, g.nazwa as Gatunek, f.rok_wydania, kw.kategoria as "Kategoria wiekowa", f.cena
from filmy f, gatunek g, kat_wiekowa kw
where f.gatunek=g.id
and f.kat_wiekowa=kw.id;

CREATE OR REPLACE VIEW "v_filmy_dla_dzieci" ("Tytul", "Gatunek", "Rok wydania", "Cena [PLN]") AS 
  select f.tytul, g.nazwa as Gatunek, f.rok_wydania, f.cena
from filmy f, gatunek g, kat_wiekowa kw
where f.gatunek=g.id
and f.kat_wiekowa=kw.id
and kw.kategoria='+7'

CREATE OR REPLACE VIEW "v_zamowienia" ("Imię i nazwisko", "Film", "Status", "Data wypozyczenia", "Termin oddania", "Data oddania", "Doplata") AS 
  select CONCAT(k.imie, ' ', k.nazwisko) as "Imię i nazwisko", f.tytul, s.opis as Status, z.data_wypozyczenia, z.termin_oddania, z.data_oddania, z.doplata
from filmy f, zamowienia z, klienci k, statusy s
where z.film=f.id
and z.klient=k.id
and z.status=s.id;

CREATE OR REPLACE VIEW "v_zamowienia_przetrzymane" ("Imię i nazwisko", "Film", "Status", "Data wypozyczenia", "Termin oddania", "Data oddania", "Doplata") AS 
  select CONCAT(k.imie, ' ', k.nazwisko) as "Imię i nazwisko", f.tytul, s.opis as Status, z.data_wypozyczenia, z.termin_oddania, z.data_oddania, z.doplata
from filmy f, zamowienia z, klienci k, statusy s
where z.film=f.id
and z.klient=k.id
and z.status=s.id
and s.opis='Przetrzymane';

--select * from v_filmy
--select * from v_filmy_dla_dzieci
--select * from v_zamowienia
--select * from v_zamowienia_przetrzymane
