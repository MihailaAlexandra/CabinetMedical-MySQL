CREATE DATABASE CabinetMedical;
USE CabinetMedical;

--create table  consultatie--
CREATE TABLE CONSULTATIE(
ID_CONSULTATIE INT PRIMARY KEY  NOT NULL AUTO_INCREMENT,
DATA DATE ,
DETALII_CONSULTATIE VARCHAR(50),
PRET INT ,
ID_MEDIC INT,
ID_PACIENT INT 
);
DESCRIBE CONSULTATIE;

--create table pacient--
CREATE TABLE PACIENT(
ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
NUME VARCHAR(20) ,
PRENUME VARCHAR(20),
CNP INT ,
DATA_NASTERE DATE  ,
LOC_NASTERE VARCHAR(50) ,
TELEFON VARCHAR(20) ,
STRADA VARCHAR(50),
NUMAR INT,
BLOC INT,
APARTAMENT INT,
LOCALITATE VARCHAR(50) ,
CODPOSTAL INT
);
DESCRIBE PACIENT;

--create table medic--
CREATE TABLE MEDIC(
ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
NUME VARCHAR(20) ,
PRENUME VARCHAR(20) ,
TELEFON VARCHAR(20) ,
EMAIL VARCHAR(50) ,
STRADA VARCHAR(50) ,
NUMAR INT ,
BLOC INT,
APARTAMENT INT,
LOCALITATE VARCHAR(50),
CODPOSTAL INT,
SPECIALITATE VARCHAR(50)
);
DESCRIBE MEDIC;

--create table reteta--
CREATE TABLE RETETA(
NUMAR INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
ID_CONSULTATIE INT,
ID_MEDIC INT,
DATA_ELABORARE DATETIME 
);
DESCRIBE RETETA;

--create table medicament--
CREATE TABLE MEDICAMENT(
COD INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
SUBSTANTA_ACTIVA VARCHAR(50),
DENUMIRE VARCHAR(50),
INDICATII VARCHAR(50),
CONTRAINDICATII VARCHAR(50),
REACTII_ADVERSE VARCHAR(50) 
);
DESCRIBE MEDICAMENT;

--create table item_reteta--
CREATE TABLE ITEM_RETETA(
ID_RETETA INT NOT NULL UNIQUE,
ID_MEDICAMENT INT,
DOZAJ VARCHAR(50),
CANTITATE VARCHAR(50) 
);
DESCRIBE ITEM_RETETA;

--After the database and the tables have been created, a few ALTER instructions were written in order to update the structure of the database, as described below--
ALTER TABLE ITEM_RETETA add constraint 
ITEM_RETETA_PL primary key (ID_RETETA, ID_MEDICAMENT);

ALTER TABLE CONSULTATIE ADD FOREIGN KEY CONSULTATIE_CON(id_PACIENT) references PACIENT(ID);


ALTER TABLE CONSULTATIE ADD FOREIGN KEY CONSULTATIE_CON2 (ID_MEDIC) references MEDIC(ID);


ALTER TABLE RETETA ADD FOREIGN KEY RETETA_CON(ID_CONSULTATIE) references CONSULTATIE(ID_CONSULTATIE);


ALTER TABLE RETETA ADD FOREIGN KEY RETETA_CON2(ID_MEDIC) references MEDIC(ID);


ALTER TABLE ITEM_RETETA ADD FOREIGN KEY ITEM_RETETA_CON(ID_MEDICAMENT) references MEDICAMENT(COD);

ALTER TABLE ITEM_RETETA 
ADD CONSTRAINT ITEM_RETETA_CON2 
FOREIGN KEY (ID_RETETA) REFERENCES RETETA(NUMAR);

ALTER TABLE PACIENT MODIFY COLUMN CNP VARCHAR(13);

--In order to be able to use the database I populated the tables with various data necessary in order to perform queries and manipulate the data. In the testing process, this necessary data is identified in the Test Design phase and created in the Test Implementation phase.--

--Below you can find all the insert instructions that were created in the scope of this project--

INSERT INTO MEDIC VALUES
(1,'Matei','George','0723333333','mateigeorge@gmail.com','Drm.Ciorogarla','12','10','32','Bucuresti','062397','cardiologie'),
(2,'Mateescu','Andrei','0723334321','mateescuandrei@yahoo.com','Bd.Iuliu Maniu','11','5','160','Bucuresti','023467','gastroenterologie'),
(3,'Mandea','Camelia','0722212908','mandeacamelia@gmail.com','Drm.Bacriu','20','20','114','Ploiesti','063456','stomatologie'),
(4,'Prodan','Taner','0723333333','prodantaner@gmail.com','Bd.Carol','22','13','31','Timisoara','444677','oftalmologie'),
(5,'Matinciuc','Mihai','0723007654','matinciucmihai@yahoo.com','Drm.Bisericii','60','10','144','Targoviste','062395','ginecologie'),
(6,'Manea','Andreea','0789898976','maneaandreea@gmail.com','Str.Trenului','56','34','121','Bucuresti','077043','psihiatrie'),
(7,'Valeriu','George','0723323433','valeriugeorge@yahoo.com','Bd.Ceahlau','80','37','267','Vaslui','351623','neurologie');


INSERT INTO PACIENT (ID, NUME, PRENUME, CNP, DATA_NASTERE, LOC_NASTERE, TELEFON, STRADA, NUMAR, BLOC, APARTAMENT, LOCALITATE, CODPOSTAL)
VALUES
(1, 'Pavel', 'Mihaela', '189038563827', '1977-07-16', 'Bucuresti', '0731534435', 'Bd.Regiesti', '27', '11', '86', 'Bucuresti', '163243'),
(2, 'Patrascu', 'Andrei', '189042467532', '1979-04-11', 'Bucuresti', '0742327895', 'Bd.Sibiu', '25', '2', '22', 'Bucuresti', '161194'),
(3, 'Pantaru', 'Delia', '189017364597', '1978-07-22', 'Bucuresti', '0770323223', 'Bd.Veteranilor', '18', '33', '68', 'Bucuresti', '165213'),
(4, 'Fanica', 'Mateut', '189022222233', '1997-05-12', 'Bucuresti', '0731334455', 'Bd.Cantemir', '13', '20', '12', 'Bucuresti', '227256'),
(5, 'Iordan', 'Camelia', '189011111111', '1957-01-29', 'Bucuresti', '0789543267', 'Bd.Gorjului', '17', '25', '118', 'Bucuresti', '999999'),
(6, 'Dan', 'Anastasia', '166022123456', '1999-02-21', 'Bucuresti', '0731334455', 'Bd.Bacau', '12', '15', '16', 'Bucuresti', '400000'),
(7, 'Stamatie', 'Oana', '298354567865', '1999-01-20', 'Bucuresti', '0765123456', 'Splaiul.Unirii', '132', '45', '16', 'Bucuresti', '177777');


INSERT INTO CONSULTATIE VALUES(1, '2015-06-10', 'consultatie cu aparatul Doppler', 121, 1, 1);
INSERT INTO CONSULTATIE VALUES(2, '2018-05-18', 'semne meningeale,anamneza', 218, 2, 2);
INSERT INTO CONSULTATIE VALUES(3, '2018-01-22', 'Control stomatologic', 150, 3, 3);
INSERT INTO CONSULTATIE VALUES(4, '2018-08-19', 'Consult oftalmologic', 120, 4, 4);
INSERT INTO CONSULTATIE VALUES(5, '2018-01-06', 'Consult ginecologic', 200, 5, 5);
INSERT INTO CONSULTATIE VALUES(6, '2018-01-25', 'Control psihiatrie', 100, 6, 6);
INSERT INTO CONSULTATIE VALUES(7, '2015-09-22', 'Tomografie computerizată', 250, 7, 7);


INSERT INTO RETETA VALUES(100, 1, 1, '2015-06-10');
INSERT INTO RETETA VALUES(101, 2, 2, '2018-05-18');
INSERT INTO RETETA VALUES(102, 3, 3, '2018-01-22');
INSERT INTO RETETA VALUES(103, 4, 4, '2018-08-19');
INSERT INTO RETETA VALUES(104, 5, 5, '2018-01-06');
INSERT INTO RETETA VALUES(105, 6, 6, '2018-01-25');
INSERT INTO RETETA VALUES(106, 7, 7, '2015-09-22');


INSERT INTO MEDICAMENT VALUES(1, 'Clonazepam', 'Rivotril', NULL, NULL, NULL);
INSERT INTO MEDICAMENT VALUES(2, 'Cynara scolymus', 'Cynarix', NULL, NULL, NULL);
INSERT INTO MEDICAMENT VALUES(3, 'Etoricoxib', 'Arcoxia', NULL, NULL, NULL);
INSERT INTO MEDICAMENT VALUES(4, NULL, 'Copaxone', NULL, NULL, NULL );
INSERT INTO MEDICAMENT VALUES(5, 'Betametazonă', 'Betabioptal', NULL, 'Hipertensiune intraoculară', NULL);
INSERT INTO MEDICAMENT VALUES(6, 'Candidoza', 'Medacter', NULL, 'Hipersensibilitate', NULL);
INSERT INTO MEDICAMENT VALUES(7, 'Polipragmazia', 'Cipralex', NULL, NULL, NULL);

insert into item_reteta values(100,1,'2 pastile/zi','2 cutii'); 
insert into item_reteta values(101,2,'3 pastile/zi','1 cutie'); 
insert into item_reteta values(102,3,'2 pastile/zi','2 cutii'); 
insert into item_reteta values(103,4,'1 pastila/zi','1 flacon');
insert into item_reteta values(104,5,'2 pastile/zi','2 cutii');
insert into item_reteta values(105,6,'1 capsula/zi','1 cutie');
insert into item_reteta values(106,7,'2 ori/zi','1 cutie');


--After the insert, in order to prepare the data to be better suited for the testing process, I updated some data in the following way--

--1. To update the phone number for the patient with block number = 132--
UPDATE PACIENT
SET TELEFON = '0765123456'
WHERE NUMAR = '132';

SELECT * FROM PACIENT;

--2. To double the consultation price for consultations with id_consultatie=4 from the CONSULTATION table.--
UPDATE CONSULTATIE
SET PRET = 2 * PRET
WHERE ID_CONSULTATIE = 4;

SELECT * FROM CONSULTATIE;

--3. To change the doctor's first name from George to Andrei.--
UPDATE MEDIC
SET PRENUME = 'George'
WHERE PRENUME = 'Andrei';

SELECT * FROM MEDIC;

--4. To cancel the active substance for the medicine called Rivotril.--
UPDATE MEDICAMENT
SET SUBSTANTA_ACTIVA = '-'
WHERE denumire LIKE 'Rivotril';

SELECT * FROM MEDICAMENT;

--In order to simulate various scenarios that might happen in real life I created the following queries that would cover multiple potential real-life situations--

--1. To select all doctors from the Doctor table.--
Select * from MEDIC; 

--2. To select only doctors who specialize in cardiology--
SELECT * FROM MEDIC
WHERE SPECIALITATE LIKE '%CARDIOLOGIE%';

--3. Let's select the consultations performed by the doctor with id_medic=1--
SELECT*FROM CONSULTATIE
WHERE ID_MEDIC=1;

--JOINTS--
--1. To select the prescriptions (display only number, date) concluded by doctors (display name).--
SELECT r.numar, r.data_elaborare, m.id, m.nume
FROM reteta r, medic m
WHERE r.id_medic = m.id;

--2. Display the dosage found on the prescription (display number) indicated by each doctor (display id_medic)--
SELECT ir.dozaj, r.numar, r.id_medic
FROM item_reteta ir, reteta r
WHERE ir.id_reteta = r.numar;

--3. Display all prescriptions issued by Matei George's doctor.--
SELECT m.nume AS nume,
       m.prenume AS prenume,
       r.data_elaborare AS data,
       me.denumire AS denumire,
       ir.dozaj AS dozaj,
       ir.cantitate AS cantitate
FROM item_reteta ir
JOIN reteta r ON ir.id_reteta = r.numar
JOIN medic m ON m.id = r.id_medic
JOIN medicament me ON ir.id_medicament = me.cod
WHERE m.nume = 'Matei'
AND m.prenume = 'George';


--4. Display all patients consulted by medical doctor Prodan Taner.--
SELECT 
    c.data AS data,
    c.detalii_consultatie AS detalii_consultatie,
    c.pret AS pret,
    m.nume AS nume_medic,
    m.prenume AS prenume_medic,
    p.nume AS nume_pacient,
    p.prenume AS prenume_pacient,
    p.cnp AS cnp,
    p.data_nastere AS data_nastere,
    p.loc_nastere AS loc_nastere,
    p.telefon AS telefon,
    p.localitate AS localitate
FROM 
    consultatie c
JOIN 
    pacient p ON c.id_pacient = p.id
JOIN 
    medic m ON c.id_medic = m.id
WHERE 
    m.nume = 'Prodan' AND m.prenume = 'Taner';
    
--GROUP FUNCTIONS--

--1. Display the number of consultations whose price is less than 200.--
SELECT COUNT(*) AS id_consultatie
FROM consultatie
WHERE pret < 200;

--2. To display the date of the first consultation and the date of the oldest consultation.--
SELECT MIN(data), MAX(data)
FROM consultatie;


--3. To display the average price for each consultation. Sort by price (the AVG() function and the GROUP BY() clause are used to group the data according to consultation_id, and the ordering is done using the ORDER BY function--
SELECT ID_CONSULTATIE , ROUND( AVG(PRET),2) MEDIE_PRET
FROM CONSULTATIE
GROUP BY ID_CONSULTATIE
ORDER BY MEDIE_PRET;

--4. To display the average price for each consultation, for those products whose price is between 50 and 350 and to order it in descending order.--
SELECT 
    ID_CONSULTATIE, 
    AVG(PRET) AS PRET_MEDIU
FROM 
    CONSULTATIE
GROUP BY 
    ID_CONSULTATIE
HAVING 
    AVG(PRET) BETWEEN 50 AND 350
ORDER BY 
    PRET_MEDIU DESC;
    
--CASE--

--1. To change the price of consultations according to the details of the consultation:
• 220 if details_consultation is of the type 'Dental consultation'
• 160 if details_consultation is of the type 'Ophthalmological control'
• 350 if details_consultation is of the type 'Computed Tomography'
For the other consultations, the price will be 300.--

SELECT id_consultatie, detalii_consultatie,
  CASE
    WHEN detalii_consultatie LIKE '%Control stomatologic%' THEN 220
    WHEN detalii_consultatie LIKE '%Consult oftalmologic%' THEN 160
    WHEN detalii_consultatie LIKE '%Tomografie computerizata%' THEN 350
    ELSE 300
  END AS pret
FROM consultatie;

--VIEW--
--1. To create a virtual table with all patients who live in Bucharest.--
CREATE OR REPLACE VIEW v_pacient
AS 
SELECT * FROM pacient
WHERE loc_nastere = 'Bucuresti';

SELECT * FROM v_pacient;

--ConCluSIonS--
The database created is for:
• To discover new trends in diseases and infections;
• To monitor the evolution of patients during treatment, as well as after consultations.
• To highlight the drugs used and prescriptions issued by doctors.
• To monitor the centers of development - research for infectious diseases.




