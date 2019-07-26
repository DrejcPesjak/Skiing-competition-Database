/*
Created		3.5.2017
Modified		3.5.2017
Project		
Model		
Company		
Author		
Version		
Database		MS SQL 7 
*/


--Drop table [TEKMOVALCI] 
--go
--Drop table [CASI] 
--go
--Drop table [STEVILKA_NA_TEKMI] 
--go
--Drop table [PRIZORISCA] 
--go
--Drop table [TEKME] 
--go

Create database SMUCANJE
go

Use SMUCANJE
go

Create table [TEKME] (
	[id_tekme] Integer NOT NULL,
	[dolzina_proge] Integer NOT NULL,
	[visina_starta] Integer NOT NULL,
	[visina_cilja] Integer NOT NULL,
	[st_vratc] Integer NOT NULL,
	[id_prizorisca] Char(10) NOT NULL,
Primary Key  ([id_tekme])
) 
go

Create table [PRIZORISCA] (
	[id_prizorisca] Char(10) NOT NULL,
	[ime] Nvarchar(100) NOT NULL,
	[drzava] Nvarchar(50) NOT NULL,
	[nadmorska_visina] Integer NOT NULL,
Primary Key  ([id_prizorisca])
) 
go

Create table [STEVILKA_NA_TEKMI] (
	[id_tekmovalca] Integer NOT NULL,
	[id_tekme] Integer NOT NULL,
	[tekmovalna_st] Integer,
Primary Key  ([id_tekmovalca],[id_tekme])
) 
go

Create table [CASI] (
	[id] Integer NOT NULL,
	[vrsta_casa] Nvarchar(6) NOT NULL,
	[stevilka_teka] Integer NOT NULL,
	[cas] Datetime NOT NULL,
	[lokalni_cas_starta] Datetime NOT NULL,
	[id_tekmovalca] Integer NOT NULL,
	[id_tekme] Integer NOT NULL,
Primary Key  ([id])
) 
go

Create table [TEKMOVALCI] (
	[id_tekmovalca] Integer NOT NULL,
	[ime] Nvarchar(50) NOT NULL,
	[priimek] Nvarchar(50) NOT NULL,
	[datum_roj] Datetime NOT NULL,
	[drzava] Nvarchar(50) NOT NULL,
	[spol] Char(1) NOT NULL,
Primary Key  ([id_tekmovalca])
) 
go


Alter table [STEVILKA_NA_TEKMI] add  foreign key([id_tekme]) references [TEKME] ([id_tekme]) 
go
Alter table [CASI] add  foreign key([id_tekme]) references [TEKME] ([id_tekme]) 
go
Alter table [TEKME] add  foreign key([id_prizorisca]) references [PRIZORISCA] ([id_prizorisca]) 
go
Alter table [STEVILKA_NA_TEKMI] add  foreign key([id_tekmovalca]) references [TEKMOVALCI] ([id_tekmovalca]) 
go
Alter table [CASI] add  foreign key([id_tekmovalca]) references [TEKMOVALCI] ([id_tekmovalca]) 
go


Set quoted_identifier on
go


Set quoted_identifier off
go


/* Roles permissions */


/* Users permissions */


