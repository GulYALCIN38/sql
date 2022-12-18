-- DISTINCT
-- DISTINCT clause, çağrılan terimlerden tekrarlı olanların sadece birincisini alırCREATE TABLE musteri_urun 


CREATE TABLE musteri_urun 
(
urun_id int, 
musteri_isim varchar(50),
urun_isim varchar(50) 
);
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (20, 'Veli', 'Elma'); 
INSERT INTO musteri_urun VALUES (30, 'Ayse', 'Armut'); 
INSERT INTO musteri_urun VALUES (20, 'Ali', 'Elma'); 
INSERT INTO musteri_urun VALUES (10, 'Adem', 'Portakal'); 
INSERT INTO musteri_urun VALUES (40, 'Veli', 'Kaysi'); 
INSERT INTO musteri_urun VALUES (20, 'Elif', 'Elma');
select * from musteri_urun 

-- tabloda kac farkli cesit meyve vardir
-- Musteri urun tablosundan urun isimlerini tekrarsız(grup) listeleyiniz
--GROUP BY COZUM
select  urun_isim from musteri_urun
group by urun_isim

--DISTINCT COZUM
select  DISTINCT (urun_isim )from musteri_urun

--TABLODA KAC FARKLI MEYVE VAR
SELECT urun_isim, COUNT (Distinct urun_isim)FROM musteri_urun
group by urun_isim

SELECT urun_isim, COUNT ( urun_isim)FROM musteri_urun
group by urun_isim


----------- fetch next row only ---------------
-- tablodan ilk 3 kaydi listele
select * from musteri_urun 
order by urun_id
fetch next 3 row only

2. yol

select * from musteri_urun 
order by urun_id limit 3




CREATE TABLE maas 
(
id int, 
musteri_isim varchar(50),
maas int 
);
INSERT INTO maas VALUES (10, 'Ali', 5000); 
INSERT INTO maas VALUES (10, 'Ali', 7500); 
INSERT INTO maas VALUES (20, 'Veli', 10000); 
INSERT INTO maas VALUES (30, 'Ayse', 9000); 
INSERT INTO maas VALUES (20, 'Ali', 6500); 
INSERT INTO maas VALUES (10, 'Adem', 8000); 
INSERT INTO maas VALUES (40, 'Veli', 8500); 
INSERT INTO maas VALUES (20, 'Elif', 5500);
-- en yuksek maas alan satir

select * from maas

order by maas desc limit 1

-- maas tablosundan en yuksek ikinci maas satiri

select * from maas
order by maas desc 
  offset 1 limit 1

select * from maas
order by maas desc 
offset 1
fetch next 1 row only




-- maas tablosundan en az 4. maas

select * from maas
order by maas offset 3 limit 1
drop table personel
CREATE TABLE personel 
(
id int,
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda')

select * from  personel

alter table personel 
add ulke varchar(20) default 'turkie'
update personel 
set ulke= 'fas'
where sehir='Istanbul'

alter table personel
add zipcode  varchar(30),add yas int,

-------     sutun column silmek ------------


alter table personel
drop column zipcode -- column yazmadan da siliyor

alter table personel
drop ulke, drop sirket;


--------isim degiismi sutunda --------

alter table personel
rename column sehir to il -- column yazmadan da degisir

alter table personel

rename to isciler


----------- TYPE/SET(MODIFY) SUTUN OZELLIKLERI DEGISTIRME -----------

ALTER TABLE isciler
alter column il type varchar(30),
alter column maas set not null;

--
--stringi numeric yapmak izicn
ALTER TABLE isciler
alter column  maas type varchar(30) using (maas::varchar(30))



--------------TRASACTION  (BEGIN, SAVEPOINT, ROLLBACK, COMMIT)
--TRAM=SACTIONBASLATMAK ICIN BEGIM KOMUTU KULLANIRIZ BITIRMEK ICIN COMMIT
drop table ogrenciler2
CREATE TABLE ogrenciler2
(
id serial,-- COUNTER GIBI OTOMATIK CALISIR VE SAYI ATAR
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu real       
);




BEGIN;
INSERT INTO ogrenciler2 VALUES(default, 'Ali Can', 'Hasan',75.5);
INSERT INTO ogrenciler2 VALUES(default, 'Merve Gul', 'Ayse',85.3);
savepoint x;
INSERT INTO ogrenciler2 VALUES(default, 'Kemal Yasa', 'Hasan',85.6);
INSERT INTO ogrenciler2 VALUES(default, 'Nesibe Yilmaz', 'Ayse',95.3);
savepoint y;
INSERT INTO ogrenciler2 VALUES(default, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler2 VALUES(default, 'Can Bak', 'Ali', 67.5);
ROLLBACK to X;
COMMIT;

delete from ogrenciler2

select * from ogrenciler2

drop
