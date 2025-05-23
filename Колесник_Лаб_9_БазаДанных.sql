USE [master]
GO
/****** Object:  Database [University]    Script Date: 13.05.2025 17:09:55 ******/
CREATE DATABASE [University]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'University', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\University.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'University_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\University_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [University] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [University].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [University] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [University] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [University] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [University] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [University] SET ARITHABORT OFF 
GO
ALTER DATABASE [University] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [University] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [University] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [University] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [University] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [University] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [University] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [University] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [University] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [University] SET  DISABLE_BROKER 
GO
ALTER DATABASE [University] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [University] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [University] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [University] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [University] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [University] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [University] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [University] SET RECOVERY FULL 
GO
ALTER DATABASE [University] SET  MULTI_USER 
GO
ALTER DATABASE [University] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [University] SET DB_CHAINING OFF 
GO
ALTER DATABASE [University] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [University] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [University] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [University] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'University', N'ON'
GO
ALTER DATABASE [University] SET QUERY_STORE = ON
GO
ALTER DATABASE [University] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [University]
GO
/****** Object:  User [Sidorov_Tea]    Script Date: 13.05.2025 17:09:55 ******/
CREATE USER [Sidorov_Tea] FOR LOGIN [Sidorov_Tea] WITH DEFAULT_SCHEMA=[Sidorov_Tea]
GO
/****** Object:  User [Proba]    Script Date: 13.05.2025 17:09:55 ******/
CREATE USER [Proba] FOR LOGIN [Proba] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Petrov_Stud]    Script Date: 13.05.2025 17:09:55 ******/
CREATE USER [Petrov_Stud] FOR LOGIN [Petrov_Stud] WITH DEFAULT_SCHEMA=[Petrov_Stud]
GO
/****** Object:  User [Nikitin_Sec]    Script Date: 13.05.2025 17:09:55 ******/
CREATE USER [Nikitin_Sec] FOR LOGIN [Nikitin_Sec] WITH DEFAULT_SCHEMA=[Nikitin_Sec]
GO
/****** Object:  User [Ivanov_Dek]    Script Date: 13.05.2025 17:09:55 ******/
CREATE USER [Ivanov_Dek] FOR LOGIN [Ivanov_Dek] WITH DEFAULT_SCHEMA=[Ivanov_Dek]
GO
/****** Object:  User [Egorov_Adm]    Script Date: 13.05.2025 17:09:55 ******/
CREATE USER [Egorov_Adm] FOR LOGIN [Egorov_Adm] WITH DEFAULT_SCHEMA=[Egorov_Adm]
GO
/****** Object:  DatabaseRole [TEACHER]    Script Date: 13.05.2025 17:09:55 ******/
CREATE ROLE [TEACHER]
GO
/****** Object:  DatabaseRole [STUDENT]    Script Date: 13.05.2025 17:09:55 ******/
CREATE ROLE [STUDENT]
GO
/****** Object:  DatabaseRole [SECRETARY]    Script Date: 13.05.2025 17:09:55 ******/
CREATE ROLE [SECRETARY]
GO
/****** Object:  DatabaseRole [DEKAN]    Script Date: 13.05.2025 17:09:55 ******/
CREATE ROLE [DEKAN]
GO
/****** Object:  DatabaseRole [ADMIN]    Script Date: 13.05.2025 17:09:55 ******/
CREATE ROLE [ADMIN]
GO
ALTER ROLE [TEACHER] ADD MEMBER [Sidorov_Tea]
GO
ALTER ROLE [db_owner] ADD MEMBER [Proba]
GO
ALTER ROLE [SECRETARY] ADD MEMBER [Nikitin_Sec]
GO
ALTER ROLE [DEKAN] ADD MEMBER [Ivanov_Dek]
GO
ALTER ROLE [ADMIN] ADD MEMBER [Egorov_Adm]
GO
/****** Object:  Schema [ADMIN]    Script Date: 13.05.2025 17:09:55 ******/
CREATE SCHEMA [ADMIN]
GO
/****** Object:  Schema [DEKAN]    Script Date: 13.05.2025 17:09:55 ******/
CREATE SCHEMA [DEKAN]
GO
/****** Object:  Schema [Egorov_Adm]    Script Date: 13.05.2025 17:09:55 ******/
CREATE SCHEMA [Egorov_Adm]
GO
/****** Object:  Schema [Ivanov_Dek]    Script Date: 13.05.2025 17:09:55 ******/
CREATE SCHEMA [Ivanov_Dek]
GO
/****** Object:  Schema [Nikitin_Sec]    Script Date: 13.05.2025 17:09:55 ******/
CREATE SCHEMA [Nikitin_Sec]
GO
/****** Object:  Schema [Petrov_Stud]    Script Date: 13.05.2025 17:09:55 ******/
CREATE SCHEMA [Petrov_Stud]
GO
/****** Object:  Schema [SECRETARY]    Script Date: 13.05.2025 17:09:55 ******/
CREATE SCHEMA [SECRETARY]
GO
/****** Object:  Schema [Sidorov_Tea]    Script Date: 13.05.2025 17:09:55 ******/
CREATE SCHEMA [Sidorov_Tea]
GO
/****** Object:  Schema [STUDENT]    Script Date: 13.05.2025 17:09:55 ******/
CREATE SCHEMA [STUDENT]
GO
/****** Object:  Schema [TEACHER]    Script Date: 13.05.2025 17:09:55 ******/
CREATE SCHEMA [TEACHER]
GO
/****** Object:  Table [dbo].[Discuplinu]    Script Date: 13.05.2025 17:09:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discuplinu](
	[Kod_Discuplinu] [int] NOT NULL,
	[name_Discuplinu] [nchar](30) NULL,
	[kol_chasov] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Kod_Discuplinu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [University] SET  READ_WRITE 
GO
