/****** Object:  Table [dbo].[Customer]    Script Date: 18-Mar-22 2:20:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Gender] [nvarchar](10) NULL,
	[Mobile] [varchar](10) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 18-Mar-22 2:20:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Category] [varchar](50) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 18-Mar-22 2:20:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Customer] [varchar](50) NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[PurchasedOn] [date] NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 
GO
INSERT [dbo].[Customer] ([Id], [Name], [Gender], [Mobile]) VALUES (1, N'Raj', N'Male', N'9876543210')
GO
INSERT [dbo].[Customer] ([Id], [Name], [Gender], [Mobile]) VALUES (4, N'Ramya', N'Female', N'9876543210')
GO
INSERT [dbo].[Customer] ([Id], [Name], [Gender], [Mobile]) VALUES (6, N'Sreekanth', N'Male', N'9875641230')
GO
INSERT [dbo].[Customer] ([Id], [Name], [Gender], [Mobile]) VALUES (7, N'Raghav', N'Male', N'9874561220')
GO
INSERT [dbo].[Customer] ([Id], [Name], [Gender], [Mobile]) VALUES (8, N'Amritha', N'Female', N'9876541230')
GO
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([Id], [Name], [Category], [Price]) VALUES (1, N'Potato', N'Groceries', CAST(100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([Id], [Name], [Category], [Price]) VALUES (2, N'Tomato', N'Groceries', CAST(150.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([Id], [Name], [Category], [Price]) VALUES (3, N'Onion', N'Groceries', CAST(70.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([Id], [Name], [Category], [Price]) VALUES (4, N'The Magic of Thinking Big', N'Books', CAST(250.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([Id], [Name], [Category], [Price]) VALUES (5, N'Rich Dad Poor Dad', N'Books', CAST(230.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([Id], [Name], [Category], [Price]) VALUES (6, N'The Secret', N'Books', CAST(270.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([Id], [Name], [Category], [Price]) VALUES (13, N'Mobile', N'Electronics', CAST(45000.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([Id], [Name], [Category], [Price]) VALUES (14, N'Chair', N'Furniture', CAST(500.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([Id], [Name], [Category], [Price]) VALUES (15, N'Flowers', N'Decoration', CAST(200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Product] ([Id], [Name], [Category], [Price]) VALUES (16, N'Table', N'Furniture', CAST(500.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Sale] ON 
GO
INSERT [dbo].[Sale] ([Id], [Customer], [Amount], [PurchasedOn]) VALUES (1, N'Raj', CAST(450.00 AS Decimal(10, 2)), CAST(N'2022-03-06' AS Date))
GO
INSERT [dbo].[Sale] ([Id], [Customer], [Amount], [PurchasedOn]) VALUES (2, N'Robert', CAST(450.00 AS Decimal(10, 2)), CAST(N'2022-03-07' AS Date))
GO
INSERT [dbo].[Sale] ([Id], [Customer], [Amount], [PurchasedOn]) VALUES (3, N'Raheem', CAST(450.00 AS Decimal(10, 2)), CAST(N'2022-03-08' AS Date))
GO
INSERT [dbo].[Sale] ([Id], [Customer], [Amount], [PurchasedOn]) VALUES (4, N'Willams', CAST(2000.00 AS Decimal(10, 2)), CAST(N'2022-02-09' AS Date))
GO
INSERT [dbo].[Sale] ([Id], [Customer], [Amount], [PurchasedOn]) VALUES (5, N'Krishna', CAST(1500.00 AS Decimal(10, 2)), CAST(N'2022-02-10' AS Date))
GO
INSERT [dbo].[Sale] ([Id], [Customer], [Amount], [PurchasedOn]) VALUES (6, N'Manohar', CAST(2500.00 AS Decimal(10, 2)), CAST(N'2022-02-11' AS Date))
GO
INSERT [dbo].[Sale] ([Id], [Customer], [Amount], [PurchasedOn]) VALUES (7, N'Ramya', CAST(3500.00 AS Decimal(10, 2)), CAST(N'2022-03-12' AS Date))
GO
INSERT [dbo].[Sale] ([Id], [Customer], [Amount], [PurchasedOn]) VALUES (8, N'Sruthi', CAST(500.00 AS Decimal(10, 2)), CAST(N'2022-03-13' AS Date))
GO
INSERT [dbo].[Sale] ([Id], [Customer], [Amount], [PurchasedOn]) VALUES (9, N'Daniel', CAST(500.00 AS Decimal(10, 2)), CAST(N'2022-03-13' AS Date))
GO
INSERT [dbo].[Sale] ([Id], [Customer], [Amount], [PurchasedOn]) VALUES (10, N'Michale', CAST(1000.00 AS Decimal(10, 2)), CAST(N'2022-03-11' AS Date))
GO
INSERT [dbo].[Sale] ([Id], [Customer], [Amount], [PurchasedOn]) VALUES (11, N'Santhosh', CAST(2500.00 AS Decimal(10, 2)), CAST(N'2022-03-10' AS Date))
GO
INSERT [dbo].[Sale] ([Id], [Customer], [Amount], [PurchasedOn]) VALUES (12, N'Ramya', CAST(4000.00 AS Decimal(10, 2)), CAST(N'2022-03-04' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Sale] OFF
GO