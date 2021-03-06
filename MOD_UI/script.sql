USE [master]
GO
/****** Object:  Database [MOD_DB]    Script Date: 10/3/2019 6:26:33 PM ******/
CREATE DATABASE [MOD_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MOD_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\MOD_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MOD_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\MOD_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MOD_DB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MOD_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MOD_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MOD_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MOD_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MOD_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MOD_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MOD_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MOD_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MOD_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MOD_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MOD_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MOD_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MOD_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MOD_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MOD_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MOD_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MOD_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MOD_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MOD_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MOD_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MOD_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MOD_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MOD_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MOD_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MOD_DB] SET  MULTI_USER 
GO
ALTER DATABASE [MOD_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MOD_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MOD_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MOD_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MOD_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MOD_DB] SET QUERY_STORE = OFF
GO
USE [MOD_DB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [MOD_DB]
GO
/****** Object:  Table [dbo].[PaymentDtls]    Script Date: 10/3/2019 6:26:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentDtls](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[txtType] [varchar](50) NULL,
	[amount] [float] NULL,
	[remarks] [varchar](50) NULL,
	[mentorId] [int] NOT NULL,
	[mentorName] [varchar](50) NULL,
	[trainingId] [int] NOT NULL,
	[skillName] [varchar](50) NULL,
	[totalAmountToMentor] [float] NULL,
 CONSTRAINT [PK_PaymentDtls] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SkillDtls]    Script Date: 10/3/2019 6:26:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkillDtls](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[toc] [varchar](50) NULL,
	[prerequisites] [nchar](10) NULL,
	[timings] [varchar](50) NULL,
 CONSTRAINT [PK_SkillDtls] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainingDtls]    Script Date: 10/3/2019 6:26:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainingDtls](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status] [varchar](50) NULL,
	[progress] [int] NULL,
	[commisionAmount] [float] NULL,
	[rating] [int] NULL,
	[avaRating] [float] NULL,
	[startDate] [date] NULL,
	[endDate] [date] NULL,
	[startTime] [datetime] NULL,
	[endTime] [datetime] NULL,
	[amountReceived] [float] NULL,
	[userId] [int] NOT NULL,
	[userName] [varchar](50) NULL,
	[mentorId] [int] NOT NULL,
	[mentorName] [varchar](50) NULL,
	[skillId] [int] NOT NULL,
	[skillname] [varchar](50) NULL,
	[fees] [float] NULL,
 CONSTRAINT [PK_TrainingDtls] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDtls]    Script Date: 10/3/2019 6:26:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDtls](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[userName] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[contactNumber] [numeric](10, 0) NOT NULL,
	[regCode] [varchar](50) NULL,
	[role] [int] NOT NULL,
	[linkdinUrl] [varchar](50) NULL,
	[yearOfExperience] [int] NULL,
	[active] [bit] NOT NULL,
	[confirmedSignUp] [bit] NULL,
	[resetPasswordDate] [datetime] NULL,
	[resetPassword] [bit] NULL,
	[pictureUrl] [varchar](50) NULL,
 CONSTRAINT [PK_UserDtls] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SkillDtls] ON 

INSERT [dbo].[SkillDtls] ([id], [name], [toc], [prerequisites], [timings]) VALUES (12, N'Java', N'Spring, Hibernate', N'Core Java ', N'9AM - 11AM')
INSERT [dbo].[SkillDtls] ([id], [name], [toc], [prerequisites], [timings]) VALUES (13, N'JAva', N'jaba', N'java      ', N'havnan')
INSERT [dbo].[SkillDtls] ([id], [name], [toc], [prerequisites], [timings]) VALUES (14, N'sam', N'sam', N'sam       ', N'sam')
SET IDENTITY_INSERT [dbo].[SkillDtls] OFF
SET IDENTITY_INSERT [dbo].[UserDtls] ON 

INSERT [dbo].[UserDtls] ([id], [email], [userName], [password], [firstName], [lastName], [contactNumber], [regCode], [role], [linkdinUrl], [yearOfExperience], [active], [confirmedSignUp], [resetPasswordDate], [resetPassword], [pictureUrl]) VALUES (1, N'admin@gmail.com', N'Daddy', N'YWRtaW4=', N'Admin', N'Admin', CAST(9876543210 AS Numeric(10, 0)), NULL, 1, NULL, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserDtls] ([id], [email], [userName], [password], [firstName], [lastName], [contactNumber], [regCode], [role], [linkdinUrl], [yearOfExperience], [active], [confirmedSignUp], [resetPasswordDate], [resetPassword], [pictureUrl]) VALUES (2, N'himanshu@gmail.com', N'himi', N'OTg3Ng==', N'Himashu', N'Goel', CAST(9876543210 AS Numeric(10, 0)), NULL, 3, NULL, NULL, 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserDtls] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__UserDtls__AB6E616494365036]    Script Date: 10/3/2019 6:26:34 PM ******/
ALTER TABLE [dbo].[UserDtls] ADD  CONSTRAINT [UQ__UserDtls__AB6E616494365036] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TrainingDtls]  WITH CHECK ADD  CONSTRAINT [FK_TrainingDtls_TrainingDtls] FOREIGN KEY([skillId])
REFERENCES [dbo].[SkillDtls] ([id])
GO
ALTER TABLE [dbo].[TrainingDtls] CHECK CONSTRAINT [FK_TrainingDtls_TrainingDtls]
GO
USE [master]
GO
ALTER DATABASE [MOD_DB] SET  READ_WRITE 
GO
