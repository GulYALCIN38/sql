-- 		SUBQUERIES
--SUBQUERY baska bir SORGU(query)’nun icinde calisan SORGU’dur
CREATE TABLE calisanlar3 (
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);
CREATE TABLE markalar1 (
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
	
);
INSERT INTO calisanlar3 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar3 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar3 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar3 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar3 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar3 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar3 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');
INSERT INTO markalar1 VALUES(100, 'Vakko', 12000);
INSERT INTO markalar1 VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar1 VALUES(102, 'Adidas', 10000);
INSERT INTO markalar1 VALUES(103, 'LCWaikiki', 21000);
SELECT * from calisanlar3;
SELECT * from markalar1;

-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini 
--ve bu markada calisanlarin isimlerini ve maaşlarini listeleyin.
select isim,maas,isyeri   from calisanlar3
Where isyeri in (select marka_isim from markalar where calisan_sayisi>15000 )

-- marka_id’si 101’den büyük olan marka çalişanlarinin 
-- isim, maaş ve şehirlerini listeleyiniz
Select isim,maas,sehir from calisanlar3
where isyeri in (select marka_isim from markalar1 where marka_id>101 )


/*
--ÖDEV- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.
*/
select marka_id,calisan_sayisi from markalar1
where marka_isim in (select isyeri from calisanlar3 where sehir='Ankara');

-- AGGREGATE METHOD


--Calisanlar tablosunda maksimum maası listeleyiniz
SELECT max(maas) AS maksimum_maas FROM calisanlar3;
/*
    Eğer bir sütuna geçici olarak bir isim vermek istersek AS komutunu yazdıktan sonra vermek
istediğimiz ismi yazarız
*/
--Calisanlar tablosunda minimum maası listeleyiniz
SELECT min(maas) AS minimum_maas FROM calisanlar3;
--Calisanlar tablosundaki maasların toplamını listeleyiniz
SELECT sum(maas) AS maas_toplamı FROM calisanlar3;
--Calisanlar tablosundaki maasların ortalamasını listeleyiniz
SELECT avg(maas) AS maas_ortalaması FROM calisanlar3;
SELECT round(avg(maas),2) AS maas_ortalaması FROM calisanlar3;
--Calisanlar tablosundaki maasların sayısı
SELECT count(maas) AS maas_sayısı FROM calisanlar3;--sadece maas yazan satirlari sayar
SELECT count(*) AS maas_sayısı FROM calisanlar3;-- satirlari sayar maas null olsada ekler


--******Aggregate methotlarda subquery*********---------

--her markanin id sini ismini ve toplam kac sehirde bulundugunu listeleyen bir sorgu yazin

SELECT marka_id,marka_isim,
(SELECT count(sehir) as sehir_sayisi FROM calisanlar3 WHERE marka_isim=isyeri) 
FROM markalar1;

--  Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin 
--  toplam maaşini listeleyiniz

select marka_isim,calisan_sayisi,(select sum(maas)from calisanlar3 where isyeri=marka_isim)as toplam 
from markalar1 ;


create view toplammaas1
as 
select marka_isim,calisan_sayisi,(select sum(maas)from calisanlar3 where isyeri=marka_isim)as toplam 
from markalar1 ;
select * from toplammaas1;



-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin 
-- maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.

select marka_isim,calisan_sayisi,
(select max(maas)from calisanlar3 where isyeri=marka_isim)as enyuksek,
(select min (maas)from calisanlar3 where isyeri=marka_isim)as endusuk
from markalar1;

--view kullnimi***************************************
create view maxminmaas
as 
select marka_isim,calisan_sayisi,
(select max(maas)from calisanlar3 where isyeri=marka_isim)as enyuksek,
(select min (maas)from calisanlar3 where isyeri=marka_isim)as endusuk
from markalar;

select *from maxminmaas;

--**************************EXIST CONDITION************************************
CREATE TABLE mart
(   
urun_id int,    
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan 
(   
urun_id int ,
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');
select * from mart
select * from nisan
/*
--MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
  URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
  MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız. 
*/

SELECT urun_id,musteri_isim FROM mart
where exists(select urun_id from nisan where mart.urun_id=nisan.urun_id );

/*
--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
*/

select urun_isim,musteri_isim from nisan
where exists(select urun_isim from mart where mart.urun_isim=nisan.urun_isim);








