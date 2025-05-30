USE [master]
GO
/****** Object:  Database [Учебная_Колесник]    Script Date: 10.05.2025 10:34:49 ******/
CREATE DATABASE [Учебная_Колесник]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Учебная_Колесник', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Учебная_Колесник.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Учебная_Колесник_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Учебная_Колесник_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Учебная_Колесник] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Учебная_Колесник].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Учебная_Колесник] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Учебная_Колесник] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Учебная_Колесник] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Учебная_Колесник] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Учебная_Колесник] SET ARITHABORT OFF 
GO
ALTER DATABASE [Учебная_Колесник] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Учебная_Колесник] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Учебная_Колесник] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Учебная_Колесник] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Учебная_Колесник] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Учебная_Колесник] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Учебная_Колесник] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Учебная_Колесник] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Учебная_Колесник] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Учебная_Колесник] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Учебная_Колесник] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Учебная_Колесник] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Учебная_Колесник] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Учебная_Колесник] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Учебная_Колесник] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Учебная_Колесник] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Учебная_Колесник] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Учебная_Колесник] SET RECOVERY FULL 
GO
ALTER DATABASE [Учебная_Колесник] SET  MULTI_USER 
GO
ALTER DATABASE [Учебная_Колесник] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Учебная_Колесник] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Учебная_Колесник] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Учебная_Колесник] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Учебная_Колесник] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Учебная_Колесник] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Учебная_Колесник', N'ON'
GO
ALTER DATABASE [Учебная_Колесник] SET QUERY_STORE = ON
GO
ALTER DATABASE [Учебная_Колесник] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Учебная_Колесник]
GO
/****** Object:  UserDefinedFunction [dbo].[Пример1]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Пример1] (@Страна AS VARCHAR(50)) RETURNS VARCHAR(50) AS BEGIN DECLARE @S1 AS VARCHAR(50) SELECT @S1 = Столица FROM Страны WHERE Название = @Страна RETURN @S1 END
GO
/****** Object:  UserDefinedFunction [dbo].[Пример2]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* Пример 2: Создать функцию для перевода площади в тыс. кв. км. */
CREATE FUNCTION [dbo].[Пример2] (@Площадь AS FLOAT) RETURNS FLOAT AS BEGIN DECLARE @P2 AS FLOAT SET @P2 = ROUND(@Площадь / 1000, 2) RETURN @P2 END
GO
/****** Object:  UserDefinedFunction [dbo].[Пример3]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* Пример 3: Создать функцию для вычисления плотности населения */
CREATE FUNCTION [dbo].[Пример3] (@Население AS INT, @Площадь AS FLOAT) RETURNS FLOAT AS BEGIN DECLARE @P3 AS FLOAT SET @P3 = ROUND(CAST(@Население AS FLOAT) / @Площадь, 2) RETURN @P3 END
GO
/****** Object:  UserDefinedFunction [dbo].[Пример4]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Пример4]() RETURNS VARCHAR(50) AS BEGIN DECLARE @P4 AS VARCHAR(50), @M1 AS FLOAT, @M2 AS FLOAT SELECT @M1 = MAX(Площадь) FROM Страны SELECT @M2 = MAX(Площадь) FROM Страны WHERE Площадь < @M1 SELECT @P4 = Название FROM Страны WHERE Площадь = @M2 RETURN @P4 END
GO
/****** Object:  UserDefinedFunction [dbo].[Пример5]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Пример5] (@Конт AS VARCHAR(50) = 'Европа') RETURNS VARCHAR(50) AS BEGIN DECLARE @P5 AS VARCHAR(50), @M5 AS FLOAT SELECT @M5 = MIN(Площадь) FROM Страны WHERE Континент = @Конт SELECT @P5 = Название FROM Страны WHERE Континент = @Конт AND Площадь = @M5 RETURN @P5 END
GO
/****** Object:  UserDefinedFunction [dbo].[Пример6]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Пример6] (@A6 AS VARCHAR(50)) RETURNS VARCHAR(50) AS BEGIN RETURN LEFT(@A6, 1) + REPLICATE('.', LEN(@A6) - 2) + RIGHT(@A6, 1) END
GO
/****** Object:  UserDefinedFunction [dbo].[Пример7]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Пример7] (@C7 AS CHAR(1)) RETURNS INT AS BEGIN DECLARE @K7 AS INT SELECT @K7 = COUNT(*) FROM Страны WHERE CHARINDEX(@C7, Название) > 0 RETURN @K7 END

GO
/****** Object:  Table [dbo].[Страны]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Страны](
	[Название] [nvarchar](255) NULL,
	[Столица] [nvarchar](255) NULL,
	[Площадь] [float] NULL,
	[Население] [float] NULL,
	[Континент] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Пример1Представление]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* Пример 1: Создайте представление, содержащее список стран, население которых меньше 1 млн. чел., а площадь больше 100 тыс. кв. км, и используйте его */
CREATE VIEW [dbo].[Пример1Представление] AS SELECT Название, Столица, Площадь, Население, Континент FROM Страны WHERE Население < 1000000 AND Площадь > 100000
GO
/****** Object:  View [dbo].[Пример2Представление]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Пример2Представление] (Континент, Площадь, Население) AS SELECT Континент, SUM(Площадь), SUM(Население) FROM Страны GROUP BY Континент
GO
/****** Object:  View [dbo].[Задание1Представление]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* Задание 1: Создайте представление, содержащее список африканских стран, население которых больше 10 млн. чел., а площадь больше 500 тыс. кв. км, и используйте его */
CREATE VIEW [dbo].[Задание1Представление] AS SELECT Название, Столица, Площадь, Население, Континент FROM Страны WHERE Континент = 'Африка' AND Население > 10000000 AND Площадь > 500000
GO
/****** Object:  View [dbo].[Задание2Представление]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* Задание 2: Создайте представление, содержащее список континентов, среднюю площадь стран, которые находятся на нем, среднюю плотность населения, и используйте его */
CREATE VIEW [dbo].[Задание2Представление] (Континент, Средняя_площадь, Средняя_плотность) AS SELECT Континент, AVG(Площадь), AVG(Население / Площадь) FROM Страны GROUP BY Континент
GO
/****** Object:  Table [dbo].[Кафедра]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Кафедра](
	[Шифр] [nvarchar](255) NOT NULL,
	[Название] [nvarchar](255) NOT NULL,
	[Факультет] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK__Кафедра__6900EEE6732EA663] PRIMARY KEY CLUSTERED 
(
	[Шифр] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Преподаватель]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Преподаватель](
	[Таб_номер] [int] NOT NULL,
	[Звание] [nvarchar](255) NOT NULL,
	[Степень] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK__Преподав__9398F8D9EFEF57BE] PRIMARY KEY CLUSTERED 
(
	[Таб_номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудник]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудник](
	[Таб_номер] [int] NOT NULL,
	[Кафедра] [nvarchar](255) NULL,
	[ФИО] [nvarchar](255) NULL,
	[Должность] [nvarchar](255) NULL,
	[Зарплата] [decimal](10, 2) NULL,
	[Начальник] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Таб_номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Пример3Представление]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* Пример 3: Создайте представление, содержащее фамилии преподавателей, должность, каждого преподавателя, звание, степень, место работы, зарплату и используйте его */
CREATE VIEW [dbo].[Пример3Представление] (Фамилия, Должность, Звание, Степень, Кафедра, Зарплата) AS SELECT Фамилия, Должность, Звание, Степень, Название, Зарплата FROM Сотрудник С INNER JOIN Преподаватель П ON С.Таб_номер = П.Таб_номер INNER JOIN Кафедра К ON С.Шифр = К.Шифр
GO
/****** Object:  Table [dbo].[Экзамен]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Экзамен](
	[Код_Экзамена] [int] NOT NULL,
	[Дата] [date] NOT NULL,
	[Код] [int] NOT NULL,
	[Рег_номер] [int] NOT NULL,
	[Таб_номер] [int] NOT NULL,
	[Аудитория] [nvarchar](4) NOT NULL,
	[Оценка] [int] NOT NULL,
 CONSTRAINT [PK__Экзамен__327441B53055BA0E] PRIMARY KEY CLUSTERED 
(
	[Код_Экзамена] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Задание3Представление]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* Задание 3: Создайте представление, содержащее фамилии преподавателей, их должность, звание, степень, место работы, количество их экзаменов, и используйте его */
CREATE VIEW [dbo].[Задание3Представление] (Фамилия, Должность, Звание, Степень, Кафедра, Количество_экзаменов) AS SELECT С.Фамилия, С.Должность, П.Звание, П.Степень, К.Название, COUNT(Э.Дата) FROM Сотрудник С INNER JOIN Преподаватель П ON С.Таб_номер = П.Таб_номер INNER JOIN Кафедра К ON С.Шифр = К.Шифр LEFT JOIN Экзамен Э ON С.Таб_номер = Э.Таб_номер GROUP BY С.Фамилия, С.Должность, П.Звание, П.Степень, К.Название
GO
/****** Object:  UserDefinedFunction [dbo].[Пример9]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Пример9] (@A9 AS FLOAT, @B9 AS FLOAT) RETURNS TABLE AS RETURN (SELECT Название, Столица, Площадь, Население, Континент FROM Страны WHERE Площадь BETWEEN @A9 AND @B9)
GO
/****** Object:  Table [dbo].[Академики]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Академики](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [nvarchar](255) NOT NULL,
	[Имя] [nvarchar](255) NOT NULL,
	[Отчество] [nvarchar](255) NOT NULL,
	[Дата_рождения] [date] NOT NULL,
	[Специализация] [nvarchar](255) NOT NULL,
	[Год_присвоения_звания] [int] NOT NULL,
 CONSTRAINT [PK_Академики] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Дисциплина]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Дисциплина](
	[Код] [int] NOT NULL,
	[Объем] [int] NOT NULL,
	[Название] [nvarchar](255) NOT NULL,
	[Исполнители] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK__Дисципли__AE76132EAFA22C10] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Зав_кафедрой]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Зав_кафедрой](
	[Таб_номер] [int] NOT NULL,
	[Стаж] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Таб_номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заявка]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заявка](
	[Номер_Заявки] [int] NOT NULL,
	[Код] [int] NOT NULL,
	[Номер] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK__Заявка__AA40880FF80EC2BF] PRIMARY KEY CLUSTERED 
(
	[Номер_Заявки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Инженер]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Инженер](
	[Таб_номер] [int] NOT NULL,
	[Специальность] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Таб_номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Специальность]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Специальность](
	[Номер] [nvarchar](255) NOT NULL,
	[Направление] [nvarchar](255) NOT NULL,
	[Шифр] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK__Специаль__063C4BF6CB8290D1] PRIMARY KEY CLUSTERED 
(
	[Номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Страны_У]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Страны_У](
	[Название] [nvarchar](255) NULL,
	[Столица] [nvarchar](255) NULL,
	[Площадь] [float] NULL,
	[Население] [float] NULL,
	[Континент] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Студент]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Студент](
	[Рег_номер] [int] NOT NULL,
	[Номер] [nvarchar](255) NOT NULL,
	[Фамилия] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK__Студент__7C2075B9AF93D71F] PRIMARY KEY CLUSTERED 
(
	[Рег_номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Факультет]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Факультет](
	[Аббревиатура] [nvarchar](255) NOT NULL,
	[Название] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK__Факульте__FDFD8786154D3DE1] PRIMARY KEY CLUSTERED 
(
	[Аббревиатура] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Академики] ON 

INSERT [dbo].[Академики] ([Код], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (1, N'Аничков', N'Николай', N'Николаевич', CAST(N'1885-11-03' AS Date), N'медицина', 1939)
INSERT [dbo].[Академики] ([Код], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (2, N'Бартольд', N'Василий', N'Владимирович', CAST(N'1869-11-15' AS Date), N'историк', 1913)
INSERT [dbo].[Академики] ([Код], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (3, N'Белопольский', N'Аристарх', N'Аполлонович', CAST(N'1854-07-13' AS Date), N'астрофизик', 1903)
INSERT [dbo].[Академики] ([Код], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (4, N'Бородин', N'Иван', N'Парфеньевич', CAST(N'1847-01-30' AS Date), N'ботаник', 1902)
INSERT [dbo].[Академики] ([Код], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (5, N'Вальден', N'Павел', N'Иванович', CAST(N'1863-07-26' AS Date), N'химик-технолог', 1910)
INSERT [dbo].[Академики] ([Код], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (6, N'Вернадский', N'Владимир', N'Иванович', CAST(N'1863-03-12' AS Date), N'геохимик', 1908)
INSERT [dbo].[Академики] ([Код], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (7, N'Виноградов', N'Павел', N'Гаврилович', CAST(N'1854-11-30' AS Date), N'историк', 1914)
INSERT [dbo].[Академики] ([Код], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (8, N'Ипатьев', N'Владимир', N'Николаевич', CAST(N'1867-11-21' AS Date), N'химик', 1916)
INSERT [dbo].[Академики] ([Код], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (9, N'Истрин', N'Василий', N'Михайлович', CAST(N'1865-02-22' AS Date), N'филолог', 1907)
INSERT [dbo].[Академики] ([Код], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (10, N'Карпинский', N'Александр', N'Петрович', CAST(N'1847-01-07' AS Date), N'геолог', 1889)
INSERT [dbo].[Академики] ([Код], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (11, N'Коковцов', N'Павел', N'Константинович', CAST(N'1861-07-01' AS Date), N'историк', 1906)
INSERT [dbo].[Академики] ([Код], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (12, N'Курнаков', N'Николай', N'Семёнович', CAST(N'1860-12-06' AS Date), N'химик', 1913)
INSERT [dbo].[Академики] ([Код], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (13, N'Марр', N'Николай', N'Яковлевич', CAST(N'1865-01-06' AS Date), N'лингвист', 1912)
INSERT [dbo].[Академики] ([Код], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (14, N'Насонов', N'Николай', N'Викторович', CAST(N'1855-02-26' AS Date), N'зоолог', 1906)
INSERT [dbo].[Академики] ([Код], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (15, N'Ольденбург', N'Сергей', N'Фёдорович', CAST(N'1863-09-26' AS Date), N'историк', 1903)
INSERT [dbo].[Академики] ([Код], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (16, N'Павлов', N'Иван', N'Петрович', CAST(N'1849-09-26' AS Date), N'физиолог', 1907)
INSERT [dbo].[Академики] ([Код], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (17, N'Перетц', N'Владимир', N'Николаевич', CAST(N'1870-01-31' AS Date), N'филолог', 1914)
INSERT [dbo].[Академики] ([Код], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (18, N'Соболевский', N'Алексей', N'Иванович', CAST(N'1857-01-07' AS Date), N'лингвист', 1900)
INSERT [dbo].[Академики] ([Код], [Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (19, N'Стеклов', N'Владимир', N'Андреевич', CAST(N'1864-01-09' AS Date), N'математик', 1912)
SET IDENTITY_INSERT [dbo].[Академики] OFF
GO
INSERT [dbo].[Дисциплина] ([Код], [Объем], [Название], [Исполнители]) VALUES (101, 320, N'Математика', N'вм')
INSERT [dbo].[Дисциплина] ([Код], [Объем], [Название], [Исполнители]) VALUES (102, 160, N'Информатика', N'пи')
INSERT [dbo].[Дисциплина] ([Код], [Объем], [Название], [Исполнители]) VALUES (103, 160, N'Физика', N'оф')
INSERT [dbo].[Дисциплина] ([Код], [Объем], [Название], [Исполнители]) VALUES (202, 120, N'Базы данных', N'ис')
INSERT [dbo].[Дисциплина] ([Код], [Объем], [Название], [Исполнители]) VALUES (204, 160, N'Электроника', N'эф')
INSERT [dbo].[Дисциплина] ([Код], [Объем], [Название], [Исполнители]) VALUES (205, 80, N'Программирование', N'пи')
INSERT [dbo].[Дисциплина] ([Код], [Объем], [Название], [Исполнители]) VALUES (209, 80, N'Моделирование', N'мм')
GO
INSERT [dbo].[Зав_кафедрой] ([Таб_номер], [Стаж]) VALUES (101, 15)
INSERT [dbo].[Зав_кафедрой] ([Таб_номер], [Стаж]) VALUES (201, 18)
INSERT [dbo].[Зав_кафедрой] ([Таб_номер], [Стаж]) VALUES (301, 20)
INSERT [dbo].[Зав_кафедрой] ([Таб_номер], [Стаж]) VALUES (401, 10)
INSERT [dbo].[Зав_кафедрой] ([Таб_номер], [Стаж]) VALUES (501, 18)
INSERT [dbo].[Зав_кафедрой] ([Таб_номер], [Стаж]) VALUES (601, 8)
GO
INSERT [dbo].[Заявка] ([Номер_Заявки], [Код], [Номер]) VALUES (1, 101, N'01.03.04')
INSERT [dbo].[Заявка] ([Номер_Заявки], [Код], [Номер]) VALUES (2, 205, N'01.03.04')
INSERT [dbo].[Заявка] ([Номер_Заявки], [Код], [Номер]) VALUES (3, 209, N'01.03.04')
INSERT [dbo].[Заявка] ([Номер_Заявки], [Код], [Номер]) VALUES (4, 101, N'09.03.02')
INSERT [dbo].[Заявка] ([Номер_Заявки], [Код], [Номер]) VALUES (5, 102, N'09.03.02')
INSERT [dbo].[Заявка] ([Номер_Заявки], [Код], [Номер]) VALUES (6, 103, N'09.03.02')
INSERT [dbo].[Заявка] ([Номер_Заявки], [Код], [Номер]) VALUES (7, 202, N'09.03.02')
INSERT [dbo].[Заявка] ([Номер_Заявки], [Код], [Номер]) VALUES (8, 205, N'09.03.02')
INSERT [dbo].[Заявка] ([Номер_Заявки], [Код], [Номер]) VALUES (9, 209, N'09.03.02')
INSERT [dbo].[Заявка] ([Номер_Заявки], [Код], [Номер]) VALUES (10, 101, N'09.03.03')
INSERT [dbo].[Заявка] ([Номер_Заявки], [Код], [Номер]) VALUES (11, 102, N'09.03.03')
INSERT [dbo].[Заявка] ([Номер_Заявки], [Код], [Номер]) VALUES (12, 103, N'09.03.03')
INSERT [dbo].[Заявка] ([Номер_Заявки], [Код], [Номер]) VALUES (13, 202, N'09.03.03')
INSERT [dbo].[Заявка] ([Номер_Заявки], [Код], [Номер]) VALUES (14, 205, N'09.03.03')
INSERT [dbo].[Заявка] ([Номер_Заявки], [Код], [Номер]) VALUES (15, 101, N'14.03.02')
INSERT [dbo].[Заявка] ([Номер_Заявки], [Код], [Номер]) VALUES (16, 102, N'14.03.02')
INSERT [dbo].[Заявка] ([Номер_Заявки], [Код], [Номер]) VALUES (17, 103, N'14.03.02')
INSERT [dbo].[Заявка] ([Номер_Заявки], [Код], [Номер]) VALUES (18, 204, N'14.03.02')
INSERT [dbo].[Заявка] ([Номер_Заявки], [Код], [Номер]) VALUES (19, 101, N'38.03.05')
INSERT [dbo].[Заявка] ([Номер_Заявки], [Код], [Номер]) VALUES (20, 103, N'38.03.05')
INSERT [dbo].[Заявка] ([Номер_Заявки], [Код], [Номер]) VALUES (21, 202, N'38.03.05')
INSERT [dbo].[Заявка] ([Номер_Заявки], [Код], [Номер]) VALUES (22, 209, N'38.03.05')
GO
INSERT [dbo].[Инженер] ([Таб_номер], [Специальность]) VALUES (153, N'электроник')
INSERT [dbo].[Инженер] ([Таб_номер], [Специальность]) VALUES (241, N'электроник')
INSERT [dbo].[Инженер] ([Таб_номер], [Специальность]) VALUES (242, N'программист')
INSERT [dbo].[Инженер] ([Таб_номер], [Специальность]) VALUES (435, N'электроник')
INSERT [dbo].[Инженер] ([Таб_номер], [Специальность]) VALUES (614, N'программист')
GO
INSERT [dbo].[Кафедра] ([Шифр], [Название], [Факультет]) VALUES (N'вм', N'Высшая математика', N'Ен')
INSERT [dbo].[Кафедра] ([Шифр], [Название], [Факультет]) VALUES (N'ис', N'Информационные системы', N'Ит')
INSERT [dbo].[Кафедра] ([Шифр], [Название], [Факультет]) VALUES (N'мм', N'Математическое моделирование', N'Фм')
INSERT [dbo].[Кафедра] ([Шифр], [Название], [Факультет]) VALUES (N'оф', N'Общая физика', N'Ен')
INSERT [dbo].[Кафедра] ([Шифр], [Название], [Факультет]) VALUES (N'пи', N'Прикладная информатика', N'Ит')
INSERT [dbo].[Кафедра] ([Шифр], [Название], [Факультет]) VALUES (N'эф', N'Экспериментальная физика', N'Фм')
GO
INSERT [dbo].[Преподаватель] ([Таб_номер], [Звание], [Степень]) VALUES (101, N'профессор', N'д. т.н.')
INSERT [dbo].[Преподаватель] ([Таб_номер], [Звание], [Степень]) VALUES (102, N'доцент', N'к. ф.-м. н.')
INSERT [dbo].[Преподаватель] ([Таб_номер], [Звание], [Степень]) VALUES (105, N'доцент', N'к. т.н.')
INSERT [dbo].[Преподаватель] ([Таб_номер], [Звание], [Степень]) VALUES (201, N'профессор', N'д. ф.-м. н.')
INSERT [dbo].[Преподаватель] ([Таб_номер], [Звание], [Степень]) VALUES (202, N'доцент', N'к. ф.-м. н.')
INSERT [dbo].[Преподаватель] ([Таб_номер], [Звание], [Степень]) VALUES (301, N'профессор', N'д. т.н.')
INSERT [dbo].[Преподаватель] ([Таб_номер], [Звание], [Степень]) VALUES (302, N'доцент', N'к. т.н.')
INSERT [dbo].[Преподаватель] ([Таб_номер], [Звание], [Степень]) VALUES (401, N'профессор', N'д. т.н.')
INSERT [dbo].[Преподаватель] ([Таб_номер], [Звание], [Степень]) VALUES (402, N'доцент', N'к. т.н.')
INSERT [dbo].[Преподаватель] ([Таб_номер], [Звание], [Степень]) VALUES (403, N'ассистент', N'–')
INSERT [dbo].[Преподаватель] ([Таб_номер], [Звание], [Степень]) VALUES (501, N'профессор', N'д. ф.-м. н.')
INSERT [dbo].[Преподаватель] ([Таб_номер], [Звание], [Степень]) VALUES (502, N'профессор', N'д. ф.-м. н.')
INSERT [dbo].[Преподаватель] ([Таб_номер], [Звание], [Степень]) VALUES (503, N'доцент', N'к. ф.-м. н.')
INSERT [dbo].[Преподаватель] ([Таб_номер], [Звание], [Степень]) VALUES (601, N'профессор', N'д. ф.-м. н.')
GO
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (101, N'пи', N'Прохоров П.П.', N'зав. кафедрой', CAST(35000.00 AS Decimal(10, 2)), 101)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (102, N'пи', N'Семенов С.С.', N'преподаватель', CAST(25000.00 AS Decimal(10, 2)), 101)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (105, N'пи', N'Петров П.П.', N'преподаватель', CAST(25000.00 AS Decimal(10, 2)), 101)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (153, N'пи', N'Сидорова С.С.', N'инженер', CAST(15000.00 AS Decimal(10, 2)), 102)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (201, N'ис', N'Андреев А.А.', N'зав. кафедрой', CAST(35000.00 AS Decimal(10, 2)), 201)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (202, N'ис', N'Борисов Б.Б.', N'преподаватель', CAST(25000.00 AS Decimal(10, 2)), 201)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (241, N'ис', N'Глухов Г.Г.', N'инженер', CAST(20000.00 AS Decimal(10, 2)), 201)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (242, N'ис', N'Чернов Ч.Ч.', N'инженер', CAST(15000.00 AS Decimal(10, 2)), 202)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (301, N'мм', N'Басов Б.Б.', N'зав. кафедрой', CAST(35000.00 AS Decimal(10, 2)), 301)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (302, N'мм', N'Сергеева С.С.', N'преподаватель', CAST(25000.00 AS Decimal(10, 2)), 301)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (401, N'оф', N'Волков В.В.', N'зав. кафедрой', CAST(35000.00 AS Decimal(10, 2)), 401)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (402, N'оф', N'Зайцев З.З.', N'преподаватель', CAST(25000.00 AS Decimal(10, 2)), 401)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (403, N'оф', N'Смирнов С.С.', N'преподаватель', CAST(15000.00 AS Decimal(10, 2)), 401)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (435, N'оф', N'Лисин Л.Л.', N'инженер', CAST(20000.00 AS Decimal(10, 2)), 402)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (501, N'вм', N'Кузнецов К.К.', N'зав. кафедрой', CAST(35000.00 AS Decimal(10, 2)), 501)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (502, N'вм', N'Романцев Р.Р.', N'преподаватель', CAST(25000.00 AS Decimal(10, 2)), 501)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (503, N'вм', N'Соловьев С.С.', N'преподаватель', CAST(25000.00 AS Decimal(10, 2)), 501)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (601, N'эф', N'Зверев З.З.', N'зав. кафедрой', CAST(35000.00 AS Decimal(10, 2)), 601)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (602, N'эф', N'Сорокина С.С.', N'преподаватель', CAST(25000.00 AS Decimal(10, 2)), 601)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (614, N'эф', N'Григорьев Г.Г.', N'инженер', CAST(20000.00 AS Decimal(10, 2)), 602)
GO
INSERT [dbo].[Специальность] ([Номер], [Направление], [Шифр]) VALUES (N'01.03.04', N'Прикладная математика', N'мм')
INSERT [dbo].[Специальность] ([Номер], [Направление], [Шифр]) VALUES (N'09.03.02', N'Информационные системы и технологии', N'ис')
INSERT [dbo].[Специальность] ([Номер], [Направление], [Шифр]) VALUES (N'09.03.03', N'Прикладная информатика', N'пи')
INSERT [dbo].[Специальность] ([Номер], [Направление], [Шифр]) VALUES (N'14.03.02', N'Ядерные физика и технологии', N'эф')
INSERT [dbo].[Специальность] ([Номер], [Направление], [Шифр]) VALUES (N'38.03.05', N'Бизнес-информатика', N'ис')
GO
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Австрия', N'Вена', 83858, 8741753, N'Европа')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Азербайджан', N'Баку', 86600, 9705600, N'Азия')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Албания', N'Тирана', 28748, 2866026, N'Европа')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Алжир', N'Алжир', 2381740, 39813722, N'Африка')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Ангола', N'Луанда', 1246700, 25831000, N'Африка')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Аргентина', N'Буэнос-Айрес', 2766890, 43847000, N'Южная Америка')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Афганистан', N'Кабул', 647500, 29822848, N'Азия')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Бангладеш', N'Дакка', 144000, 160221000, N'Азия')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Бахрейн', N'Манама', 701, 1397000, N'Азия')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Белиз', N'Бельмопан', 22966, 377968, N'Северная Америка')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Белоруссия', N'Минск', 207595, 9498400, N'Европа')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Бельгия', N'Брюссель', 30528, 11250585, N'Европа')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Бенин', N'Порто-Ново', 112620, 11167000, N'Африка')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Болгария', N'София', 110910, 7153784, N'Европа')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Боливия', N'Сукре', 1098580, 10985059, N'Южная Америка')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Ботсвана', N'Габороне', 600370, 2209208, N'Африка')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Бразилия', N'Бразилиа', 8511965, 206081432, N'Южная Америка')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Буркина-Фасо', N'Уагадугу', 274200, 19034397, N'Африка')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Бутан', N'Тхимпху', 47000, 784000, N'Азия')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Великобритания', N'Лондон', 244820, 65341183, N'Европа')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Венгрия', N'Будапешт', 93030, 9830485, N'Европа')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Венесуэла', N'Каракас', 912050, 31028637, N'Южная Америка')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Восточный', N'Тимор Дили', 14874, 1167242, N'Азия')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Вьетнам', N'Ханой', 329560, 91713300, N'Азия')
GO
INSERT [dbo].[Студент] ([Рег_номер], [Номер], [Фамилия]) VALUES (10101, N'09.03.03', N'Николаева Н. Н.')
INSERT [dbo].[Студент] ([Рег_номер], [Номер], [Фамилия]) VALUES (10102, N'09.03.03', N'Иванов И. И.')
INSERT [dbo].[Студент] ([Рег_номер], [Номер], [Фамилия]) VALUES (10103, N'09.03.03', N'Крюков К. К.')
INSERT [dbo].[Студент] ([Рег_номер], [Номер], [Фамилия]) VALUES (20101, N'09.03.02', N'Андреев А. А.')
INSERT [dbo].[Студент] ([Рег_номер], [Номер], [Фамилия]) VALUES (20102, N'09.03.02', N'Федоров Ф. Ф.')
INSERT [dbo].[Студент] ([Рег_номер], [Номер], [Фамилия]) VALUES (30101, N'14.03.02', N'Бондаренко Б. Б.')
INSERT [dbo].[Студент] ([Рег_номер], [Номер], [Фамилия]) VALUES (30102, N'14.03.02', N'Цветков К. К.')
INSERT [dbo].[Студент] ([Рег_номер], [Номер], [Фамилия]) VALUES (30103, N'14.03.02', N'Петров П. П.')
INSERT [dbo].[Студент] ([Рег_номер], [Номер], [Фамилия]) VALUES (50101, N'01.03.04', N'Сергеев С. С.')
INSERT [dbo].[Студент] ([Рег_номер], [Номер], [Фамилия]) VALUES (50102, N'01.03.04', N'Кудрявцев К. К.')
INSERT [dbo].[Студент] ([Рег_номер], [Номер], [Фамилия]) VALUES (80101, N'38.03.05', N'Макаров М. М.')
INSERT [dbo].[Студент] ([Рег_номер], [Номер], [Фамилия]) VALUES (80102, N'38.03.05', N'Яковлев Я. Я.')
GO
INSERT [dbo].[Факультет] ([Аббревиатура], [Название]) VALUES (N'Гн', N'Гуманитарные науки')
INSERT [dbo].[Факультет] ([Аббревиатура], [Название]) VALUES (N'Ен', N'Естественные науки')
INSERT [dbo].[Факультет] ([Аббревиатура], [Название]) VALUES (N'Ит', N'Информационные технологии')
INSERT [dbo].[Факультет] ([Аббревиатура], [Название]) VALUES (N'Фм', N'Физико-математический')
GO
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (1, CAST(N'2015-06-05' AS Date), 102, 10101, 102, N'т505', 4)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (2, CAST(N'2015-06-05' AS Date), 102, 10102, 102, N'т505', 4)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (3, CAST(N'2015-06-05' AS Date), 202, 20101, 202, N'т506', 4)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (4, CAST(N'2015-06-05' AS Date), 202, 20102, 202, N'т506', 3)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (5, CAST(N'2015-06-07' AS Date), 102, 30101, 105, N'ф419', 3)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (6, CAST(N'2015-06-07' AS Date), 102, 30102, 101, N'т506', 4)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (7, CAST(N'2015-06-07' AS Date), 102, 80101, 102, N'м425', 5)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (8, CAST(N'2015-06-09' AS Date), 205, 80102, 402, N'м424', 4)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (9, CAST(N'2015-06-09' AS Date), 209, 20101, 302, N'ф333', 3)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (10, CAST(N'2015-06-10' AS Date), 101, 10101, 501, N'т506', 4)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (11, CAST(N'2015-06-10' AS Date), 101, 10102, 501, N'т506', 4)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (12, CAST(N'2015-06-10' AS Date), 204, 30102, 601, N'ф349', 5)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (13, CAST(N'2015-06-10' AS Date), 209, 80101, 301, N'э105', 5)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (14, CAST(N'2015-06-10' AS Date), 209, 80102, 301, N'э105', 4)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (15, CAST(N'2015-06-12' AS Date), 101, 80101, 502, N'с324', 4)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (16, CAST(N'2015-06-15' AS Date), 101, 30101, 503, N'ф417', 4)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (17, CAST(N'2015-06-15' AS Date), 101, 50101, 501, N'ф201', 5)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (18, CAST(N'2015-06-15' AS Date), 101, 50102, 501, N'ф201', 3)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (19, CAST(N'2015-06-15' AS Date), 103, 10101, 403, N'ф414', 4)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (20, CAST(N'2015-06-17' AS Date), 102, 10101, 102, N'т505', 5)
GO
ALTER TABLE [dbo].[Дисциплина]  WITH CHECK ADD  CONSTRAINT [FK__Дисциплин__Испол__6FB49575] FOREIGN KEY([Исполнители])
REFERENCES [dbo].[Кафедра] ([Шифр])
GO
ALTER TABLE [dbo].[Дисциплина] CHECK CONSTRAINT [FK__Дисциплин__Испол__6FB49575]
GO
ALTER TABLE [dbo].[Зав_кафедрой]  WITH CHECK ADD FOREIGN KEY([Таб_номер])
REFERENCES [dbo].[Сотрудник] ([Таб_номер])
GO
ALTER TABLE [dbo].[Заявка]  WITH CHECK ADD  CONSTRAINT [FK__Заявка__Код__73852659] FOREIGN KEY([Код])
REFERENCES [dbo].[Дисциплина] ([Код])
GO
ALTER TABLE [dbo].[Заявка] CHECK CONSTRAINT [FK__Заявка__Код__73852659]
GO
ALTER TABLE [dbo].[Заявка]  WITH CHECK ADD  CONSTRAINT [FK__Заявка__Номер__72910220] FOREIGN KEY([Номер])
REFERENCES [dbo].[Специальность] ([Номер])
GO
ALTER TABLE [dbo].[Заявка] CHECK CONSTRAINT [FK__Заявка__Номер__72910220]
GO
ALTER TABLE [dbo].[Инженер]  WITH CHECK ADD FOREIGN KEY([Таб_номер])
REFERENCES [dbo].[Сотрудник] ([Таб_номер])
GO
ALTER TABLE [dbo].[Кафедра]  WITH CHECK ADD  CONSTRAINT [FK__Кафедра__Факульт__69FBBC1F] FOREIGN KEY([Факультет])
REFERENCES [dbo].[Факультет] ([Аббревиатура])
GO
ALTER TABLE [dbo].[Кафедра] CHECK CONSTRAINT [FK__Кафедра__Факульт__69FBBC1F]
GO
ALTER TABLE [dbo].[Преподаватель]  WITH CHECK ADD  CONSTRAINT [FK__Преподава__Таб_н__7FEAFD3E] FOREIGN KEY([Таб_номер])
REFERENCES [dbo].[Сотрудник] ([Таб_номер])
GO
ALTER TABLE [dbo].[Преподаватель] CHECK CONSTRAINT [FK__Преподава__Таб_н__7FEAFD3E]
GO
ALTER TABLE [dbo].[Сотрудник]  WITH CHECK ADD  CONSTRAINT [FK__Сотрудник__Кафед__76619304] FOREIGN KEY([Кафедра])
REFERENCES [dbo].[Кафедра] ([Шифр])
GO
ALTER TABLE [dbo].[Сотрудник] CHECK CONSTRAINT [FK__Сотрудник__Кафед__76619304]
GO
ALTER TABLE [dbo].[Сотрудник]  WITH CHECK ADD FOREIGN KEY([Начальник])
REFERENCES [dbo].[Сотрудник] ([Таб_номер])
GO
ALTER TABLE [dbo].[Специальность]  WITH CHECK ADD  CONSTRAINT [FK__Специально__Шифр__6CD828CA] FOREIGN KEY([Шифр])
REFERENCES [dbo].[Кафедра] ([Шифр])
GO
ALTER TABLE [dbo].[Специальность] CHECK CONSTRAINT [FK__Специально__Шифр__6CD828CA]
GO
ALTER TABLE [dbo].[Экзамен]  WITH CHECK ADD  CONSTRAINT [FK__Экзамен__Код__05A3D694] FOREIGN KEY([Код])
REFERENCES [dbo].[Дисциплина] ([Код])
GO
ALTER TABLE [dbo].[Экзамен] CHECK CONSTRAINT [FK__Экзамен__Код__05A3D694]
GO
ALTER TABLE [dbo].[Экзамен]  WITH CHECK ADD  CONSTRAINT [FK__Экзамен__Рег_ном__0697FACD] FOREIGN KEY([Рег_номер])
REFERENCES [dbo].[Студент] ([Рег_номер])
GO
ALTER TABLE [dbo].[Экзамен] CHECK CONSTRAINT [FK__Экзамен__Рег_ном__0697FACD]
GO
ALTER TABLE [dbo].[Экзамен]  WITH CHECK ADD  CONSTRAINT [FK__Экзамен__Таб_ном__078C1F06] FOREIGN KEY([Таб_номер])
REFERENCES [dbo].[Преподаватель] ([Таб_номер])
GO
ALTER TABLE [dbo].[Экзамен] CHECK CONSTRAINT [FK__Экзамен__Таб_ном__078C1F06]
GO
/****** Object:  StoredProcedure [dbo].[Задание10Процедура]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Задание10Процедура] @K AS INT OUTPUT, @D AS INT AS BEGIN IF @D BETWEEN 0 AND 9 SET @K = @K * 10 + @D END
GO
/****** Object:  StoredProcedure [dbo].[Задание11Процедура]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Задание11Процедура] @K AS INT OUTPUT AS BEGIN DECLARE @Rev INT = 0, @N INT = @K WHILE @N > 0 BEGIN SET @Rev = @Rev * 10 + @N % 10 SET @N = @N / 10 END SET @K = @Rev END
GO
/****** Object:  StoredProcedure [dbo].[Задание12Процедура]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Задание12Процедура] @X AS FLOAT OUTPUT, @Y AS FLOAT OUTPUT AS BEGIN DECLARE @Temp FLOAT SET @Temp = @X SET @X = @Y SET @Y = @Temp END
GO
/****** Object:  StoredProcedure [dbo].[Задание13Процедура]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Задание13Процедура] @A AS FLOAT OUTPUT, @B AS FLOAT OUTPUT, @C AS FLOAT OUTPUT AS BEGIN DECLARE @Temp FLOAT IF @A > @B BEGIN SET @Temp = @A SET @A = @B SET @B = @Temp END IF @B > @C BEGIN SET @Temp = @B SET @B = @C SET @C = @Temp END IF @A > @B BEGIN SET @Temp = @A SET @A = @B SET @B = @Temp END END
GO
/****** Object:  StoredProcedure [dbo].[Задание14Процедура]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Задание14Процедура] @K AS INT, @C AS INT OUTPUT, @S AS INT OUTPUT AS BEGIN DECLARE @N INT = ABS(@K), @Digit INT SET @C = 0 SET @S = 0 WHILE @N > 0 BEGIN SET @Digit = @N % 10 SET @S = @S + @Digit SET @C = @C + 1 SET @N = @N / 10 END IF @K = 0 BEGIN SET @C = 1 SET @S = 0 END END
GO
/****** Object:  StoredProcedure [dbo].[Задание1Процедура]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* Задание 1: Создать хранимую процедуру для вывода информации о сервере, базе данных, пользователе и времени */
CREATE PROC [dbo].[Задание1Процедура] AS BEGIN SELECT @@Servername AS Сервер, @@Version AS [Версия СУБД], Db_Name() AS [База данных], User AS [Пользователь базы данных], System_User AS [Системный пользователь], GETDATE() AS [Текущее время] END
GO
/****** Object:  StoredProcedure [dbo].[Задание2Процедура]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Задание2Процедура] AS BEGIN SELECT Название, Столица, Площадь, Население, Континент FROM Страны END
GO
/****** Object:  StoredProcedure [dbo].[Задание3Процедура]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Задание3Процедура] @Конт AS VARCHAR(50) AS BEGIN SELECT Название, Столица, Площадь, Население FROM Страны WHERE Континент != @Конт END
GO
/****** Object:  StoredProcedure [dbo].[Задание4Процедура]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Задание4Процедура] @A AS FLOAT, @B AS FLOAT AS BEGIN SELECT Название, Столица, Площадь, Население, Континент FROM Страны WHERE Население BETWEEN @A AND @B END
GO
/****** Object:  StoredProcedure [dbo].[Задание5Процедура]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Задание5Процедура] @Буква AS CHAR(1), @Количество AS INT OUTPUT AS BEGIN SELECT @Количество = COUNT(*) FROM Страны WHERE CHARINDEX(@Буква, Название) = 0 END
GO
/****** Object:  StoredProcedure [dbo].[Задание6Процедура]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Задание6Процедура] @Конт AS VARCHAR(50) = 'Африка' AS BEGIN SELECT TOP 5 Название, Столица, Площадь, Население, Континент FROM Страны WHERE Континент = @Конт ORDER BY Население DESC END
GO
/****** Object:  StoredProcedure [dbo].[Задание7Процедура]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Задание7Процедура] AS BEGIN SELECT Название, Столица, Площадь, Население, Континент INTO Страны_К FROM Страны WHERE LEFT(Название, 1) = 'К' END
GO
/****** Object:  StoredProcedure [dbo].[Задание8Процедура]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Задание8Процедура] AS BEGIN DECLARE @K AS INT SELECT @K = COUNT(*) FROM Страны_К DROP TABLE Страны_К RETURN @K END
GO
/****** Object:  StoredProcedure [dbo].[Задание9Процедура]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Задание9Процедура] @Число AS INT, @Количество AS INT OUTPUT AS BEGIN DECLARE @N INT = ABS(@Число) SET @Количество = 0 WHILE @N > 0 BEGIN SET @N = @N / 10 SET @Количество = @Количество + 1 END IF @Число = 0 SET @Количество = 1 END
GO
/****** Object:  StoredProcedure [dbo].[Пример1Процедура]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* Пример 1: Создать хранимую процедуру для вывода информации о сервере, базе данных и пользователе */
CREATE PROC [dbo].[Пример1Процедура] AS BEGIN SELECT @@Servername AS Сервер, @@Version AS [Версия СУБД], Db_Name() AS [База данных], User AS [Пользователь базы данных], System_User AS [Системный пользователь] END
GO
/****** Object:  StoredProcedure [dbo].[Пример2Процедура]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Пример2Процедура] AS BEGIN SELECT Название, Столица FROM Страны END
GO
/****** Object:  StoredProcedure [dbo].[Пример3Процедура]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Пример3Процедура] @Конт AS VARCHAR(50) AS BEGIN SELECT Название, Столица, Площадь, Население FROM Страны WHERE Континент = @Конт END

GO
/****** Object:  StoredProcedure [dbo].[Пример4Процедура]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Пример4Процедура] @A AS FLOAT, @B AS FLOAT AS BEGIN SELECT Название, Столица, Площадь, Население, Континент FROM Страны WHERE Площадь BETWEEN @A AND @B END

GO
/****** Object:  StoredProcedure [dbo].[Пример5Процедура]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Пример5Процедура] @Буква AS CHAR(1), @Количество AS INT OUTPUT AS BEGIN SELECT @Количество = COUNT(*) FROM Страны WHERE CHARINDEX(@Буква, Название) > 0 END
GO
/****** Object:  StoredProcedure [dbo].[Пример6Процедура]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Пример6Процедура] @Конт AS VARCHAR(50) = 'Европа' AS BEGIN SELECT TOP 3 Название, Столица, Площадь, Население, Континент FROM Страны WHERE Континент = @Конт ORDER BY Площадь END
GO
/****** Object:  StoredProcedure [dbo].[Пример7Процедура]    Script Date: 10.05.2025 10:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Пример7Процедура] AS BEGIN SELECT Название, Столица, Площадь, Население, Континент INTO Страны_У FROM Страны WHERE LEFT(Название, 1) = 'У' END
GO
USE [master]
GO
ALTER DATABASE [Учебная_Колесник] SET  READ_WRITE 
GO
