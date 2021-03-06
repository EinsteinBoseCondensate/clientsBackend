USE [master]
GO
/****** Object:  Database [ClientsStorage]    Script Date: 05/06/2021 6:31:35 ******/
CREATE DATABASE [ClientsStorage]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ClientsStorage', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ClientsStorage.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ClientsStorage_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ClientsStorage_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ClientsStorage] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ClientsStorage].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ClientsStorage] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ClientsStorage] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ClientsStorage] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ClientsStorage] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ClientsStorage] SET ARITHABORT OFF 
GO
ALTER DATABASE [ClientsStorage] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ClientsStorage] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ClientsStorage] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ClientsStorage] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ClientsStorage] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ClientsStorage] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ClientsStorage] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ClientsStorage] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ClientsStorage] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ClientsStorage] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ClientsStorage] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ClientsStorage] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ClientsStorage] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ClientsStorage] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ClientsStorage] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ClientsStorage] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ClientsStorage] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ClientsStorage] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ClientsStorage] SET  MULTI_USER 
GO
ALTER DATABASE [ClientsStorage] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ClientsStorage] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ClientsStorage] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ClientsStorage] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ClientsStorage] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ClientsStorage] SET QUERY_STORE = OFF
GO
USE [ClientsStorage]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 05/06/2021 6:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 05/06/2021 6:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
	[Gender] [int] NOT NULL,
	[DateOfBirth] [datetime2](7) NOT NULL,
	[Address] [nvarchar](100) NULL,
	[CountryId] [uniqueidentifier] NULL,
	[PostalCode] [nvarchar](25) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 05/06/2021 6:31:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Code] [nvarchar](25) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Client] ([Id], [Name], [Surname], [Gender], [DateOfBirth], [Address], [CountryId], [PostalCode]) VALUES (N'd5eadc8e-4daf-4c27-9f2d-4607e3abb220', N'Kalkbr', N'asdfasasdfasd', 1, CAST(N'2021-06-02T22:00:00.0000000' AS DateTime2), N'asdfasdf', N'5be052c3-8ec5-467b-bdcd-152982e1b4de', N'30700')
INSERT [dbo].[Client] ([Id], [Name], [Surname], [Gender], [DateOfBirth], [Address], [CountryId], [PostalCode]) VALUES (N'0187d86f-890f-4fe1-b450-4e5d31c0b5d6', N'Kalkbr', N'asdfasasdfasd', 1, CAST(N'2021-06-02T22:00:00.0000000' AS DateTime2), N'asdfasdf', N'5be052c3-8ec5-467b-bdcd-152982e1b4de', N'30700')
INSERT [dbo].[Client] ([Id], [Name], [Surname], [Gender], [DateOfBirth], [Address], [CountryId], [PostalCode]) VALUES (N'148aca4c-32c2-4094-a2ae-5378eaddac80', N'Kalkbr', N'asdfasasdfasd', 1, CAST(N'2021-06-02T22:00:00.0000000' AS DateTime2), N'asdfasdf', N'5be052c3-8ec5-467b-bdcd-152982e1b4de', N'30700')
INSERT [dbo].[Client] ([Id], [Name], [Surname], [Gender], [DateOfBirth], [Address], [CountryId], [PostalCode]) VALUES (N'4bc6279a-6aa6-49c7-989b-55457ab02924', N'Kalkbr', N'asdfasasdfasd', 1, CAST(N'2021-06-02T22:00:00.0000000' AS DateTime2), N'asdfasdf', N'5be052c3-8ec5-467b-bdcd-152982e1b4de', N'30700')
INSERT [dbo].[Client] ([Id], [Name], [Surname], [Gender], [DateOfBirth], [Address], [CountryId], [PostalCode]) VALUES (N'75087e06-9ec2-4367-9330-60fff8317ec3', N'Kalkbr', N'asdfasasdfasd', 1, CAST(N'2021-06-02T22:00:00.0000000' AS DateTime2), N'asdfasdf', N'5be052c3-8ec5-467b-bdcd-152982e1b4de', N'30700')
INSERT [dbo].[Client] ([Id], [Name], [Surname], [Gender], [DateOfBirth], [Address], [CountryId], [PostalCode]) VALUES (N'ebdc5906-031f-4cc1-8f0a-64f4fd7e3c74', N'Kalkbr', N'asdfasasdfasd', 1, CAST(N'2021-06-02T22:00:00.0000000' AS DateTime2), N'asdfasdf', N'5be052c3-8ec5-467b-bdcd-152982e1b4de', N'30700')
INSERT [dbo].[Client] ([Id], [Name], [Surname], [Gender], [DateOfBirth], [Address], [CountryId], [PostalCode]) VALUES (N'bb95971d-7379-4175-8252-68a5737efd5a', N'Kalkbr', N'asdfasasdfasd', 1, CAST(N'2021-06-02T22:00:00.0000000' AS DateTime2), N'asdfasdf', N'5be052c3-8ec5-467b-bdcd-152982e1b4de', N'30700')
INSERT [dbo].[Client] ([Id], [Name], [Surname], [Gender], [DateOfBirth], [Address], [CountryId], [PostalCode]) VALUES (N'6695d58f-5f4d-4fec-8290-6b76cd1f7634', N'Kalkbr33333ddddddAAaaaaaAAAAAAAAAAAA', N'asdfasasdfasd', 1, CAST(N'2021-06-02T22:00:00.0000000' AS DateTime2), N'asdfasdfaaaaaadddddddddddaaaaaaa', N'5be052c3-8ec5-467b-bdcd-152982e1b4de', N'30700')
INSERT [dbo].[Client] ([Id], [Name], [Surname], [Gender], [DateOfBirth], [Address], [CountryId], [PostalCode]) VALUES (N'cf050947-b052-43d0-9cbb-6ecf196f16e6', N'Kalkbr', N'asdfasasdfasd', 1, CAST(N'2021-06-02T22:00:00.0000000' AS DateTime2), N'asdfasdf', N'5be052c3-8ec5-467b-bdcd-152982e1b4de', N'30700')
INSERT [dbo].[Client] ([Id], [Name], [Surname], [Gender], [DateOfBirth], [Address], [CountryId], [PostalCode]) VALUES (N'c1ab7834-3e53-4df2-bd01-73282531a85d', N'Kalkbr', N'asdfasasdfasd', 1, CAST(N'2021-06-02T22:00:00.0000000' AS DateTime2), N'asdfasdf', N'5be052c3-8ec5-467b-bdcd-152982e1b4de', N'30700')
INSERT [dbo].[Client] ([Id], [Name], [Surname], [Gender], [DateOfBirth], [Address], [CountryId], [PostalCode]) VALUES (N'74e0acc9-5644-4dc3-8090-775742a832b0', N'Kalkbr', N'asdfasasdfasd', 1, CAST(N'2021-06-02T22:00:00.0000000' AS DateTime2), N'asdfasdf', N'5be052c3-8ec5-467b-bdcd-152982e1b4de', N'30700')
INSERT [dbo].[Client] ([Id], [Name], [Surname], [Gender], [DateOfBirth], [Address], [CountryId], [PostalCode]) VALUES (N'2e826a87-b49b-47ce-94f3-84c4fce31fc0', N'Kalkbr', N'asdfasasdfasd', 1, CAST(N'2021-06-02T22:00:00.0000000' AS DateTime2), N'asdfasdf', N'5be052c3-8ec5-467b-bdcd-152982e1b4de', N'30700')
INSERT [dbo].[Client] ([Id], [Name], [Surname], [Gender], [DateOfBirth], [Address], [CountryId], [PostalCode]) VALUES (N'173284c2-d1c4-4749-adf5-90d790844fd8', N'Kalkbr', N'asdfasasdfasd', 1, CAST(N'2021-06-02T22:00:00.0000000' AS DateTime2), N'asdfasdf', N'5be052c3-8ec5-467b-bdcd-152982e1b4de', N'30700')
INSERT [dbo].[Client] ([Id], [Name], [Surname], [Gender], [DateOfBirth], [Address], [CountryId], [PostalCode]) VALUES (N'109b3484-fab7-4e5c-a5a5-983d4af9a2e5', N'Kalkbr', N'asdfasasdfasd', 1, CAST(N'2021-06-02T22:00:00.0000000' AS DateTime2), N'asdfasdf', N'5be052c3-8ec5-467b-bdcd-152982e1b4de', N'30700')
INSERT [dbo].[Client] ([Id], [Name], [Surname], [Gender], [DateOfBirth], [Address], [CountryId], [PostalCode]) VALUES (N'8fbd5aba-c0af-4a03-aaf8-9841a9e554bf', N'Kalkbr', N'asdfasasdfasd', 1, CAST(N'2021-06-02T22:00:00.0000000' AS DateTime2), N'asdfasdf', N'5be052c3-8ec5-467b-bdcd-152982e1b4de', N'30700')
INSERT [dbo].[Client] ([Id], [Name], [Surname], [Gender], [DateOfBirth], [Address], [CountryId], [PostalCode]) VALUES (N'e546a130-a034-4809-a7eb-b0ac02811039', N'Kalkbr', N'asdfasasdfasd', 1, CAST(N'2021-06-02T22:00:00.0000000' AS DateTime2), N'asdfasdf', N'5be052c3-8ec5-467b-bdcd-152982e1b4de', N'30700')
INSERT [dbo].[Client] ([Id], [Name], [Surname], [Gender], [DateOfBirth], [Address], [CountryId], [PostalCode]) VALUES (N'77db2194-6859-4253-b831-b65e2700ac77', N'Kalkbr', N'asdfasasdfasd', 1, CAST(N'2021-06-02T22:00:00.0000000' AS DateTime2), N'asdfasdf', N'5be052c3-8ec5-467b-bdcd-152982e1b4de', N'30700')
INSERT [dbo].[Client] ([Id], [Name], [Surname], [Gender], [DateOfBirth], [Address], [CountryId], [PostalCode]) VALUES (N'0ea128ee-d883-498f-9227-beba9e98a76c', N'Kalkbr', N'asdfasasdfasd', 1, CAST(N'2021-06-02T22:00:00.0000000' AS DateTime2), N'asdfasdf', N'5be052c3-8ec5-467b-bdcd-152982e1b4de', N'30700')
INSERT [dbo].[Client] ([Id], [Name], [Surname], [Gender], [DateOfBirth], [Address], [CountryId], [PostalCode]) VALUES (N'faef141d-919e-4010-b868-d61618e808e3', N'Kalkbr', N'asdfasasdfasd', 1, CAST(N'2021-06-02T22:00:00.0000000' AS DateTime2), N'asdfasdf', N'5be052c3-8ec5-467b-bdcd-152982e1b4de', N'30700')
INSERT [dbo].[Client] ([Id], [Name], [Surname], [Gender], [DateOfBirth], [Address], [CountryId], [PostalCode]) VALUES (N'80b78812-739f-4b07-8cb8-d6eb8a65a8a8', N'Kalkbr', N'asdfasasdfasd', 1, CAST(N'2021-06-02T22:00:00.0000000' AS DateTime2), N'asdfasdf', N'5be052c3-8ec5-467b-bdcd-152982e1b4de', N'30700')
INSERT [dbo].[Client] ([Id], [Name], [Surname], [Gender], [DateOfBirth], [Address], [CountryId], [PostalCode]) VALUES (N'5b9f82e3-60eb-41c1-8227-e139ad42ebd1', N'Kalkbr', N'asdfasasdfasd', 1, CAST(N'2021-06-02T22:00:00.0000000' AS DateTime2), N'asdfasdf', N'5be052c3-8ec5-467b-bdcd-152982e1b4de', N'30700')
INSERT [dbo].[Client] ([Id], [Name], [Surname], [Gender], [DateOfBirth], [Address], [CountryId], [PostalCode]) VALUES (N'86ad01c6-39b3-4e4a-b11c-e6893a088750', N'Kalkbr', N'asdfasasdfasd', 1, CAST(N'2021-06-02T22:00:00.0000000' AS DateTime2), N'asdfasdf', N'5be052c3-8ec5-467b-bdcd-152982e1b4de', N'30700')
INSERT [dbo].[Client] ([Id], [Name], [Surname], [Gender], [DateOfBirth], [Address], [CountryId], [PostalCode]) VALUES (N'362fb29e-e818-44e9-981a-e7670b04dbf9', N'Kalkbr', N'asdfasasdfasd', 1, CAST(N'2021-06-02T22:00:00.0000000' AS DateTime2), N'asdfasdf', N'5be052c3-8ec5-467b-bdcd-152982e1b4de', N'30700')
INSERT [dbo].[Client] ([Id], [Name], [Surname], [Gender], [DateOfBirth], [Address], [CountryId], [PostalCode]) VALUES (N'9b93e564-447e-479f-8cf6-e9bf200261ef', N'Kalkbr', N'asdfasasdfasd', 1, CAST(N'2021-06-02T22:00:00.0000000' AS DateTime2), N'asdfasdf', N'5be052c3-8ec5-467b-bdcd-152982e1b4de', N'30700')
INSERT [dbo].[Client] ([Id], [Name], [Surname], [Gender], [DateOfBirth], [Address], [CountryId], [PostalCode]) VALUES (N'fcafc581-b694-4025-b99c-ee84aa8a9d8c', N'Kalkbr', N'asdfasasdfasd', 1, CAST(N'2021-06-02T22:00:00.0000000' AS DateTime2), N'asdfasdf', N'7cfed7fd-588a-4b39-9ea5-1c7b2c0d06b3', N'30700')
GO
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'bf8dd3d9-f6fc-4b75-a3d0-0088c091ce4c', N'Aruba', N'AW')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'c4bd387c-e589-4050-ac8b-022c1e9a269a', N'Papua New Guinea', N'PG')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'663b2f84-85ce-46db-a878-02c1c6aeb569', N'Lebanon', N'LB')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'd5e21be0-1a9c-427a-8106-034b680af737', N'Burkina Faso', N'BF')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'e2870829-4b24-4778-95b3-03558016e0fb', N'Madagascar', N'MG')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'6f0e8cbd-10cb-4b33-8ba6-0506ad0cd5ec', N'Greece', N'GR')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'3b67f8f0-8f01-4069-a6df-060e0fc2b215', N'Brunei Darussalam', N'BN')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'47ccbdd7-0a2a-49e7-98ab-0672bf8c9cad', N'Norway', N'NO')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'fa5425a9-d391-4eab-85eb-07e45b94d550', N'Serbia and Montenegro', N'CS')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'89f75cf6-f5ff-41a7-86f6-080fc6eabd56', N'Slovenia', N'SI')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'd273ea5d-8ec8-4008-96bc-0890d41e767c', N'Paraguay', N'PY')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'c6a1593c-e886-4258-9779-09624a640ca9', N'Afghanistan', N'AF')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'35df18f0-bcb8-4e0e-9aac-09f3bf841347', N'Cyprus', N'CY')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'21d367f3-8b2c-4e7a-a7db-0c2648211caf', N'Cocos (Keeling) Islands', N'CC')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'e5ec0020-fa3b-4ada-9c15-0c4854bdba7b', N'Chile', N'CL')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'd6a9a89d-36a0-49b9-8dd5-0c5a363c0b97', N'Cote DIvoire', N'CI')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'aefe659e-3570-4ec0-af72-0e24e115d2e2', N'Moldova, Republic of', N'MD')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'd814aede-98b6-43fa-b10f-1017b7e5fe8f', N'Seychelles', N'SC')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'0db52009-716c-46e3-b526-103698e868c4', N'San Marino', N'SM')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'e5b53056-ba2e-423c-8f41-1499958d5250', N'Hungary', N'HU')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'38a0156f-a6a7-4dda-b267-14a05d83b1b3', N'Virgin Islands, U.S.', N'VI')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'5be052c3-8ec5-467b-bdcd-152982e1b4de', N'Netherlands Antilles', N'AN')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'518d26c7-17f0-492d-84af-16356277387e', N'Jamaica', N'JM')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'f6654bff-847d-4b81-9dff-171360b75e0b', N'Christmas Island', N'CX')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'1ff9379c-85fa-4b68-a302-17221a149f0a', N'Maldives', N'MV')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'a29b8737-34b1-47ce-af89-17df61e85ba6', N'Egypt', N'EG')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'e48ff355-0ec9-42e6-bdc9-1a049625a549', N'Northern Mariana Islands', N'MP')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'8d4eba9d-16c8-49e7-b08a-1ab0c34a16cf', N'Sao Tome and Principe', N'ST')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'ebb86dd8-a53e-4491-a42c-1ae11035b480', N'Ecuador', N'EC')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'2d639f45-8e6c-40b8-b602-1b1475c3c254', N'Saint Kitts and Nevis', N'KN')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'7cfed7fd-588a-4b39-9ea5-1c7b2c0d06b3', N'Angola', N'AO')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'957f36ec-1eca-4569-8cc0-1cee38937172', N'Somalia', N'SO')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'33dd60be-498b-405d-a616-1e7996797034', N'Antigua and Barbuda', N'AG')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'45a1ed5a-0740-495f-89c0-1f2740a6862c', N'Nepal', N'NP')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'09b81ba1-98dd-435b-bc65-1f70e1c1b80a', N'Germany', N'DE')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'3cde19cb-1685-40f3-a077-1f94af72db7d', N'Suriname', N'SR')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'68b950c6-2cbf-4baa-ac13-2080432f6ea9', N'Bouvet Island', N'BV')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'3228d8eb-5d99-4a89-92a2-212197926849', N'Saint Vincent and the Grenadines', N'VC')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'adebb87a-0699-4f9b-95c7-21cd77c7a980', N'Kenya', N'KE')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'47509a13-f814-4efc-bce1-238793e14e2d', N'Micronesia, Federated States of', N'FM')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'8521a7af-75c1-4b40-a13e-253c63ed00e6', N'Niger', N'NE')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'5a60aaa1-73e7-4c4b-b13a-2679f32e83e4', N'Oman', N'OM')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'c255adea-d2b8-46a6-b057-26905f5096ba', N'Portugal', N'PT')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'946b151c-4e08-449f-8a62-2724f01140b2', N'Bahrain', N'BH')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'746de9c1-b3c5-468d-90f7-279d94cb9ee3', N'Finland', N'FI')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'f9f0b51f-ca64-49f5-b7a9-27ec1a924811', N'Cape Verde', N'CV')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'057391ad-4246-4710-a9fc-28ba5d519049', N'Bermuda', N'BM')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'642bf4d5-5a0c-4175-b6ac-28fa1ca5ac1c', N'French Polynesia', N'PF')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'd1d668ba-8ae5-4007-9ab3-28fab72c4d3a', N'Peru', N'PE')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'95afd862-ef14-4335-903a-29df6affe144', N'Sri Lanka', N'LK')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'181ed1ea-dc34-4b35-b778-2a6264f4a2c0', N'Haiti', N'HT')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'816b859c-84a8-4249-ad8c-2e7e2e0bca1b', N'Nicaragua', N'NI')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'2bedbfbe-9710-4ae4-b476-3042f7965d32', N'Falkland Islands (Malvinas)', N'FK')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'c65cb7b5-1242-4cc9-a75f-310cd7bb1001', N'Nigeria', N'NG')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'db0d2a6e-b1e2-4214-b650-3297e07e04de', N'Puerto Rico', N'PR')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'27749f81-76e1-44c9-b627-3343a1cf0a61', N'Jersey', N'JE')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'10dd331f-085d-487c-b6f4-336eb6a4d455', N'Grenada', N'GD')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'd73e2112-e05b-4b36-98b9-34c22b22e28d', N'Japan', N'JP')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'ebfb71a3-beb2-43c3-8b11-36043c71b5d6', N'Argentina', N'AR')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'e9527f6a-fe72-4764-a8a3-36c6a0b147df', N'Jordan', N'JO')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'd52ada6f-9ecd-45af-8082-374e25990eab', N'Malawi', N'MW')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'9ec87603-f0bb-4679-9d0c-38cb2301dd38', N'Syrian Arab Republic', N'SY')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'700e107b-7e61-467c-92cf-38d0414f4e51', N'Guinea', N'GN')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'a1ea4713-895d-46db-a8b6-3afb192b21d9', N'Heard Island and Mcdonald Islands', N'HM')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'c85cee2d-48c0-4203-bc3c-3b402a520358', N'Gabon', N'GA')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'9d762b04-3ae1-4462-b244-3b4a74a2caf1', N'New Caledonia', N'NC')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'64f1bc40-40e1-46a6-88ad-3bcec8dcbe6b', N'Turkey', N'TR')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'02ded855-d6aa-4dec-9bf6-3c6e3c4ffd5b', N'Iceland', N'IS')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'e6545a79-5839-465a-bf79-3d0d957dc816', N'Cameroon', N'CM')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'2a146551-a4aa-4360-bd1b-3d87aee3b4df', N'Albania', N'AL')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'7352a5cb-bdb6-4775-b867-3dc2e26d524d', N'Austria', N'AT')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'5bd25750-9227-45f9-a81e-3fbbaca10f58', N'Tuvalu', N'TV')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'569cf718-fb36-4e95-afa0-40d3eaef48be', N'Viet Nam', N'VN')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'cd0c4fb2-6783-48db-8b6a-43201c1f8f16', N'Belarus', N'BY')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'605fa4c7-d385-48a3-aa8e-433f3075ad19', N'Mauritania', N'MR')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'8539401b-6e5e-4faa-90e6-43d0b7713e7e', N'Cayman Islands', N'KY')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'f863bb11-1b84-47c4-9cca-44b56bc0e939', N'Macedonia, The Former Yugoslav Republic of', N'MK')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'ac4119fb-1209-40ff-8a49-4590be8dfab5', N'Philippines', N'PH')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'e4c0d3dd-e5ae-4d5d-8471-4672b4a739ee', N'Mexico', N'MX')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'0d06a54a-287b-44bc-995f-47036453502b', N'Guernsey', N'GG')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'7baf358a-fa49-4358-9642-4757daae410a', N'Israel', N'IL')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'8d73a7d4-5855-4e67-a3cd-4767ffa78dec', N'Marshall Islands', N'MH')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'0655594a-b89c-4f81-95e0-49adac348b58', N'British Indian Ocean Territory', N'IO')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'f4ccb519-cfe0-42b7-a0da-4b78bc4a1c22', N'Palau', N'PW')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'ea0856b3-d27e-46fb-888f-4bece67a8f0c', N'Cambodia', N'KH')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'b632be5f-653f-4b7d-a857-4c132f3f68b1', N'Burundi', N'BI')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'5fa850b3-d81f-412f-9959-4c58ec654fea', N'Indonesia', N'ID')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'3a5b3adc-be8a-4521-8ca9-4f56cf5f3ff6', N'South Georgia and the South Sandwich Islands', N'GS')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'e29d6ca6-4c42-482f-9458-523f72e53ce4', N'India', N'IN')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'a7cccb9c-0654-47fd-9a54-52611c7ca066', N'United States', N'US')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'e2ea1825-35f8-4f23-959d-548478089389', N'Dominican Republic', N'DO')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'8b543d43-dcd4-43a6-8f3b-5567ad81fa67', N'Comoros', N'KM')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'028b8efa-66be-42bb-a48e-558a6b4b4123', N'Samoa', N'WS')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'7f0d62ce-fd4b-4107-a4cb-59c26c3fb515', N'Australia', N'AU')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'78eec691-4f82-4b89-8b6c-5ad368eee2a3', N'Algeria', N'DZ')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'eba44101-b987-4902-a4d6-5ced6ebb2e14', N'Kyrgyzstan', N'KG')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'c38fc703-8003-4c9f-8d4c-5d4d517fa41d', N'Libyan Arab Jamahiriya', N'LY')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'd07df3f5-471f-4930-ac90-5db0fe9345f0', N'Bangladesh', N'BD')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'ac7a8df2-92e3-4411-bc1f-5e210744a8fc', N'Venezuela', N'VE')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'bb18d211-c528-46c1-8961-601842b03574', N'Macao', N'MO')
GO
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'06d302c1-76bb-4489-a89b-615a7d3c06be', N'Guam', N'GU')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'02b1bd2a-1d3a-4669-b54a-63439c8ae84d', N'Lao PeopleS Democratic Republic', N'LA')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'41edb558-6b1d-4140-8a75-644631c11c7f', N'Taiwan, Province of China', N'TW')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'39e66823-ba0e-42a8-9bd2-64b917a63c27', N'French Guiana', N'GF')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'f4b657ac-679b-47d0-ac1d-6839d7b0dd07', N'New Zealand', N'NZ')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'b2ae4f3d-11aa-4dc3-9f9a-68627f68635c', N'Luxembourg', N'LU')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'8566cbc3-7eaf-4c00-8e5f-6eddb17680ba', N'Netherlands', N'NL')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'd0d8ec69-d8f8-4629-a44f-6f08e4aef6f9', N'Turks and Caicos Islands', N'TC')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'f131c6e5-c597-4656-85b1-6f9943999c37', N'Solomon Islands', N'SB')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'bd43a2dd-8dc8-4db2-ba33-6fe048aaa89e', N'Sudan', N'SD')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'5743c868-e082-4059-b069-705f4501b598', N'Uganda', N'UG')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'93138c95-8bbe-4a51-a45e-725282ec013a', N'Poland', N'PL')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'ed7cdd83-7bee-4750-8545-730ff9a70aaa', N'Togo', N'TG')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'80f0585c-fb6b-467a-9d93-733a53af548f', N'Costa Rica', N'CR')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'7d9886e9-2b48-4099-b749-749803d933f9', N'Bosnia and Herzegovina', N'BA')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'44d0dbbb-920a-49ad-aafe-7777aa629f4f', N'Bolivia', N'BO')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'32917030-99cc-4a22-957e-781d217f9015', N'Malta', N'MT')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'76b3a7d4-8673-45fc-a28f-79106c94787a', N'Kiribati', N'KI')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'548a3701-7208-4bb7-9d88-7a3caaab1733', N'Iraq', N'IQ')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'9c6a5875-6e6b-40e6-8ba7-7b1d7275ac69', N'Gambia', N'GM')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'03cfbab1-38fc-4cfb-9fe9-7b9747f96bb6', N'Martinique', N'MQ')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'4d95f61c-dd8e-4547-a427-7d1476e6cafd', N'Djibouti', N'DJ')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'457f33bc-e171-4168-9f81-7d2d3a851221', N'Armenia', N'AM')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'b98bff7d-cbde-4334-b6b1-7eba5e673faf', N'Kuwait', N'KW')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'3322f72c-4533-462b-8515-7f1717c32b90', N'Nauru', N'NR')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'fed84df6-476a-434e-8d45-7f72481a41b7', N'Croatia', N'HR')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'6fa6ecca-2ed6-4e18-8d87-8079a87f3715', N'Monaco', N'MC')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'735e8026-75be-4a5e-a1e8-82c6326f1573', N'Azerbaijan', N'AZ')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'115a963d-4bb9-40d9-bf74-837eb5ca229e', N'Senegal', N'SN')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'682d1177-3970-46b2-b6d1-856cb3865b65', N'Dominica', N'DM')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'99ba2c8e-8771-41d1-9197-85eea427ddf7', N'Bulgaria', N'BG')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'216d0089-ea81-4f45-ae6c-8781eb943364', N'Tokelau', N'TK')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'295c8f9c-1fd2-4169-97c2-89574755c2e9', N'Estonia', N'EE')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'749d6b30-4785-49a5-b75c-8992b711b93a', N'Saint Pierre and Miquelon', N'PM')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'9074f9db-0e51-4900-992a-8b106d9ff884', N'Cuba', N'CU')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'bc984ada-f9fb-4431-b9cd-8c819d3cea79', N'Swaziland', N'SZ')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'06433796-1707-4a0b-a11f-8cb5fe82da56', N'Korea, Democratic People Republic of', N'KP')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'938cd565-19c3-444e-9dba-8fe7ee074d0b', N'China', N'CN')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'6650d751-bf5c-4068-93df-902c5a09c6f6', N'Isle of Man', N'IM')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'2e1b7e70-6436-4fa2-9d27-90428ec22f8f', N'Chad', N'TD')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'baee12d3-8181-4aab-a9f2-912846f5b036', N'Zimbabwe', N'ZW')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'04d3340c-3575-422e-b6ea-9225e67bcb6f', N'Virgin Islands, British', N'VG')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'e3979a97-fc80-4c5d-a596-926c361b23d1', N'Belize', N'BZ')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'96400f5e-43bb-4db9-83c0-95ab06799977', N'Myanmar', N'MM')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'dd6a18e2-f342-4922-992a-9605c70f32d0', N'Honduras', N'HN')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'61b4df10-424a-42e5-8dca-96d7d5d621b5', N'Holy See (Vatican City State)', N'VA')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'e2950f1b-6815-4660-9d6f-96f74b0b5c2e', N'Mali', N'ML')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'536a9e1f-ddbd-462e-b007-9a7c62a5d1bb', N'Guatemala', N'GT')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'93983ee1-6a5e-4a96-ad5b-9ac624ee08df', N'Spain', N'ES')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'8b687b2d-aed6-4708-b2c6-9dbb534618fd', N'Mozambique', N'MZ')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'68e875d9-db33-4a10-8c82-a0cfb871dfc8', N'Italy', N'IT')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'73a23512-d3c5-4ac7-aa80-a1ca804d4858', N'Denmark', N'DK')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'4e524122-b50f-4cf2-ad5d-a1eb61957367', N'El Salvador', N'SV')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'11cfb516-25dc-483a-94f8-a1fcaa919810', N'Cook Islands', N'CK')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'f7302414-44d1-4775-96d6-a38263e4c87a', N'Sweden', N'SE')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'd5d7ccbb-5fc0-4e10-befc-a48662b0f555', N'Fiji', N'FJ')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'59264484-a6f5-40fc-9a84-a5bfe8679fb1', N'Equatorial Guinea', N'GQ')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'5a43c1ce-0aec-4b95-9354-a73eb5ca7dd8', N'Thailand', N'TH')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'c3f3427b-f30c-40c9-91bc-a77266e3a862', N'Ireland', N'IE')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'91e2fa91-4213-4b63-8179-a87342aa125c', N'Vanuatu', N'VU')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'0cdbb39d-d990-4eed-8e5c-a997a4e5956e', N'Saint Lucia', N'LC')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'9f2c5dbf-c7cb-4bad-a247-aa09918799e3', N'Mongolia', N'MN')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'1096fd36-9387-4cb1-b9f6-ac86789ebe41', N'Wallis and Futuna', N'WF')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'2b3eb7d9-4cc9-45dd-a207-acf988fbc7ad', N'Greenland', N'GL')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'4097090d-98f0-4c5a-9ec0-acfdda2d152a', N'Zambia', N'ZM')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'a96b03ed-e274-436b-afe4-ad489644d8fc', N'Tunisia', N'TN')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'b011df1f-6cde-42be-9878-ad8f5b8e66f3', N'Morocco', N'MA')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'7bc74bce-3020-425e-bf6b-adacef0276ed', N'Åland Islands', N'AX')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'd4b96509-a505-4e22-a5a4-ae31723bf56f', N'Switzerland', N'CH')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'e5e4e922-387a-499a-9a63-b0ece83f36bd', N'Montserrat', N'MS')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'ca6e19b3-9731-433e-a663-b156d5036c55', N'Pitcairn', N'PN')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'6dec266c-1feb-4b44-a9a6-b19bc0ba0fed', N'Turkmenistan', N'TM')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'05d820a6-0301-4ade-acf4-b319245ad0dc', N'American Samoa', N'AS')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'66f1e663-a4b8-4bd9-bd5b-b81d0b5150f7', N'Uzbekistan', N'UZ')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'37104829-796b-47b3-acb2-b9b18b5e5c66', N'Czech Republic', N'CZ')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'141a17b3-7af5-4847-a4ed-bb3edc92cd72', N'France', N'FR')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'6975ec9b-cdc9-48d2-a335-bdb6ac53b25c', N'Tonga', N'TO')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'7f62b41c-82b4-457d-85c1-bf030017e5b8', N'Mayotte', N'YT')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'2c08a0a5-27fc-46be-b397-c0755f4bc232', N'Georgia', N'GE')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'80549c88-816b-4275-98e2-c086ed199ad0', N'Botswana', N'BW')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'64c820c8-f7c9-4186-9788-c181671ed90e', N'Brazil', N'BR')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'986a7fd3-4a24-49bd-aeef-c18b543455cf', N'RWANDA', N'RW')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'd330cb82-3e06-4ade-b06a-c2a552aba7f9', N'Liechtenstein', N'LI')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'cf7a5bcb-0d94-4361-b0f9-c45028110927', N'Western Sahara', N'EH')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'4bab4bea-a634-4ff3-83ac-c4bbf0ab7657', N'Hong Kong', N'HK')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'4dc02123-c84d-4d0b-a16d-c4d59818b23e', N'Singapore', N'SG')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'7578105e-40c9-4839-8934-c5bb0d985b3f', N'United Kingdom', N'GB')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'160bfc75-036d-489f-89d9-c5ee2e6dd0ac', N'French Southern Territories', N'TF')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'f2a40690-4da4-41da-979d-c79b34e6d7b7', N'Pakistan', N'PK')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'9f15932a-6fe8-4c43-bd37-c7a8cd00a915', N'Qatar', N'QA')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'3188c67d-12f1-4135-bfc3-c7c409f0975e', N'Mauritius', N'MU')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'e8f7f52a-283b-4fc0-9c90-c9f520be4aa8', N'Bahamas', N'BS')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'174c9fb1-87ff-4eb7-8384-cafc35c11977', N'Faroe Islands', N'FO')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'e3c9bdce-91e2-46cd-af3e-cb35ec7e940c', N'Guyana', N'GY')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'8a9ef4f7-691c-4d02-8b6e-cb96a42edbab', N'Palestinian Territory, Occupied', N'PS')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'579b4f71-da45-43ba-92b9-cbc9a772f1a6', N'Slovakia', N'SK')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'f45d4a16-ba28-4bd8-86bd-cd32388c034b', N'South Africa', N'ZA')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'e2c8d901-6c3a-4e09-8c85-cd60e5fe0f9f', N'Saudi Arabia', N'SA')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'62986370-0277-460b-84fc-cd8c21c44978', N'Timor-Leste', N'TL')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'1a4d14e2-27a6-4f84-a588-cdef32b649f7', N'Bhutan', N'BT')
GO
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'8bf0490c-61cb-4310-8997-d0367b6edce6', N'Reunion', N'RE')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'84a89984-a1a6-483c-b9f9-d161830c5ea6', N'Svalbard and Jan Mayen', N'SJ')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'dd55cb4b-e3db-4170-9a66-d34377d076d4', N'Colombia', N'CO')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'4d18440a-ef15-4c4e-aef4-d4067d3bb39b', N'Ukraine', N'UA')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'f64ec80d-a980-4922-a8e2-d557a9190980', N'Anguilla', N'AI')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'7b413902-df1f-45ac-b7e6-d5bc0db9ddc0', N'Guadeloupe', N'GP')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'edf4da97-fdeb-4e57-81bf-d6348853552b', N'Eritrea', N'ER')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'0f179aa4-1c58-481f-930d-d74e392e3b98', N'Canada', N'CA')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'd14a7bde-89a0-4a27-95b5-d7f9057f8790', N'Sierra Leone', N'SL')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'90f0d234-ee75-4193-96d3-d9618b4cb513', N'Antarctica', N'AQ')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'ee226c52-0e72-42e3-8293-d9c9624a578f', N'Kazakhstan', N'KZ')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'63a98750-e6ae-4fbb-9360-da0aa9623a90', N'Saint Helena', N'SH')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'40b4ee8c-0f97-48da-bac6-da6f7d4f43d8', N'Central African Republic', N'CF')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'ff8d8af9-1b33-4465-9918-dc7fd896ff1e', N'Norfolk Island', N'NF')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'a03b8e16-0274-4660-8fdf-dcba514dbcec', N'Barbados', N'BB')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'5b6e9018-7757-4383-8a3a-dcf38b2891b6', N'Yemen', N'YE')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'88b5b737-50e7-4ac3-8715-dddf2e3876c0', N'Malaysia', N'MY')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'31ea867e-54cb-4fe8-8689-de23dc5d7c2b', N'Romania', N'RO')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'd1c1f5f4-c24d-46aa-b265-deaa62a25c5a', N'Iran, Islamic Republic Of', N'IR')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'637a4044-50ab-497e-ab7e-e1780d2fed66', N'Lesotho', N'LS')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'fb31a027-db47-429f-b8f2-e36b639e9f79', N'Benin', N'BJ')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'334b04c9-2d79-4d96-963e-e39937be39df', N'Korea, Republic of', N'KR')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'6d8c268e-6bad-40cc-9550-e5cd39e1b4bf', N'Liberia', N'LR')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'2a317893-7c66-43e4-9785-e75015cc9cd4', N'Ethiopia', N'ET')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'f97305eb-43d1-42dc-b044-e9305cb3a1ca', N'United States Minor Outlying Islands', N'UM')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'31b60d78-9487-41eb-ab7f-eb7ef5a86a66', N'Tajikistan', N'TJ')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'f6e23c19-b7e2-46b3-babd-ec0ee0ada5b6', N'United Arab Emirates', N'AE')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'1f0284f5-e672-40ae-be89-ec156ad48636', N'Gibraltar', N'GI')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'22c0d1f9-42c9-401c-87d6-ec2039070de8', N'Lithuania', N'LT')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'9393cfa7-9aad-47b1-8e0b-ecd66f0d9383', N'Russian Federation', N'RU')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'ad5da2fe-1a1f-4b2a-a19d-ed56aff071c4', N'Ghana', N'GH')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'21ad2050-e45a-4ded-9663-ee02f2e97040', N'Trinidad and Tobago', N'TT')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'cb06d8ad-cc44-4ecc-aad1-ee63aa7a2062', N'Uruguay', N'UY')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'84c49b43-8a63-451d-86ab-ee67f49318e0', N'Latvia', N'LV')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'12ff8090-1b7c-401b-92c9-f0f9f34d9a9f', N'Tanzania, United Republic of', N'TZ')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'54902cf1-24ef-4793-82a4-f233657ac999', N'AndorrA', N'AD')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'017957a5-3690-44a3-b8fe-f7b5b699de4d', N'Panama', N'PA')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'7c5ebca1-c086-4fff-8736-f8de27a46333', N'Guinea-Bissau', N'GW')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'f3780a7c-9767-4ca5-9aca-fa349a9609cf', N'Belgium', N'BE')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'df22aa5d-3fc9-4441-97cd-faedb143fcd8', N'Namibia', N'NA')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'258418c2-6037-4811-add8-fba701cbb9d9', N'Congo, The Democratic Republic of the', N'CD')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'1c36e203-8945-40e7-a6f1-fc0df2c271fd', N'Niue', N'NU')
INSERT [dbo].[Country] ([Id], [Name], [Code]) VALUES (N'bd4ecd87-8a4b-4043-809a-fd56a71ea736', N'Congo', N'CG')
GO
/****** Object:  Index [IX_Client_CountryId]    Script Date: 05/06/2021 6:31:35 ******/
CREATE NONCLUSTERED INDEX [IX_Client_CountryId] ON [dbo].[Client]
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Country_CountryId] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Country_CountryId]
GO
USE [master]
GO
ALTER DATABASE [ClientsStorage] SET  READ_WRITE 
GO
