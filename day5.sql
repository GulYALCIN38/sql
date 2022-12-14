---************************** GRUO BY   ***********************************


CREATE TABLE personel
(
id int primary key,
isim varchar(50), 
sehir varchar(50), 
	maas int,  
sirket varchar(20)
);
INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel VALUES(450789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');


-- ISME GORE TOPLAM MAASLARI BUL
SELECT isim,sum(maas)from personel
 group by isim;

select * from personel

--sehre gore toplam personel sayisi
SELECT sehir , count(isim)from personel
 group by sehir;
 
 --sirketlere gore 5000 tl  den fazla olan personel sayisini bul
 
 --***************** HAVING    ***************************
 -- HAVING SADECE GROUPBAY ILE KULLANILIR  GROUP BY DAN SONRA SART GEREKIRSE WHERE YERINE KULLANIRIZ
-- Her sirketin MIN maaslarini eger 4000’den buyukse goster

SELECT sirket ,min(maas)as endusukmaas from personel
group by sirket
having min(maas)>4000;

-- 2) Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi
-- ve toplam maasi gosteren sorgu yaziniz

select isim, sum(maas) from personel
group by isim
having sum(maas)>10000;


-- Eger bir sehirde calisan personel sayisi 1’den coksa sehir ismini ve personel sayisini veren sorgu yaziniz
select sehir, count(isim) from personel
group by sehir
having count(isim)>1

--Eger bir sehirde alinan MAX maas 5000’den dusukse sehir ismini ve MAX maasi veren sorgu yaziniz
select sehir,max(maas)from personel
group by sehir
having sum(maas)<5000



--************************ UNION       ******************************

--						UNION OPERATOR
-- Iki farkli sorgulamanin sonucunu birlestiren islemdir. Secilen Field SAYISI ve DATA TYPE’i
-- ayni olmalidir.


-- 1) Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan
-- sehirleri gosteren sorguyu yazini

SELECT sehir, maas from personel 
where  maas>5000
union
select isim , maas from personel
where maas>4000

-- 2) Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki personelin maaslarini
-- bir tabloda gosteren sorgu yaziniz masa gore siralayin

select isim,maas from personel
where isim='Mehmet Ozturk'
union
select sehir, maas from personel
where sehir='Istanbul'
order by maas desc

drop table if exists personel
CREATE TABLE personel_bilgi  (
id int,
tel char(10) UNIQUE ,  
cocuk_sayisi int,
CONSTRAINT personel_bilgi_fk FOREIGN KEY (id) REFERENCES personel(id)
);
INSERT INTO personel_bilgi VALUES(123456789, '5302345678', 5);  
INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);


select * from personel_bilgi 

select * from personel

-- id’si 123456789 olan personelin    Personel tablosundan sehir ve maasini, 
-- personel_bilgi  tablosundan da tel ve cocuk sayisini yazdirin


select sehir as sehi_tel ,maas as maas_cocuksayisi from personel
where id=123456789
union
select tel,cocuk_sayisi from personel_bilgi where id=123456789



  ------ union all  --------
  
  
  
--Personel tablosundada maasi 5000’den az olan tum isimleri ve maaslari bulunuz

select isim, maas from personel
where maas<5000

union all--union yazinca isimler tek e dustu,, union all yazinca  iki sorguyu bir arada sadelestirmeden verdi

select isim, maas from personel
where maas<5000;



--------------- INTERSECT (KESISIM IKI SORGUNUNKESISIM KUMESINI GETIRIR) ------------


--Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini yazdir
--Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
--Iki sorguyu INTERSECT ile birlestirin

SELECT id from personel
where  sehir in('Istanbul','Ankara')
intersect
SELECT id from personel_bilgi
where  cocuk_sayisi in(2,3)

-- Honda,Ford ve Tofas’ta calisan ortak isimde personel varsa listeleyin
select isim from personel where sirket='Honda'  
intersect
 select isim from personel where sirket='Ford' 
intersect
select isim from personel where sirket='Tofas';  


-------------------------   EXEPT(HARIC)  OPERATOR-_____________________

--IKI SORGUDA ORTAK ELEMANLARI CIKARP SADECE BIRINE OZGU OLANLARI GETIRIRI fark kumesi gibi calisir


--5000 den az maas alip honda ada calismayanlari yazin
select isim,sirket from personel  where maas<5000
except
select isim, sirket from personel where sirket ='Honda'























