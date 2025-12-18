USE [master]
GO
/****** Object:  Database [TaskManagement]    Script Date: 18-12-2025 11:55:31 ******/
CREATE DATABASE [TaskManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TaskManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TaskManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TaskManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TaskManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TaskManagement] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TaskManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TaskManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TaskManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TaskManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TaskManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TaskManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [TaskManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TaskManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TaskManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TaskManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TaskManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TaskManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TaskManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TaskManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TaskManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TaskManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TaskManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TaskManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TaskManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TaskManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TaskManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TaskManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TaskManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TaskManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TaskManagement] SET  MULTI_USER 
GO
ALTER DATABASE [TaskManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TaskManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TaskManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TaskManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TaskManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TaskManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TaskManagement] SET QUERY_STORE = ON
GO
ALTER DATABASE [TaskManagement] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TaskManagement]
GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 18-12-2025 11:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[TaskId] [int] IDENTITY(1,1) NOT NULL,
	[TaskTitle] [nvarchar](200) NULL,
	[TaskDescription] [nvarchar](max) NULL,
	[TaskDueDate] [date] NULL,
	[TaskStatus] [nvarchar](50) NULL,
	[TaskRemarks] [nvarchar](500) NULL,
	[CreatedOn] [datetime] NULL,
	[LastUpdatedOn] [datetime] NULL,
	[CreatedById] [int] NULL,
	[CreatedByName] [nvarchar](100) NULL,
	[LastUpdatedById] [int] NULL,
	[LastUpdatedByName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 18-12-2025 11:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[PasswordHash] [nvarchar](200) NULL,
	[CreatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tasks] ON 
GO
INSERT [dbo].[Tasks] ([TaskId], [TaskTitle], [TaskDescription], [TaskDueDate], [TaskStatus], [TaskRemarks], [CreatedOn], [LastUpdatedOn], [CreatedById], [CreatedByName], [LastUpdatedById], [LastUpdatedByName]) VALUES (3, N'Interview1', N'Improve confidence ,skills', CAST(N'2025-12-17' AS Date), N'Completed', N'doing', CAST(N'2025-12-17T20:54:43.543' AS DateTime), CAST(N'2025-12-17T21:03:39.523' AS DateTime), 2, NULL, 2, N'nitinsharma')
GO
INSERT [dbo].[Tasks] ([TaskId], [TaskTitle], [TaskDescription], [TaskDueDate], [TaskStatus], [TaskRemarks], [CreatedOn], [LastUpdatedOn], [CreatedById], [CreatedByName], [LastUpdatedById], [LastUpdatedByName]) VALUES (4, N'task', N'tacktodo', CAST(N'2025-12-17' AS Date), N'Completed', N'todo', CAST(N'2025-12-17T22:03:29.160' AS DateTime), CAST(N'2025-12-17T22:04:22.557' AS DateTime), 2, NULL, 2, N'nitinsharma')
GO
SET IDENTITY_INSERT [dbo].[Tasks] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [PasswordHash], [CreatedOn]) VALUES (1, N'nitin', N'nitin123@gmail.com', N'$2a$11$kGLp.OTcHLnxdc34Mxt/m.p50zHazV0vRB0c0QG60esCURO4xAaCm', CAST(N'2025-12-17T11:54:37.250' AS DateTime))
GO
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [PasswordHash], [CreatedOn]) VALUES (2, N'nitinsharma', N'nitin@gmail.com', N'$2a$11$mUyPB/kYNNV21pl2Edevsurpb/HhYjvlrf5Sszw198fKou92qVUp.', CAST(N'2025-12-17T13:00:24.987' AS DateTime))
GO
INSERT [dbo].[Users] ([UserId], [FullName], [Email], [PasswordHash], [CreatedOn]) VALUES (4, N'nitinsharma', N'nitin1@gmail.com', N'$2a$11$GlpsfAos7/.3jqZiGKxJEubDTFZ1ZO93fW3/GMdSKPGhowXIKhV8W', CAST(N'2025-12-17T13:02:48.260' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D105348533F518]    Script Date: 18-12-2025 11:55:31 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tasks] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  StoredProcedure [dbo].[sp_CreateTask]    Script Date: 18-12-2025 11:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CreateTask]
(
 @TaskTitle NVARCHAR(200),
 @TaskDescription NVARCHAR(MAX),
 @TaskDueDate DATE,
 @TaskStatus NVARCHAR(50),
 @TaskRemarks NVARCHAR(500),
 @CreatedById INT,
 @CreatedByName NVARCHAR(100)
)
AS
BEGIN
 INSERT INTO Tasks
 (TaskTitle, TaskDescription, TaskDueDate, TaskStatus, TaskRemarks,
  CreatedById, CreatedByName)
 VALUES
 (@TaskTitle, @TaskDescription, @TaskDueDate, @TaskStatus, @TaskRemarks,
  @CreatedById, @CreatedByName)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteTask]    Script Date: 18-12-2025 11:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteTask]
(
 @TaskId INT
)
AS
BEGIN
 DELETE FROM Tasks WHERE TaskId = @TaskId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllTasks]    Script Date: 18-12-2025 11:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAllTasks]
AS
BEGIN
 SELECT * FROM Tasks ORDER BY CreatedOn DESC
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetTaskById]    Script Date: 18-12-2025 11:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetTaskById]
(
 @TaskId INT
)
AS
BEGIN
 SELECT * FROM Tasks WHERE TaskId = @TaskId
END
GO
/****** Object:  StoredProcedure [dbo].[sp_LoginUser]    Script Date: 18-12-2025 11:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_LoginUser]
(
 @Email NVARCHAR(100)
)
AS
BEGIN
 SELECT * FROM Users WHERE Email = @Email
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RegisterUser]    Script Date: 18-12-2025 11:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RegisterUser]
(
 @FullName NVARCHAR(100),
 @Email NVARCHAR(100),
 @PasswordHash NVARCHAR(200)
)
AS
BEGIN
 INSERT INTO Users (FullName, Email, PasswordHash)
 VALUES (@FullName, @Email, @PasswordHash)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SearchTasks]    Script Date: 18-12-2025 11:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SearchTasks]
(
 @SearchText NVARCHAR(200)
)
AS
BEGIN
 SELECT * FROM Tasks
 WHERE TaskTitle LIKE '%' + @SearchText + '%'
    OR TaskStatus LIKE '%' + @SearchText + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateTask]    Script Date: 18-12-2025 11:55:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateTask]
(
 @TaskId INT,
 @TaskTitle NVARCHAR(200),
 @TaskDescription NVARCHAR(MAX),
 @TaskDueDate DATE,
 @TaskStatus NVARCHAR(50),
 @TaskRemarks NVARCHAR(500),
 @LastUpdatedById INT,
 @LastUpdatedByName NVARCHAR(100)
)
AS
BEGIN
 UPDATE Tasks SET
  TaskTitle = @TaskTitle,
  TaskDescription = @TaskDescription,
  TaskDueDate = @TaskDueDate,
  TaskStatus = @TaskStatus,
  TaskRemarks = @TaskRemarks,
  LastUpdatedOn = GETDATE(),
  LastUpdatedById = @LastUpdatedById,
  LastUpdatedByName = @LastUpdatedByName
 WHERE TaskId = @TaskId
END
GO
USE [master]
GO
ALTER DATABASE [TaskManagement] SET  READ_WRITE 
GO
