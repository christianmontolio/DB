USE [master]
GO
/****** Object:  Database [Staging]    Script Date: 7/1/2017 9:02:48 AM ******/
CREATE DATABASE [Staging]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'staging', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\staging.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'staging_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\staging_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Staging] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Staging].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Staging] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Staging] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Staging] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Staging] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Staging] SET ARITHABORT OFF 
GO
ALTER DATABASE [Staging] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Staging] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Staging] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Staging] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Staging] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Staging] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Staging] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Staging] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Staging] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Staging] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Staging] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Staging] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Staging] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Staging] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Staging] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Staging] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Staging] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Staging] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Staging] SET RECOVERY FULL 
GO
ALTER DATABASE [Staging] SET  MULTI_USER 
GO
ALTER DATABASE [Staging] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Staging] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Staging] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Staging] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Staging]
GO
/****** Object:  Table [dbo].[Stg_Regiones]    Script Date: 7/1/2017 9:02:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Stg_Regiones](
	[IdRegion] [int] NOT NULL,
	[DescRegion] [varchar](50) NOT NULL,
	[Estado] [char](1) NOT NULL,
 CONSTRAINT [PK_Stg_Regiones] PRIMARY KEY CLUSTERED 
(
	[IdRegion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Stg_Regiones] ([IdRegion], [DescRegion], [Estado]) VALUES (1, N'Norte', N'A')
INSERT [dbo].[Stg_Regiones] ([IdRegion], [DescRegion], [Estado]) VALUES (2, N'Sur', N'A')
INSERT [dbo].[Stg_Regiones] ([IdRegion], [DescRegion], [Estado]) VALUES (3, N'Este', N'A')
INSERT [dbo].[Stg_Regiones] ([IdRegion], [DescRegion], [Estado]) VALUES (4, N'Oeste', N'A')
INSERT [dbo].[Stg_Regiones] ([IdRegion], [DescRegion], [Estado]) VALUES (5, N'Metro', N'A')
USE [master]
GO
ALTER DATABASE [Staging] SET  READ_WRITE 
GO
