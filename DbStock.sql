USE [ProductDbStock]
GO
/****** Object:  Table [dbo].[TblCategory]    Script Date: 22.6.2020 13:38:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblCategory](
	[CategoryId] [smallint] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nchar](20) NOT NULL,
 CONSTRAINT [PK_TblCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TblCustomer]    Script Date: 22.6.2020 13:38:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblCustomer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL,
	[CustomerSurname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TblCustomer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TblProduct]    Script Date: 22.6.2020 13:38:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblProduct](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Marka] [nchar](10) NOT NULL,
	[ProductCategory] [smallint] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Stock] [tinyint] NULL,
 CONSTRAINT [PK_TblProduct] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TblSale]    Script Date: 22.6.2020 13:38:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblSale](
	[Sale] [int] IDENTITY(1,1) NOT NULL,
	[Product] [int] NOT NULL,
	[Customer] [int] NOT NULL,
	[Total] [tinyint] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_TblSale] PRIMARY KEY CLUSTERED 
(
	[Sale] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[TblCategory] ON 

INSERT [dbo].[TblCategory] ([CategoryId], [CategoryName]) VALUES (1, N'BEYAZ EŞYA          ')
INSERT [dbo].[TblCategory] ([CategoryId], [CategoryName]) VALUES (8, N'KÜÇÜK EV ALETLERİ   ')
INSERT [dbo].[TblCategory] ([CategoryId], [CategoryName]) VALUES (9, N'BİLGİSAYAR          ')
INSERT [dbo].[TblCategory] ([CategoryId], [CategoryName]) VALUES (10, N'BİLGİSAYAR ÜRÜNLERİ ')
INSERT [dbo].[TblCategory] ([CategoryId], [CategoryName]) VALUES (11, N'SES VE MÜZİK        ')
INSERT [dbo].[TblCategory] ([CategoryId], [CategoryName]) VALUES (12, N'TELEFON             ')
INSERT [dbo].[TblCategory] ([CategoryId], [CategoryName]) VALUES (13, N'TELEVİZYON          ')
INSERT [dbo].[TblCategory] ([CategoryId], [CategoryName]) VALUES (29, N'CEP TELEFONLARI     ')
SET IDENTITY_INSERT [dbo].[TblCategory] OFF
SET IDENTITY_INSERT [dbo].[TblCustomer] ON 

INSERT [dbo].[TblCustomer] ([CustomerId], [CustomerName], [CustomerSurname]) VALUES (1, N'EMEL', N'ÇINAR')
INSERT [dbo].[TblCustomer] ([CustomerId], [CustomerName], [CustomerSurname]) VALUES (2, N'ALİ', N'YILDIZ')
INSERT [dbo].[TblCustomer] ([CustomerId], [CustomerName], [CustomerSurname]) VALUES (4, N'MERYEM', N'YEŞİLAY')
INSERT [dbo].[TblCustomer] ([CustomerId], [CustomerName], [CustomerSurname]) VALUES (5, N'YÜKSEL', N'ALTAN')
INSERT [dbo].[TblCustomer] ([CustomerId], [CustomerName], [CustomerSurname]) VALUES (6, N'HAMİDE', N'OK')
INSERT [dbo].[TblCustomer] ([CustomerId], [CustomerName], [CustomerSurname]) VALUES (7, N'ZEYNEP', N'SEYHAN')
INSERT [dbo].[TblCustomer] ([CustomerId], [CustomerName], [CustomerSurname]) VALUES (8, N'SELDA', N'BAŞARAN')
INSERT [dbo].[TblCustomer] ([CustomerId], [CustomerName], [CustomerSurname]) VALUES (9, N'AHMET', N'ÖZÇELİK')
SET IDENTITY_INSERT [dbo].[TblCustomer] OFF
SET IDENTITY_INSERT [dbo].[TblProduct] ON 

INSERT [dbo].[TblProduct] ([ProductId], [ProductName], [Marka], [ProductCategory], [Price], [Stock]) VALUES (1, N'ÇAMAŞIR MAKİNESİ', N'BOSH      ', 1, CAST(550.00 AS Decimal(18, 2)), 20)
INSERT [dbo].[TblProduct] ([ProductId], [ProductName], [Marka], [ProductCategory], [Price], [Stock]) VALUES (2, N'BULAŞIK MAKİNESİ', N'ARÇELİK   ', 1, CAST(850.00 AS Decimal(18, 2)), 21)
INSERT [dbo].[TblProduct] ([ProductId], [ProductName], [Marka], [ProductCategory], [Price], [Stock]) VALUES (4, N'SU ISITICI', N'TEFAL     ', 8, CAST(99.00 AS Decimal(18, 2)), 35)
INSERT [dbo].[TblProduct] ([ProductId], [ProductName], [Marka], [ProductCategory], [Price], [Stock]) VALUES (6, N'ÜTÜ', N'TEFAL     ', 8, CAST(45.00 AS Decimal(18, 2)), 5)
INSERT [dbo].[TblProduct] ([ProductId], [ProductName], [Marka], [ProductCategory], [Price], [Stock]) VALUES (7, N'BUZDOLABI', N'REGAL     ', 1, CAST(945.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[TblProduct] ([ProductId], [ProductName], [Marka], [ProductCategory], [Price], [Stock]) VALUES (8, N'LAPTOP', N'TOSHİBA   ', 9, CAST(550.00 AS Decimal(18, 2)), 15)
INSERT [dbo].[TblProduct] ([ProductId], [ProductName], [Marka], [ProductCategory], [Price], [Stock]) VALUES (9, N'LAPTOP', N'MONSTER   ', 9, CAST(750.00 AS Decimal(18, 2)), 11)
INSERT [dbo].[TblProduct] ([ProductId], [ProductName], [Marka], [ProductCategory], [Price], [Stock]) VALUES (10, N'HARD DİSK 250GB', N'TOSHİBA   ', 10, CAST(150.00 AS Decimal(18, 2)), 5)
INSERT [dbo].[TblProduct] ([ProductId], [ProductName], [Marka], [ProductCategory], [Price], [Stock]) VALUES (11, N'KLAVYE', N'LOGITECH  ', 10, CAST(200.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[TblProduct] ([ProductId], [ProductName], [Marka], [ProductCategory], [Price], [Stock]) VALUES (13, N'MOUSE', N'LOGITECH  ', 10, CAST(35.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[TblProduct] ([ProductId], [ProductName], [Marka], [ProductCategory], [Price], [Stock]) VALUES (17, N'KULAKLIK', N'JBL       ', 11, CAST(0.00 AS Decimal(18, 2)), 9)
SET IDENTITY_INSERT [dbo].[TblProduct] OFF
SET IDENTITY_INSERT [dbo].[TblSale] ON 

INSERT [dbo].[TblSale] ([Sale], [Product], [Customer], [Total], [Price]) VALUES (1, 1, 2, 3, CAST(3500.00 AS Decimal(18, 2)))
INSERT [dbo].[TblSale] ([Sale], [Product], [Customer], [Total], [Price]) VALUES (2, 1, 2, 2, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[TblSale] ([Sale], [Product], [Customer], [Total], [Price]) VALUES (3, 1, 5, 5, CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[TblSale] ([Sale], [Product], [Customer], [Total], [Price]) VALUES (8, 1, 2, 2, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[TblSale] ([Sale], [Product], [Customer], [Total], [Price]) VALUES (9, 4, 6, 17, CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[TblSale] ([Sale], [Product], [Customer], [Total], [Price]) VALUES (12, 1, 2, 2, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[TblSale] ([Sale], [Product], [Customer], [Total], [Price]) VALUES (13, 1, 2, 2, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[TblSale] ([Sale], [Product], [Customer], [Total], [Price]) VALUES (14, 13, 8, 1, CAST(12.00 AS Decimal(18, 2)))
INSERT [dbo].[TblSale] ([Sale], [Product], [Customer], [Total], [Price]) VALUES (15, 13, 5, 11, CAST(12.00 AS Decimal(18, 2)))
INSERT [dbo].[TblSale] ([Sale], [Product], [Customer], [Total], [Price]) VALUES (16, 13, 5, 11, CAST(12.30 AS Decimal(18, 2)))
INSERT [dbo].[TblSale] ([Sale], [Product], [Customer], [Total], [Price]) VALUES (20, 13, 2, 2, CAST(12.30 AS Decimal(18, 2)))
INSERT [dbo].[TblSale] ([Sale], [Product], [Customer], [Total], [Price]) VALUES (21, 13, 2, 2, CAST(20.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[TblSale] OFF
ALTER TABLE [dbo].[TblProduct]  WITH CHECK ADD  CONSTRAINT [FK_TblProduct_TblCategory] FOREIGN KEY([ProductCategory])
REFERENCES [dbo].[TblCategory] ([CategoryId])
GO
ALTER TABLE [dbo].[TblProduct] CHECK CONSTRAINT [FK_TblProduct_TblCategory]
GO
ALTER TABLE [dbo].[TblSale]  WITH CHECK ADD  CONSTRAINT [FK_TblSale_TblCustomer] FOREIGN KEY([Customer])
REFERENCES [dbo].[TblCustomer] ([CustomerId])
GO
ALTER TABLE [dbo].[TblSale] CHECK CONSTRAINT [FK_TblSale_TblCustomer]
GO
ALTER TABLE [dbo].[TblSale]  WITH CHECK ADD  CONSTRAINT [FK_TblSale_TblProduct] FOREIGN KEY([Product])
REFERENCES [dbo].[TblProduct] ([ProductId])
GO
ALTER TABLE [dbo].[TblSale] CHECK CONSTRAINT [FK_TblSale_TblProduct]
GO
