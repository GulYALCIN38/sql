-- DDL - DATA DEFINITION LANG.
-- CREATE - TABLO OLUSTURMA
CREATE TABLE ogrenciler1
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
netort real,--ondalikli sayilar icin double gibi
kayit_tarih date
);

--varolan tablaodan yeni bir tablo olusturmak
CREATE TABLE ogrenci_notlari1
AS
SELECT isim,soyisim,netort FROM ogrenciler1;
-- data manipulation language
-- insert veri ekleme
INSERT INTO ogrenciler1 VALUES ('1234567','SAIT','ILHAN',85.5,now());
INSERT INTO ogrenciler1 VALUES ('1234567','SAIT','ILHAN',85.5,'2022-12-13');

-- bir tabloya parcali veri ekle
INSERT INTO ogrenciler1 (isim,soyisim)VALUES('GUL','YALCIN');

--DQL - DATA QERY LANG.
-- SELECT
select * FROM ogrenciler1;


