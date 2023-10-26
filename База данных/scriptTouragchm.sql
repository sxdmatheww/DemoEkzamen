USE [master]
GO
/****** Object:  Database [touragentstvo_chm]    Script Date: 26.10.2023 9:57:46 ******/
CREATE DATABASE [touragentstvo_chm]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'touragentstvo_chm', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\touragentstvo_chm.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'touragentstvo_chm_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\touragentstvo_chm_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [touragentstvo_chm] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [touragentstvo_chm].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [touragentstvo_chm] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [touragentstvo_chm] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [touragentstvo_chm] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [touragentstvo_chm] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [touragentstvo_chm] SET ARITHABORT OFF 
GO
ALTER DATABASE [touragentstvo_chm] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [touragentstvo_chm] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [touragentstvo_chm] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [touragentstvo_chm] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [touragentstvo_chm] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [touragentstvo_chm] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [touragentstvo_chm] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [touragentstvo_chm] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [touragentstvo_chm] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [touragentstvo_chm] SET  DISABLE_BROKER 
GO
ALTER DATABASE [touragentstvo_chm] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [touragentstvo_chm] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [touragentstvo_chm] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [touragentstvo_chm] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [touragentstvo_chm] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [touragentstvo_chm] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [touragentstvo_chm] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [touragentstvo_chm] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [touragentstvo_chm] SET  MULTI_USER 
GO
ALTER DATABASE [touragentstvo_chm] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [touragentstvo_chm] SET DB_CHAINING OFF 
GO
ALTER DATABASE [touragentstvo_chm] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [touragentstvo_chm] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [touragentstvo_chm] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [touragentstvo_chm] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [touragentstvo_chm] SET QUERY_STORE = OFF
GO
USE [touragentstvo_chm]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 26.10.2023 9:57:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[id] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 26.10.2023 9:57:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[id] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[count_of_stars] [int] NOT NULL,
	[id_country] [int] NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelComment]    Script Date: 26.10.2023 9:57:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelComment](
	[id] [int] NOT NULL,
	[id_hotel] [int] NOT NULL,
	[text] [nvarchar](max) NOT NULL,
	[author] [nvarchar](100) NOT NULL,
	[creation_date] [datetime] NOT NULL,
 CONSTRAINT [PK_HotelComment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelImage]    Script Date: 26.10.2023 9:57:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelImage](
	[id] [int] NOT NULL,
	[id_hotel] [int] NOT NULL,
	[imagesource] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_HotelImage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelOfTour]    Script Date: 26.10.2023 9:57:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelOfTour](
	[id_hotel] [int] NOT NULL,
	[id_tour] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 26.10.2023 9:57:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[id] [int] NOT NULL,
	[ticketcount] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[imagepreview] [varbinary](max) NOT NULL,
	[price] [money] NOT NULL,
	[isactual] [bit] NOT NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 26.10.2023 9:57:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[id] [int] NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfTour]    Script Date: 26.10.2023 9:57:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfTour](
	[id_tour] [int] NOT NULL,
	[id_type] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Country] FOREIGN KEY([id_country])
REFERENCES [dbo].[Country] ([id])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Country]
GO
ALTER TABLE [dbo].[HotelComment]  WITH CHECK ADD  CONSTRAINT [FK_HotelComment_Hotel] FOREIGN KEY([id_hotel])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelComment] CHECK CONSTRAINT [FK_HotelComment_Hotel]
GO
ALTER TABLE [dbo].[HotelImage]  WITH CHECK ADD  CONSTRAINT [FK_HotelImage_Hotel] FOREIGN KEY([id_hotel])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelImage] CHECK CONSTRAINT [FK_HotelImage_Hotel]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_Hotel] FOREIGN KEY([id_hotel])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_Hotel]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_Tour] FOREIGN KEY([id_tour])
REFERENCES [dbo].[Tour] ([id])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_Tour]
GO
ALTER TABLE [dbo].[TypeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfTour_Tour] FOREIGN KEY([id_tour])
REFERENCES [dbo].[Tour] ([id])
GO
ALTER TABLE [dbo].[TypeOfTour] CHECK CONSTRAINT [FK_TypeOfTour_Tour]
GO
ALTER TABLE [dbo].[TypeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfTour_Type] FOREIGN KEY([id_type])
REFERENCES [dbo].[Type] ([id])
GO
ALTER TABLE [dbo].[TypeOfTour] CHECK CONSTRAINT [FK_TypeOfTour_Type]
GO
USE [master]
GO
ALTER DATABASE [touragentstvo_chm] SET  READ_WRITE 
GO
