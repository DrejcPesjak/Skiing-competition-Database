CREATE DATABASE SVETOVNI_POKAL
GO

USE SVETOVNI_POKAL
GO

-----------------------------------------------

Create table [TEKMOVALEC]
(
	[stevilka] Integer NOT NULL,
	[ime] Nvarchar(30) NOT NULL,
	[priimek] Char(30) NOT NULL,
	[spol] Nvarchar(1) NOT NULL,
	[datum_rojstva] Datetime NOT NULL,
	[drzava] Nvarchar(40) NOT NULL,
Primary Key ([stevilka])
) 
go

Create table [PRIZORISCE]
(
	[stevilka] Integer NOT NULL,
	[ime] Nvarchar(30) NOT NULL,
	[drzava] Nvarchar(50) NOT NULL,
	[nadmorska_visina] Integer NOT NULL,
Primary Key ([stevilka])
) 
go

Create table [TEKMA]
(
	[stevilka] Integer NOT NULL,
	[spol] Char(1) NULL,
	[datum] Datetime NOT NULL,
	[dolzina_proge] Integer NOT NULL,
	[visina_start] Integer NOT NULL,
	[visina_cilj] Integer NOT NULL,
	[stevilo_vratc] Integer NOT NULL,
	[stevilo_vmesnih_casov] Integer NULL,
	[disciplina] Nvarchar(30) NOT NULL,
	[stevilka_prizorisca] Integer NOT NULL,
Primary Key ([stevilka])
) 
go

Create table [MERITEV]
(
	[stevilka_tekme] Integer NOT NULL,
	[stevilka_tekmovalca] Integer NOT NULL,
	[disciplina] Nvarchar(30) NULL,
	[tek] Integer NOT NULL,
	[stevilka] Integer NOT NULL,
	[vrsta] Nvarchar(20) NOT NULL,
	[cas] Datetime NULL,
Primary Key ([stevilka_tekme],[stevilka_tekmovalca],[tek],[stevilka])
) 
go

Create table [DISCIPLINA]
(
	[disciplina] Nvarchar(30) NOT NULL,
Primary Key ([disciplina])
) 
go

Create table [RAZPORED_TEKME]
(
	[stevilka_tekme] Integer NOT NULL,
	[stevilka_tekmovalca] Integer NOT NULL,
	[startna_stevilka] Integer NOT NULL,
	[osvojeno_mesto] Integer NULL,
	[osvojene_tocke] Integer NULL,
Primary Key ([stevilka_tekme],[stevilka_tekmovalca])
) 
go

Create table [MERITEV_VRSTA]
(
	[vrsta] Nvarchar(20) NOT NULL,
Primary Key ([vrsta])
) 
go




Alter table [RAZPORED_TEKME] add  foreign key([stevilka_tekmovalca]) references [TEKMOVALEC] ([stevilka])  on update no action on delete no action 
go
Alter table [TEKMA] add  foreign key([stevilka_prizorisca]) references [PRIZORISCE] ([stevilka])  on update no action on delete no action 
go
Alter table [RAZPORED_TEKME] add  foreign key([stevilka_tekme]) references [TEKMA] ([stevilka])  on update no action on delete no action 
go
Alter table [TEKMA] add  foreign key([disciplina]) references [DISCIPLINA] ([disciplina])  on update no action on delete no action 
go
Alter table [MERITEV] add  foreign key([disciplina]) references [DISCIPLINA] ([disciplina])  on update no action on delete no action 
go
Alter table [MERITEV] add  foreign key([stevilka_tekme],[stevilka_tekmovalca]) references [RAZPORED_TEKME] ([stevilka_tekme],[stevilka_tekmovalca])  on update no action on delete no action 
go
Alter table [MERITEV] add  foreign key([vrsta]) references [MERITEV_VRSTA] ([vrsta])  on update no action on delete no action 
go




-------------------------------------------------------

SET DATEFORMAT dmy
GO


INSERT INTO TEKMOVALEC VALUES
(1,'Tina','Maze','ž','2.5.1983','Slovenija'),
(2,'Lindsey','Vonn','ž','18.10.1984','ZDA'),
(3,'Tina','Weirather','ž','24.5.1989','Lihenštajn'),
(4,'Petra','Vlhova','ž','13.6.1995','Slovaška'),
(5,'Nicol','Delago','ž','05.1.1996','Italija'),

(6,'Didier','Defago','m','02.10.1977','Švica'),
(7,'Fritz','Dopfer','m','24.8.1987','Nemèija'),
(8,'Aksel Lund','Svindal','m','26.12.1982','Norveška'),
(9,'Matic','Skube','m','23.2.1988','Slovenija'),
(10,'Filip','Zubriè','m','27.1.1993','Hrvaška'),
(11,'Benjamin','Reich','m','28.2.2978','Avstrija')
GO



INSERT INTO PRIZORISCE VALUES
(1,'Soelden','Avstrija',2684),
(2,'Levi','Finska',206),
(3,'Kilington','ZDA',400),
(4,'Lake Louise','Kanada',1600),
(5,'Val d''Isere','francija',1706),
(6,'Sestriere','Italija',2000)
GO

INSERT INTO DISCIPLINA VALUES ('slalom'),('veleslalom'),('superleleslalom'),('smuk'),('kombinacija')
GO


INSERT INTO MERITEV_VRSTA VALUES ('start'),('vmesni èas'),('cilj'),('DNF'),('DNS')
GO

---------------------------------------------
-- 1.  tekma

INSERT INTO TEKMA VALUES(1,'ž','22.10.2016',1450,3040,2670,51,3,'veleslalom',1)
GO

INSERT INTO RAZPORED_TEKME (stevilka_tekme,stevilka_tekmovalca,startna_stevilka) VALUES (1,3,1)
INSERT INTO RAZPORED_TEKME (stevilka_tekme,stevilka_tekmovalca,startna_stevilka) VALUES (1,1,2)
INSERT INTO RAZPORED_TEKME (stevilka_tekme,stevilka_tekmovalca,startna_stevilka) VALUES (1,2,3)
INSERT INTO RAZPORED_TEKME (stevilka_tekme,stevilka_tekmovalca,startna_stevilka) VALUES (1,5,4)
INSERT INTO RAZPORED_TEKME (stevilka_tekme,stevilka_tekmovalca,startna_stevilka) VALUES (1,4,5)
GO

INSERT INTO RAZPORED_TEKME (stevilka_tekme,stevilka_tekmovalca,startna_stevilka) VALUES (2,5,1)
INSERT INTO RAZPORED_TEKME (stevilka_tekme,stevilka_tekmovalca,startna_stevilka) VALUES (2,4,2)
INSERT INTO RAZPORED_TEKME (stevilka_tekme,stevilka_tekmovalca,startna_stevilka) VALUES (2,1,3)
INSERT INTO RAZPORED_TEKME (stevilka_tekme,stevilka_tekmovalca,startna_stevilka) VALUES (2,2,4)
INSERT INTO RAZPORED_TEKME (stevilka_tekme,stevilka_tekmovalca,startna_stevilka) VALUES (2,3,5)
GO


INSERT INTO MERITEV VALUES (1,3,NULL,1,1,'start','22.10.2016 9:00:07.997')
INSERT INTO MERITEV VALUES (1,3,NULL,1,2,'vmesni èas','22.10.2016 9:00:19.997')
INSERT INTO MERITEV VALUES (1,3,NULL,1,3,'vmesni èas','22.10.2016 9:00:34.997')
INSERT INTO MERITEV VALUES (1,3,NULL,1,4,'vmesni èas','22.10.2016 9:00:56.997')
INSERT INTO MERITEV VALUES (1,3,NULL,1,5,'cilj','22.10.2016 9:01:09.997')

INSERT INTO MERITEV VALUES (1,1,NULL,1,1,'start','22.10.2016 9:02:07.997')
INSERT INTO MERITEV VALUES (1,1,NULL,1,2,'vmesni èas','22.10.2016 9:02:19.997')
INSERT INTO MERITEV VALUES (1,1,NULL,1,3,'vmesni èas','22.10.2016 9:02:37.997')
INSERT INTO MERITEV VALUES (1,1,NULL,1,4,'vmesni èas','22.10.2016 9:02:56.997')
INSERT INTO MERITEV VALUES (1,1,NULL,1,5,'DNF',NULL)

INSERT INTO MERITEV VALUES (1,2,NULL,1,1,'start','22.10.2016 9:04:04.997')
INSERT INTO MERITEV VALUES (1,2,NULL,1,2,'vmesni èas','22.10.2016 9:04:17.997')
INSERT INTO MERITEV VALUES (1,2,NULL,1,3,'vmesni èas','22.10.2016 9:04:37.943')
INSERT INTO MERITEV VALUES (1,2,NULL,1,4,'vmesni èas','22.10.2016 9:04:59.97')
INSERT INTO MERITEV VALUES (1,2,NULL,1,5,'cilj','22.10.2016 9:05:05.999')

INSERT INTO MERITEV VALUES (1,5,NULL,1,1,'start','22.10.2016 9:06:04.997')
INSERT INTO MERITEV VALUES (1,5,NULL,1,2,'vmesni èas','22.10.2016 9:06:17.997')
INSERT INTO MERITEV VALUES (1,5,NULL,1,3,'vmesni èas','22.10.2016 9:06:37.943')
INSERT INTO MERITEV VALUES (1,5,NULL,1,4,'vmesni èas','22.10.2016 9:06:59.97')
INSERT INTO MERITEV VALUES (1,5,NULL,1,5,'cilj','22.10.2016 9:07:05.129')


INSERT INTO MERITEV VALUES (1,4,NULL,1,1,'DNS',NULL)


--------------------------------------------------------------------------------------------------

-- 2. tekma



INSERT INTO TEKMA VALUES(2,'m','23.10.2016',1450,3040,2670,46,3,'veleslalom',1)
GO



-------------------------------------------------------------------------------------------------

SELECT
--sekund 
CAST( datediff(millisecond,
	(SELECT cas FROM MERITEV WHERE stevilka_tekme = 1 AND stevilka_tekmovalca = 5 AND vrsta = 'start' ),
	(SELECT cas FROM MERITEV WHERE stevilka_tekme = 1 AND stevilka_tekmovalca = 5 AND vrsta = 'cilj')) / 1000	AS CHAR )
	
	 + 's : ' + 

--stotink
CAST( datediff(millisecond,
	(SELECT cas FROM MERITEV WHERE stevilka_tekme = 1 AND stevilka_tekmovalca = 5 AND vrsta = 'start' ),
	(SELECT cas FROM MERITEV WHERE stevilka_tekme = 1 AND stevilka_tekmovalca = 5 AND vrsta = 'cilj')) % 1000 / 10	AS CHAR)  
	+ 'stotink'
