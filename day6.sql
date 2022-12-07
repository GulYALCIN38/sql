

--*******************      JOIN     ********************


CREATE TABLE sirketler  
(
sirket_id int,  
sirket_isim varchar(20)
);
INSERT INTO sirketler VALUES(100, 'Toyota'); 
INSERT INTO sirketler VALUES(101, 'Honda'); 
INSERT INTO sirketler VALUES(102, 'Ford');  
INSERT INTO sirketler VALUES(103, 'Hyundai');


CREATE TABLE siparisler
(
siparis_id int, 
	sirket_id int,
	siparis_tarihi date
);
INSERT INTO siparisler VALUES(11, 101, '2020-04-17'); 
INSERT INTO siparisler VALUES(22, 102, '2020-04-18');  
INSERT INTO siparisler VALUES(33, 103, '2020-04-19');  
INSERT INTO siparisler VALUES(44, 104, '2020-04-20');  
INSERT INTO siparisler VALUES(55,  105, '2020-04-21');

select * from sirketler

select * from siparisler
-- SORU) Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--       siparis_tarihleri ile yeni bir tablo olusturun

select sirketler.sirket_isim, siparisler.siparis_id,siparisler.siparis_tarihi 
from sirketler inner join  siparisler -- kesisim kumesi gibi calisir ortak eleman uzerinden
on sirketler.sirket_id=siparisler.sirket_id

-- ***************    LEFT JOIN   *********************
-- SORU) Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--       siparis_tarihleri ile yeni bir tablo olusturun

select sirketler.sirket_isim, siparisler.siparis_id,siparisler.siparis_tarihi 
from sirketler LEFT join  siparisler -- SOLDAKI KUMEYI(sirketler) OLDUGU GIBI GETIRIR AMA KESISMEYEN ELEMANLAR NULL GELIR
on sirketler.sirket_id=siparisler.sirket_id


-- SORU) Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--       siparis_tarihleri ile yeni bir tablo olusturun

select sirketler.sirket_isim, siparisler.siparis_id,siparisler.siparis_tarihi 
from sirketler right join  siparisler -- Sagdaki KUMEYI(siparisler) OLDUGU GIBI GETIRIR AMA KESISMEYEN ELEMANLAR NULL GELIR
on sirketler.sirket_id=siparisler.sirket_id



--  ***********************  FULL JOINS   *********************


select sirketler.sirket_isim, siparisler.siparis_id,siparisler.siparis_tarihi 
from sirketler FULL join  siparisler -- IKI TABLOYU DA GETIRIR
on sirketler.sirket_id=siparisler.sirket_id



--**************************** SELF JOINS     *******************


DROP TABLE  personel CASCADE
CREATE TABLE personel  (
id int,
isim varchar(20),  
title varchar(60),  yonetici_id int
);
INSERT INTO personel VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO personel VALUES(2, 'Veli Cem', 'QA', 3);
INSERT INTO personel VALUES(3, 'Ayse Gul', 'QA Lead', 4); 
INSERT INTO personel VALUES(4, 'Fatma Can', 'CEO', 5);

SELECT * FROM personel
-- Her personelin yanina yonetici ismini yazdiran bir tablo olusturun

select  isim   from personel


select p1.isim as personel_isim, p2.isim as yoneticiisim
from personel p1  inner join personel p2 

on p1.yonetici_id =p2.id


-- *********************** LIKE   CONDITION    *********************

DROP TABLE  	musteriler

CREATE TABLE musteriler  (
id int UNIQUE,
isim varchar(50) NOT NULL,
gelir int
);
INSERT INTO musteriler (id, isim, gelir) VALUES (1001, 'Ali', 62000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1002, 'Ayse', 57500); 
INSERT INTO musteriler (id, isim, gelir) VALUES (1003, 'Feride', 71000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1004, 'Fatma', 42000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1005, 'Kasim', 44000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1006, 'ahmet', 82000);
-- SORU : Ismi A harfi ile baslayan musterilerin tum bilgilerini yazdiran QUERY yazin




select * from musteriler
where isim ilike 'A%'-- like yazinca sadece  buyuk A lari getirir,(ali ayse) ilike yazinca kucuk harfide getirir(ali ayse ahmet)

select * from musteriler
where isim like 'A%'

select * from musteriler
where isim ~~'A%' -- like gibi calistu


select * from musteriler
where isim ~~*'A%' -- ilike gibi calistu

-- ismi e ile biten musteri ve isim gelirleri

select isim,gelir from musteriler
where isim like '%e'

select isim,gelir from musteriler
where isim ~~ '%e'

-- icinde e,r olan musteri isim gelir

select isim,gelir from musteriler
where isim like '%er%'

-- isim 5 harfli son 4 harfi atma olsun

select * from musteriler
where  isim like '_atma'

--Ikinci harfi a olan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler
where  isim like '_a%'


--Ucuncu harfi s olan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler
where  isim ~~ '__s%'

---- LIKE Condition
/*
	3) REGEXP_LIKE =>Daha karmaşık sorgular için herhangi bir kod, metin icerisinde istenilen yazi
	veya kod parcasinin aranip bulunmasini saglayan kendine ait soz dizimi olan bir yapidir.
	(REGEXP_LIKE) PostgreSQL de ‘’ ~ ‘’ karekteri ile kullanilir
*/

CREATE TABLE kelimeler  (
id int UNIQUE,
kelime varchar(50) NOT NULL,  Harf_sayisi int
);
INSERT INTO kelimeler VALUES (1001, 'hot', 3); 
INSERT INTO kelimeler VALUES (1002, 'hat', 3); 
INSERT INTO kelimeler VALUES (1003, 'hit', 3);  
INSERT INTO kelimeler VALUES (1004, 'hbt', 3);  
INSERT INTO kelimeler VALUES (1008, 'hct', 3);
INSERT INTO kelimeler VALUES (1005, 'adem', 4);  
INSERT INTO kelimeler VALUES (1006, 'selim', 5); 
INSERT INTO kelimeler VALUES (1007, 'yusuf', 5);
INSERT INTO kelimeler VALUES (1009, 'hAt', 3); 
--SORU : Ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini yazdiran
--       QUERY yazin

select * from kelimeler
where  kelime ~ 'h[ai]t'



select * from kelimeler
where  kelime ~* 'h[ai]t' -- BUYUK KUCUK HARF GOZETMEDEN YAP

--SORU : Ilk harfi h,son harfi t olup 2.harfi a ile k arasinda olan 3 harfli kelimelerin tum bilgilerini
--yazdiran QUERY yazin

select * from kelimeler
where  kelime ~ 'h[a-k]t'

--SORU: Icinde m veya i olan kelimelerin tum bilgilerini yazdiran QUERYyazin
select * from kelimeler
where  kelime ~*'[mi]'

select * from musteriler 

--SORU : a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler
where  kelime ~*'^[as]'


--SORU : m veya f ile biten kelimelerin tum bilgilerini yazdiran QUERY yazin

select * from kelimeler
where  kelime ~*'[mf]$'


/*
 ****************** UPPER – LOWER - INITCAP **************
 
 
Tablolari yazdirirken buyuk harf, kucuk harf veya ilk harfleri buyuk digerleri
kucuk harf yazdirmak icin kullaniriz
 */
 
 
 select upper(kelime) from kelimeler --hepsi buyuk harf
  select lower(kelime) from kelimeler --hepsi kucuk harf
 select initcap(kelime) from kelimeler --bas harfi buyuk yazar
select * from musteriler
select lower(title),upper(isim)from musteriler -- birden fazla  sutunu degistirebiliriz





