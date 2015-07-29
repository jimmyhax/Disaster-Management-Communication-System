
--ADMIN PORTAL SCRIPT

BEGIN TRANSACTION

GO
/****** Object:  Table [dbo].[Members]    Script Date: 07/12/2012 18:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[MemberID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](128) NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[Avatar] [nvarchar](64) NULL,
	[IsEnable] [int] NOT NULL,
	[IsBuiltIn] [int] NOT NULL,
	[LastLogin] [datetime] NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NULL,
	[TimeZoneID] [nvarchar](64) NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_Members] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_Members_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC,
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Members] ON
INSERT [dbo].[Members] ([MemberID], [Name], [Email], [Password], [Avatar], [IsEnable], [IsBuiltIn], [LastLogin], [Created], [Modified], [TimeZoneID]) VALUES (1, N'Admin', N'admin@demo.com', N'767172637656486A3444756A6644794C34763231464B50425745513D', NULL, 0, 1, CAST(0x0000A08C00FEDAD8 AS DateTime), CAST(0x0000A0120143DDC8 AS DateTime), CAST(0x0000A08C00FF2A7D AS DateTime), N'FLE Standard Time')
INSERT [dbo].[Members] ([MemberID], [Name], [Email], [Password], [Avatar], [IsEnable], [IsBuiltIn], [LastLogin], [Created], [Modified], [TimeZoneID]) VALUES (2, N'Example Site', N'example@demo.com', N'72633957716A5052616B664A4767476D737859356C783343706C733D', NULL, 0, 0, NULL, CAST(0x0000A05F008B6818 AS DateTime), CAST(0x0000A06900DA8293 AS DateTime), NULL)
INSERT [dbo].[Members] ([MemberID], [Name], [Email], [Password], [Avatar], [IsEnable], [IsBuiltIn], [LastLogin], [Created], [Modified], [TimeZoneID]) VALUES (3, N'Viewer', N'viewer@demo.com', N'49384E2B7457394D59315279474D747631633350623178784343303D', NULL, 0, 0, CAST(0x0000A05F00912B4E AS DateTime), CAST(0x0000A05F0090A4B7 AS DateTime), CAST(0x0000A06E00558A61 AS DateTime), NULL)
INSERT [dbo].[Members] ([MemberID], [Name], [Email], [Password], [Avatar], [IsEnable], [IsBuiltIn], [LastLogin], [Created], [Modified], [TimeZoneID]) VALUES (4, N'Editor', N'editor@demo.com', N'4A37316C385361494C46396978512F4E413865572B754A376E64553D', NULL, 0, 0, CAST(0x0000A07400D756D5 AS DateTime), CAST(0x0000A05F0090DAED AS DateTime), CAST(0x0000A06E0055B97F AS DateTime), NULL)
INSERT [dbo].[Members] ([MemberID], [Name], [Email], [Password], [Avatar], [IsEnable], [IsBuiltIn], [LastLogin], [Created], [Modified], [TimeZoneID]) VALUES (5, N'Demo', N'demo@demo.com', N'6E34353976784532496D716B66367A6B454952782B3239576664343D', NULL, 0, 0, NULL, CAST(0x0000A06900D273A2 AS DateTime), CAST(0x0000A06900DAF344 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Members] OFF
/****** Object:  Table [dbo].[Languages]    Script Date: 07/12/2012 18:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Languages](
	[LanguageID] [int] NOT NULL,
	[Code] [varchar](3) NOT NULL,
	[EnglishName] [nvarchar](128) NOT NULL,
	[NativeName] [nvarchar](128) NULL,
	[IsEnabled] [int] NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[LanguageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (1, N'ACE', N'Achinese', N'Bahsa Acèh', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (2, N'ACH', N'Acoli', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (3, N'ADA', N'Adangme', N'adangbɛ', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (4, N'AFA', N'Afro-Asiatic (Other)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (5, N'AFH', N'Afrihili (Artificial language)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (6, N'AFR', N'Afrikaans', N'Afrikaans', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (7, N'AJM', N'Aljamia', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (8, N'AKK', N'Akkadian', N'akkadû, lišānum akkadītum', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (9, N'ALB', N'Albanian', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (10, N'ALE', N'Aleut', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (11, N'ALG', N'Algonquian languages', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (12, N'AMH', N'Amharic', N'አማርኛ', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (13, N'ANG', N'English, Old (ca. 450-1100)', N'Englisc', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (14, N'APA', N'Apache languages', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (15, N'ARA', N'Arabic', N'العربية', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (16, N'ARC', N'Aramaic', N'ܐܪܡܝܐ', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (17, N'ARM', N'Armenian', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (18, N'ARN', N'Araucanian', N'mapudungun, mapuchedungun', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (19, N'ARP', N'Arapaho', N'Hinóno''eitíít', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (20, N'ART', N'Artificial (Other)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (21, N'ARW', N'Arawak', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (22, N'ASM', N'Assamese', N'অসমীয়া', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (23, N'ATH', N'Athapascan languages', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (24, N'AVA', N'Avaric', N'авар мацӀ, магӀарул мацӀ', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (25, N'AVE', N'Avestan', N'avesta', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (26, N'AWA', N'Awadhi', N'अवधी', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (27, N'AYM', N'Aymara', N'aymar aru', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (28, N'AZE', N'Azerbaijani', N'Azərbaycanca', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (29, N'BAD', N'Banda', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (30, N'BAI', N'Bamileke languages', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (31, N'BAK', N'Bashkir', N'башҡорт теле', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (32, N'BAL', N'Baluchi', N'بلوچی', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (33, N'BAM', N'Bambara', N'bamanankan', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (34, N'BAN', N'Balinese', N'Basa Bali', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (35, N'BAQ', N'Basque', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (36, N'BAS', N'Basa', N'ɓasaá', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (37, N'BAT', N'Baltic (Other)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (38, N'BEJ', N'Beja', N'بداوية', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (39, N'BEL', N'Byelorussian', N'Беларуская мова', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (40, N'BEM', N'Bemba', N'ichiBemba', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (41, N'BEN', N'Bengali', N'বাংলা', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (42, N'BER', N'Berber languages', N'Tamazight / Tamaziɣt', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (43, N'BHO', N'Bhojpuri', N'भोजपुरी', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (44, N'BIK', N'Bikol', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (45, N'BIN', N'Bini', N'Edo', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (46, N'BLA', N'Siksika', N'siksiká,  ᓱᖽᐧᖿ', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (47, N'BRA', N'Braj', N'ब्रज भाषा', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (48, N'BRE', N'Breton', N'brezhoneg', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (49, N'BUG', N'Buginese', N'', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (50, N'BUL', N'Bulgarian', N'български език', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (51, N'BUR', N'Burmese', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (52, N'CAD', N'Caddo', N'Hasí:nay', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (53, N'CAI', N'Central American Indian (Other)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (54, N'CAM', N'Khmer', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (55, N'CAR', N'Carib', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (56, N'CAT', N'Catalan', N'català / valencià', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (57, N'CAU', N'Caucasian (Other)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (58, N'CEB', N'Cebuano', N'Sinugboanon', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (59, N'CEL', N'Celtic languages', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (60, N'CHA', N'Chamorro', N'Chamoru', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (61, N'CHB', N'Chibcha', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (62, N'CHE', N'Chechen', N'нохчийн мотт', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (63, N'CHG', N'Chagatai', N'جغتای', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (64, N'CHI', N'Chinese', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (65, N'CHN', N'Chinook jargon', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (66, N'CHO', N'Choctaw', N'Chahta Anumpa', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (67, N'CHR', N'Cherokee', N'ᏣᎳᎩ', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (68, N'CHU', N'Church Slavic', N'ѩзыкъ словѣньскъ', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (69, N'CHV', N'Chuvash', N'чӑваш чӗлхи', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (70, N'CHY', N'Cheyenne', N'Tsêhést', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (71, N'COP', N'Coptic', N'', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (72, N'COR', N'Cornish', N'Kernewek', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (73, N'CPE', N'Creoles and Pidgins, English', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (74, N'CPF', N'Creoles and Pidgins, French', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (75, N'CPP', N'Creoles and Pidgins, Portuguese', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (76, N'CRE', N'Cree', N'ᓀᐦᐃᔭᐍᐏᐣ', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (77, N'CRP', N'Creoles and Pidgins (Other)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (78, N'CUS', N'Cushitic (Other)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (79, N'CZE', N'Czech', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (80, N'DAK', N'Dakota', N'Lakhota', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (81, N'DAN', N'Danish', N'dansk', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (82, N'DEL', N'Delaware', N'Lënape', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (83, N'DIN', N'Dinka', N'Thuɔŋjäŋ', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (84, N'DOI', N'Dogri', N'डोगरी', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (85, N'DRA', N'Dravidian (Other)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (86, N'DUA', N'Duala', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (87, N'DUM', N'Dutch, Middle ca. 1050-1350', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (88, N'DUT', N'Dutch', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (89, N'DYU', N'Dyula', N'Julakan', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (90, N'EFI', N'Efik', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (91, N'EGY', N'Egyptian', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (92, N'EKA', N'Ekajuk', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (93, N'ELX', N'Elamite', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (94, N'ENG', N'English', N'English', 1)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (95, N'ENM', N'English, Middle (1100-1500)', N'English', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (96, N'ESK', N'Eskimo', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (97, N'ESP', N'Esperanto', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (98, N'EST', N'Estonian', N'eesti keel', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (99, N'ETH', N'Ethiopic', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (100, N'EWE', N'Ewe', N'Ɛʋɛgbɛ', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (101, N'EWO', N'Ewondo', NULL, 0)
GO
print 'Processed 100 total records'
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (102, N'FAN', N'Fang', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (103, N'FAR', N'Faroese', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (104, N'FAT', N'Fanti', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (105, N'FIJ', N'Fijian', N'vosa Vakaviti', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (106, N'FIN', N'Finnish', N'suomi, suomen kieli', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (107, N'FIU', N'Finno-Ugrian (Other)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (108, N'FON', N'Fon', N'Fɔngbe', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (109, N'FRE', N'French', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (110, N'FRI', N'Friesian', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (111, N'FRM', N'French, Middle (ca. 1400-1600)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (112, N'FRO', N'French, Old (ca. 842-1400)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (113, N'FUL', N'Fula', N'Fulfulde, Pulaar, Pular', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (114, N'GAA', N'Gþ', N'Gã', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (115, N'GAE', N'Gaelic (Scots)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (116, N'GAG', N'Gallegan', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (117, N'GAL', N'Oromo', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (118, N'GAY', N'Gayo', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (119, N'GEM', N'Germanic (Other)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (120, N'GEO', N'Georgian', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (121, N'GER', N'German', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (122, N'GIL', N'Gilbertese', N'taetae ni Kiribati', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (123, N'GMH', N'German, Middle High ca.1050-1500', N'diutisk', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (124, N'GOH', N'German, Old High ca.750-1050', N'diutisc', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (125, N'GON', N'Gondi', N'Gōndi', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (126, N'GOT', N'Gothic', N'', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (127, N'GRB', N'Grebo', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (128, N'GRC', N'Greek, Ancient (to 1453)', N'Ἑλληνικά', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (129, N'GRE', N'Greek, Modern (1453- )', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (130, N'GUA', N'Guarani', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (131, N'GUJ', N'Gujarati', N'ગુજરાતી', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (132, N'HAI', N'Haida', N'X̲aat Kíl', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (133, N'HAU', N'Hausa', N'Hausancī, هَوُسَ', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (134, N'HAW', N'Hawaiian', N'‘Ōlelo Hawai‘i', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (135, N'HEB', N'Hebrew', N'עִבְרִית, עברית', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (136, N'HER', N'Herero', N'Otjiherero', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (137, N'HIL', N'Hiligaynon', N'Ilonggo', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (138, N'HIM', N'Himachali', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (139, N'HIN', N'Hindi', N'हिन्दी', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (140, N'HMO', N'Hiri Motu', N'Hiri Motu', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (141, N'HUN', N'Hungarian', N'magyar', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (142, N'HUP', N'Hupa', N'Na:tinixwe Mixine:whe', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (143, N'IBA', N'Iban', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (144, N'IBO', N'Igbo', N'Igbo', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (145, N'ICE', N'Icelandic', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (146, N'IJO', N'Ijo', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (147, N'ILO', N'Iloko', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (148, N'INC', N'Indic (Other)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (149, N'IND', N'Indonesian', N'Bahasa Indonesia', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (150, N'INE', N'Indo-European (Other)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (151, N'INT', N'Interlingua', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (152, N'IRA', N'Iranian (Other)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (153, N'IRI', N'Irish', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (154, N'IRO', N'Iroquoian languages', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (155, N'ITA', N'Italian', N'italiano', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (156, N'JAV', N'Javanese', N'basa Jawa', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (157, N'JPN', N'Japanese', N'日本語 (にほんご)', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (158, N'JPR', N'Judeo-Persian', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (159, N'JRB', N'Judeo-Arabic', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (160, N'KAA', N'Kara-Kalpak', N'қарақалпақ тили', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (161, N'KAB', N'Kabyle', N'Taqbaylit', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (162, N'KAC', N'Kachin', N'Jingpho, Marip', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (163, N'KAM', N'Kamba', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (164, N'KAN', N'Kannada', N'ಕನ್ನಡ', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (165, N'KAR', N'Karen', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (166, N'KAS', N'Kashmiri', N'कॉशुर, کٲشُر', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (167, N'KAU', N'Kanuri', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (168, N'KAW', N'Kawi', N'Bhāṣa Kawi', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (169, N'KAZ', N'Kazakh', N'Қазақ тілі', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (170, N'KHA', N'Khasi', N'Khasi', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (171, N'KHI', N'Khoisan (Other)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (172, N'KHO', N'Khotanese', N'ancient', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (173, N'KIK', N'Kikuyu', N'Gĩkũyũ', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (174, N'KIN', N'Kinyarwanda', N'Ikinyarwanda', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (175, N'KIR', N'Kirghiz', N'кыргыз тили', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (176, N'KOK', N'Konkani', N'कॊंकणि', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (177, N'KON', N'Kongo', N'Kikongo', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (178, N'KOR', N'Korean', N'한국어 (韓國語), 조선말 (朝鮮語)', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (179, N'KPE', N'Kpelle', N'kpele', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (180, N'KRO', N'Kru', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (181, N'KRU', N'Kurukh', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (182, N'KUA', N'Kuanyama', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (183, N'KUR', N'Kurdish', N'Kurdî', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (184, N'KUS', N'Kusaie', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (185, N'KUT', N'Kutenai', N'Ktunaxa', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (186, N'LAD', N'Ladino', N'ג''ודיאו-איספאנייול', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (187, N'LAH', N'Lahnd', N'ਲਹਿੰਦੀ', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (188, N'LAM', N'Lamba', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (189, N'LAN', N'Langue d''oc (post-1500)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (190, N'LAO', N'Lao', N'ພາສາລາວ', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (191, N'LAP', N'Lapp', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (192, N'LAT', N'Latin', N'latine, lingua Latina', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (193, N'LAV', N'Latvian', N'latviešu valoda', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (194, N'LIN', N'Lingala', N'lingala', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (195, N'LIT', N'Lithuanian', N'lietuvių kalba', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (196, N'LOL', N'Mongo', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (197, N'LOZ', N'Lozi', N'siLozi', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (198, N'LUB', N'Luba-Katanga', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (199, N'LUG', N'Ganda', N'Luganda', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (200, N'LUI', N'Luiseno', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (201, N'LUN', N'Lunda', N'chiLunda', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (202, N'LUO', N'Luo (Kenya and Tanzania)', N'Dholuo', 0)
GO
print 'Processed 200 total records'
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (203, N'MAC', N'Macedonian', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (204, N'MAD', N'Madurese', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (205, N'MAG', N'Magahi', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (206, N'MAH', N'Marshall', N'Kajin M̧ajeļ', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (207, N'MAI', N'Maithili', N'मैथिली', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (208, N'MAK', N'Makasar', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (209, N'MAL', N'Malayalam', N'മലയാളം', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (210, N'MAN', N'Mandingo', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (211, N'MAO', N'Maori', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (212, N'MAP', N'Austronesian (Other)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (213, N'MAR', N'Marathi', N'मराठी', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (214, N'MAS', N'Masai', N'ɔl Maa', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (215, N'MAX', N'Manx', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (216, N'MAY', N'Malay', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (217, N'MEN', N'Mende', N'Mɛnde', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (218, N'MIC', N'Micmac', N'Míkmaq, Mi''gmaq', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (219, N'MIN', N'Minangkabau', N'Baso Minangkabau', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (220, N'MIS', N'Miscellaneous (Other)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (221, N'MKH', N'Mon-Khmer (Other)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (222, N'MLA', N'Malagasy', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (223, N'MLT', N'Maltese', N'Malti', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (224, N'MNI', N'Manipuri', N'মৈইতৈইলোন', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (225, N'MNO', N'Manobo languages', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (226, N'MOH', N'Mohawk', N'Kanien’keha', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (227, N'MOL', N'Moldavian', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (228, N'MON', N'Mongolian', N'монгол хэл', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (230, N'MUL', N'Multiple languages', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (231, N'MUN', N'Munda (Other)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (232, N'MUS', N'Creek', N'Maskoki, Mvskokē empunakv', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (233, N'MWR', N'Marwari', N'मारवाड़ी', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (234, N'MYN', N'Mayan languages', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (235, N'NAH', N'Aztec', N'nāhuatl, nawatlahtolli', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (236, N'NAI', N'North American Indian (Other)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (237, N'NAV', N'Navajo', N'Diné bizaad, Dinékʼehǰí', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (238, N'NDE', N'Ndebele (Zimbabwe)', N'isiNdebele', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (239, N'NDO', N'Ndonga', N'Owambo', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (240, N'NEP', N'Nepali', N'नेपाली', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (241, N'NEW', N'Newari', N'Nepal Bhasa', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (242, N'NIC', N'Niger-Kordofanian (Other)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (243, N'NIU', N'Niuean', N'ko e vagahau Niuē, faka-Niue', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (244, N'NOR', N'Norwegian', N'norsk', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (245, N'NSO', N'Northern Sotho', N'Sesotho sa Leboa, Sepedi', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (246, N'NUB', N'Nubian languages', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (247, N'NYA', N'Nyanja', N'chiCheŵa, chinyanja', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (248, N'NYM', N'Nyamwezi', N'Kinyamwezi', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (249, N'NYN', N'Nyankole', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (250, N'NYO', N'Nyoro', N'Runyoro', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (251, N'NZI', N'Nzimav', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (252, N'OJI', N'Ojibwa', N'ᐊᓂᔑᓇᐯᒧᐏᐣ (Anishinaabemowin)', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (253, N'ORI', N'Oriya', N'ଓଡ଼ିଆ', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (254, N'OSA', N'Osage', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (255, N'OSS', N'Ossetic', N'ирон ӕвзаг', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (256, N'OTA', N'Turkish, Ottoman', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (257, N'OTO', N'Otomian languages', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (258, N'PAA', N'Papuan-Australian (Other)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (259, N'PAG', N'Pangasinan', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (260, N'PAL', N'Pahlavi', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (261, N'PAM', N'Pampanga', N'Kapampangan', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (262, N'PAN', N'Panjabi', N'ਪੰਜਾਬੀ, پنجابی', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (263, N'PAP', N'Papiamento', N'Papiamentu', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (264, N'PAU', N'Palauan', N'tekoi ra Belau', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (265, N'PEO', N'Old Persian (ca. 600-400 B.C.)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (266, N'PER', N'Persian', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (267, N'PLI', N'Pali', N'पालि', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (268, N'POL', N'Polish', N'polski', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (269, N'PON', N'Ponape', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (270, N'POR', N'Portuguese', N'português', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (271, N'PRA', N'Prakrit languages', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (272, N'PRO', N'Provencal, Old (to 1500)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (273, N'PUS', N'Pushto', N'پښتو', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (274, N'QUE', N'Quechua', N'Runa Simi, Kichwa', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (275, N'RAJ', N'Rajasthani', N'राजस्थानी', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (276, N'RAR', N'Rarotongan', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (277, N'ROA', N'Romance (Other)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (278, N'ROH', N'Raeto-Romance', N'rumantsch grischun', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (279, N'ROM', N'Romany', N'rromani ćhib, Romani šib, Romanó', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (280, N'RUM', N'Romanian', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (281, N'RUN', N'Rundi', N'Rundi', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (282, N'RUS', N'Russian', N'русский язык', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (283, N'SAD', N'Sandawe', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (284, N'SAG', N'Sango', N'yângâ tî sängö', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (285, N'SAI', N'South American Indian (Other)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (286, N'SAL', N'Salishan languages', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (287, N'SAM', N'Samaritan Aramaic', N'ארמית, ܐܪܡܝܐ', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (288, N'SAN', N'Sanskrit', N'संस्कृतम्', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (289, N'SAO', N'Samoan', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (290, N'SCC', N'Serbo-Croatian (Cyrillic)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (291, N'SCO', N'Scots', N'Scots leid, Lallans', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (292, N'SCR', N'Serbo-Croatian (Roman)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (293, N'SEL', N'Selkup', N'шӧльӄумыт әты', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (294, N'SEM', N'Semitic (Other)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (295, N'SHN', N'Shan', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (296, N'SHO', N'Shona', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (297, N'SID', N'Sidamo', N'Sidámo ''Afó', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (298, N'SIO', N'Siouan languages', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (299, N'SIT', N'Sino-Tibetan (Other)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (300, N'SLA', N'Slavic (Other)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (301, N'SLO', N'Slovak', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (302, N'SLV', N'Slovenian', N'slovenščina', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (303, N'SND', N'Sindhi', N'سنڌي، سندھی, सिन्धी', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (304, N'SNH', N'Sinhalese', NULL, 0)
GO
print 'Processed 300 total records'
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (305, N'SOM', N'Somali', N'Soomaaliga, af Soomaali', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (306, N'SON', N'Songhai', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (307, N'SPA', N'Spanish', N'español, castellano', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (308, N'SRR', N'Serer', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (309, N'SSO', N'Sotho', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (310, N'SUK', N'Sukuma', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (311, N'SUN', N'Sundanese', N'basa Sunda', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (312, N'SUS', N'Susu', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (313, N'SUX', N'Sumerian', N'eme-ĝir', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (314, N'SWA', N'Swahili', N'Kiswahili', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (315, N'SWZ', N'Swazi', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (316, N'SYR', N'Syriac', N'ܣܘܪܝܝܐ', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (317, N'TAG', N'Tagalog', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (318, N'TAH', N'Tahitian', N'te reo Tahiti, te reo Māʼohi', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (319, N'TAJ', N'Tajik', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (320, N'TAM', N'Tamil', N'தமிழ்', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (321, N'TAR', N'Tatar', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (322, N'TEL', N'Telugu', N'తెలుగు', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (323, N'TEM', N'Timne', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (324, N'TER', N'Tereno', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (325, N'THA', N'Thai', N'ภาษาไทย', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (326, N'TIB', N'Tibetan', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (327, N'TIG', N'Tigre', N'Tigré, Khasa', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (328, N'TIR', N'Tigrinya', N'ትግርኛ', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (329, N'TIV', N'Tivi', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (330, N'TLI', N'Tlingit', N'Lingít', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (331, N'TOG', N'Tonga (Nyasa)', N'chiTonga', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (332, N'TON', N'Tonga (Tonga Islands)', N'faka-Tonga', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (333, N'TRU', N'Truk', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (334, N'TSI', N'Tsimshian', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (335, N'TSO', N'Tsonga', N'Xitsonga', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (336, N'TSW', N'Tswana', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (337, N'TUK', N'Turkmen', N'Түркмен', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (338, N'TUM', N'Tumbuka', N'chiTumbuka', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (339, N'TUR', N'Turkish', N'Türkçe', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (340, N'TUT', N'Altaic (Other)', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (341, N'TWI', N'Twi', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (342, N'UGA', N'Ugaritic', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (343, N'UIG', N'Uighur', N'Uyƣurqə, Uyğurçe, ئۇيغۇرچ', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (344, N'UKR', N'Ukrainian', N'українська мова', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (345, N'UMB', N'Umbundu', N'úmbúndú', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (346, N'UND', N'Undetermined', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (347, N'URD', N'Urdu', N'اردو', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (348, N'UZB', N'Uzbek', N'O''zbek, Ўзбек, أۇزبېك', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (349, N'VAI', N'Vai', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (350, N'VEN', N'Venda', N'Tshivenḓa', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (351, N'VIE', N'Vietnamese', N'Tiếng Việt', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (352, N'VOT', N'Votic', N'vaďďa tšeeli', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (353, N'WAK', N'Wakashan languages', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (354, N'WAL', N'Walamo', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (355, N'WAR', N'Waray', N'Winaray, Lineyte-Samarnon', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (356, N'WAS', N'Washo', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (357, N'WEL', N'Welsh', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (358, N'WEN', N'Sorbian languages', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (359, N'WOL', N'Wolof', N'Wolof', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (360, N'XHO', N'Xhosa', N'isiXhosa', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (361, N'YAO', N'Yao', N'Chiyao', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (362, N'YAP', N'Yap', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (363, N'YID', N'Yiddish', N'ייִדיש', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (364, N'YOR', N'Yoruba', N'Yorùbá', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (365, N'ZAP', N'Zapotec', NULL, 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (366, N'ZEN', N'Zenaga', N'Tuḍḍungiyya', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (367, N'ZUL', N'Zulu', N'isiZulu', 0)
INSERT [dbo].[Languages] ([LanguageID], [Code], [EnglishName], [NativeName], [IsEnabled]) VALUES (368, N'ZUN', N'Zuni', N'Shiwi', 0)
/****** Object:  Table [dbo].[AuditEventTypes]    Script Date: 07/12/2012 18:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditEventTypes](
	[TypeID] [int] NOT NULL,
	[Description] [nvarchar](1024) NOT NULL,
 CONSTRAINT [PK_AuditEventTypes] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_AuditEventClasses] UNIQUE NONCLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AuditEventTypes] ([TypeID], [Description]) VALUES (1, N'Default')
INSERT [dbo].[AuditEventTypes] ([TypeID], [Description]) VALUES (2, N'Info')
INSERT [dbo].[AuditEventTypes] ([TypeID], [Description]) VALUES (3, N'Success')
INSERT [dbo].[AuditEventTypes] ([TypeID], [Description]) VALUES (4, N'Warning')
INSERT [dbo].[AuditEventTypes] ([TypeID], [Description]) VALUES (5, N'Error')
/****** Object:  Table [dbo].[AuditEventSources]    Script Date: 07/12/2012 18:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditEventSources](
	[SourceID] [int] NOT NULL,
	[Description] [nvarchar](1024) NOT NULL,
 CONSTRAINT [PK_AuditEventSources] PRIMARY KEY CLUSTERED 
(
	[SourceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_AuditEventTypes] UNIQUE NONCLUSTERED 
(
	[SourceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AuditEventSources] ([SourceID], [Description]) VALUES (1, N'App')
INSERT [dbo].[AuditEventSources] ([SourceID], [Description]) VALUES (2, N'System')
INSERT [dbo].[AuditEventSources] ([SourceID], [Description]) VALUES (3, N'API')
/****** Object:  Table [dbo].[ActionTokenTypes]    Script Date: 07/12/2012 18:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionTokenTypes](
	[ActionTypeID] [int] NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_ActionTokenTypes] PRIMARY KEY CLUSTERED 
(
	[ActionTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ActionTokenTypes] ([ActionTypeID], [Description]) VALUES (1, N'Self-Activation')
INSERT [dbo].[ActionTokenTypes] ([ActionTypeID], [Description]) VALUES (2, N'Password Reset')
/****** Object:  Table [dbo].[MemberAttemptTypes]    Script Date: 07/12/2012 18:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberAttemptTypes](
	[MemberAttemptTypeID] [int] NOT NULL,
	[AttemptTypeDescription] [nvarchar](1024) NOT NULL,
 CONSTRAINT [PK_MemberAttemptTypes] PRIMARY KEY CLUSTERED 
(
	[MemberAttemptTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[MemberAttemptTypes] ([MemberAttemptTypeID], [AttemptTypeDescription]) VALUES (1, N'Login Password Failed')
/****** Object:  Table [dbo].[ProfileFieldGroups]    Script Date: 07/12/2012 18:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfileFieldGroups](
	[FieldGroupID] [int] IDENTITY(1,1) NOT NULL,
	[FieldGroupName] [nvarchar](64) NOT NULL,
	[FieldGroupDescription] [nvarchar](1024) NOT NULL,
	[OrderID] [int] NOT NULL,
	[IsActive] [int] NOT NULL,
	[AdminUseOnly] [int] NOT NULL,
 CONSTRAINT [PK_ProfileFieldGroups] PRIMARY KEY CLUSTERED 
(
	[FieldGroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_ProfileFieldGroups] UNIQUE NONCLUSTERED 
(
	[FieldGroupName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ProfileFieldGroups] ON
INSERT [dbo].[ProfileFieldGroups] ([FieldGroupID], [FieldGroupName], [FieldGroupDescription], [OrderID], [IsActive], [AdminUseOnly]) VALUES (1, N'Personal', N'', 1, 1, 0)
INSERT [dbo].[ProfileFieldGroups] ([FieldGroupID], [FieldGroupName], [FieldGroupDescription], [OrderID], [IsActive], [AdminUseOnly]) VALUES (2, N'Payments', N'', 2, 1, 0)
INSERT [dbo].[ProfileFieldGroups] ([FieldGroupID], [FieldGroupName], [FieldGroupDescription], [OrderID], [IsActive], [AdminUseOnly]) VALUES (3, N'Geo Information', N'', 3, 0, 0)
SET IDENTITY_INSERT [dbo].[ProfileFieldGroups] OFF
/****** Object:  Table [dbo].[ParameterTypes]    Script Date: 07/12/2012 18:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParameterTypes](
	[TypeID] [int] NOT NULL,
	[TypeName] [nvarchar](128) NOT NULL,
	[TypeSize] [int] NOT NULL,
 CONSTRAINT [PK_ParameterTypes] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_ParameterTypes] UNIQUE NONCLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_ParameterTypes_1] UNIQUE NONCLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ParameterTypes] ([TypeID], [TypeName], [TypeSize]) VALUES (1, N'ShortString', 64)
INSERT [dbo].[ParameterTypes] ([TypeID], [TypeName], [TypeSize]) VALUES (2, N'LongString', 512)
INSERT [dbo].[ParameterTypes] ([TypeID], [TypeName], [TypeSize]) VALUES (3, N'SmallInteger', 3)
INSERT [dbo].[ParameterTypes] ([TypeID], [TypeName], [TypeSize]) VALUES (4, N'Bool', 4)
INSERT [dbo].[ParameterTypes] ([TypeID], [TypeName], [TypeSize]) VALUES (5, N'RadioInteger', 2)
INSERT [dbo].[ParameterTypes] ([TypeID], [TypeName], [TypeSize]) VALUES (6, N'BigString', 4096)
/****** Object:  Table [dbo].[Roles]    Script Date: 07/12/2012 18:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[IsBuiltIn] [int] NOT NULL,
	[BackColor] [nvarchar](24) NOT NULL,
	[ForeColor] [nvarchar](24) NOT NULL,
	[Settings] [nvarchar](4000) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_Roles] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Roles] ON
INSERT [dbo].[Roles] ([RoleID], [Name], [IsBuiltIn], [BackColor], [ForeColor], [Settings], [Created], [Modified]) VALUES (1, N'Admins', 1, N'c32113', N'White', N'People who care about role and member management', CAST(0x0000A05F00880749 AS DateTime), CAST(0x0000A07000C46255 AS DateTime))
INSERT [dbo].[Roles] ([RoleID], [Name], [IsBuiltIn], [BackColor], [ForeColor], [Settings], [Created], [Modified]) VALUES (2, N'Editor', 0, N'1d4d14', N'White', N'Who has permission to edit something', CAST(0x0000A05F00880749 AS DateTime), CAST(0x0000A068009E8390 AS DateTime))
INSERT [dbo].[Roles] ([RoleID], [Name], [IsBuiltIn], [BackColor], [ForeColor], [Settings], [Created], [Modified]) VALUES (3, N'Viewer', 0, N'0d5e96', N'White', N'Who has permission to view something', CAST(0x0000A05F00880749 AS DateTime), CAST(0x0000A068009E7999 AS DateTime))
INSERT [dbo].[Roles] ([RoleID], [Name], [IsBuiltIn], [BackColor], [ForeColor], [Settings], [Created], [Modified]) VALUES (4, N'Blocked', 1, N'740711', N'White', N'Blocked members for some reason', CAST(0x0000A05F00880749 AS DateTime), CAST(0x0000A068009D5803 AS DateTime))
INSERT [dbo].[Roles] ([RoleID], [Name], [IsBuiltIn], [BackColor], [ForeColor], [Settings], [Created], [Modified]) VALUES (5, N'Self Registered', 1, N'86cc71', N'White', N'Members which registered independently via public UI ', CAST(0x0000A05F00880749 AS DateTime), CAST(0x0000A068009D8A7B AS DateTime))
INSERT [dbo].[Roles] ([RoleID], [Name], [IsBuiltIn], [BackColor], [ForeColor], [Settings], [Created], [Modified]) VALUES (6, N'Not Activated', 1, N'e75560', N'White', N'Members which are not activated using notification email', CAST(0x0000A05F00880749 AS DateTime), CAST(0x0000A068009E560E AS DateTime))
INSERT [dbo].[Roles] ([RoleID], [Name], [IsBuiltIn], [BackColor], [ForeColor], [Settings], [Created], [Modified]) VALUES (7, N'API Members', 1, N'3aa0df', N'White', N'Members which use API for some purposes ', CAST(0x0000A05F00880749 AS DateTime), CAST(0x0000A068009DEC28 AS DateTime))
INSERT [dbo].[Roles] ([RoleID], [Name], [IsBuiltIn], [BackColor], [ForeColor], [Settings], [Created], [Modified]) VALUES (8, N'Self Activated', 1, N'35a220', N'White', N'Members which activated their accounts', CAST(0x0000A05F00880749 AS DateTime), CAST(0x0000A068009E11DB AS DateTime))
INSERT [dbo].[Roles] ([RoleID], [Name], [IsBuiltIn], [BackColor], [ForeColor], [Settings], [Created], [Modified]) VALUES (9, N'A-SocialSignIn', 1, N'1973cc', N'White', N'Members which signed in via Social Networks', CAST(0x0000A0B400D70E50 AS DateTime), CAST(0x0000A0B400ED6A29 AS DateTime))
INSERT [dbo].[Roles] ([RoleID], [Name], [IsBuiltIn], [BackColor], [ForeColor], [Settings], [Created], [Modified]) VALUES (10, N'Twitter', 1, N'40afe5', N'White', N'Members which signed in via Twitter', CAST(0x0000A0B400D72ADD AS DateTime), CAST(0x0000A0B50139ED34 AS DateTime))
INSERT [dbo].[Roles] ([RoleID], [Name], [IsBuiltIn], [BackColor], [ForeColor], [Settings], [Created], [Modified]) VALUES (11, N'Facebook', 1, N'425a9f', N'White', N'Members which signed in via Facebook', CAST(0x0000A0B400D738CC AS DateTime), CAST(0x0000A0B5013A0495 AS DateTime))
INSERT [dbo].[Roles] ([RoleID], [Name], [IsBuiltIn], [BackColor], [ForeColor], [Settings], [Created], [Modified]) VALUES (12, N'Google', 1, N'4763e2', N'White', N'Members which signed in via Google', CAST(0x0000A0B400D743FA AS DateTime), CAST(0x0000A0B5013A1B6C AS DateTime))
INSERT [dbo].[Roles] ([RoleID], [Name], [IsBuiltIn], [BackColor], [ForeColor], [Settings], [Created], [Modified]) VALUES (13, N'Yahoo', 1, N'9400b1', N'White', N'Members which signed in via Yahoo', CAST(0x0000A0B400D74D68 AS DateTime), CAST(0x0000A0B5013A3532 AS DateTime))
INSERT [dbo].[Roles] ([RoleID], [Name], [IsBuiltIn], [BackColor], [ForeColor], [Settings], [Created], [Modified]) VALUES (14, N'Live Journal', 1, N'7796c0', N'White', N'Members which signed in via Live Journal', CAST(0x0000A0B500F270D8 AS DateTime), CAST(0x0000A0B5013A68C0 AS DateTime))
INSERT [dbo].[Roles] ([RoleID], [Name], [IsBuiltIn], [BackColor], [ForeColor], [Settings], [Created], [Modified]) VALUES (15, N'Blogger', 1, N'eb6413', N'White', N'Members which signed in via Blogger', CAST(0x0000A0B500F27967 AS DateTime), CAST(0x0000A0B5013AA358 AS DateTime))
INSERT [dbo].[Roles] ([RoleID], [Name], [IsBuiltIn], [BackColor], [ForeColor], [Settings], [Created], [Modified]) VALUES (16, N'OpenID', 1, N'f7931e', N'White', N'Members which signed in via OpenID', CAST(0x0000A0B500F28699 AS DateTime), CAST(0x0000A0B5013AB9A3 AS DateTime))
INSERT [dbo].[Roles] ([RoleID], [Name], [IsBuiltIn], [BackColor], [ForeColor], [Settings], [Created], [Modified]) VALUES (17, N'My OpenID', 1, N'64b653', N'White', N'Members which signed in via myOpenID', CAST(0x0000A0B501226B88 AS DateTime), CAST(0x0000A0B5013ACD54 AS DateTime))
INSERT [dbo].[Roles] ([RoleID], [Name], [IsBuiltIn], [BackColor], [ForeColor], [Settings], [Created], [Modified]) VALUES (18, N'LDAP', 1, N'328cbd', N'White', N'Members which signed in via LDAP Directory', CAST(0x0000A0B501226B88 AS DateTime), CAST(0x0000A0B5013ACD54 AS DateTime))

SET IDENTITY_INSERT [dbo].[Roles] OFF
/****** Object:  Table [dbo].[ProfileFieldTypes]    Script Date: 07/12/2012 18:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfileFieldTypes](
	[FieldTypeID] [int] NOT NULL,
	[FieldTypeName] [nvarchar](64) NOT NULL,
	[FieldTypeDescription] [nvarchar](1024) NULL,
	[FieldTypeSize] [int] NOT NULL,
 CONSTRAINT [PK_ProfileFieldTypes_1] PRIMARY KEY CLUSTERED 
(
	[FieldTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_ProfileFieldTypes_1] UNIQUE NONCLUSTERED 
(
	[FieldTypeName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ProfileFieldTypes] ([FieldTypeID], [FieldTypeName], [FieldTypeDescription], [FieldTypeSize]) VALUES (1, N'String', N'Free style string (Max length is 32 chars)', 32)
INSERT [dbo].[ProfileFieldTypes] ([FieldTypeID], [FieldTypeName], [FieldTypeDescription], [FieldTypeSize]) VALUES (2, N'StringMultiline', N'Free style long string  (Max length is 2048 chars)', 2048)
INSERT [dbo].[ProfileFieldTypes] ([FieldTypeID], [FieldTypeName], [FieldTypeDescription], [FieldTypeSize]) VALUES (3, N'Number', N'Free style number', 10)
INSERT [dbo].[ProfileFieldTypes] ([FieldTypeID], [FieldTypeName], [FieldTypeDescription], [FieldTypeSize]) VALUES (4, N'SingleSelectList', N'Single select from list of values', 0)
INSERT [dbo].[ProfileFieldTypes] ([FieldTypeID], [FieldTypeName], [FieldTypeDescription], [FieldTypeSize]) VALUES (5, N'MultiSelectList', N'Multiple select from list of values', 0)
INSERT [dbo].[ProfileFieldTypes] ([FieldTypeID], [FieldTypeName], [FieldTypeDescription], [FieldTypeSize]) VALUES (6, N'CheckBox', N'Checkbox', 0)
INSERT [dbo].[ProfileFieldTypes] ([FieldTypeID], [FieldTypeName], [FieldTypeDescription], [FieldTypeSize]) VALUES (7, N'RadioBoxGroup', N'Radio box group', 0)
INSERT [dbo].[ProfileFieldTypes] ([FieldTypeID], [FieldTypeName], [FieldTypeDescription], [FieldTypeSize]) VALUES (8, N'ComboBox', N'String from the dropdown list', 0)
/****** Object:  Table [dbo].[ProfileFields]    Script Date: 07/12/2012 18:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfileFields](
	[FieldID] [int] IDENTITY(1,1) NOT NULL,
	[FieldTypeID] [int] NOT NULL,
	[FieldName] [nvarchar](64) NOT NULL,
	[Comment] [ntext] NULL,
	[PossibleValues] [ntext] NULL,
	[TextSelectValue] [nvarchar](64) NULL,
	[IsMandatory] [int] NOT NULL,
	[ShowInSignUp] [int] NOT NULL,
	[FieldGroupID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NULL,
	[SortValues] [int] NULL,
	[IsActive] [int] NOT NULL,
	[AdminUseOnly] [int] NOT NULL,
	[VerticalLayout] [int] NOT NULL,
    [Encrypted] [int] NULL,
 CONSTRAINT [PK_ProfileFields] PRIMARY KEY CLUSTERED 
(
	[FieldID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_ProfileFields] UNIQUE NONCLUSTERED 
(
	[FieldName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ProfileFields] ON
INSERT [dbo].[ProfileFields] ([FieldID], [FieldTypeID], [FieldName], [Comment], [PossibleValues], [TextSelectValue], [IsMandatory], [ShowInSignUp], [FieldGroupID], [OrderID], [Created], [Modified], [SortValues], [IsActive], [AdminUseOnly], [VerticalLayout]) VALUES (63, 1, N'First name', N'First name as in passport', NULL, NULL, 1, 1, 1, 1, CAST(0x0000A06E00E6B680 AS DateTime), NULL, 1, 1, 0, 0)
INSERT [dbo].[ProfileFields] ([FieldID], [FieldTypeID], [FieldName], [Comment], [PossibleValues], [TextSelectValue], [IsMandatory], [ShowInSignUp], [FieldGroupID], [OrderID], [Created], [Modified], [SortValues], [IsActive], [AdminUseOnly], [VerticalLayout]) VALUES (64, 1, N'Family name', N'Family name  as in passport', NULL, NULL, 1, 1, 1, 2, CAST(0x0000A06E00E6B680 AS DateTime), NULL, 1, 1, 0, 0)
INSERT [dbo].[ProfileFields] ([FieldID], [FieldTypeID], [FieldName], [Comment], [PossibleValues], [TextSelectValue], [IsMandatory], [ShowInSignUp], [FieldGroupID], [OrderID], [Created], [Modified], [SortValues], [IsActive], [AdminUseOnly], [VerticalLayout]) VALUES (65, 1, N'Birth Date', N'Please use the following format dd.mm.yyyy', NULL, NULL, 1, 1, 1, 8, CAST(0x0000A06E00E6B680 AS DateTime), NULL, 1, 1, 0, 0)
INSERT [dbo].[ProfileFields] ([FieldID], [FieldTypeID], [FieldName], [Comment], [PossibleValues], [TextSelectValue], [IsMandatory], [ShowInSignUp], [FieldGroupID], [OrderID], [Created], [Modified], [SortValues], [IsActive], [AdminUseOnly], [VerticalLayout]) VALUES (66, 8, N'Gender', N'Please select your gender', N'Male; Female', N'Please select your option', 1, 1, 1, 3, CAST(0x0000A06E00E6B680 AS DateTime), NULL, 1, 1, 0, 0)
INSERT [dbo].[ProfileFields] ([FieldID], [FieldTypeID], [FieldName], [Comment], [PossibleValues], [TextSelectValue], [IsMandatory], [ShowInSignUp], [FieldGroupID], [OrderID], [Created], [Modified], [SortValues], [IsActive], [AdminUseOnly], [VerticalLayout]) VALUES (67, 8, N'Country', N'Select your country', N'Andorra; United Arab Emirates; Afghanistan; Antigua and Barbuda; Anguilla;Albania;Armenia;Netherlands Antilles;Angola;Antarctica;Argentina;American Samoa;Austria;Australia;Aruba;Aland Islands;Azerbaijan;Bosnia and Herzegovina;Barbados;Bangladesh;Belgium;Burkina Faso;Bulgaria;Bahrain;Burundi;Benin;Saint Barthelemy;Bermuda;Brunei;Bolivia;Brazil;The Bahamas;Bhutan;Bouvet Island;Botswana;Belarus;Belize;Canada;Cocos (Keeling) Islands;Democratic Republic of the Congo;Central African Republic;Republic of the Congo;Switzerland;Ivory Coast;Cook Islands;Chile;Cameroon;China;Colombia;Costa Rica;Cuba;Cape Verde;Christmas Island;Cyprus;Czech Republic;Germany;Djibouti;Denmark;Dominica;Dominican Republic;Algeria;Ecuador;Estonia;Egypt;Western Sahara;Eritrea;Spain;Ethiopia;Finland;Fiji;Falkland Islands;Micronesia;Faroe Islands;France;Gabon;United Kingdom;Grenada;Georgia;French Guiana;Guernsey;Ghana;Gibraltar;Greenland;The Gambia;Guinea;Guadeloupe;Equatorial Guinea;Greece;South Georgia and South Sandwich Islands;Guatemala;Guam;Guinea-Bissau;Guyana;Hong Kong;Heard Island and McDonald Islands;Honduras;Croatia;Haiti;Hungary;Indonesia;Ireland;Israel;Isle of Man;India;British Indian Ocean Territory;Iraq;Iran;Iceland;Italy;Jersey;Jamaica;Jordan;Japan;Kenya;Kyrgyzstan;Cambodia;Kiribati;Comoros;Saint Kitts and Nevis;North Korea;South Korea;Kuwait;Cayman Islands;Kazakhstan;Laos;Lebanon;Saint Lucia;Liechtenstein;Sri Lanka;Liberia;Lesotho;Lithuania;Luxembourg;Latvia;Libya;Morocco;Monaco;Moldova;Montenegro;Saint Martin;Madagascar;Marshall Islands;Macedonia;Mali;Burma;Mongolia;Macau;Northern Mariana Islands;Martinique;Mauritania;Montserrat;Malta;Mauritius;Maldives;Malawi;Mexico;Malaysia;Mozambique;Namibia;New Caledonia;Niger;Norfolk Island;Nigeria;Nicaragua;Netherlands;Norway;Nepal;Nauru;Niue;New Zealand;Oman;Panama;Peru;French Polynesia;Papua New Guinea;Philippines;Pakistan;Poland;Saint Pierre and Miquelon;Pitcairn Islands;Puerto Rico;Palesinian Territory;Portugal;Palau;Paraguay;Qatar;Reunion;Romania;Serbia;Russian Federation;Rwanda;Saudi Arabia;Solomon Islands;Seychelles;Sudan;Sweden;Singapore;Saint Helena;Slovenia;Svalbard;Slovakia;Sierra Leone;San Marino;Senegal;Somalia;Suriname;Sao Tome and Principe;El Salvador;Syria;Swaziland;Turks and Caicos Islands;Chad;French Southern and Antarctic Lands;Togo;Thailand;Tajikistan;Tokelau;Timor-Leste;Turkmenistan;Tunisia;Tonga;Turkey;Trinidad and Tobago;Tuvalu;Taiwan;Tanzania;Ukraine;Uganda;United States Minor Outlying Islands;United States;Uruguay;Uzbekistan;Vatican City;Saint Vincent and the Grenadines;Venezuela;British Virgin Islands;Virgin Islands;Vietnam;Vanuatu;Wallis and Futuna;Samoa;Yemen;Mayotte;South Africa;Zambia;Zimbabwe', N'Please select your option', 1, 1, 1, 4, CAST(0x0000A06E00E6B680 AS DateTime), NULL, 1, 1, 0, 0)
INSERT [dbo].[ProfileFields] ([FieldID], [FieldTypeID], [FieldName], [Comment], [PossibleValues], [TextSelectValue], [IsMandatory], [ShowInSignUp], [FieldGroupID], [OrderID], [Created], [Modified], [SortValues], [IsActive], [AdminUseOnly], [VerticalLayout]) VALUES (68, 1, N'City', N'', NULL, NULL, 1, 1, 1, 6, CAST(0x0000A06E00E6B680 AS DateTime), NULL, 1, 1, 0, 0)
INSERT [dbo].[ProfileFields] ([FieldID], [FieldTypeID], [FieldName], [Comment], [PossibleValues], [TextSelectValue], [IsMandatory], [ShowInSignUp], [FieldGroupID], [OrderID], [Created], [Modified], [SortValues], [IsActive], [AdminUseOnly], [VerticalLayout]) VALUES (69, 1, N'Nationality', N'', NULL, NULL, 1, 1, 1, 7, CAST(0x0000A06E00E6B680 AS DateTime), NULL, 1, 1, 0, 0)
INSERT [dbo].[ProfileFields] ([FieldID], [FieldTypeID], [FieldName], [Comment], [PossibleValues], [TextSelectValue], [IsMandatory], [ShowInSignUp], [FieldGroupID], [OrderID], [Created], [Modified], [SortValues], [IsActive], [AdminUseOnly], [VerticalLayout]) VALUES (70, 1, N'Phone number', N'', NULL, NULL, 1, 1, 1, 9, CAST(0x0000A06E00E6B680 AS DateTime), NULL, 1, 1, 0, 0)
INSERT [dbo].[ProfileFields] ([FieldID], [FieldTypeID], [FieldName], [Comment], [PossibleValues], [TextSelectValue], [IsMandatory], [ShowInSignUp], [FieldGroupID], [OrderID], [Created], [Modified], [SortValues], [IsActive], [AdminUseOnly], [VerticalLayout]) VALUES (71, 1, N'Passport number', N'', NULL, NULL, 1, 1, 1, 10, CAST(0x0000A06E00E6B680 AS DateTime), NULL, 1, 1, 0, 0)
INSERT [dbo].[ProfileFields] ([FieldID], [FieldTypeID], [FieldName], [Comment], [PossibleValues], [TextSelectValue], [IsMandatory], [ShowInSignUp], [FieldGroupID], [OrderID], [Created], [Modified], [SortValues], [IsActive], [AdminUseOnly], [VerticalLayout]) VALUES (73, 1, N'District', N'', NULL, NULL, 1, 1, 1, 5, CAST(0x0000A06E00E6B680 AS DateTime), NULL, 1, 1, 0, 0)
INSERT [dbo].[ProfileFields] ([FieldID], [FieldTypeID], [FieldName], [Comment], [PossibleValues], [TextSelectValue], [IsMandatory], [ShowInSignUp], [FieldGroupID], [OrderID], [Created], [Modified], [SortValues], [IsActive], [AdminUseOnly], [VerticalLayout]) VALUES (77, 1, N'Emergency Contact Name', N'Emergency Contact Name', NULL, NULL, 1, 1, 1, 11, CAST(0x0000A06E00E6B680 AS DateTime), NULL, 1, 1, 0, 0)
INSERT [dbo].[ProfileFields] ([FieldID], [FieldTypeID], [FieldName], [Comment], [PossibleValues], [TextSelectValue], [IsMandatory], [ShowInSignUp], [FieldGroupID], [OrderID], [Created], [Modified], [SortValues], [IsActive], [AdminUseOnly], [VerticalLayout]) VALUES (78, 1, N'Emergency Phone Number', N'Emergency Phone Number', NULL, NULL, 1, 1, 1, 12, CAST(0x0000A06E00E6B680 AS DateTime), NULL, 1, 1, 0, 0)
INSERT [dbo].[ProfileFields] ([FieldID], [FieldTypeID], [FieldName], [Comment], [PossibleValues], [TextSelectValue], [IsMandatory], [ShowInSignUp], [FieldGroupID], [OrderID], [Created], [Modified], [SortValues], [IsActive], [AdminUseOnly], [VerticalLayout]) VALUES (79, 2, N'Additional information', N'', NULL, NULL, 0, 1, 1, 13, CAST(0x0000A06E00E6B680 AS DateTime), NULL, 1, 1, 0, 0)
INSERT [dbo].[ProfileFields] ([FieldID], [FieldTypeID], [FieldName], [Comment], [PossibleValues], [TextSelectValue], [IsMandatory], [ShowInSignUp], [FieldGroupID], [OrderID], [Created], [Modified], [SortValues], [IsActive], [AdminUseOnly], [VerticalLayout]) VALUES (85, 1, N'Credit Card Number', N'Your Credit Card Number', NULL, NULL, 0, 0, 2, 1, CAST(0x0000A07F010A9261 AS DateTime), CAST(0x0000A07F011ADA0E AS DateTime), 1, 1, 0, 0)
INSERT [dbo].[ProfileFields] ([FieldID], [FieldTypeID], [FieldName], [Comment], [PossibleValues], [TextSelectValue], [IsMandatory], [ShowInSignUp], [FieldGroupID], [OrderID], [Created], [Modified], [SortValues], [IsActive], [AdminUseOnly], [VerticalLayout]) VALUES (86, 1, N'Bank Account', N'Your bank account number', NULL, NULL, 0, 0, 2, 2, CAST(0x0000A07F0118D546 AS DateTime), NULL, 1, 1, 0, 0)
INSERT [dbo].[ProfileFields] ([FieldID], [FieldTypeID], [FieldName], [Comment], [PossibleValues], [TextSelectValue], [IsMandatory], [ShowInSignUp], [FieldGroupID], [OrderID], [Created], [Modified], [SortValues], [IsActive], [AdminUseOnly], [VerticalLayout]) VALUES (87, 1, N'Geo Location', N'Your Geo Location', NULL, NULL, 0, 0, 3, 0, CAST(0x0000A07F011B5191 AS DateTime), CAST(0x0000A07F011B6946 AS DateTime), 1, 1, 0, 0)
INSERT [dbo].[ProfileFields] ([FieldID], [FieldTypeID], [FieldName], [Comment], [PossibleValues], [TextSelectValue], [IsMandatory], [ShowInSignUp], [FieldGroupID], [OrderID], [Created], [Modified], [SortValues], [IsActive], [AdminUseOnly], [VerticalLayout]) VALUES (88, 5, N'Which bank do you prefer ?', N'Please select one or more values below', N'City Bank; New-York Bank; EU Credit; First national Bank', N'[No selected items]', 1, 1, 2, 3, CAST(0x0000A0830064BD9F AS DateTime), CAST(0x0000A08C00794E87 AS DateTime), 0, 1, 0, 0)
INSERT [dbo].[ProfileFields] ([FieldID], [FieldTypeID], [FieldName], [Comment], [PossibleValues], [TextSelectValue], [IsMandatory], [ShowInSignUp], [FieldGroupID], [OrderID], [Created], [Modified], [SortValues], [IsActive], [AdminUseOnly], [VerticalLayout]) VALUES (89, 7, N'Payment Type', N'Please select your payment type', N'Credit Card; Western Union; Bank Account Transfer', NULL, 1, 1, 2, 5, CAST(0x0000A08400780029 AS DateTime), CAST(0x0000A08C00793722 AS DateTime), 0, 1, 0, 0)
INSERT [dbo].[ProfileFields] ([FieldID], [FieldTypeID], [FieldName], [Comment], [PossibleValues], [TextSelectValue], [IsMandatory], [ShowInSignUp], [FieldGroupID], [OrderID], [Created], [Modified], [SortValues], [IsActive], [AdminUseOnly], [VerticalLayout]) VALUES (90, 7, N'Payment Period', N'Please select your payment period', N'1 Month; 6 Months; 1 Year', N'Please select your payment period', 1, 1, 2, 4, CAST(0x0000A08400785889 AS DateTime), CAST(0x0000A08C007926C0 AS DateTime), 0, 1, 0, 1)
SET IDENTITY_INSERT [dbo].[ProfileFields] OFF
/****** Object:  Table [dbo].[Parameters]    Script Date: 07/12/2012 18:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parameters](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Value] [ntext] NULL,
	[MemberID] [bigint] NOT NULL,
	[Created] [datetime] NOT NULL,
	[TypeID] [int] NOT NULL,
	[Modified] [datetime] NULL,
 CONSTRAINT [PK_Parameters] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_Parameters] UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Parameters] ON
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (12, N'api-enabled', N'true', 1, CAST(0x0000A02A00107AC0 AS DateTime), 4, CAST(0x0000A05400714847 AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (43, N'api-secret-url', NULL, 1, CAST(0x0000A02A00107AC0 AS DateTime), 2, CAST(0x0000A04C00B09EE6 AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (3, N'general-admin-email', N'admin@demo.com', 1, CAST(0x0000A0240103D3A0 AS DateTime), 1, CAST(0x0000A068009F142A AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (39, N'general-app-maintenance-enabled', N'false', 1, CAST(0x0000A02E00000000 AS DateTime), 4, CAST(0x0000A05400FD640E AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (37, N'general-app-maintenance-url', N'Offline', 1, CAST(0x0000A02E00000000 AS DateTime), 2, CAST(0x0000A04C00907B22 AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (17, N'general-app-path', N'localhost', 1, CAST(0x0000A02E00000000 AS DateTime), 2, CAST(0x0000A080016CCF3F AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (36, N'general-app-secret-admin-url', NULL, 1, CAST(0x0000A02E00000000 AS DateTime), 2, CAST(0x0000A06A00EB4F1A AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (10, N'general-audit-enabled', N'true', 1, CAST(0x0000A024011826C0 AS DateTime), 4, CAST(0x0000A04C00D2261B AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (18, N'general-cookie-name', N'myApplicationCookie', 1, CAST(0x0000A02E00000000 AS DateTime), 1, CAST(0x0000A03001073BD9 AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (13, N'general-domain-name', N'localhost', 1, CAST(0x0000A02A00107AC0 AS DateTime), 2, CAST(0x0000A080016CCF5C AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (49, N'language-public-default', N'ENG', 1, CAST(0x0000A02E00000000 AS DateTime), 1, CAST(0x0000A05C00EB0D68 AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (30, N'mailserver-smtp-email', N'user@mail.server.com', 1, CAST(0x0000A024010DB6E0 AS DateTime), 1, CAST(0x0000A080016CCF7C AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (1, N'mailserver-smtp-host', N'mail.server.com', 1, CAST(0x0000A024010087E0 AS DateTime), 1, CAST(0x0000A080016CCF6A AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (5, N'mailserver-smtp-pass', N'mailserver', 1, CAST(0x0000A024010FE960 AS DateTime), 1, CAST(0x0000A080016CCF8A AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (15, N'mailserver-smtp-port', N'25', 1, CAST(0x0000A02E014FE830 AS DateTime), 3, CAST(0x0000A02F0155AFD0 AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (16, N'mailserver-smtp-ssl-enabled', N'true', 1, CAST(0x0000A02E014FE830 AS DateTime), 4, CAST(0x0000A02E007269A1 AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (4, N'mailserver-smtp-user', N'Admin', 1, CAST(0x0000A024010DB6E0 AS DateTime), 1, CAST(0x0000A06E00A495C2 AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (28, N'registration-mail-domain-restriction', N'1', 1, CAST(0x0000A02F00000000 AS DateTime), 5, CAST(0x0000A05F008AF137 AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (29, N'registration-mail-domain-restriction-list', NULL, 1, CAST(0x0000A02F00000000 AS DateTime), 2, CAST(0x0000A05F008AF128 AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (24, N'registration-member-activation-to-roles', N'Self Registered; Self Activated; Viewer', 1, CAST(0x0000A02E00000000 AS DateTime), 2, CAST(0x0000A068009F33BC AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (26, N'registration-member-registration-to-roles', N'Self Registered; Not Activated', 1, CAST(0x0000A02E00000000 AS DateTime), 2, CAST(0x0000A068009F33B4 AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (23, N'registration-reset-password', N'true', 1, CAST(0x0000A02E00000000 AS DateTime), 4, CAST(0x0000A037005DADD8 AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (21, N'registration-self-activation', N'true', 1, CAST(0x0000A02E00000000 AS DateTime), 4, CAST(0x0000A037005DADCF AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (20, N'registration-self-registration', N'true', 1, CAST(0x0000A02E00000000 AS DateTime), 4, CAST(0x0000A037005DADCE AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (32, N'rules-member-mail-bcc', NULL, 1, CAST(0x0000A03600000000 AS DateTime), 2, CAST(0x0000A06701117408 AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (34, N'rules-member-mail-bcc-activation', N'false', 1, CAST(0x0000A03600000000 AS DateTime), 4, CAST(0x0000A05F008B094F AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (35, N'rules-member-mail-bcc-passworchange', N'false', 1, CAST(0x0000A03600000000 AS DateTime), 4, CAST(0x0000A05F008B0951 AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (33, N'rules-member-mail-bcc-registration', N'false', 1, CAST(0x0000A03600000000 AS DateTime), 4, CAST(0x0000A05F008B094E AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (47, N'rules-password-failed-attempts', N'7', 1, CAST(0x0000A02E00000000 AS DateTime), 5, CAST(0x0000A080016D1206 AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (48, N'rules-password-failed-attempts-redirect', NULL, 1, CAST(0x0000A02E00000000 AS DateTime), 2, CAST(0x0000A06700E2CBFC AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (44, N'rules-password-failed-roles', N'Blocked', 1, CAST(0x0000A02E00000000 AS DateTime), 2, CAST(0x0000A06700E2BF67 AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (25, N'rules-redirect-after-login', N'', 1, CAST(0x0000A02E00000000 AS DateTime), 2, CAST(0x0000A080016CCF98 AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (31, N'rules-redirect-after-logout', N'', 1, CAST(0x0000A02E00000000 AS DateTime), 2, CAST(0x0000A080016CCFC3 AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (51, N'rules-redirect-after-sign-up', NULL, 1, CAST(0x0000A02E00000000 AS DateTime), 2, CAST(0x0000A07400CDE916 AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (40, N'themes-app-current-name', N'bootstrap', 1, CAST(0x0000A02E00000000 AS DateTime), 1, CAST(0x0000A080016B32C0 AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (50, N'ui-app-fluid', N'false', 1, CAST(0x0000A02A00107AC0 AS DateTime), 4, CAST(0x0000A07F00624F9A AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (6, N'ui-app-name', N'Role & Member', 1, CAST(0x0000A024010E89D0 AS DateTime), 1, CAST(0x0000A03601528694 AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (9, N'ui-paging-size', N'40', 1, CAST(0x0000A024010FE960 AS DateTime), 3, CAST(0x0000A04D00DB2B1F AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (52,N'social-blogger-enabled', N'true', 1, CAST(0x0000A0B301391C40 AS DateTime), 4, CAST(0x0000A0B5013C0C8C AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (53,N'social-blogger-roles', N'Blogger; A-SocialSignIn', 1, CAST(0x0000A0B301391C40 AS DateTime), 1, CAST(0x0000A0B500F8C168 AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (54,N'social-facebook-app-id', N'your App ID', 1, CAST(0x0000A0B301391C40 AS DateTime), 1, CAST(0x0000A0B40073082F AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (55,N'social-facebook-app-secret', N'your App Secret', 1, CAST(0x0000A0B301391C40 AS DateTime), 1, CAST(0x0000A0B40073084D AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (56,N'social-facebook-enabled', N'true', 1, CAST(0x0000A0B301391C40 AS DateTime), 4, CAST(0x0000A0B301557161 AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (57,N'social-facebook-roles', N'Facebook; A-SocialSignIn', 1, CAST(0x0000A0B301391C40 AS DateTime), 1, CAST(0x0000A0B500F8C14B AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (58,N'social-google-roles', N'Google; A-SocialSignIn', 1, CAST(0x0000A0B301391C40 AS DateTime), 1, CAST(0x0000A0B500F8C14C AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (59,N'social-goole-enabled', N'true', 1, CAST(0x0000A0B301391C40 AS DateTime), 4, CAST(0x0000A0B5013C0C89 AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (60,N'social-livejournal-enabled', N'true', 1, CAST(0x0000A0B301391C40 AS DateTime), 4, CAST(0x0000A0B5013C0C8A AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (61,N'social-livejournal-roles', N'Live Journal; A-SocialSignIn', 1, CAST(0x0000A0B301391C40 AS DateTime), 1, CAST(0x0000A0B500F8C166 AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (62,N'social-myopenid-enabled', N'true', 1, CAST(0x0000A0B301391C40 AS DateTime), 4, CAST(0x0000A0B5013C0C8E AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (63,N'social-myopenid-roles', N'My OpenID; A-SocialSignIn', 1, CAST(0x0000A0B301391C40 AS DateTime), 1, CAST(0x0000A0B501241E0B AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (64,N'social-openid-enabled', N'true', 1, CAST(0x0000A0B301391C40 AS DateTime), 4, CAST(0x0000A0B5013C0C8D AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (65,N'social-openid-roles', N'OpenID; A-SocialSignIn', 1, CAST(0x0000A0B301391C40 AS DateTime), 1, CAST(0x0000A0B500F8C168 AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (66,N'social-twitter-consumer-key', N'your app Consumer key', 1, CAST(0x0000A0B301391C40 AS DateTime), 1, CAST(0x0000A0B3014DBEFD AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (67,N'social-twitter-consumer-secret', N'your App Consumer Secret', 1, CAST(0x0000A0B301391C40 AS DateTime), 1, CAST(0x0000A0B3014DBF0D AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (68,N'social-twitter-enabled', N'true', 1, CAST(0x0000A0B301391C40 AS DateTime), 4, CAST(0x0000A0B5013BF94E AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (69,N'social-twitter-roles', N'Twitter; A-SocialSignIn', 1, CAST(0x0000A0B301391C40 AS DateTime), 1, CAST(0x0000A0B500F8C136 AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (70,N'social-yahoo-enabled', N'true', 1, CAST(0x0000A0B301391C40 AS DateTime), 4, CAST(0x0000A0B5013C0C8A AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (71,N'social-yahoo-roles', N'Yahoo; A-SocialSignIn', 1, CAST(0x0000A0B301391C40 AS DateTime), 1, CAST(0x0000A0B500F8C156 AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (72,N'ldap-add-role-group', N'true', 1, CAST(0x0000A0D3011826C0 AS DateTime), 4, CAST(0x0000A0D300F87AA8 AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (73,N'ldap-add-to-roles', N'LDAP; Viewer', 1, CAST(0x0000A02E00000000 AS DateTime), 2, CAST(0x0000A0D300F68B54 AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (74,N'ldap-domain', N'domain.com', 1, CAST(0x0000A02E00000000 AS DateTime), 2, CAST(0x0000A0D500DB1DBA AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (75,N'ldap-enabled', N'false', 1, CAST(0x0000A0D3011826C0 AS DateTime), 4, CAST(0x0000A0D300F87AA1 AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (76,N'ldap-path', N'LDAP://domainname.com/DC=domainname,DC=com', 1, CAST(0x0000A02E00000000 AS DateTime), 2, CAST(0x0000A0D301036F2A AS DateTime))
INSERT [dbo].[Parameters] ([ID], [Name], [Value], [MemberID], [Created], [TypeID], [Modified]) VALUES (77,N'ldap-use-only', N'false', 1, CAST(0x0000A0D3011826C0 AS DateTime), 4, CAST(0x0000A0D500D73A3E AS DateTime))

SET IDENTITY_INSERT [dbo].[Parameters] OFF
/****** Object:  Table [dbo].[MemberTokens]    Script Date: 07/12/2012 18:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberTokens](
	[MemberTokenID] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberID] [bigint] NOT NULL,
	[Token] [nvarchar](254) NOT NULL,
	[GeneratedBy] [nvarchar](64) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NULL,
 CONSTRAINT [PK_MemberTokens] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_MemberTokens] UNIQUE NONCLUSTERED 
(
	[Token] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MemberTokens] ON
INSERT [dbo].[MemberTokens] ([MemberTokenID], [MemberID], [Token], [GeneratedBy], [Created], [Modified]) VALUES (1, 2, N'HYXMvDsQWhGhbShE7yS1', N'admin@mail.com', CAST(0x0000A05F008BBA28 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[MemberTokens] OFF
/****** Object:  Table [dbo].[MemberAttempts]    Script Date: 07/12/2012 18:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberAttempts](
	[AttemptID] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberID] [bigint] NOT NULL,
	[AttemptType] [int] NOT NULL,
	[Attempts] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NULL,
	[IsAttemptValid] [int] NOT NULL,
 CONSTRAINT [PK_MemberPasswordAttempts] PRIMARY KEY CLUSTERED 
(
	[AttemptID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MemberAttempts] ON
INSERT [dbo].[MemberAttempts] ([AttemptID], [MemberID], [AttemptType], [Attempts], [Created], [Modified], [IsAttemptValid]) VALUES (1, 1, 1, 3, CAST(0x0000A06A00DE253B AS DateTime), CAST(0x0000A06A00DE6DDF AS DateTime), 0)
INSERT [dbo].[MemberAttempts] ([AttemptID], [MemberID], [AttemptType], [Attempts], [Created], [Modified], [IsAttemptValid]) VALUES (2, 1, 1, 2, CAST(0x0000A06A00E37D49 AS DateTime), CAST(0x0000A06A00E39428 AS DateTime), 0)
INSERT [dbo].[MemberAttempts] ([AttemptID], [MemberID], [AttemptType], [Attempts], [Created], [Modified], [IsAttemptValid]) VALUES (3, 1, 1, 2, CAST(0x0000A06D00D32A46 AS DateTime), CAST(0x0000A06D00D3368F AS DateTime), 0)
INSERT [dbo].[MemberAttempts] ([AttemptID], [MemberID], [AttemptType], [Attempts], [Created], [Modified], [IsAttemptValid]) VALUES (8, 1, 1, 1, CAST(0x0000A07E005157D8 AS DateTime), CAST(0x0000A07E00515BC1 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[MemberAttempts] OFF
/****** Object:  Table [dbo].[ActionTokens]    Script Date: 07/12/2012 18:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionTokens](
	[ActionID] [bigint] IDENTITY(1,1) NOT NULL,
	[ActionType] [int] NOT NULL,
	[Token] [nvarchar](254) NOT NULL,
	[Email] [nvarchar](254) NOT NULL,
	[Created] [datetime] NOT NULL,
	[ReturnURL] [nvarchar](2048) NULL,
 CONSTRAINT [PK_ActionTokens] PRIMARY KEY CLUSTERED 
(
	[ActionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_ActionTokens] UNIQUE NONCLUSTERED 
(
	[Token] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuditEvents]    Script Date: 07/12/2012 18:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditEvents](
	[EventID] [bigint] IDENTITY(1,1) NOT NULL,
	[EventSource] [int] NOT NULL,
	[EventType] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[MemberEmail] [nvarchar](255) NOT NULL,
	[Details] [ntext] NULL,
	[IPAddress] [nvarchar](64) NOT NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_AuditEvents] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberRoles]    Script Date: 07/12/2012 18:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberRoles](
	[MemberID] [bigint] NOT NULL,
	[RoleID] [bigint] NOT NULL,
	[Created] [datetime] NULL,
 CONSTRAINT [PK_MemberRoles] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[MemberRoles] ([MemberID], [RoleID], [Created]) VALUES (1, 1, CAST(0x0000A05F0085FA71 AS DateTime))
INSERT [dbo].[MemberRoles] ([MemberID], [RoleID], [Created]) VALUES (1, 2, CAST(0x0000A05F008B8650 AS DateTime))
INSERT [dbo].[MemberRoles] ([MemberID], [RoleID], [Created]) VALUES (1, 3, CAST(0x0000A05F008B865F AS DateTime))
INSERT [dbo].[MemberRoles] ([MemberID], [RoleID], [Created]) VALUES (2, 7, CAST(0x0000A05F008B7B5D AS DateTime))
INSERT [dbo].[MemberRoles] ([MemberID], [RoleID], [Created]) VALUES (3, 3, CAST(0x0000A05F0090B3C2 AS DateTime))
INSERT [dbo].[MemberRoles] ([MemberID], [RoleID], [Created]) VALUES (4, 2, CAST(0x0000A05F0090F9F1 AS DateTime))
INSERT [dbo].[MemberRoles] ([MemberID], [RoleID], [Created]) VALUES (5, 7, CAST(0x0000A06900ED0287 AS DateTime))
/****** Object:  Table [dbo].[MemberProfileFields]    Script Date: 07/12/2012 18:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberProfileFields](
	[ProfileFieldID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [bigint] NOT NULL,
	[FieldID] [int] NOT NULL,
	[FieldValue] [ntext] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NULL,
 CONSTRAINT [PK_MemberProfileFields] PRIMARY KEY CLUSTERED 
(
	[ProfileFieldID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MemberProfileFields] ON
INSERT [dbo].[MemberProfileFields] ([ProfileFieldID], [MemberID], [FieldID], [FieldValue], [Created], [Modified]) VALUES (1, 1, 63, N'First name', CAST(0x0000A08C007D451A AS DateTime), CAST(0x0000A08C00FF2A7D AS DateTime))
INSERT [dbo].[MemberProfileFields] ([ProfileFieldID], [MemberID], [FieldID], [FieldValue], [Created], [Modified]) VALUES (2, 1, 64, N'Family name', CAST(0x0000A08C007D4523 AS DateTime), CAST(0x0000A08C00FF2A7D AS DateTime))
INSERT [dbo].[MemberProfileFields] ([ProfileFieldID], [MemberID], [FieldID], [FieldValue], [Created], [Modified]) VALUES (3, 1, 66, N'Male', CAST(0x0000A08C007D4523 AS DateTime), CAST(0x0000A08C00FF2A82 AS DateTime))
INSERT [dbo].[MemberProfileFields] ([ProfileFieldID], [MemberID], [FieldID], [FieldValue], [Created], [Modified]) VALUES (4, 1, 67, N'Ukraine', CAST(0x0000A08C007D4523 AS DateTime), CAST(0x0000A08C00FF2A87 AS DateTime))
INSERT [dbo].[MemberProfileFields] ([ProfileFieldID], [MemberID], [FieldID], [FieldValue], [Created], [Modified]) VALUES (5, 1, 73, N'District', CAST(0x0000A08C007D4523 AS DateTime), CAST(0x0000A08C00FF2A87 AS DateTime))
INSERT [dbo].[MemberProfileFields] ([ProfileFieldID], [MemberID], [FieldID], [FieldValue], [Created], [Modified]) VALUES (6, 1, 68, N'City', CAST(0x0000A08C007D4523 AS DateTime), CAST(0x0000A08C00FF2A87 AS DateTime))
INSERT [dbo].[MemberProfileFields] ([ProfileFieldID], [MemberID], [FieldID], [FieldValue], [Created], [Modified]) VALUES (7, 1, 69, N'Nationality', CAST(0x0000A08C007D4523 AS DateTime), CAST(0x0000A08C00FF2A87 AS DateTime))
INSERT [dbo].[MemberProfileFields] ([ProfileFieldID], [MemberID], [FieldID], [FieldValue], [Created], [Modified]) VALUES (8, 1, 65, N'Birth Date', CAST(0x0000A08C007D4523 AS DateTime), CAST(0x0000A08C00FF2A87 AS DateTime))
INSERT [dbo].[MemberProfileFields] ([ProfileFieldID], [MemberID], [FieldID], [FieldValue], [Created], [Modified]) VALUES (9, 1, 70, N'Phone number', CAST(0x0000A08C007D4528 AS DateTime), CAST(0x0000A08C00FF2A87 AS DateTime))
INSERT [dbo].[MemberProfileFields] ([ProfileFieldID], [MemberID], [FieldID], [FieldValue], [Created], [Modified]) VALUES (10, 1, 71, N'Passport number', CAST(0x0000A08C007D4528 AS DateTime), CAST(0x0000A08C00FF2A8B AS DateTime))
INSERT [dbo].[MemberProfileFields] ([ProfileFieldID], [MemberID], [FieldID], [FieldValue], [Created], [Modified]) VALUES (11, 1, 77, N'Emergency', CAST(0x0000A08C007D4528 AS DateTime), CAST(0x0000A08C00FF2A8B AS DateTime))
INSERT [dbo].[MemberProfileFields] ([ProfileFieldID], [MemberID], [FieldID], [FieldValue], [Created], [Modified]) VALUES (12, 1, 78, N'Emergency', CAST(0x0000A08C007D4528 AS DateTime), CAST(0x0000A08C00FF2A8B AS DateTime))
INSERT [dbo].[MemberProfileFields] ([ProfileFieldID], [MemberID], [FieldID], [FieldValue], [Created], [Modified]) VALUES (13, 1, 79, N'', CAST(0x0000A08C007D4528 AS DateTime), CAST(0x0000A08C00FF2A8B AS DateTime))
INSERT [dbo].[MemberProfileFields] ([ProfileFieldID], [MemberID], [FieldID], [FieldValue], [Created], [Modified]) VALUES (14, 1, 85, N'1234-5678-2345-4567', CAST(0x0000A08C007D4528 AS DateTime), CAST(0x0000A08C00FF2A8B AS DateTime))
INSERT [dbo].[MemberProfileFields] ([ProfileFieldID], [MemberID], [FieldID], [FieldValue], [Created], [Modified]) VALUES (15, 1, 86, N'12346234567', CAST(0x0000A08C007D4528 AS DateTime), CAST(0x0000A08C00FF2A8B AS DateTime))
INSERT [dbo].[MemberProfileFields] ([ProfileFieldID], [MemberID], [FieldID], [FieldValue], [Created], [Modified]) VALUES (16, 1, 88, N'City Bank,First national Bank', CAST(0x0000A08C007D4528 AS DateTime), CAST(0x0000A08C00FF2A8B AS DateTime))
INSERT [dbo].[MemberProfileFields] ([ProfileFieldID], [MemberID], [FieldID], [FieldValue], [Created], [Modified]) VALUES (17, 1, 90, N'1 Month', CAST(0x0000A08C007D4531 AS DateTime), CAST(0x0000A08C00FF2A8B AS DateTime))
INSERT [dbo].[MemberProfileFields] ([ProfileFieldID], [MemberID], [FieldID], [FieldValue], [Created], [Modified]) VALUES (18, 1, 89, N'Western Union', CAST(0x0000A08C007D453B AS DateTime), CAST(0x0000A08C00FF2A8B AS DateTime))
SET IDENTITY_INSERT [dbo].[MemberProfileFields] OFF
/****** Object:  Default [DF_ProfileFieldGroups_IsActive]    Script Date: 07/12/2012 18:35:07 ******/
ALTER TABLE [dbo].[ProfileFieldGroups] ADD  CONSTRAINT [DF_ProfileFieldGroups_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
/****** Object:  Default [DF_ProfileFieldGroups_AdminUseOnly]    Script Date: 07/12/2012 18:35:07 ******/
ALTER TABLE [dbo].[ProfileFieldGroups] ADD  CONSTRAINT [DF_ProfileFieldGroups_AdminUseOnly]  DEFAULT ((0)) FOR [AdminUseOnly]
GO
/****** Object:  Default [DF_ProfileFields_IsActive]    Script Date: 07/12/2012 18:35:07 ******/
ALTER TABLE [dbo].[ProfileFields] ADD  CONSTRAINT [DF_ProfileFields_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
/****** Object:  Default [DF_ProfileFields_AdminUseOnly]    Script Date: 07/12/2012 18:35:07 ******/
ALTER TABLE [dbo].[ProfileFields] ADD  CONSTRAINT [DF_ProfileFields_AdminUseOnly]  DEFAULT ((0)) FOR [AdminUseOnly]
GO
/****** Object:  Default [DF_ProfileFields_VerticalLayout]    Script Date: 07/12/2012 18:35:07 ******/
ALTER TABLE [dbo].[ProfileFields] ADD  CONSTRAINT [DF_ProfileFields_VerticalLayout]  DEFAULT ((0)) FOR [VerticalLayout]
GO
/****** Object:  ForeignKey [FK_ActionTokens_ActionTokenTypes]    Script Date: 07/12/2012 18:35:07 ******/
ALTER TABLE [dbo].[ActionTokens]  WITH CHECK ADD  CONSTRAINT [FK_ActionTokens_ActionTokenTypes] FOREIGN KEY([ActionType])
REFERENCES [dbo].[ActionTokenTypes] ([ActionTypeID])
GO
ALTER TABLE [dbo].[ActionTokens] CHECK CONSTRAINT [FK_ActionTokens_ActionTokenTypes]
GO
/****** Object:  ForeignKey [FK_AuditEvents_AuditEventSources]    Script Date: 07/12/2012 18:35:07 ******/
ALTER TABLE [dbo].[AuditEvents]  WITH CHECK ADD  CONSTRAINT [FK_AuditEvents_AuditEventSources] FOREIGN KEY([EventSource])
REFERENCES [dbo].[AuditEventSources] ([SourceID])
GO
ALTER TABLE [dbo].[AuditEvents] CHECK CONSTRAINT [FK_AuditEvents_AuditEventSources]
GO
/****** Object:  ForeignKey [FK_AuditEvents_AuditEventTypes]    Script Date: 07/12/2012 18:35:07 ******/
ALTER TABLE [dbo].[AuditEvents]  WITH CHECK ADD  CONSTRAINT [FK_AuditEvents_AuditEventTypes] FOREIGN KEY([EventType])
REFERENCES [dbo].[AuditEventTypes] ([TypeID])
GO
ALTER TABLE [dbo].[AuditEvents] CHECK CONSTRAINT [FK_AuditEvents_AuditEventTypes]
GO
/****** Object:  ForeignKey [FK_MemberAttempts_MemberAttemptTypes]    Script Date: 07/12/2012 18:35:07 ******/
ALTER TABLE [dbo].[MemberAttempts]  WITH CHECK ADD  CONSTRAINT [FK_MemberAttempts_MemberAttemptTypes] FOREIGN KEY([AttemptType])
REFERENCES [dbo].[MemberAttemptTypes] ([MemberAttemptTypeID])
GO
ALTER TABLE [dbo].[MemberAttempts] CHECK CONSTRAINT [FK_MemberAttempts_MemberAttemptTypes]
GO
/****** Object:  ForeignKey [FK_MemberAttempts_Members]    Script Date: 07/12/2012 18:35:07 ******/
ALTER TABLE [dbo].[MemberAttempts]  WITH CHECK ADD  CONSTRAINT [FK_MemberAttempts_Members] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Members] ([MemberID])
GO
ALTER TABLE [dbo].[MemberAttempts] CHECK CONSTRAINT [FK_MemberAttempts_Members]
GO
/****** Object:  ForeignKey [FK_MemberProfileFields_MemberProfileFields]    Script Date: 07/12/2012 18:35:07 ******/
ALTER TABLE [dbo].[MemberProfileFields]  WITH CHECK ADD  CONSTRAINT [FK_MemberProfileFields_MemberProfileFields] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Members] ([MemberID])
GO
ALTER TABLE [dbo].[MemberProfileFields] CHECK CONSTRAINT [FK_MemberProfileFields_MemberProfileFields]
GO
/****** Object:  ForeignKey [FK_MemberProfileFields_ProfileFields]    Script Date: 07/12/2012 18:35:07 ******/
ALTER TABLE [dbo].[MemberProfileFields]  WITH CHECK ADD  CONSTRAINT [FK_MemberProfileFields_ProfileFields] FOREIGN KEY([FieldID])
REFERENCES [dbo].[ProfileFields] ([FieldID])
GO
ALTER TABLE [dbo].[MemberProfileFields] CHECK CONSTRAINT [FK_MemberProfileFields_ProfileFields]
GO
/****** Object:  ForeignKey [FK_MemberRoles_Members]    Script Date: 07/12/2012 18:35:07 ******/
ALTER TABLE [dbo].[MemberRoles]  WITH CHECK ADD  CONSTRAINT [FK_MemberRoles_Members] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Members] ([MemberID])
GO
ALTER TABLE [dbo].[MemberRoles] CHECK CONSTRAINT [FK_MemberRoles_Members]
GO
/****** Object:  ForeignKey [FK_MemberRoles_Roles]    Script Date: 07/12/2012 18:35:07 ******/
ALTER TABLE [dbo].[MemberRoles]  WITH CHECK ADD  CONSTRAINT [FK_MemberRoles_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[MemberRoles] CHECK CONSTRAINT [FK_MemberRoles_Roles]
GO
/****** Object:  ForeignKey [FK_MemberTokens_Members]    Script Date: 07/12/2012 18:35:07 ******/
ALTER TABLE [dbo].[MemberTokens]  WITH CHECK ADD  CONSTRAINT [FK_MemberTokens_Members] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Members] ([MemberID])
GO
ALTER TABLE [dbo].[MemberTokens] CHECK CONSTRAINT [FK_MemberTokens_Members]
GO
/****** Object:  ForeignKey [FK_Parameters_Members]    Script Date: 07/12/2012 18:35:07 ******/
ALTER TABLE [dbo].[Parameters]  WITH CHECK ADD  CONSTRAINT [FK_Parameters_Members] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Members] ([MemberID])
GO
ALTER TABLE [dbo].[Parameters] CHECK CONSTRAINT [FK_Parameters_Members]
GO
/****** Object:  ForeignKey [FK_Parameters_Parameters]    Script Date: 07/12/2012 18:35:07 ******/
ALTER TABLE [dbo].[Parameters]  WITH CHECK ADD  CONSTRAINT [FK_Parameters_Parameters] FOREIGN KEY([ID])
REFERENCES [dbo].[Parameters] ([ID])
GO
ALTER TABLE [dbo].[Parameters] CHECK CONSTRAINT [FK_Parameters_Parameters]
GO
/****** Object:  ForeignKey [FK_Parameters_ParameterTypes]    Script Date: 07/12/2012 18:35:07 ******/
ALTER TABLE [dbo].[Parameters]  WITH CHECK ADD  CONSTRAINT [FK_Parameters_ParameterTypes] FOREIGN KEY([TypeID])
REFERENCES [dbo].[ParameterTypes] ([TypeID])
GO
ALTER TABLE [dbo].[Parameters] CHECK CONSTRAINT [FK_Parameters_ParameterTypes]
GO
/****** Object:  ForeignKey [FK_ProfileFields_ProfileFieldGroups]    Script Date: 07/12/2012 18:35:07 ******/
ALTER TABLE [dbo].[ProfileFields]  WITH CHECK ADD  CONSTRAINT [FK_ProfileFields_ProfileFieldGroups] FOREIGN KEY([FieldGroupID])
REFERENCES [dbo].[ProfileFieldGroups] ([FieldGroupID])
GO
ALTER TABLE [dbo].[ProfileFields] CHECK CONSTRAINT [FK_ProfileFields_ProfileFieldGroups]
GO
/****** Object:  ForeignKey [FK_ProfileFields_ProfileFieldTypes]    Script Date: 07/12/2012 18:35:07 ******/
ALTER TABLE [dbo].[ProfileFields]  WITH CHECK ADD  CONSTRAINT [FK_ProfileFields_ProfileFieldTypes] FOREIGN KEY([FieldTypeID])
REFERENCES [dbo].[ProfileFieldTypes] ([FieldTypeID])
GO
ALTER TABLE [dbo].[ProfileFields] CHECK CONSTRAINT [FK_ProfileFields_ProfileFieldTypes]
GO

CREATE TABLE [dbo].[Domains](
	[DomainID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](2047) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NULL,
 CONSTRAINT [PK_Domains] PRIMARY KEY CLUSTERED 
(
	[DomainID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[RoleProfileFields](
	[RoleFieldID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [bigint] NOT NULL,
	[ProfileFieldID] [int] NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[DomainProfileFields](
	[DomainFieldID] [int] IDENTITY(1,1) NOT NULL,
	[DomainID] [int] NOT NULL,
	[ProfileFieldID] [int] NOT NULL,
 CONSTRAINT [PK_DomainProfileFields] PRIMARY KEY CLUSTERED 
(
	[DomainFieldID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DomainProfileFields]  WITH CHECK ADD  CONSTRAINT [FK_DomainProfileFields_Domains] FOREIGN KEY([DomainID])
REFERENCES [dbo].[Domains] ([DomainID])
GO
ALTER TABLE [dbo].[DomainProfileFields] CHECK CONSTRAINT [FK_DomainProfileFields_Domains]
GO

ALTER TABLE [dbo].[DomainProfileFields]  WITH CHECK ADD  CONSTRAINT [FK_DomainProfileFields_ProfileFields] FOREIGN KEY([ProfileFieldID])
REFERENCES [dbo].[ProfileFields] ([FieldID])
GO
ALTER TABLE [dbo].[DomainProfileFields] CHECK CONSTRAINT [FK_DomainProfileFields_ProfileFields]
GO

ALTER TABLE [dbo].[RoleProfileFields]  WITH CHECK ADD  CONSTRAINT [FK_RoleProfileFields_ProfileFields] FOREIGN KEY([ProfileFieldID])
REFERENCES [dbo].[ProfileFields] ([FieldID])
GO
ALTER TABLE [dbo].[RoleProfileFields] CHECK CONSTRAINT [FK_RoleProfileFields_ProfileFields]
GO

ALTER TABLE [dbo].[RoleProfileFields]  WITH CHECK ADD  CONSTRAINT [FK_RoleProfileFields_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[RoleProfileFields] CHECK CONSTRAINT [FK_RoleProfileFields_Roles]
GO


CREATE TABLE [dbo].[MemberSocialNetworks](
	[MemberSocialNetworkID] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberID] [bigint] NOT NULL,
	[SocialNetworkID] [int] NOT NULL,
	[SocialNetworkUserID] [nvarchar](100) NOT NULL,
	[SocialNetworkUserEmail] [nvarchar](100) NULL,
	[SocialNetworkUserName] [nvarchar](100) NULL,
	[AccessToken] [nvarchar](1024) NULL,
 CONSTRAINT [PK_MemberSocialNetworks] PRIMARY KEY CLUSTERED 
(
	[MemberSocialNetworkID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[MemberSocialNetworks]  WITH CHECK ADD  CONSTRAINT [FK_MemberSocialNetworks_Members] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Members] ([MemberID])
GO

ALTER TABLE [dbo].[MemberSocialNetworks] CHECK CONSTRAINT [FK_MemberSocialNetworks_Members]
GO

CREATE TABLE [dbo].[MemberDomains](
	[MemberDomainID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [bigint] NOT NULL,
	[DomainID] [int] NOT NULL,
 CONSTRAINT [PK_MemberDomains] PRIMARY KEY CLUSTERED 
(
	[MemberDomainID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


GO
SET IDENTITY_INSERT [dbo].[MemberDomains] ON 
GO
INSERT [dbo].[MemberDomains] ([MemberDomainID], [MemberID], [DomainID]) VALUES (1, 1, 1)
GO
INSERT [dbo].[MemberDomains] ([MemberDomainID], [MemberID], [DomainID]) VALUES (2, 2, 1)
GO
INSERT [dbo].[MemberDomains] ([MemberDomainID], [MemberID], [DomainID]) VALUES (3, 3, 1)
GO
INSERT [dbo].[MemberDomains] ([MemberDomainID], [MemberID], [DomainID]) VALUES (4, 4, 1)
GO
INSERT [dbo].[MemberDomains] ([MemberDomainID], [MemberID], [DomainID]) VALUES (5, 5, 1)
GO
SET IDENTITY_INSERT [dbo].[MemberDomains] OFF
GO

ALTER TABLE [dbo].[MemberDomains]  WITH CHECK ADD  CONSTRAINT [FK_MemberDomains_Members] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Members] ([MemberID])
GO

ALTER TABLE [dbo].[MemberDomains] CHECK CONSTRAINT [FK_MemberDomains_Members]
GO

INSERT [dbo].[Domains] ([Name], [Description], [Created], [Modified]) VALUES (N'localhost', N'localhost', CAST(0x0000A17F00FCDC01 AS DateTime), NULL)
GO


CREATE TABLE [dbo].[AuthMemberTickets](
	[AuthMemberTicketID] [bigint] IDENTITY(1,1) NOT NULL,
	[MemberID] [bigint] NOT NULL,
	[IssueDate] [datetime] NOT NULL,
	[Expiration] [datetime] NOT NULL,
	[IsPersistent] [int] NOT NULL,
	[Token] [varchar](128) NOT NULL,
 CONSTRAINT [PK_AuthMemberTickets] PRIMARY KEY CLUSTERED 
(
	[AuthMemberTicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_AuthMemberTickets] UNIQUE NONCLUSTERED 
(
	[Token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[AuthMemberTickets]  WITH CHECK ADD  CONSTRAINT [FK_AuthMemberTickets_Members] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Members] ([MemberID])
GO

ALTER TABLE [dbo].[AuthMemberTickets] CHECK CONSTRAINT [FK_AuthMemberTickets_Members]
GO

ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Member_ID] FOREIGN KEY([member_id])
REFERENCES [dbo].[Members] ([MemberID])
GO

ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [FK_Employee_Member_ID]
GO

COMMIT