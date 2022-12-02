create database b1;

CREATE TABLE OGRENCILER1
(
	ogrenci_no char(7),
	isim varchar(20),
	soyisim varchar(25),
	not_ort real,
	kayit_tarih date
);

CREATE TABLE OGR_NOTORT
AS SELECT isim,soyisim,not_ort 
FROM ogrenciler;

--DML--INSERT ILE VERI EKLE
INSERT INTO ogrenciler1 VALUES ('12345','SAID','ILHAN',85.3,now());
INSERT INTO OGRENCILER1 VALUES ('12045','ALI','ILHAN',85.3,now());
INSERT INTO OGRENCILER1 (ogrenci_no,isim,soyisim)values('123456','gul','yalcin');

--DQL DATA QUERY LANG
SELECT * FROM OGRENCILER1;






