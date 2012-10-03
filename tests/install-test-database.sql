USE [master]
GO

/****** Object:  Database [nodejstest]    Script Date: 08/19/2012 00:26:14 ******/
CREATE DATABASE [nodejstest] ON  PRIMARY 
( NAME = N'nodejstest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\nodejstest.mdf' , SIZE = 12288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'nodejstest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\nodejstest_log.ldf' , SIZE = 15040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [nodejstest] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [nodejstest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [nodejstest] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [nodejstest] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [nodejstest] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [nodejstest] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [nodejstest] SET ARITHABORT OFF 
GO

ALTER DATABASE [nodejstest] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [nodejstest] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [nodejstest] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [nodejstest] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [nodejstest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [nodejstest] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [nodejstest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [nodejstest] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [nodejstest] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [nodejstest] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [nodejstest] SET  DISABLE_BROKER 
GO

ALTER DATABASE [nodejstest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [nodejstest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [nodejstest] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [nodejstest] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO

ALTER DATABASE [nodejstest] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [nodejstest] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [nodejstest] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [nodejstest] SET  READ_WRITE 
GO

ALTER DATABASE [nodejstest] SET RECOVERY FULL 
GO

ALTER DATABASE [nodejstest] SET  MULTI_USER 
GO

ALTER DATABASE [nodejstest] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [nodejstest] SET DB_CHAINING OFF 
GO

USE [nodejstest]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 08/19/2012 00:24:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Movies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[ReleaseDate] [date] NOT NULL,
	[Genre] [nchar](10) NOT NULL,
	[Price] [money] NOT NULL,
	[Rating] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

USE nodejstest
GO
EXEC sys.sp_cdc_enable_db
GO
EXECUTE sys.sp_cdc_enable_table 
    @source_schema = N'dbo', 
    @source_name = N'Movies', 
    @capture_instance = N'dbo_Movies'";
GO

INSERT INTO [nodejstest].[dbo].[Movies]
           ([Title]
           ,[ReleaseDate]
           ,[Genre]
           ,[Price]
           ,[Rating])
     VALUES
           ('Withnail And I'
           ,'1987-06-19'
           ,'Comedy'
           ,12
           ,'10')
GO

