USE [master]
GO
/****** Object:  Database [ВАриант_7]    Script Date: 16.05.2023 12:04:16 ******/
CREATE DATABASE [ВАриант_7]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ВАриант_7', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ВАриант_7.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ВАриант_7_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ВАриант_7_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ВАриант_7] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ВАриант_7].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ВАриант_7] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ВАриант_7] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ВАриант_7] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ВАриант_7] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ВАриант_7] SET ARITHABORT OFF 
GO
ALTER DATABASE [ВАриант_7] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ВАриант_7] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ВАриант_7] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ВАриант_7] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ВАриант_7] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ВАриант_7] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ВАриант_7] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ВАриант_7] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ВАриант_7] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ВАриант_7] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ВАриант_7] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ВАриант_7] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ВАриант_7] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ВАриант_7] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ВАриант_7] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ВАриант_7] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ВАриант_7] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ВАриант_7] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ВАриант_7] SET  MULTI_USER 
GO
ALTER DATABASE [ВАриант_7] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ВАриант_7] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ВАриант_7] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ВАриант_7] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ВАриант_7] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ВАриант_7] SET QUERY_STORE = OFF
GO
USE [ВАриант_7]
GO
/****** Object:  Table [dbo].[Заказы]    Script Date: 16.05.2023 12:04:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказы](
	[Номер] [nvarchar](50) NULL,
	[ID] [nvarchar](50) NULL,
	[Услуга] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиенты]    Script Date: 16.05.2023 12:04:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиенты](
	[ФИО] [nvarchar](255) NULL,
	[Код клиента] [nvarchar](255) NOT NULL,
	[Паспортные данные] [nvarchar](255) NULL,
	[Дата рождения] [datetime] NULL,
	[Адрес] [nvarchar](255) NULL,
	[e-mail] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Отчет]    Script Date: 16.05.2023 12:04:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Отчет](
	[ID] [nvarchar](20) NOT NULL,
	[Код_услуги] [nvarchar](255) NOT NULL,
	[Дата_заказа] [date] NOT NULL,
	[Код_клиента] [nvarchar](255) NOT NULL,
	[Код_сотрудника] [nvarchar](255) NULL,
 CONSTRAINT [PK__Отчет__3214EC276BE72584] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 16.05.2023 12:04:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудники](
	[Код сотрудника] [nvarchar](255) NOT NULL,
	[Должность] [nvarchar](255) NULL,
	[ФИО ] [nvarchar](255) NULL,
	[Логин ] [nvarchar](255) NULL,
	[Пароль] [nvarchar](255) NULL,
	[Последний вход] [nvarchar](255) NULL,
	[Тип входа] [nvarchar](255) NULL,
 CONSTRAINT [PK_Сотрудники] PRIMARY KEY CLUSTERED 
(
	[Код сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Услуги]    Script Date: 16.05.2023 12:04:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Услуги](
	[ID] [nvarchar](50) NOT NULL,
	[Наименование_услуги] [nvarchar](50) NOT NULL,
	[Код_услуги] [nvarchar](50) NOT NULL,
	[Стоимость] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [ВАриант_7] SET  READ_WRITE 
GO
