Use SMUCANJE
go

SET DATEFORMAT DMY
GO

INSERT INTO [dbo].[TEKMOVALCI]([id_tekmovalca],[ime],[priimek],[datum_roj],[drzava],[spol])
VALUES (1, 'Jure', 'Kosir', '15/5/1991', 'Slovenija', 'M'),
	   (2, 'Tina', 'Maze', '19/10/1995', 'Slovenija', 'Ž'),
	   (3, 'Žak', 'Paradižnik', '24/2/1999', 'Slovenija', 'M'),
	   (4, 'Tibor', 'Zupan', '9/3/1999', 'Slovenija', 'M'),
	   (5, 'Ana', 'Bombek', '19/3/1999', 'Slovenija', 'Ž')
	   
GO

INSERT INTO [dbo].[PRIZORISCA]([id_prizorisca],[ime],[drzava],[nadmorska_visina])
VALUES (1, 'Kranjska gora', 'Slovenija', 1800),
	   (2, 'Maribor', 'Slovenija', 1400),
	   (3, 'Rogla', 'Slovenija', 1500)
GO

INSERT INTO [dbo].[TEKME]([id_tekme],[dolzina_proge],[visina_starta],[visina_cilja],[st_vratc],[id_prizorisca])
VALUES (1, 300, 1388, 1350, 15, 2),
	   (2, 600, 1490, 1400, 40, 3),
	   (3, 450, 1740, 1690, 30, 1),
	   (4, 200, 1490, 1450, 20, 2),
	   (5, 222, 1740, 1700, 25, 1)
GO

INSERT INTO [dbo].[STEVILKA_NA_TEKMI]([id_tekmovalca],[id_tekme],[tekmovalna_st])
VALUES (1, 1, 3),
	   (2, 1, 2),
	   (3, 1, 1),
	   (4, 1, 4),
	   (5, 1, 5),

	   (1, 2, 1),
	   (2, 2, 2),
	   (3, 2, 3),
	   (4, 2, 4),
	   (5, 2, 5),

	   (1, 3, 3),
	   (2, 3, NULL),
	   (3, 3, 1),
	   (4, 3, 2),
	   (5, 3, NULL),

	   (1, 4, NULL),
	   (2, 4, 1),
	   (3, 4, NULL),
	   (4, 4, NULL),
	   (5, 4, 2),

	   (1, 5, 1),
	   (2, 5, 2),
	   (3, 5, 5),
	   (4, 5, 3),
	   (5, 5, 4)
GO

INSERT INTO [dbo].[CASI] ([id],[vrsta_casa],[stevilka_teka],[cas],[lokalni_cas_starta],[id_tekmovalca],[id_tekme])
VALUES (1, 'vmesni', 1, '9/12/2010 14:20:05:012', '9/12/2010 14:20:03:012', 1, 1),
	   (2, 'konec', 1, '9/12/2010 14:20:27:142', '9/12/2010 14:20:03:012', 1, 1),
	   (3, 'konec', 2, '9/12/2010 13:51:15:142', '9/12/2010 13:50:50:612', 2, 1),
	   (4, 'konec', 1, '24/12/2017 12:31:15:142', '24/12/2017 12:30:50:612', 2, 4)
GO