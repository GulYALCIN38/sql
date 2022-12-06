--- select sorguda exist te sadece tablo ismi farkli hersey ayni in de ise iki tablo 
--arasinda sadece ortak bir sutun var

-- ******************         ALIASES (sutun birlestirme)      *******************

-- iki sutunu birlestirmek....
CREATE TABLE calisanlar1 (
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);
INSERT INTO calisanlar1 VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO calisanlar1 VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO calisanlar1 VALUES(345678901, 'Mine Bulut','Izmir');
--1. YOL
select * from calisanlar1
select calisan_id as id ,calisan_isim||' '||calisan_dogdugu_sehir as calisan_bilgisi from calisanlar1;
-- iki sutunun verilerini birlestirmek icin concet || kullanirirz

--2. YOL
SELECT calisan_id AS id, concat(calisan_isim,' ' ,calisan_dogdugu_sehir)as calisan_bilgisi from calisanlar1;

-- ******************************** is null condition  *****************************
CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50), 
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul'); 
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara'); 
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir'); 
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');
select  * from insanlar
-- isim sutununda null olan degerleri listeleyelim

select isim from insanlar WHERE isim  IS NULL;

-- isim sutununda null olan record lari listeleyelim

select * from insanlar WHERE isim  IS not  NULL;
-- insanlar tablosunda null deger almis verileri  no name yapin

update insanlar
set isim  ='no name'
where  isim is null;
select * from insanlar;

-- ******************************** ORDER BY   *****************************


CREATE TABLE insanlar1
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar1 VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar1 VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO insanlar1 VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO insanlar1 VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar1 VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO insanlar1 VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

--SORU insanlar tablosundaki adresler alfabetik sirala

select *from insanlar1
 order by adres;

select *from insanlar1
 order by soyisim;
 
 -- insanlar tablosundaki ismi mine olanlari  ssn sirali getir
 select * from insanlar1
 where isim='Mine' 
 order by ssn;
 -- tablolardaki verileri siralamak icin orderby komutu kullanilir naturel veya buyukten kucuge olablir
--  buyukten kucuge siralamak icin order by DESC yazariz


--NOT : Order By komutundan sonra field ismi yerine field numarasi da kullanilabilir
--Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin

select *from insanlar1
where soyisim='Bulut'
ORDER BY 2; -- siralnmak istenen field in sutun no suda yazilabilir


--Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin
SELECT * FROM insanlar1

order by ssn desc;
-- Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali yapin

select * from insanlar1
order by isim asc ,soyisim desc; --asc naturel siralar yazmasakta olur asc yi

-- isim soyisim degerlerini kelime uzunkuklarina gore siralayin

select isim, soyisim from insanlar1
order by LENGTH (soyisim)desc;






