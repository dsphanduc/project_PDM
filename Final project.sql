USE [master]
GO
/****** Object:  Database [College]    Script Date: 5/2/2023 3:00:06 PM ******/
CREATE DATABASE [College]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'College', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\College.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'College_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\College_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [College] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [College].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [College] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [College] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [College] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [College] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [College] SET ARITHABORT OFF 
GO
ALTER DATABASE [College] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [College] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [College] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [College] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [College] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [College] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [College] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [College] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [College] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [College] SET  ENABLE_BROKER 
GO
ALTER DATABASE [College] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [College] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [College] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [College] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [College] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [College] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [College] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [College] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [College] SET  MULTI_USER 
GO
ALTER DATABASE [College] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [College] SET DB_CHAINING OFF 
GO
ALTER DATABASE [College] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [College] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [College] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [College] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [College] SET QUERY_STORE = ON
GO
ALTER DATABASE [College] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [College]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 5/2/2023 3:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[C_id] [varchar](50) NOT NULL,
	[C_name] [varchar](50) NULL,
	[Credit] [int] NULL,
	[D_id] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[C_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 5/2/2023 3:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[D_id] [varchar](50) NOT NULL,
	[D_major] [varchar](50) NULL,
	[D_name] [varchar](50) NULL,
	[Estab] [date] NULL,
	[HOD] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[D_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 5/2/2023 3:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollment](
	[S_id] [varchar](50) NULL,
	[C_id] [varchar](50) NULL,
	[ins_ID] [varchar](50) NULL,
	[ins_name] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 5/2/2023 3:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[Ins_ID] [varchar](50) NOT NULL,
	[Ins_name] [nvarchar](50) NULL,
	[Phone] [bigint] NULL,
	[Email] [varchar](50) NULL,
	[D_major] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Ins_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedules]    Script Date: 5/2/2023 3:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedules](
	[Sche_ID] [varchar](50) NOT NULL,
	[S_id] [varchar](50) NULL,
	[C_id] [varchar](50) NULL,
	[ins_ID] [varchar](50) NULL,
	[time_start] [date] NULL,
	[time_end] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Sche_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 5/2/2023 3:00:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[S_id] [varchar](50) NOT NULL,
	[S_name] [nvarchar](50) NULL,
	[Gender] [varchar](15) NULL,
	[Email] [varchar](50) NULL,
	[Phone_number] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[S_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_D_id_C_D] FOREIGN KEY([D_id])
REFERENCES [dbo].[Department] ([D_id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_D_id_C_D]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_C_id_E_C] FOREIGN KEY([C_id])
REFERENCES [dbo].[Course] ([C_id])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_C_id_E_C]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_ins_ID_E_INS] FOREIGN KEY([ins_ID])
REFERENCES [dbo].[Instructor] ([Ins_ID])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_ins_ID_E_INS]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_S_id_E_S] FOREIGN KEY([S_id])
REFERENCES [dbo].[Student] ([S_id])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_S_id_E_S]
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD  CONSTRAINT [FK_C_id_SCHE_C] FOREIGN KEY([C_id])
REFERENCES [dbo].[Course] ([C_id])
GO
ALTER TABLE [dbo].[Schedules] CHECK CONSTRAINT [FK_C_id_SCHE_C]
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD  CONSTRAINT [FK_ins_ID_SCHE_INS] FOREIGN KEY([ins_ID])
REFERENCES [dbo].[Instructor] ([Ins_ID])
GO
ALTER TABLE [dbo].[Schedules] CHECK CONSTRAINT [FK_ins_ID_SCHE_INS]
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD  CONSTRAINT [FK_S_id_Sche_S] FOREIGN KEY([S_id])
REFERENCES [dbo].[Student] ([S_id])
GO
ALTER TABLE [dbo].[Schedules] CHECK CONSTRAINT [FK_S_id_Sche_S]
GO
USE [master]
GO
ALTER DATABASE [College] SET  READ_WRITE 
GO