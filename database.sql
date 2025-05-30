USE [master]
GO
/****** Object:  Database [HotelBase_Kolesnik]    Script Date: 26.04.2025 14:10:38 ******/
CREATE DATABASE [HotelBase_Kolesnik]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HotelBase_Kolesnik', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\HotelBase_Kolesnik.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HotelBase_Kolesnik_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\HotelBase_Kolesnik_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [HotelBase_Kolesnik] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HotelBase_Kolesnik].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HotelBase_Kolesnik] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HotelBase_Kolesnik] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HotelBase_Kolesnik] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HotelBase_Kolesnik] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HotelBase_Kolesnik] SET ARITHABORT OFF 
GO
ALTER DATABASE [HotelBase_Kolesnik] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HotelBase_Kolesnik] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HotelBase_Kolesnik] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HotelBase_Kolesnik] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HotelBase_Kolesnik] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HotelBase_Kolesnik] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HotelBase_Kolesnik] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HotelBase_Kolesnik] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HotelBase_Kolesnik] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HotelBase_Kolesnik] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HotelBase_Kolesnik] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HotelBase_Kolesnik] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HotelBase_Kolesnik] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HotelBase_Kolesnik] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HotelBase_Kolesnik] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HotelBase_Kolesnik] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HotelBase_Kolesnik] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HotelBase_Kolesnik] SET RECOVERY FULL 
GO
ALTER DATABASE [HotelBase_Kolesnik] SET  MULTI_USER 
GO
ALTER DATABASE [HotelBase_Kolesnik] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HotelBase_Kolesnik] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HotelBase_Kolesnik] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HotelBase_Kolesnik] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HotelBase_Kolesnik] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HotelBase_Kolesnik] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HotelBase_Kolesnik', N'ON'
GO
ALTER DATABASE [HotelBase_Kolesnik] SET QUERY_STORE = ON
GO
ALTER DATABASE [HotelBase_Kolesnik] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [HotelBase_Kolesnik]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 26.04.2025 14:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](5) NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 26.04.2025 14:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Code] [nchar](2) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 26.04.2025 14:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CountryOfStars] [int] NOT NULL,
	[CountryCode] [nchar](2) NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelComment]    Script Date: 26.04.2025 14:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelComment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HotelId] [int] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[Author] [nvarchar](100) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_HotelComment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelImage]    Script Date: 26.04.2025 14:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelImage](
	[Id] [int] NOT NULL,
	[HotelId] [int] NOT NULL,
	[ImageSource] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_HotelImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelOfTour]    Script Date: 26.04.2025 14:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelOfTour](
	[HotelId] [int] NOT NULL,
	[TourId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 26.04.2025 14:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[Id] [int] NOT NULL,
	[TicketCount] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ImagePreview] [varbinary](max) NULL,
	[Price] [money] NOT NULL,
	[isActual] [bit] NOT NULL,
	[ClientID] [int] NOT NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 26.04.2025 14:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfTour]    Script Date: 26.04.2025 14:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfTour](
	[TourId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
 CONSTRAINT [PK_TypeOfTour] PRIMARY KEY CLUSTERED 
(
	[TourId] ASC,
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([id], [FIO], [Login], [Password]) VALUES (3, N'Бойко Игорь Петрович', N'BoicoIP', N'1111')
INSERT [dbo].[Client] ([id], [FIO], [Login], [Password]) VALUES (5, N'Василенко Василий Александрович', N'VasilenkoVA', N'2222')
INSERT [dbo].[Client] ([id], [FIO], [Login], [Password]) VALUES (6, N'Лазарьков Петр Михайлович', N'LazarkovPM', N'3333')
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'ch', N'Китай')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'en', N'Англия')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'ru', N'Россия')
GO
SET IDENTITY_INSERT [dbo].[Hotel] ON 

INSERT [dbo].[Hotel] ([Id], [Name], [CountryOfStars], [CountryCode]) VALUES (1, N'Космос Плюс', 4, N'ru')
INSERT [dbo].[Hotel] ([Id], [Name], [CountryOfStars], [CountryCode]) VALUES (2, N'Украина', 5, N'ru')
INSERT [dbo].[Hotel] ([Id], [Name], [CountryOfStars], [CountryCode]) VALUES (3, N'Four Seasons', 5, N'ru')
SET IDENTITY_INSERT [dbo].[Hotel] OFF
GO
SET IDENTITY_INSERT [dbo].[HotelComment] ON 

INSERT [dbo].[HotelComment] ([Id], [HotelId], [Text], [Author], [CreationDate]) VALUES (1, 1, N'Замечательный', N'Иванов Иван', CAST(N'2024-02-17T00:00:00.000' AS DateTime))
INSERT [dbo].[HotelComment] ([Id], [HotelId], [Text], [Author], [CreationDate]) VALUES (2, 2, N'Лучший отель', N'Джон Дое', CAST(N'2024-02-17T00:00:00.000' AS DateTime))
INSERT [dbo].[HotelComment] ([Id], [HotelId], [Text], [Author], [CreationDate]) VALUES (4, 3, N'Есть к чему стремиться', N'Мария', CAST(N'2024-02-17T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[HotelComment] OFF
GO
INSERT [dbo].[Tour] ([Id], [TicketCount], [Name], [Description], [ImagePreview], [Price], [isActual], [ClientID]) VALUES (1, 127, N'Болгарское наследие', NULL, NULL, 35700.0000, 1, 3)
INSERT [dbo].[Tour] ([Id], [TicketCount], [Name], [Description], [ImagePreview], [Price], [isActual], [ClientID]) VALUES (4, 92, N'Волшебный Восток', NULL, NULL, 77100.0000, 1, 5)
INSERT [dbo].[Tour] ([Id], [TicketCount], [Name], [Description], [ImagePreview], [Price], [isActual], [ClientID]) VALUES (5, 72, N'Город с большими огнями', NULL, NULL, 93300.0000, 1, 6)
INSERT [dbo].[Tour] ([Id], [TicketCount], [Name], [Description], [ImagePreview], [Price], [isActual], [ClientID]) VALUES (6, 143, N'Город четырех ветров', NULL, NULL, 72500.0000, 0, 3)
GO
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (1, N'международный', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (2, N'внутренний', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (3, N'специализированный детский', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (4, N'экскурсионный', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (5, N'лечебно-оздоровительный', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (6, N'культурно-исторический', NULL)
SET IDENTITY_INSERT [dbo].[Type] OFF
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([Code])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Country]
GO
ALTER TABLE [dbo].[HotelComment]  WITH CHECK ADD  CONSTRAINT [FK_HotelComment_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([Id])
GO
ALTER TABLE [dbo].[HotelComment] CHECK CONSTRAINT [FK_HotelComment_Hotel]
GO
ALTER TABLE [dbo].[HotelImage]  WITH CHECK ADD  CONSTRAINT [FK_HotelImage_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([Id])
GO
ALTER TABLE [dbo].[HotelImage] CHECK CONSTRAINT [FK_HotelImage_Hotel]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([Id])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_Hotel]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_Tour] FOREIGN KEY([TourId])
REFERENCES [dbo].[Tour] ([Id])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_Tour]
GO
ALTER TABLE [dbo].[Tour]  WITH CHECK ADD  CONSTRAINT [FK_Tour_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([id])
GO
ALTER TABLE [dbo].[Tour] CHECK CONSTRAINT [FK_Tour_Client]
GO
ALTER TABLE [dbo].[TypeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfTour_Tour] FOREIGN KEY([TourId])
REFERENCES [dbo].[Tour] ([Id])
GO
ALTER TABLE [dbo].[TypeOfTour] CHECK CONSTRAINT [FK_TypeOfTour_Tour]
GO
ALTER TABLE [dbo].[TypeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfTour_Type] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Type] ([Id])
GO
ALTER TABLE [dbo].[TypeOfTour] CHECK CONSTRAINT [FK_TypeOfTour_Type]
GO
USE [master]
GO
ALTER DATABASE [HotelBase_Kolesnik] SET  READ_WRITE 
GO
