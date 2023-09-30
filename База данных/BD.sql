USE [master]
GO
/****** Object:  Database [BDcreation]    Script Date: 23.09.2023 12:48:17 ******/
CREATE DATABASE [BDcreation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDcreation', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BDcreation.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'BDcreation_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BDcreation_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BDcreation] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDcreation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDcreation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDcreation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDcreation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDcreation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDcreation] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDcreation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDcreation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDcreation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDcreation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDcreation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDcreation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDcreation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDcreation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDcreation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDcreation] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDcreation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDcreation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDcreation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDcreation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDcreation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDcreation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDcreation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDcreation] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BDcreation] SET  MULTI_USER 
GO
ALTER DATABASE [BDcreation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDcreation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDcreation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDcreation] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BDcreation] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BDcreation] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BDcreation] SET QUERY_STORE = OFF
GO
USE [BDcreation]
GO
/****** Object:  Table [dbo].[clients]    Script Date: 23.09.2023 12:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clients](
	[id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[password] [nchar](10) NOT NULL,
	[login] [nchar](10) NOT NULL,
 CONSTRAINT [PK_clients] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[merch]    Script Date: 23.09.2023 12:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[merch](
	[id] [int] NOT NULL,
	[name] [nchar](10) NOT NULL,
	[sale] [int] NULL,
	[picture] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[merchan]    Script Date: 23.09.2023 12:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[merchan](
	[id] [int] NOT NULL,
	[name] [nchar](10) NOT NULL,
	[price] [int] NOT NULL,
	[sale] [int] NULL,
	[picture] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_merchan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[merchOrder]    Script Date: 23.09.2023 12:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[merchOrder](
	[id] [int] NOT NULL,
	[orderId] [int] NOT NULL,
	[merchId] [int] NOT NULL,
	[amount] [int] NOT NULL,
	[sale] [int] NULL,
 CONSTRAINT [PK_merchOrder] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 23.09.2023 12:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] NOT NULL,
	[price] [int] NOT NULL,
	[sale] [int] NULL,
	[client] [int] NOT NULL,
	[place] [int] NOT NULL,
	[status] [int] NOT NULL,
	[code] [int] NOT NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[place]    Script Date: 23.09.2023 12:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[place](
	[id] [int] NOT NULL,
	[name] [nchar](10) NOT NULL,
 CONSTRAINT [PK_place] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 23.09.2023 12:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] NOT NULL,
	[role] [nchar](10) NOT NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status]    Script Date: 23.09.2023 12:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status](
	[int] [int] NOT NULL,
	[name] [nchar](10) NOT NULL,
 CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED 
(
	[int] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[workers]    Script Date: 23.09.2023 12:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[workers](
	[id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[role] [int] NOT NULL,
 CONSTRAINT [PK_workers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[clients] ([id], [name], [password], [login]) VALUES (1, N'Nas', N'12345     ', N'user      ')
INSERT [dbo].[clients] ([id], [name], [password], [login]) VALUES (2, N'Res', N'1234      ', N'user      ')
GO
INSERT [dbo].[merch] ([id], [name], [sale], [picture]) VALUES (1, N'wheel     ', 10, N'C:/picture/wheel.jpg')
INSERT [dbo].[merch] ([id], [name], [sale], [picture]) VALUES (2, N'window    ', NULL, N'C:/window.jpg')
GO
INSERT [dbo].[merchan] ([id], [name], [price], [sale], [picture]) VALUES (1, N'wheel     ', 100, 10, N'C:/wheel')
INSERT [dbo].[merchan] ([id], [name], [price], [sale], [picture]) VALUES (2, N'window    ', 200, NULL, N'C:/window')
GO
INSERT [dbo].[merchOrder] ([id], [orderId], [merchId], [amount], [sale]) VALUES (1, 1, 1, 2, 10)
INSERT [dbo].[merchOrder] ([id], [orderId], [merchId], [amount], [sale]) VALUES (2, 2, 2, 1, 10)
GO
INSERT [dbo].[orders] ([id], [price], [sale], [client], [place], [status], [code]) VALUES (1, 2000, 10, 1, 1, 1, 123)
INSERT [dbo].[orders] ([id], [price], [sale], [client], [place], [status], [code]) VALUES (2, 1000, NULL, 2, 2, 3, 333)
GO
INSERT [dbo].[place] ([id], [name]) VALUES (1, N'north     ')
INSERT [dbo].[place] ([id], [name]) VALUES (2, N'south     ')
GO
INSERT [dbo].[roles] ([id], [role]) VALUES (1, N'admin     ')
INSERT [dbo].[roles] ([id], [role]) VALUES (2, N'manager   ')
INSERT [dbo].[roles] ([id], [role]) VALUES (3, N'user      ')
GO
INSERT [dbo].[status] ([int], [name]) VALUES (1, N'ready     ')
INSERT [dbo].[status] ([int], [name]) VALUES (2, N'delivery  ')
INSERT [dbo].[status] ([int], [name]) VALUES (3, N'collected ')
GO
INSERT [dbo].[workers] ([id], [name], [role]) VALUES (1, N'San', 1)
INSERT [dbo].[workers] ([id], [name], [role]) VALUES (2, N'Wan', 2)
INSERT [dbo].[workers] ([id], [name], [role]) VALUES (3, N'Saw', 3)
GO
ALTER TABLE [dbo].[merchOrder]  WITH CHECK ADD  CONSTRAINT [FK_merchOrder_merchan] FOREIGN KEY([merchId])
REFERENCES [dbo].[merchan] ([id])
GO
ALTER TABLE [dbo].[merchOrder] CHECK CONSTRAINT [FK_merchOrder_merchan]
GO
ALTER TABLE [dbo].[merchOrder]  WITH CHECK ADD  CONSTRAINT [FK_merchOrder_orders] FOREIGN KEY([orderId])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[merchOrder] CHECK CONSTRAINT [FK_merchOrder_orders]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_clients] FOREIGN KEY([client])
REFERENCES [dbo].[clients] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_clients]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_place] FOREIGN KEY([place])
REFERENCES [dbo].[place] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_place]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_status] FOREIGN KEY([status])
REFERENCES [dbo].[status] ([int])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_status]
GO
ALTER TABLE [dbo].[workers]  WITH CHECK ADD  CONSTRAINT [FK_workers_roles] FOREIGN KEY([role])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[workers] CHECK CONSTRAINT [FK_workers_roles]
GO
USE [master]
GO
ALTER DATABASE [BDcreation] SET  READ_WRITE 
GO
