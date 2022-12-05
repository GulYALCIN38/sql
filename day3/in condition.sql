--in condition
CREATE TABLE musteriler (
urun_id int,
musteri_isim varchar(50), urun_isim varchar(50)
);

INSERT INTO musteriler VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler VALUES (20, 'John', 'Apple'); 
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm'); 
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple');
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange'); 
INSERT INTO musteriler VALUES (40, 'John', 'Apricot');
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');
select * from musteriler
-- bu tablodan urun ismi  orange apple ve apricot olanlarin tum datalari listeleyin
select * from musteriler WHERE urun_isim='Orange'or urun_isim='Apple'or urun_isim='Apricot';
select * from musteriler WHERE urun_isim IN ('Orange','Apple','Apricot');-- YUKARDAKI ILE AYNI SEY


--in condition 
select * from musteriler WHERE urun_isim='Orange' and urun_id=10;
--NOT IN CONDITION YAZDIKLARIMIZ DISINDAKILER
select * from musteriler WHERE urun_isim NOT IN ('Orange','Apple','Apricot');
-- BETWEEN CONDITION--

-- ID SI 20 ILE 40 ARASI OLAN LARI LISTELE
SELECT * FROM musteriler WHERE urun_id>=20 and urun_id<=40;
SELECT * FROM musteriler WHERE urun_id BETWEEN 20 AND 40; 
SELECT * FROM musteriler WHERE urun_id NOT BETWEEN 20 AND 40;--20 - 40 ARALIGI DISINDAKILERI GETIRIR


