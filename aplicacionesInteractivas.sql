USE [master]
GO
/****** Object:  Database [AplicacionesInteractivas]    Script Date: 5/22/2015 3:47:42 AM ******/
CREATE DATABASE [AplicacionesInteractivas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AplicacionesInteractivas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\AplicacionesInteractivas.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AplicacionesInteractivas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\AplicacionesInteractivas_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AplicacionesInteractivas] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AplicacionesInteractivas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AplicacionesInteractivas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AplicacionesInteractivas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AplicacionesInteractivas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AplicacionesInteractivas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AplicacionesInteractivas] SET ARITHABORT OFF 
GO
ALTER DATABASE [AplicacionesInteractivas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AplicacionesInteractivas] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [AplicacionesInteractivas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AplicacionesInteractivas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AplicacionesInteractivas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AplicacionesInteractivas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AplicacionesInteractivas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AplicacionesInteractivas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AplicacionesInteractivas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AplicacionesInteractivas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AplicacionesInteractivas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AplicacionesInteractivas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AplicacionesInteractivas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AplicacionesInteractivas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AplicacionesInteractivas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AplicacionesInteractivas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AplicacionesInteractivas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AplicacionesInteractivas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AplicacionesInteractivas] SET RECOVERY FULL 
GO
ALTER DATABASE [AplicacionesInteractivas] SET  MULTI_USER 
GO
ALTER DATABASE [AplicacionesInteractivas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AplicacionesInteractivas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AplicacionesInteractivas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AplicacionesInteractivas] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AplicacionesInteractivas', N'ON'
GO
USE [AplicacionesInteractivas]
GO
/****** Object:  Table [dbo].[Colocaciones]    Script Date: 5/22/2015 3:47:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Colocaciones](
	[idColocacion] [int] IDENTITY(1,1) NOT NULL,
	[idEdicion] [int] NOT NULL,
	[pauta] [varchar](50) NOT NULL,
	[fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Colocaciones] PRIMARY KEY CLUSTERED 
(
	[idColocacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ediciones]    Script Date: 5/22/2015 3:47:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ediciones](
	[idEdicion] [int] IDENTITY(1,1) NOT NULL,
	[idPublicacion] [int] NOT NULL,
	[tituloTapa] [varchar](500) NOT NULL,
	[precio] [float] NOT NULL,
	[fechaSalida] [date] NOT NULL,
	[cantidadEjemplares] [bigint] NOT NULL,
 CONSTRAINT [PK_Ediciones_1] PRIMARY KEY CLUSTERED 
(
	[idEdicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemsColocaciones]    Script Date: 5/22/2015 3:47:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemsColocaciones](
	[idItemColocacion] [int] IDENTITY(1,1) NOT NULL,
	[idPuesto] [int] NOT NULL,
	[totalEjemplaresEntregados] [int] NOT NULL,
	[totalEjemplaresDevueltos] [int] NOT NULL,
	[idPublicacion] [int] NOT NULL,
	[idEdicion] [int] NOT NULL,
	[fecha] [date] NOT NULL,
 CONSTRAINT [PK_ItemsColocaciones_1] PRIMARY KEY CLUSTERED 
(
	[idItemColocacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Publicaciones]    Script Date: 5/22/2015 3:47:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Publicaciones](
	[idPublicacion] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](500) NOT NULL,
	[tipoPublicacion] [varchar](50) NOT NULL,
	[editor] [varchar](255) NOT NULL,
	[tema] [varchar](255) NOT NULL,
	[subtema] [varchar](255) NOT NULL,
	[publico] [char](1) NOT NULL,
	[periodicidad] [varchar](50) NOT NULL,
	[idioma] [varchar](50) NOT NULL,
	[paisOrigen] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Publicaciones_1] PRIMARY KEY CLUSTERED 
(
	[idPublicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Puestos]    Script Date: 5/22/2015 3:47:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Puestos](
	[idPuesto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[direccion] [varchar](255) NOT NULL,
	[barrio] [varchar](255) NOT NULL,
	[tipo] [varchar](50) NOT NULL,
	[idZona] [int] NOT NULL,
 CONSTRAINT [PK_Puestos_1] PRIMARY KEY CLUSTERED 
(
	[idPuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Colocaciones] ON 

INSERT [dbo].[Colocaciones] ([idColocacion], [idEdicion], [pauta], [fecha]) VALUES (1, 1, N'Por defecto', CAST(0x0000A4A000000000 AS DateTime))
INSERT [dbo].[Colocaciones] ([idColocacion], [idEdicion], [pauta], [fecha]) VALUES (2, 1, N'Por defecto', CAST(0x0000A4A000000000 AS DateTime))
INSERT [dbo].[Colocaciones] ([idColocacion], [idEdicion], [pauta], [fecha]) VALUES (3, 1, N'Por defecto', CAST(0x0000A4A000000000 AS DateTime))
INSERT [dbo].[Colocaciones] ([idColocacion], [idEdicion], [pauta], [fecha]) VALUES (4, 1, N'Por defecto', CAST(0x0000A4A000000000 AS DateTime))
INSERT [dbo].[Colocaciones] ([idColocacion], [idEdicion], [pauta], [fecha]) VALUES (5, 1, N'Por defecto', CAST(0x0000A4A000000000 AS DateTime))
INSERT [dbo].[Colocaciones] ([idColocacion], [idEdicion], [pauta], [fecha]) VALUES (6, 1, N'Por defecto', CAST(0x0000A4A000000000 AS DateTime))
INSERT [dbo].[Colocaciones] ([idColocacion], [idEdicion], [pauta], [fecha]) VALUES (7, 1, N'Por defecto', CAST(0x0000A4A000000000 AS DateTime))
INSERT [dbo].[Colocaciones] ([idColocacion], [idEdicion], [pauta], [fecha]) VALUES (8, 1, N'Por defecto', CAST(0x0000A4A000000000 AS DateTime))
INSERT [dbo].[Colocaciones] ([idColocacion], [idEdicion], [pauta], [fecha]) VALUES (9, 1, N'Por defecto', CAST(0x0000A4A000000000 AS DateTime))
INSERT [dbo].[Colocaciones] ([idColocacion], [idEdicion], [pauta], [fecha]) VALUES (10, 1, N'Por defecto', CAST(0x0000A4A000000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Colocaciones] OFF
SET IDENTITY_INSERT [dbo].[Ediciones] ON 

INSERT [dbo].[Ediciones] ([idEdicion], [idPublicacion], [tituloTapa], [precio], [fechaSalida], [cantidadEjemplares]) VALUES (1, 1, N'Cristina y PASO', 1.5, CAST(0xFA390B00 AS Date), 100)
INSERT [dbo].[Ediciones] ([idEdicion], [idPublicacion], [tituloTapa], [precio], [fechaSalida], [cantidadEjemplares]) VALUES (2, 1, N'Macri, sus alianzas', 2.5, CAST(0xFA390B00 AS Date), 100)
INSERT [dbo].[Ediciones] ([idEdicion], [idPublicacion], [tituloTapa], [precio], [fechaSalida], [cantidadEjemplares]) VALUES (3, 2, N'Kickiloff y la inflacion', 2.5, CAST(0xFA390B00 AS Date), 100)
INSERT [dbo].[Ediciones] ([idEdicion], [idPublicacion], [tituloTapa], [precio], [fechaSalida], [cantidadEjemplares]) VALUES (4, 2, N'Deuda Externa', 2.5, CAST(0xFA390B00 AS Date), 100)
SET IDENTITY_INSERT [dbo].[Ediciones] OFF
SET IDENTITY_INSERT [dbo].[ItemsColocaciones] ON 

INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (2, 1, 100, 0, 1, 1, CAST(0xFA390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (3, 1, 100, 50, 1, 1, CAST(0xF9390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (4, 1, 100, 100, 1, 1, CAST(0xF8390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (5, 2, 100, 0, 1, 1, CAST(0xFA390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (6, 2, 100, 50, 1, 1, CAST(0xF9390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (7, 2, 100, 100, 1, 1, CAST(0xF8390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (8, 3, 100, 0, 1, 1, CAST(0xFA390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (9, 3, 100, 50, 1, 1, CAST(0xF9390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (10, 3, 100, 100, 1, 1, CAST(0xF8390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (11, 1, 100, 100, 1, 1, CAST(0xF7390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (12, 2, 100, 100, 1, 1, CAST(0xF7390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (13, 3, 100, 100, 1, 1, CAST(0xF7390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (14, 4, 100, 0, 1, 1, CAST(0xFA390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (15, 4, 100, 50, 1, 1, CAST(0xF9390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (16, 4, 100, 100, 1, 1, CAST(0xF8390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (17, 4, 100, 100, 1, 1, CAST(0xF7390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (18, 5, 100, 0, 1, 1, CAST(0xFA390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (19, 5, 100, 50, 1, 1, CAST(0xF9390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (20, 5, 100, 100, 1, 1, CAST(0xF8390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (21, 5, 100, 100, 1, 1, CAST(0xF7390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (22, 1, 75, 0, 1, 1, CAST(0xFB390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (23, 2, 75, 0, 1, 1, CAST(0xFB390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (24, 3, 75, 0, 1, 1, CAST(0xFB390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (25, 4, 75, 0, 1, 1, CAST(0xFB390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (26, 5, 75, 0, 1, 1, CAST(0xFB390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (27, 1, 75, 0, 1, 1, CAST(0xFB390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (28, 2, 75, 0, 1, 1, CAST(0xFB390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (29, 3, 75, 0, 1, 1, CAST(0xFB390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (30, 4, 75, 0, 1, 1, CAST(0xFB390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (31, 5, 75, 0, 1, 1, CAST(0xFB390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (32, 1, 75, 0, 1, 1, CAST(0xFB390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (33, 2, 75, 0, 1, 1, CAST(0xFB390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (34, 3, 75, 0, 1, 1, CAST(0xFB390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (35, 4, 75, 0, 1, 1, CAST(0xFB390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (36, 5, 75, 0, 1, 1, CAST(0xFB390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (37, 1, 75, 0, 1, 1, CAST(0xFB390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (38, 2, 75, 0, 1, 1, CAST(0xFB390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (39, 3, 75, 0, 1, 1, CAST(0xFB390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (40, 4, 75, 0, 1, 1, CAST(0xFB390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (41, 5, 75, 0, 1, 1, CAST(0xFB390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (42, 1, 75, 0, 1, 1, CAST(0xFB390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (43, 2, 75, 0, 1, 1, CAST(0xFB390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (44, 3, 75, 0, 1, 1, CAST(0xFB390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (45, 4, 75, 0, 1, 1, CAST(0xFB390B00 AS Date))
INSERT [dbo].[ItemsColocaciones] ([idItemColocacion], [idPuesto], [totalEjemplaresEntregados], [totalEjemplaresDevueltos], [idPublicacion], [idEdicion], [fecha]) VALUES (46, 5, 75, 0, 1, 1, CAST(0xFB390B00 AS Date))
SET IDENTITY_INSERT [dbo].[ItemsColocaciones] OFF
SET IDENTITY_INSERT [dbo].[Publicaciones] ON 

INSERT [dbo].[Publicaciones] ([idPublicacion], [titulo], [tipoPublicacion], [editor], [tema], [subtema], [publico], [periodicidad], [idioma], [paisOrigen]) VALUES (1, N'La Nacion', N'diario', N'Pepe', N'Politica', N'Elecciones', N'f', N'Semanal', N'Espanol', N'Argentina')
INSERT [dbo].[Publicaciones] ([idPublicacion], [titulo], [tipoPublicacion], [editor], [tema], [subtema], [publico], [periodicidad], [idioma], [paisOrigen]) VALUES (2, N'La Nacion', N'diario', N'Carlo', N'Economia', N'Inflacion', N'f', N'Semanal', N'Espanol', N'Argentina')
SET IDENTITY_INSERT [dbo].[Publicaciones] OFF
SET IDENTITY_INSERT [dbo].[Puestos] ON 

INSERT [dbo].[Puestos] ([idPuesto], [nombre], [direccion], [barrio], [tipo], [idZona]) VALUES (1, N'Gonzalo', N'Gaona 1830', N'Caballito', N'diario', 1)
INSERT [dbo].[Puestos] ([idPuesto], [nombre], [direccion], [barrio], [tipo], [idZona]) VALUES (2, N'Carlos', N'Paysandu 1020', N'Caballito', N'diario', 1)
INSERT [dbo].[Puestos] ([idPuesto], [nombre], [direccion], [barrio], [tipo], [idZona]) VALUES (3, N'Alberto', N'Monroe 1980', N'Belgrano', N'revista', 1)
INSERT [dbo].[Puestos] ([idPuesto], [nombre], [direccion], [barrio], [tipo], [idZona]) VALUES (4, N'Oscar', N'Libertados 1000', N'Belgrano', N'diario', 1)
INSERT [dbo].[Puestos] ([idPuesto], [nombre], [direccion], [barrio], [tipo], [idZona]) VALUES (5, N'Matias', N'Cordoba 1020', N'Palermo', N'revista', 1)
SET IDENTITY_INSERT [dbo].[Puestos] OFF
ALTER TABLE [dbo].[Colocaciones] ADD  CONSTRAINT [DF_Colocaciones_pauta_1]  DEFAULT ('default') FOR [pauta]
GO
ALTER TABLE [dbo].[ItemsColocaciones] ADD  CONSTRAINT [DF_ItemsColocaciones_totalEjemplaresEntregados]  DEFAULT ((0)) FOR [totalEjemplaresEntregados]
GO
ALTER TABLE [dbo].[ItemsColocaciones] ADD  CONSTRAINT [DF_ItemsColocaciones_totalEjemplaresDevueltos]  DEFAULT ((0)) FOR [totalEjemplaresDevueltos]
GO
ALTER TABLE [dbo].[Colocaciones]  WITH CHECK ADD  CONSTRAINT [FK_Colocaciones_Ediciones] FOREIGN KEY([idEdicion])
REFERENCES [dbo].[Ediciones] ([idEdicion])
GO
ALTER TABLE [dbo].[Colocaciones] CHECK CONSTRAINT [FK_Colocaciones_Ediciones]
GO
ALTER TABLE [dbo].[Ediciones]  WITH CHECK ADD  CONSTRAINT [FK_Ediciones_Publicaciones] FOREIGN KEY([idPublicacion])
REFERENCES [dbo].[Publicaciones] ([idPublicacion])
GO
ALTER TABLE [dbo].[Ediciones] CHECK CONSTRAINT [FK_Ediciones_Publicaciones]
GO
ALTER TABLE [dbo].[ItemsColocaciones]  WITH CHECK ADD  CONSTRAINT [FK_ItemsColocaciones_Ediciones] FOREIGN KEY([idEdicion])
REFERENCES [dbo].[Ediciones] ([idEdicion])
GO
ALTER TABLE [dbo].[ItemsColocaciones] CHECK CONSTRAINT [FK_ItemsColocaciones_Ediciones]
GO
ALTER TABLE [dbo].[ItemsColocaciones]  WITH CHECK ADD  CONSTRAINT [FK_ItemsColocaciones_Publicaciones] FOREIGN KEY([idPublicacion])
REFERENCES [dbo].[Publicaciones] ([idPublicacion])
GO
ALTER TABLE [dbo].[ItemsColocaciones] CHECK CONSTRAINT [FK_ItemsColocaciones_Publicaciones]
GO
ALTER TABLE [dbo].[ItemsColocaciones]  WITH CHECK ADD  CONSTRAINT [FK_ItemsColocaciones_Puestos] FOREIGN KEY([idPuesto])
REFERENCES [dbo].[Puestos] ([idPuesto])
GO
ALTER TABLE [dbo].[ItemsColocaciones] CHECK CONSTRAINT [FK_ItemsColocaciones_Puestos]
GO
USE [master]
GO
ALTER DATABASE [AplicacionesInteractivas] SET  READ_WRITE 
GO
