USE [master]
GO
/****** Object:  Database [Ryle_chm]    Script Date: 26.10.2023 9:06:49 ******/
CREATE DATABASE [Ryle_chm]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ryle_chm', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Ryle_chm.mdf' , SIZE = 9024KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'Ryle_chm_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Ryle_chm_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Ryle_chm] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ryle_chm].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ryle_chm] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ryle_chm] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ryle_chm] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ryle_chm] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ryle_chm] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ryle_chm] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ryle_chm] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ryle_chm] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ryle_chm] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ryle_chm] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ryle_chm] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ryle_chm] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ryle_chm] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ryle_chm] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ryle_chm] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Ryle_chm] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ryle_chm] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ryle_chm] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ryle_chm] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ryle_chm] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ryle_chm] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ryle_chm] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ryle_chm] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Ryle_chm] SET  MULTI_USER 
GO
ALTER DATABASE [Ryle_chm] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ryle_chm] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ryle_chm] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ryle_chm] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Ryle_chm] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Ryle_chm] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Ryle_chm] SET QUERY_STORE = OFF
GO
USE [Ryle_chm]
GO
/****** Object:  Table [dbo].[merch]    Script Date: 26.10.2023 9:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[merch](
	[id] [int] NOT NULL,
	[photo] [nvarchar](50) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[description] [nvarchar](50) NOT NULL,
	[proizvoditel] [nvarchar](50) NOT NULL,
	[cost] [int] NOT NULL,
	[discount] [int] NULL,
 CONSTRAINT [PK_merch] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 26.10.2023 9:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] NOT NULL,
	[id_status] [int] NOT NULL,
	[id_type_users] [int] NOT NULL,
	[id_point] [int] NOT NULL,
	[data] [date] NOT NULL,
	[kod] [int] NOT NULL,
	[cost] [int] NOT NULL,
	[discount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[point]    Script Date: 26.10.2023 9:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[point](
	[id] [int] NOT NULL,
	[adress] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_point] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sostav]    Script Date: 26.10.2023 9:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sostav](
	[id_orders] [int] NOT NULL,
	[id_merch] [int] NOT NULL,
	[count] [int] NOT NULL,
 CONSTRAINT [PK_sostav] PRIMARY KEY CLUSTERED 
(
	[id_orders] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status]    Script Date: 26.10.2023 9:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status](
	[id] [int] NOT NULL,
	[status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type_users]    Script Date: 26.10.2023 9:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type_users](
	[id] [int] NOT NULL,
	[role] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_type_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 26.10.2023 9:06:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] NOT NULL,
	[login] [nvarchar](10) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[id_type] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[merch] ([id], [photo], [title], [description], [proizvoditel], [cost], [discount]) VALUES (1, N'/photos/2.jpg', N'руль', N'коричневый', N'Германия', 500, NULL)
INSERT [dbo].[merch] ([id], [photo], [title], [description], [proizvoditel], [cost], [discount]) VALUES (2, N'/photos/3.jpg', N'масло', N'моторное', N'Россия', 700, 5)
INSERT [dbo].[merch] ([id], [photo], [title], [description], [proizvoditel], [cost], [discount]) VALUES (3, N'/photos/1.jpg', N'шина', N'16 радиус', N'Китай', 200, NULL)
GO
INSERT [dbo].[orders] ([id], [id_status], [id_type_users], [id_point], [data], [kod], [cost], [discount]) VALUES (2, 1, 1, 1, CAST(N'2023-09-16' AS Date), 123, 1200, 35)
GO
INSERT [dbo].[point] ([id], [adress]) VALUES (1, N'Пункт 1')
GO
INSERT [dbo].[sostav] ([id_orders], [id_merch], [count]) VALUES (1, 1, 123)
GO
INSERT [dbo].[status] ([id], [status]) VALUES (1, N'новый')
INSERT [dbo].[status] ([id], [status]) VALUES (2, N'в работе')
GO
INSERT [dbo].[type_users] ([id], [role]) VALUES (1, N'администратор')
INSERT [dbo].[type_users] ([id], [role]) VALUES (2, N'менеджер')
INSERT [dbo].[type_users] ([id], [role]) VALUES (3, N'клиент')
GO
INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (1, N'root', N'12345', 1)
INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (2, N'manager', N'12345', 2)
INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (3, N'client', N'12345', 3)
GO
ALTER TABLE [dbo].[sostav]  WITH CHECK ADD  CONSTRAINT [FK_sostav_merch] FOREIGN KEY([id_merch])
REFERENCES [dbo].[merch] ([id])
GO
ALTER TABLE [dbo].[sostav] CHECK CONSTRAINT [FK_sostav_merch]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_type_users] FOREIGN KEY([id_type])
REFERENCES [dbo].[type_users] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_type_users]
GO
USE [master]
GO
ALTER DATABASE [Ryle_chm] SET  READ_WRITE 
GO
