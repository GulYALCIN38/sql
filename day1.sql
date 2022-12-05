-- DDL - DATA DEFINITION LANG.
-- CREATE - TABLO OLUŞTURMA
Create table ogrenciler2
(
	ogrenci_no char(7),
	isim varchar(20),
	net_ort real,
	kayit_tarih date
);
--VAROLAN TABLODAN YENİ BİR TABLO OLUŞTURMA
create table ogr_notlari
as --Benzer tablodaki başlıklarla ve data tipleriyle yeni bir tablo oluşturmak için 
----normal tablo oluştururken ki parantezler yerine AS kullanıp Select komutuyla almak istediğimiz verileri alırız
SELECT  isim,net_ort from ogrenciler2;
Create table ogrenciler1
(
	ogrenci_no char(7),
	isim varchar(20),
	soyisim varchar(25),
	net_ort real,
	kayit_tarih date	
);

create table isimler
as
select isim,soyisim from ogrenciler1
-- DML - DATA MANUPULATION LANG.
-- INSERT (Database'e veri ekleme)

insert into ogrenciler1 values ('1234567','said','ilhan',89.5,now());
insert into ogrenciler1 values ('7654321','gul','yalcin',34.6,'2020-12-11');
-- BIR TABLOYA PARÇALI VERİ EKLEMEK İSTERSEK

insert into ogrenciler1 (isim, soyisim)values('hasan','kaya');
-- DQL - DATA QUERY LANG.
-- SELECT

select * from ogrenciler1;-- Burdaki * sembolü herşeyi anlamındadırllll
create table isim_not
as
select isim,soyisim,net_ort from ogrenciler1

insert into isim_not values ('Osman','yalcin',95.5);
insert into isim_not values ('ali','nur',85.5);
insert into isim_not values ('omer','cin',65.5);
select * from isim_not;

-- VAROLAN BİR TABLODAN YENİ BİR TABLO OLUŞTURMA
CREATE TABLE NOTLAR
AS
SELECT isim,net_ort FROM ogrenciler1;
select * from notlar;
--INSERT- TABLO İÇİNE VERİ EKLEME
INSERT INTO notlar VALUES ('Osman',95.5);
INSERT INTO notlar VALUES ('Sumeyye',95.5);
INSERT INTO notlar VALUES ('Salih',95.5);
INSERT INTO notlar VALUES ('Hakan',95.5);
INSERT INTO notlar VALUES ('Adem',95.5);
select * from notlar;

-- CONSTRAINT
--UNIQUE
--NOT NULL

CREATE TABLE ogrenciler3
(
ogrenci_no char(7) unique,
isim varchar(20) NOT NULL, 
soyisim varchar(25),
not_ort real,
kayit_tarih date
);
select * from ogrenciler3;
insert into ogrenciler3 values ('1234567','erol','evren',75.5,now());
insert into ogrenciler3 values ('1234568','ercan','kaya',85.5,now());
insert into ogrenciler3 values ('1234507','lale','evren',75.5,now());
INSERT INTO ogrenciler3 (ogrenci_no,soyisim,not_ort) VALUES ('1234569','Evren',85.5);-- not null dan dolayi kabul edilmedi
-- PRIMARY KEY ataması

CREATE TABLE ogrenciler4
(
ogrenci_no char(7) primary key,
isim varchar(20) , 
soyisim varchar(25),
not_ort real,
kayit_tarih date
);

-- Eğer CONSTRAINT ismini kendimiz vermek istersek bu yolu kullanabiliriz
CREATE TABLE ogrenciler5
(
ogrenci_no char(7),
isim varchar(20), 
soyisim varchar(25),
not_ort real,
kayit_tarih date,
CONSTRAINT ogr PRIMARY KEY(ogrenci_no)    
);

CREATE TABLE ogrenciler6
(
ogrenci_no char(7),
isim varchar(20), 
soyisim varchar(25),
not_ort real,
kayit_tarih date,
PRIMARY KEY(ogrenci_no)    
);

-- FOREIGN KEY 

/*
“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”,  
“iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
“tedarikci_id” yi Foreign Key yapin.
*/

create table tedarikciler3
(
 tedarikci_id char(5)primary key,
	tedarikci_ismi varchar(20),
	iletisim_ismi varchar(25)
);
select * from tedarikciler3

CREATE TABLE urunler
(
tedarikci_id char(5),
urun_id char(5),
FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)  
);

CREATE TABLE urunler
(
tedarikci_id char(5),
urun_id char(5),
CONSTRAINT urn_fk FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)  
);

select * from tedarikciler3;
select * from urunler;
/*
“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, “ise_baslama”  
field’lari olsun. “id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın. 
“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”, “sokak”, “cadde” ve 
“sehir” fieldlari olsun.  “adres_id” field‘i ile Foreign Key oluşturun.
*/
CREATE TABLE calisanlar
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int NOT NULL,
ise_baslama date    
);
CREATE TABLE adresler
(
adres_id varchar(30),
sokak varchar(30),
cadde varchar(30),
sehir varchar(30),
FOREIGN KEY (adres_id) REFERENCES calisanlar(id)    
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14'); 
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14'); -- UNIQUE CONS. Kabul etmez
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); -- NOT NULL CONS. Kabul etmez
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); -- UNIQUE CONS. Kabul etmez
--INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); -- INT / STRING
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
--INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); -- PRIMARY KEY
--INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); -- PRIMARY KEY 
--INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- PRIMARY KEY
INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
   
-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');
SELECT * FROM calisanlar;
SELECT * FROM adresler;

-- CHECK CONSTRAINT
CREATE TABLE calisanlar2
(
id varchar(15) PRIMARY KEY,
isim varchar(30) UNIQUE,
maas int CHECK (maas>10000) NOT NULL,
ise_baslama date    
);
SELECT * FROM calisanlar2;
INSERT INTO calisanlar2 VALUES('10002', 'Mehmet Yılmaz' ,19000, '2018-04-14'); 

-- DQL -- WHERE KULLANIMI
SELECT * FROM calisanlar;
SELECT isim FROM calisanlar;

-- Calisanlar tablosundan maası 5000 den buyuk olan isimleri listeleyiniz
SELECT isim,maas FROM calisanlar WHERE maas>5000;
-- Calisanlar tablosundan ismi Veli Han olan tüm verileri listeleyiniz
SELECT * FROM calisanlar WHERE isim='Veli Han';
-- Calisanlar tablosundan maası 5000 olan tüm verileri listeleyiniz
SELECT * FROM calisanlar WHERE maas=5000;

-- DML -- DELETE KOMUTU
DELETE FROM calisanlar; -- Eğer parent tablo başka bir child tablo ile iliskili ise önce child tablo silinmelidir
DELETE FROM adresler;
SELECT * FROM adresler;
--Adresler tablosundan sehri Antep olan verileri silelim
DELETE FROM adresler WHERE sehir = 'Antep';

CREATE TABLE ogrenciler7
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int       
);
INSERT INTO ogrenciler7 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler7 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler7 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler7 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler7 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler7 VALUES(127, 'Mustafa Bak', 'Ali', 99);

select * from ogrenciler7




