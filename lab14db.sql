USE [master]
GO
/****** Object:  Database [Учебная_Колесник2]    Script Date: 28.04.2025 16:45:13 ******/
CREATE DATABASE [Учебная_Колесник2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Учебная_Колесник2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Учебная_Колесник2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Учебная_Колесник2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Учебная_Колесник2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Учебная_Колесник2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Учебная_Колесник2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Учебная_Колесник2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Учебная_Колесник2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Учебная_Колесник2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Учебная_Колесник2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Учебная_Колесник2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Учебная_Колесник2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Учебная_Колесник2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Учебная_Колесник2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Учебная_Колесник2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Учебная_Колесник2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Учебная_Колесник2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Учебная_Колесник2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Учебная_Колесник2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Учебная_Колесник2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Учебная_Колесник2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Учебная_Колесник2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Учебная_Колесник2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Учебная_Колесник2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Учебная_Колесник2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Учебная_Колесник2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Учебная_Колесник2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Учебная_Колесник2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Учебная_Колесник2] SET RECOVERY FULL 
GO
ALTER DATABASE [Учебная_Колесник2] SET  MULTI_USER 
GO
ALTER DATABASE [Учебная_Колесник2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Учебная_Колесник2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Учебная_Колесник2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Учебная_Колесник2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Учебная_Колесник2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Учебная_Колесник2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Учебная_Колесник2', N'ON'
GO
ALTER DATABASE [Учебная_Колесник2] SET QUERY_STORE = ON
GO
ALTER DATABASE [Учебная_Колесник2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Учебная_Колесник2]
GO
/****** Object:  Table [dbo].[Гимназисты]    Script Date: 28.04.2025 16:45:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Гимназисты](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [varchar](50) NOT NULL,
	[Предмет] [varchar](50) NOT NULL,
	[Школа] [varchar](50) NOT NULL,
	[Баллы] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Животные_Колесник]    Script Date: 28.04.2025 16:45:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Животные_Колесник](
	[ID] [int] NOT NULL,
	[Название] [varchar](50) NULL,
	[Отряд] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Лицеисты]    Script Date: 28.04.2025 16:45:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Лицеисты](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [varchar](50) NOT NULL,
	[Предмет] [varchar](50) NOT NULL,
	[Школа] [varchar](50) NOT NULL,
	[Баллы] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Страны]    Script Date: 28.04.2025 16:45:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Страны](
	[Страна] [nvarchar](255) NULL,
	[Столица] [nvarchar](255) NULL,
	[Часть света] [nvarchar](255) NULL,
	[Население тыс. чел.] [float] NULL,
	[Площадь тыс. кв. км] [float] NULL,
	[Тип управления] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Страны_Колесник]    Script Date: 28.04.2025 16:45:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Страны_Колесник](
	[ID] [int] NOT NULL,
	[Название] [varchar](50) NOT NULL,
	[Площадь] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Управление_Колесник]    Script Date: 28.04.2025 16:45:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Управление_Колесник](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Вид] [varchar](225) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ученики]    Script Date: 28.04.2025 16:45:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ученики](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [varchar](50) NOT NULL,
	[Предмет] [varchar](50) NOT NULL,
	[Школа] [varchar](50) NOT NULL,
	[Баллы] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ученики_Архив]    Script Date: 28.04.2025 16:45:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ученики_Архив](
	[ID] [int] NOT NULL,
	[Фамилия] [varchar](50) NULL,
	[Предмет] [varchar](50) NULL,
	[Школа] [varchar](50) NULL,
	[Баллы] [float] NULL,
	[Удалено] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ученики_Колесник]    Script Date: 28.04.2025 16:45:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ученики_Колесник](
	[Фамилия] [varchar](50) NULL,
	[Удалено] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Цветы_Колесник]    Script Date: 28.04.2025 16:45:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Цветы_Колесник](
	[ID] [int] NOT NULL,
	[Название] [varchar](50) NULL,
	[Класс] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Страны] ([Страна], [Столица], [Часть света], [Население тыс. чел.], [Площадь тыс. кв. км], [Тип управления]) VALUES (N'Австрия', N'Вена', N'Европа', 7513, 84, 4)
INSERT [dbo].[Страны] ([Страна], [Столица], [Часть света], [Население тыс. чел.], [Площадь тыс. кв. км], [Тип управления]) VALUES (N'Великобритания', N'Лондон', N'Европа', 55928, 244, 1)
INSERT [dbo].[Страны] ([Страна], [Столица], [Часть света], [Население тыс. чел.], [Площадь тыс. кв. км], [Тип управления]) VALUES (N'Греция', N'Афины', N'Европа', 9280, 132, 4)
INSERT [dbo].[Страны] ([Страна], [Столица], [Часть света], [Население тыс. чел.], [Площадь тыс. кв. км], [Тип управления]) VALUES (N'Афганистан', N'Кабул', N'Азия', 20340, 647, 3)
INSERT [dbo].[Страны] ([Страна], [Столица], [Часть света], [Население тыс. чел.], [Площадь тыс. кв. км], [Тип управления]) VALUES (N'Монголия', N'Улан-Батор', N'Азия', 1555, 1565, 4)
INSERT [dbo].[Страны] ([Страна], [Столица], [Часть света], [Население тыс. чел.], [Площадь тыс. кв. км], [Тип управления]) VALUES (N'Япония', N'Токио', N'Азия', 114276, 372, 1)
INSERT [dbo].[Страны] ([Страна], [Столица], [Часть света], [Население тыс. чел.], [Площадь тыс. кв. км], [Тип управления]) VALUES (N'Франция', N'Париж', N'Европа', 53183, 551, 3)
INSERT [dbo].[Страны] ([Страна], [Столица], [Часть света], [Население тыс. чел.], [Площадь тыс. кв. км], [Тип управления]) VALUES (N'Швеция', N'Стокгольм', N'Европа', 8268, 450, 1)
INSERT [dbo].[Страны] ([Страна], [Столица], [Часть света], [Население тыс. чел.], [Площадь тыс. кв. км], [Тип управления]) VALUES (N'Египет', N'Каир', N'Африка', 38740, 1001, 3)
INSERT [dbo].[Страны] ([Страна], [Столица], [Часть света], [Население тыс. чел.], [Площадь тыс. кв. км], [Тип управления]) VALUES (N'Сомали', N'Могадишо', N'Африка', 3350, 638, 0)
INSERT [dbo].[Страны] ([Страна], [Столица], [Часть света], [Население тыс. чел.], [Площадь тыс. кв. км], [Тип управления]) VALUES (N'США', N'Вашингтон', N'Америка', 217700, 9363, 3)
INSERT [dbo].[Страны] ([Страна], [Столица], [Часть света], [Население тыс. чел.], [Площадь тыс. кв. км], [Тип управления]) VALUES (N'Мексика', N'Мехико', N'Америка', 62500, 1973, 4)
INSERT [dbo].[Страны] ([Страна], [Столица], [Часть света], [Население тыс. чел.], [Площадь тыс. кв. км], [Тип управления]) VALUES (N'Мальта', N'Валлетта', N'Европа', 330, 0.3, 4)
INSERT [dbo].[Страны] ([Страна], [Столица], [Часть света], [Население тыс. чел.], [Площадь тыс. кв. км], [Тип управления]) VALUES (N'Монако', N'Монако', N'Европа', 25, 0.2, 1)
GO
SET IDENTITY_INSERT [dbo].[Ученики] ON 

INSERT [dbo].[Ученики] ([ID], [Фамилия], [Предмет], [Школа], [Баллы]) VALUES (1, N'Иванова', N'Математика', N'Лицей', 93.5)
INSERT [dbo].[Ученики] ([ID], [Фамилия], [Предмет], [Школа], [Баллы]) VALUES (2, N'Петров', N'Физика', N'Лицей', 99)
INSERT [dbo].[Ученики] ([ID], [Фамилия], [Предмет], [Школа], [Баллы]) VALUES (3, N'Сидоров', N'Математика', N'Лицей', 83)
INSERT [dbo].[Ученики] ([ID], [Фамилия], [Предмет], [Школа], [Баллы]) VALUES (4, N'Полухина', N'Физика', N'Гимназия', 78)
INSERT [dbo].[Ученики] ([ID], [Фамилия], [Предмет], [Школа], [Баллы]) VALUES (5, N'Матвеева', N'Химия', N'Лицей', 92)
INSERT [dbo].[Ученики] ([ID], [Фамилия], [Предмет], [Школа], [Баллы]) VALUES (6, N'Касимов', N'Химия', N'Гимназия', 68)
INSERT [dbo].[Ученики] ([ID], [Фамилия], [Предмет], [Школа], [Баллы]) VALUES (7, N'Нурулин', N'Математика', N'Гимназия', 76)
INSERT [dbo].[Ученики] ([ID], [Фамилия], [Предмет], [Школа], [Баллы]) VALUES (8, N'Авдеев', N'Физика', N'Лицей', 87)
INSERT [dbo].[Ученики] ([ID], [Фамилия], [Предмет], [Школа], [Баллы]) VALUES (9, N'Никитина', N'Химия', N'Лицей', 94)
INSERT [dbo].[Ученики] ([ID], [Фамилия], [Предмет], [Школа], [Баллы]) VALUES (10, N'Барышева', N'Химия', N'Лицей', 88)
INSERT [dbo].[Ученики] ([ID], [Фамилия], [Предмет], [Школа], [Баллы]) VALUES (11, N'Маркин', N'Физика', N'Гимназия', 96)
INSERT [dbo].[Ученики] ([ID], [Фамилия], [Предмет], [Школа], [Баллы]) VALUES (12, N'Никишина', N'Математика', N'Школа №31', 72)
INSERT [dbo].[Ученики] ([ID], [Фамилия], [Предмет], [Школа], [Баллы]) VALUES (15, N'Смирнова', N'Математика', N'Лицей', 85)
INSERT [dbo].[Ученики] ([ID], [Фамилия], [Предмет], [Школа], [Баллы]) VALUES (16, N'Козлов', N'Физика', N'Гимназия', 90)
INSERT [dbo].[Ученики] ([ID], [Фамилия], [Предмет], [Школа], [Баллы]) VALUES (17, N'Лебедева', N'Химия', N'Школа №18', 70)
SET IDENTITY_INSERT [dbo].[Ученики] OFF
GO
ALTER TABLE [dbo].[Животные_Колесник] ADD  DEFAULT ('Хищные') FOR [Отряд]
GO
ALTER TABLE [dbo].[Управление_Колесник] ADD  DEFAULT ('Республика') FOR [Вид]
GO
ALTER TABLE [dbo].[Цветы_Колесник] ADD  DEFAULT ('Двудольные') FOR [Класс]
GO
ALTER TABLE [dbo].[Страны_Колесник]  WITH CHECK ADD CHECK  (([Площадь]>(0)))
GO
ALTER TABLE [dbo].[Ученики]  WITH CHECK ADD CHECK  (([Баллы]>=(0) AND [Баллы]<=(100)))
GO
USE [master]
GO
ALTER DATABASE [Учебная_Колесник2] SET  READ_WRITE 
GO
