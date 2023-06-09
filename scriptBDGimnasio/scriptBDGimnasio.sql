USE [master]
GO
/****** Object:  Database [BDGimnasio]    Script Date: 10/3/2022 11:21:50 ******/
CREATE DATABASE [BDGimnasio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDGimnasio', FILENAME = N'C:\Bases\SQLServer\BDGimnasio.mdf' , SIZE = 5120KB , MAXSIZE = 10240KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BDGimnasio_log', FILENAME = N'C:\Bases\SQLServer\BDGimnasio_log.ldf' , SIZE = 1024KB , MAXSIZE = 5120KB , FILEGROWTH = 1024KB )
GO
ALTER DATABASE [BDGimnasio] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDGimnasio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDGimnasio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDGimnasio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDGimnasio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDGimnasio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDGimnasio] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDGimnasio] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BDGimnasio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDGimnasio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDGimnasio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDGimnasio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDGimnasio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDGimnasio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDGimnasio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDGimnasio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDGimnasio] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BDGimnasio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDGimnasio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDGimnasio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDGimnasio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDGimnasio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDGimnasio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDGimnasio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDGimnasio] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BDGimnasio] SET  MULTI_USER 
GO
ALTER DATABASE [BDGimnasio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDGimnasio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDGimnasio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDGimnasio] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BDGimnasio] SET DELAYED_DURABILITY = DISABLED 
GO
USE [BDGimnasio]
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 10/3/2022 11:21:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Alumno](
	[idAlumno] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NULL,
	[apellido] [nvarchar](100) NULL,
	[dni] [nvarchar](50) NULL,
	[direccion] [nvarchar](100) NULL,
	[telefono] [nvarchar](50) NULL,
	[email] [nvarchar](100) NULL,
	[fechaNac] [date] NULL,
	[idCiudad] [int] NULL,
	[observaciones] [nvarchar](4000) NULL,
	[estado] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[idAlumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AlumnoxClase]    Script Date: 10/3/2022 11:21:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlumnoxClase](
	[idAlumnoxClase] [int] IDENTITY(1,1) NOT NULL,
	[idAlumno] [int] NULL,
	[idProfesorxClase] [int] NULL,
	[fechaDesde] [date] NULL,
	[fechaHasta] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[idAlumnoxClase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Asistencia]    Script Date: 10/3/2022 11:21:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asistencia](
	[idAsistencia] [bigint] IDENTITY(1,1) NOT NULL,
	[idAlumno] [int] NULL,
	[fecha] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idAsistencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ciudad]    Script Date: 10/3/2022 11:21:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudad](
	[idCiudad] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NULL,
	[idProvincia] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCiudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Clase]    Script Date: 10/3/2022 11:21:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clase](
	[idClase] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NULL,
	[fechaDesde] [date] NULL,
	[fechaHasta] [date] NULL,
	[cupoMaximo] [int] NULL,
	[descripcion] [nvarchar](4000) NULL,
	[estado] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[idClase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ejercicio]    Script Date: 10/3/2022 11:21:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ejercicio](
	[idEjercicio] [int] IDENTITY(1,1) NOT NULL,
	[idMaquina] [int] NULL,
	[nombre] [nvarchar](100) NULL,
	[descripcion] [nvarchar](4000) NULL,
	[idTipoEjercicio] [int] NULL,
	[estado] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[idEjercicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EjercicioPlanAlumno]    Script Date: 10/3/2022 11:21:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EjercicioPlanAlumno](
	[idEjercicioPlanAlumno] [int] IDENTITY(1,1) NOT NULL,
	[idEjercicio] [int] NOT NULL,
	[idPlanxAlumno] [int] NULL,
	[repeticiones] [int] NULL,
	[series] [int] NULL,
	[intensidadCarga] [nvarchar](100) NULL,
	[observaciones] [nvarchar](4000) NULL,
	[dia] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[idEjercicioPlanAlumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EjercicioxPlan]    Script Date: 10/3/2022 11:21:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EjercicioxPlan](
	[idEjercicioxPlan] [int] IDENTITY(1,1) NOT NULL,
	[idEjercicio] [int] NOT NULL,
	[idPlan] [int] NOT NULL,
	[repeticiones] [int] NULL,
	[series] [int] NULL,
	[observaciones] [nvarchar](4000) NULL,
	[dia] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[idEjercicioxPlan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Maquina]    Script Date: 10/3/2022 11:21:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Maquina](
	[idMaquina] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NULL,
	[descripcion] [nvarchar](4000) NULL,
	[fechaAlta] [date] NULL,
	[fechaBaja] [date] NULL,
	[estado] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[idMaquina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Planes]    Script Date: 10/3/2022 11:21:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Planes](
	[idPlan] [int] IDENTITY(1,1) NOT NULL,
	[idTipoPlan] [int] NOT NULL,
	[nombre] [nvarchar](100) NULL,
	[descripcion] [nvarchar](4000) NULL,
	[estado] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[idPlan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PlanxAlumno]    Script Date: 10/3/2022 11:21:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanxAlumno](
	[idPlanxAlumno] [int] IDENTITY(1,1) NOT NULL,
	[idPlan] [int] NULL,
	[idAlumno] [int] NULL,
	[nro] [int] NULL,
	[fechaDesde] [date] NULL,
	[fechaHasta] [date] NULL,
	[idProfesor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idPlanxAlumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Profesor]    Script Date: 10/3/2022 11:21:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Profesor](
	[idProfesor] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NULL,
	[apellido] [nvarchar](100) NULL,
	[dni] [nvarchar](50) NULL,
	[direccion] [nvarchar](100) NULL,
	[telefono] [nvarchar](50) NULL,
	[email] [nvarchar](100) NULL,
	[fechaNac] [date] NULL,
	[idCiudad] [int] NULL,
	[observaciones] [nvarchar](4000) NULL,
	[estado] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[idProfesor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProfesorxClase]    Script Date: 10/3/2022 11:21:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfesorxClase](
	[idProfesorxClase] [int] IDENTITY(1,1) NOT NULL,
	[idProfesor] [int] NOT NULL,
	[idClase] [int] NOT NULL,
	[fechaDesde] [date] NULL,
	[fechaHasta] [date] NULL,
	[dia] [nvarchar](15) NULL,
	[horaInicio] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[idProfesorxClase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 10/3/2022 11:21:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[idProvincia] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[idProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoEjercicio]    Script Date: 10/3/2022 11:21:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEjercicio](
	[idTipoEjercicio] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NULL,
	[descripcion] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoEjercicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoPlan]    Script Date: 10/3/2022 11:21:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoPlan](
	[idTipoPlan] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NULL,
	[descripcion] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoPlan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Titulo]    Script Date: 10/3/2022 11:21:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Titulo](
	[idTitulo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[idTitulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TituloxProfesor]    Script Date: 10/3/2022 11:21:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TituloxProfesor](
	[idTituloxProfesor] [int] IDENTITY(1,1) NOT NULL,
	[idTitulo] [int] NULL,
	[idProfesor] [int] NULL,
	[fechaEgreso] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[idTituloxProfesor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 10/3/2022 11:21:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [nvarchar](50) NULL,
	[contraseña] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vPlanPersonalizado]    Script Date: 10/3/2022 11:21:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vPlanPersonalizado]
AS
SELECT Ejercicio.nombre AS Ejercicio, EjercicioPlanAlumno.series AS Series, EjercicioPlanAlumno.repeticiones AS Repeticiones,Maquina.nombre AS Maquina, EjercicioPlanAlumno.dia AS Dia,EjercicioPlanAlumno.observaciones AS Observaciones, Planes.nombre AS PlanBase, Alumno.idAlumno AS idAlumno, PlanxAlumno.idPlanxAlumno AS idPxA, PlanxAlumno.fechaDesde AS fechaDesde ,CONCAT(Alumno.nombre,' ',Alumno.apellido) AS Alumno,Alumno.dni AS DNI,Alumno.direccion AS Direccion,Alumno.email AS Email, Alumno.telefono AS Telefono FROM EjercicioPlanAlumno 
LEFT JOIN Ejercicio ON Ejercicio.idEjercicio = EjercicioPlanAlumno.idEjercicio
LEFT JOIN Maquina ON Maquina.idMaquina = Ejercicio.idMaquina
LEFT JOIN PlanxAlumno ON PlanxAlumno.idPlanxAlumno = EjercicioPlanAlumno.idPlanxAlumno
LEFT JOIN Alumno ON Alumno.idAlumno = PlanxAlumno.idAlumno
LEFT JOIN Planes ON Planes.idPlan = PlanxAlumno.idPlan


GO
SET IDENTITY_INSERT [dbo].[Alumno] ON 

INSERT [dbo].[Alumno] ([idAlumno], [nombre], [apellido], [dni], [direccion], [telefono], [email], [fechaNac], [idCiudad], [observaciones], [estado]) VALUES (1, N'Diego', N'Albarracin', N'40572722', N'Jujuy 1531', N'3533406942', N'diegoalbarracin0@gmail.com', CAST(N'1997-09-11' AS Date), 2, N'', N'0')
INSERT [dbo].[Alumno] ([idAlumno], [nombre], [apellido], [dni], [direccion], [telefono], [email], [fechaNac], [idCiudad], [observaciones], [estado]) VALUES (2, N'Juan', N'Lopez', N'1234567891', N'Lopez y Planes 124', N'3533406942', N'juanLo@gmail.com', CAST(N'1984-12-10' AS Date), 17, N'', N'0')
INSERT [dbo].[Alumno] ([idAlumno], [nombre], [apellido], [dni], [direccion], [telefono], [email], [fechaNac], [idCiudad], [observaciones], [estado]) VALUES (4, N'Ricardo', N'Alca', N'23569845', N'Mendoza 101', N'34111548', N'nalka@gmail.com', CAST(N'1995-07-14' AS Date), 5, N'', N'0')
INSERT [dbo].[Alumno] ([idAlumno], [nombre], [apellido], [dni], [direccion], [telefono], [email], [fechaNac], [idCiudad], [observaciones], [estado]) VALUES (5, N'Lisandro', N'Martinez', N'34585691', N'Lopez y Planes 124', N'3533123456', N'juanLo@gmail.com', CAST(N'1984-12-10' AS Date), 19, N'', N'0')
INSERT [dbo].[Alumno] ([idAlumno], [nombre], [apellido], [dni], [direccion], [telefono], [email], [fechaNac], [idCiudad], [observaciones], [estado]) VALUES (6, N'Marco', N'Berratti', N'55555555', N'Bv. Italia 444', N'1111111111', N'MarcoB@gmail.com', CAST(N'2001-08-14' AS Date), 2, N'', N'0')
INSERT [dbo].[Alumno] ([idAlumno], [nombre], [apellido], [dni], [direccion], [telefono], [email], [fechaNac], [idCiudad], [observaciones], [estado]) VALUES (12, N'Pablo', N'Ballon', N'25856987', N'Lanus 1970', N'011546978', N'pballon', CAST(N'1970-08-24' AS Date), 4, N'', N'0')
INSERT [dbo].[Alumno] ([idAlumno], [nombre], [apellido], [dni], [direccion], [telefono], [email], [fechaNac], [idCiudad], [observaciones], [estado]) VALUES (13, N'Luis', N'Miguel', N'32568945', N'', N'', N'luismiguel@gmail.com', CAST(N'2021-08-24' AS Date), 5, N'', N'0')
INSERT [dbo].[Alumno] ([idAlumno], [nombre], [apellido], [dni], [direccion], [telefono], [email], [fechaNac], [idCiudad], [observaciones], [estado]) VALUES (14, N'Luis', N'Suarez', N'35456985', N'Bv.España 879', N'0351459874', N'LuisitoSuartez9@gmail.com', CAST(N'1987-01-24' AS Date), 5, N'Jugador de futbol profesional.', N'0')
INSERT [dbo].[Alumno] ([idAlumno], [nombre], [apellido], [dni], [direccion], [telefono], [email], [fechaNac], [idCiudad], [observaciones], [estado]) VALUES (15, N'Joaquin', N'Lopez', N'4058888', N'', N'', N'juanjo@gmail.com', CAST(N'2021-08-24' AS Date), 11, N'', N'0')
INSERT [dbo].[Alumno] ([idAlumno], [nombre], [apellido], [dni], [direccion], [telefono], [email], [fechaNac], [idCiudad], [observaciones], [estado]) VALUES (16, N'Gabriel', N'Blasco', N'11111111', N'', N'', N'sdasdasdas', CAST(N'2021-08-24' AS Date), 3, N'', N'1')
INSERT [dbo].[Alumno] ([idAlumno], [nombre], [apellido], [dni], [direccion], [telefono], [email], [fechaNac], [idCiudad], [observaciones], [estado]) VALUES (17, N'Martina', N'Saenz', N'41569874', N'', N'', N'martuS@gmail.com', CAST(N'2001-05-15' AS Date), 20, N'', N'1')
INSERT [dbo].[Alumno] ([idAlumno], [nombre], [apellido], [dni], [direccion], [telefono], [email], [fechaNac], [idCiudad], [observaciones], [estado]) VALUES (18, N'Jordi', N'Wild', N'30695478', N'', N'', N'jwildbarca@gmail.com', CAST(N'2021-08-24' AS Date), 10, N'', N'1')
INSERT [dbo].[Alumno] ([idAlumno], [nombre], [apellido], [dni], [direccion], [telefono], [email], [fechaNac], [idCiudad], [observaciones], [estado]) VALUES (19, N'Damian', N'Beer', N'25635698', N'', N'', N'mrbear@gmail.com', CAST(N'2021-08-24' AS Date), 2, N'', N'1')
INSERT [dbo].[Alumno] ([idAlumno], [nombre], [apellido], [dni], [direccion], [telefono], [email], [fechaNac], [idCiudad], [observaciones], [estado]) VALUES (20, N'a', N'a', N'1', N'', N'', N'a', CAST(N'2021-08-24' AS Date), 3, N'', N'1')
INSERT [dbo].[Alumno] ([idAlumno], [nombre], [apellido], [dni], [direccion], [telefono], [email], [fechaNac], [idCiudad], [observaciones], [estado]) VALUES (21, N'b', N'b', N'1', N'', N'', N'b', CAST(N'2021-08-24' AS Date), 13, N'', N'0')
INSERT [dbo].[Alumno] ([idAlumno], [nombre], [apellido], [dni], [direccion], [telefono], [email], [fechaNac], [idCiudad], [observaciones], [estado]) VALUES (22, N'Gabriel', N'Diaz', N'45000000', N'La Rioja 1100', N'353254788', N'gDiaz@gmail.com', CAST(N'2021-08-24' AS Date), 4, N'', N'0')
INSERT [dbo].[Alumno] ([idAlumno], [nombre], [apellido], [dni], [direccion], [telefono], [email], [fechaNac], [idCiudad], [observaciones], [estado]) VALUES (23, N'Juan', N'Diaz', N'789', N'', N'35632', N'jdiaz@gmial.com', CAST(N'2021-08-24' AS Date), 1, N'', N'0')
INSERT [dbo].[Alumno] ([idAlumno], [nombre], [apellido], [dni], [direccion], [telefono], [email], [fechaNac], [idCiudad], [observaciones], [estado]) VALUES (24, N'Leandro', N'Martinez', N'35695485', N'', N'3533406942', N'leandroMartinezTandil@gmail.com', CAST(N'2021-08-24' AS Date), 6, N'', N'0')
INSERT [dbo].[Alumno] ([idAlumno], [nombre], [apellido], [dni], [direccion], [telefono], [email], [fechaNac], [idCiudad], [observaciones], [estado]) VALUES (25, N'Joaquin', N'Galicia', N'35696214', N'', N'3533406942', N'xoc@gmail.com', CAST(N'2021-08-24' AS Date), 15, N'', N'0')
INSERT [dbo].[Alumno] ([idAlumno], [nombre], [apellido], [dni], [direccion], [telefono], [email], [fechaNac], [idCiudad], [observaciones], [estado]) VALUES (26, N'Alejandro', N'Fabregas', N'40659235', N'', N'3533406942', N'pruebaA@gmail.com', CAST(N'2021-08-24' AS Date), 5, N'', N'1')
SET IDENTITY_INSERT [dbo].[Alumno] OFF
SET IDENTITY_INSERT [dbo].[AlumnoxClase] ON 

INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (1, 1, 1, CAST(N'2021-08-27' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (2, 2, 1, CAST(N'2021-11-04' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (3, 12, 1, CAST(N'2021-11-03' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (4, 5, 1, CAST(N'2021-11-03' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (5, 2, 1, CAST(N'2021-11-03' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (6, 4, 5, CAST(N'2021-11-03' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (7, 16, 5, CAST(N'2021-11-03' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (8, 2, 5, CAST(N'2021-11-03' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (9, 15, 7, CAST(N'2021-11-05' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (10, 4, 7, CAST(N'2021-11-05' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (11, 12, 7, CAST(N'2021-11-05' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (12, 12, 10, CAST(N'2021-11-05' AS Date), CAST(N'2021-11-22' AS Date))
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (13, 4, 12, CAST(N'2021-11-05' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (14, 6, 12, CAST(N'2021-11-05' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (15, 16, 16, CAST(N'2021-11-05' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (16, 12, 14, CAST(N'2021-11-05' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (17, 14, 14, CAST(N'2021-11-05' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (18, 4, 15, CAST(N'2021-10-16' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (19, 22, 15, CAST(N'2021-11-05' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (20, 17, 15, CAST(N'2021-11-05' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (21, 16, 4, CAST(N'2021-09-23' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (22, 6, 4, CAST(N'2021-11-14' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (23, 2, 6, CAST(N'2021-11-10' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (24, 4, 6, CAST(N'2021-11-10' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (25, 5, 6, CAST(N'2021-11-10' AS Date), CAST(N'2021-11-10' AS Date))
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (26, 6, 6, CAST(N'2021-11-10' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (27, 14, 6, CAST(N'2021-11-10' AS Date), CAST(N'2021-11-10' AS Date))
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (28, 22, 6, CAST(N'2021-11-10' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (29, 19, 6, CAST(N'2021-11-10' AS Date), CAST(N'2021-11-21' AS Date))
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (30, 12, 6, CAST(N'2021-11-10' AS Date), CAST(N'2021-11-21' AS Date))
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (31, 23, 4, CAST(N'2021-11-07' AS Date), CAST(N'2021-08-24' AS Date))
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (32, 22, 4, CAST(N'2021-11-10' AS Date), CAST(N'2021-11-10' AS Date))
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (33, 2, 4, CAST(N'2021-11-08' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (34, 17, 4, CAST(N'2021-11-10' AS Date), CAST(N'2021-11-10' AS Date))
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (35, 4, 4, CAST(N'2021-11-07' AS Date), CAST(N'2021-08-24' AS Date))
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (36, 15, 4, CAST(N'2021-09-24' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (37, 12, 4, CAST(N'2021-11-09' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (38, 14, 4, CAST(N'2021-09-25' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (39, 17, 4, CAST(N'2021-11-09' AS Date), CAST(N'2021-11-10' AS Date))
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (40, 5, 4, CAST(N'2021-09-25' AS Date), CAST(N'2021-11-10' AS Date))
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (41, 17, 4, CAST(N'2021-09-25' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (42, 2, 2, CAST(N'2021-11-10' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (43, 5, 2, CAST(N'2021-08-25' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (44, 14, 2, CAST(N'2021-11-10' AS Date), CAST(N'2021-11-10' AS Date))
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (45, 16, 2, CAST(N'2021-11-10' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (46, 17, 2, CAST(N'2021-11-10' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (47, 5, 12, CAST(N'2021-11-10' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (48, 4, 16, CAST(N'2021-11-20' AS Date), CAST(N'2021-11-20' AS Date))
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (49, 2, 12, CAST(N'2021-11-20' AS Date), CAST(N'2021-11-20' AS Date))
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (50, 12, 17, CAST(N'2021-11-21' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (51, 12, 18, CAST(N'2021-11-21' AS Date), CAST(N'2021-11-21' AS Date))
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (52, 22, 4, CAST(N'2021-11-17' AS Date), CAST(N'2021-11-21' AS Date))
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (53, 23, 4, CAST(N'2021-11-18' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (54, 22, 10, CAST(N'2021-11-18' AS Date), CAST(N'2021-11-22' AS Date))
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (55, 24, 10, CAST(N'2021-11-22' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (56, 24, 8, CAST(N'2021-11-25' AS Date), NULL)
INSERT [dbo].[AlumnoxClase] ([idAlumnoxClase], [idAlumno], [idProfesorxClase], [fechaDesde], [fechaHasta]) VALUES (57, 24, 17, CAST(N'2022-03-06' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[AlumnoxClase] OFF
SET IDENTITY_INSERT [dbo].[Asistencia] ON 

INSERT [dbo].[Asistencia] ([idAsistencia], [idAlumno], [fecha]) VALUES (2, 1, CAST(N'2021-10-03 04:10:41.943' AS DateTime))
INSERT [dbo].[Asistencia] ([idAsistencia], [idAlumno], [fecha]) VALUES (4, 15, CAST(N'2021-10-01 15:30:00.000' AS DateTime))
INSERT [dbo].[Asistencia] ([idAsistencia], [idAlumno], [fecha]) VALUES (6, 15, CAST(N'2021-10-01 18:30:00.000' AS DateTime))
INSERT [dbo].[Asistencia] ([idAsistencia], [idAlumno], [fecha]) VALUES (7, 1, CAST(N'2021-10-06 10:00:00.000' AS DateTime))
INSERT [dbo].[Asistencia] ([idAsistencia], [idAlumno], [fecha]) VALUES (9, 1, CAST(N'2021-10-08 21:03:48.000' AS DateTime))
INSERT [dbo].[Asistencia] ([idAsistencia], [idAlumno], [fecha]) VALUES (10, 15, CAST(N'2021-10-06 21:10:36.580' AS DateTime))
INSERT [dbo].[Asistencia] ([idAsistencia], [idAlumno], [fecha]) VALUES (12, 1, CAST(N'2021-10-15 01:29:58.790' AS DateTime))
INSERT [dbo].[Asistencia] ([idAsistencia], [idAlumno], [fecha]) VALUES (13, 1, CAST(N'2020-09-15 00:00:00.000' AS DateTime))
INSERT [dbo].[Asistencia] ([idAsistencia], [idAlumno], [fecha]) VALUES (14, 15, CAST(N'2020-06-07 00:00:00.000' AS DateTime))
INSERT [dbo].[Asistencia] ([idAsistencia], [idAlumno], [fecha]) VALUES (15, 1, CAST(N'2019-01-07 00:00:00.000' AS DateTime))
INSERT [dbo].[Asistencia] ([idAsistencia], [idAlumno], [fecha]) VALUES (16, 15, CAST(N'2019-09-18 00:00:00.000' AS DateTime))
INSERT [dbo].[Asistencia] ([idAsistencia], [idAlumno], [fecha]) VALUES (17, 1, CAST(N'2020-09-09 00:00:00.000' AS DateTime))
INSERT [dbo].[Asistencia] ([idAsistencia], [idAlumno], [fecha]) VALUES (18, 1, CAST(N'2022-03-10 08:42:28.847' AS DateTime))
SET IDENTITY_INSERT [dbo].[Asistencia] OFF
SET IDENTITY_INSERT [dbo].[Ciudad] ON 

INSERT [dbo].[Ciudad] ([idCiudad], [nombre], [idProvincia]) VALUES (1, N'Villa Maria', 5)
INSERT [dbo].[Ciudad] ([idCiudad], [nombre], [idProvincia]) VALUES (2, N'Las Varillas', 5)
INSERT [dbo].[Ciudad] ([idCiudad], [nombre], [idProvincia]) VALUES (3, N'Villa Nueva', 5)
INSERT [dbo].[Ciudad] ([idCiudad], [nombre], [idProvincia]) VALUES (4, N'San Francisco', 5)
INSERT [dbo].[Ciudad] ([idCiudad], [nombre], [idProvincia]) VALUES (5, N'Bahia Blanca', 1)
INSERT [dbo].[Ciudad] ([idCiudad], [nombre], [idProvincia]) VALUES (6, N'Tandil', 1)
INSERT [dbo].[Ciudad] ([idCiudad], [nombre], [idProvincia]) VALUES (7, N'Resistencia', 3)
INSERT [dbo].[Ciudad] ([idCiudad], [nombre], [idProvincia]) VALUES (8, N'Posadas', 13)
INSERT [dbo].[Ciudad] ([idCiudad], [nombre], [idProvincia]) VALUES (9, N'Rawson', 4)
INSERT [dbo].[Ciudad] ([idCiudad], [nombre], [idProvincia]) VALUES (10, N'Lanus', 1)
INSERT [dbo].[Ciudad] ([idCiudad], [nombre], [idProvincia]) VALUES (11, N'Rosario', 20)
INSERT [dbo].[Ciudad] ([idCiudad], [nombre], [idProvincia]) VALUES (12, N'Santa Fe', 20)
INSERT [dbo].[Ciudad] ([idCiudad], [nombre], [idProvincia]) VALUES (13, N'Parana', 7)
INSERT [dbo].[Ciudad] ([idCiudad], [nombre], [idProvincia]) VALUES (14, N'Avellaneda', 1)
INSERT [dbo].[Ciudad] ([idCiudad], [nombre], [idProvincia]) VALUES (15, N'Bariloche', 15)
INSERT [dbo].[Ciudad] ([idCiudad], [nombre], [idProvincia]) VALUES (16, N'Bell Ville', 5)
INSERT [dbo].[Ciudad] ([idCiudad], [nombre], [idProvincia]) VALUES (17, N'Carlos Paz', 5)
INSERT [dbo].[Ciudad] ([idCiudad], [nombre], [idProvincia]) VALUES (18, N'Capilla del Monte', 5)
INSERT [dbo].[Ciudad] ([idCiudad], [nombre], [idProvincia]) VALUES (19, N'Alta Gracia', 5)
INSERT [dbo].[Ciudad] ([idCiudad], [nombre], [idProvincia]) VALUES (20, N'Cosquin', 5)
INSERT [dbo].[Ciudad] ([idCiudad], [nombre], [idProvincia]) VALUES (21, N'Capital Federal', 1)
INSERT [dbo].[Ciudad] ([idCiudad], [nombre], [idProvincia]) VALUES (22, N'a', 16)
SET IDENTITY_INSERT [dbo].[Ciudad] OFF
SET IDENTITY_INSERT [dbo].[Clase] ON 

INSERT [dbo].[Clase] ([idClase], [nombre], [fechaDesde], [fechaHasta], [cupoMaximo], [descripcion], [estado]) VALUES (1, N'Zumba', CAST(N'2021-08-19' AS Date), NULL, 10, N'', N'0')
INSERT [dbo].[Clase] ([idClase], [nombre], [fechaDesde], [fechaHasta], [cupoMaximo], [descripcion], [estado]) VALUES (2, N'Spinning', CAST(N'2021-08-24' AS Date), NULL, 4, N'', N'0')
INSERT [dbo].[Clase] ([idClase], [nombre], [fechaDesde], [fechaHasta], [cupoMaximo], [descripcion], [estado]) VALUES (3, N'Yoga', CAST(N'2021-09-28' AS Date), NULL, 8, N'', N'0')
INSERT [dbo].[Clase] ([idClase], [nombre], [fechaDesde], [fechaHasta], [cupoMaximo], [descripcion], [estado]) VALUES (4, N'Xcore', CAST(N'2021-09-23' AS Date), NULL, 6, N'', N'0')
INSERT [dbo].[Clase] ([idClase], [nombre], [fechaDesde], [fechaHasta], [cupoMaximo], [descripcion], [estado]) VALUES (5, N'Body Combat', CAST(N'2021-09-23' AS Date), NULL, 16, N'', N'0')
INSERT [dbo].[Clase] ([idClase], [nombre], [fechaDesde], [fechaHasta], [cupoMaximo], [descripcion], [estado]) VALUES (6, N'BodyJam', CAST(N'2021-09-28' AS Date), NULL, 10, N'', N'0')
INSERT [dbo].[Clase] ([idClase], [nombre], [fechaDesde], [fechaHasta], [cupoMaximo], [descripcion], [estado]) VALUES (7, N'BodyPump', CAST(N'2021-10-15' AS Date), NULL, 1, N'', N'0')
SET IDENTITY_INSERT [dbo].[Clase] OFF
SET IDENTITY_INSERT [dbo].[Ejercicio] ON 

INSERT [dbo].[Ejercicio] ([idEjercicio], [idMaquina], [nombre], [descripcion], [idTipoEjercicio], [estado]) VALUES (1, NULL, N'Sentadilla', N'', 2, N'0')
INSERT [dbo].[Ejercicio] ([idEjercicio], [idMaquina], [nombre], [descripcion], [idTipoEjercicio], [estado]) VALUES (2, NULL, N'Flexion', N'', 2, N'0')
INSERT [dbo].[Ejercicio] ([idEjercicio], [idMaquina], [nombre], [descripcion], [idTipoEjercicio], [estado]) VALUES (3, 7, N'Dominada en barra', N'', 2, N'0')
INSERT [dbo].[Ejercicio] ([idEjercicio], [idMaquina], [nombre], [descripcion], [idTipoEjercicio], [estado]) VALUES (4, 6, N'Remo', N'', 2, N'0')
INSERT [dbo].[Ejercicio] ([idEjercicio], [idMaquina], [nombre], [descripcion], [idTipoEjercicio], [estado]) VALUES (5, NULL, N'Plancha frontal', N'', 2, N'0')
INSERT [dbo].[Ejercicio] ([idEjercicio], [idMaquina], [nombre], [descripcion], [idTipoEjercicio], [estado]) VALUES (6, NULL, N'Salto de tijeras', N'', 1, N'0')
INSERT [dbo].[Ejercicio] ([idEjercicio], [idMaquina], [nombre], [descripcion], [idTipoEjercicio], [estado]) VALUES (7, NULL, N'Elevacion de Rodilla', N'', 1, N'1')
INSERT [dbo].[Ejercicio] ([idEjercicio], [idMaquina], [nombre], [descripcion], [idTipoEjercicio], [estado]) VALUES (8, 5, N'Trote', N'', 1, N'0')
SET IDENTITY_INSERT [dbo].[Ejercicio] OFF
SET IDENTITY_INSERT [dbo].[EjercicioPlanAlumno] ON 

INSERT [dbo].[EjercicioPlanAlumno] ([idEjercicioPlanAlumno], [idEjercicio], [idPlanxAlumno], [repeticiones], [series], [intensidadCarga], [observaciones], [dia]) VALUES (7, 2, 9, 8, 7, NULL, N'', N'1')
INSERT [dbo].[EjercicioPlanAlumno] ([idEjercicioPlanAlumno], [idEjercicio], [idPlanxAlumno], [repeticiones], [series], [intensidadCarga], [observaciones], [dia]) VALUES (8, 4, 9, 9, 8, NULL, N'', N'2')
INSERT [dbo].[EjercicioPlanAlumno] ([idEjercicioPlanAlumno], [idEjercicio], [idPlanxAlumno], [repeticiones], [series], [intensidadCarga], [observaciones], [dia]) VALUES (10, 1, 11, 7, 7, NULL, N'a', N'3')
INSERT [dbo].[EjercicioPlanAlumno] ([idEjercicioPlanAlumno], [idEjercicio], [idPlanxAlumno], [repeticiones], [series], [intensidadCarga], [observaciones], [dia]) VALUES (11, 2, 11, 8, 8, NULL, N'a', N'1')
INSERT [dbo].[EjercicioPlanAlumno] ([idEjercicioPlanAlumno], [idEjercicio], [idPlanxAlumno], [repeticiones], [series], [intensidadCarga], [observaciones], [dia]) VALUES (12, 5, 11, 9, 9, NULL, N'a', N'2')
INSERT [dbo].[EjercicioPlanAlumno] ([idEjercicioPlanAlumno], [idEjercicio], [idPlanxAlumno], [repeticiones], [series], [intensidadCarga], [observaciones], [dia]) VALUES (14, 2, 12, 18, 9, NULL, N'', N'1')
INSERT [dbo].[EjercicioPlanAlumno] ([idEjercicioPlanAlumno], [idEjercicio], [idPlanxAlumno], [repeticiones], [series], [intensidadCarga], [observaciones], [dia]) VALUES (15, 5, 12, 8, 7, NULL, N'', N'1')
INSERT [dbo].[EjercicioPlanAlumno] ([idEjercicioPlanAlumno], [idEjercicio], [idPlanxAlumno], [repeticiones], [series], [intensidadCarga], [observaciones], [dia]) VALUES (16, 4, 12, 1, 1, NULL, N'', N'1')
INSERT [dbo].[EjercicioPlanAlumno] ([idEjercicioPlanAlumno], [idEjercicio], [idPlanxAlumno], [repeticiones], [series], [intensidadCarga], [observaciones], [dia]) VALUES (17, 1, 12, 1, 1, NULL, N'', N'2')
INSERT [dbo].[EjercicioPlanAlumno] ([idEjercicioPlanAlumno], [idEjercicio], [idPlanxAlumno], [repeticiones], [series], [intensidadCarga], [observaciones], [dia]) VALUES (18, 3, 12, 1, 1, NULL, N'', N'2')
INSERT [dbo].[EjercicioPlanAlumno] ([idEjercicioPlanAlumno], [idEjercicio], [idPlanxAlumno], [repeticiones], [series], [intensidadCarga], [observaciones], [dia]) VALUES (19, 6, 13, 26, 11, NULL, N'', N'2')
INSERT [dbo].[EjercicioPlanAlumno] ([idEjercicioPlanAlumno], [idEjercicio], [idPlanxAlumno], [repeticiones], [series], [intensidadCarga], [observaciones], [dia]) VALUES (21, 4, 13, 26, 11, NULL, N'', N'1')
INSERT [dbo].[EjercicioPlanAlumno] ([idEjercicioPlanAlumno], [idEjercicio], [idPlanxAlumno], [repeticiones], [series], [intensidadCarga], [observaciones], [dia]) VALUES (22, 5, 9, 16, 16, NULL, N'a', N'1')
INSERT [dbo].[EjercicioPlanAlumno] ([idEjercicioPlanAlumno], [idEjercicio], [idPlanxAlumno], [repeticiones], [series], [intensidadCarga], [observaciones], [dia]) VALUES (23, 1, 14, 51, 16, NULL, N'', N'1')
INSERT [dbo].[EjercicioPlanAlumno] ([idEjercicioPlanAlumno], [idEjercicio], [idPlanxAlumno], [repeticiones], [series], [intensidadCarga], [observaciones], [dia]) VALUES (24, 5, 15, 26, 11, NULL, N'', N'1')
INSERT [dbo].[EjercicioPlanAlumno] ([idEjercicioPlanAlumno], [idEjercicio], [idPlanxAlumno], [repeticiones], [series], [intensidadCarga], [observaciones], [dia]) VALUES (25, 3, 15, 26, 11, NULL, N'', N'1')
INSERT [dbo].[EjercicioPlanAlumno] ([idEjercicioPlanAlumno], [idEjercicio], [idPlanxAlumno], [repeticiones], [series], [intensidadCarga], [observaciones], [dia]) VALUES (26, 5, 16, 26, 11, NULL, N'', N'1')
INSERT [dbo].[EjercicioPlanAlumno] ([idEjercicioPlanAlumno], [idEjercicio], [idPlanxAlumno], [repeticiones], [series], [intensidadCarga], [observaciones], [dia]) VALUES (27, 1, 9, 16, 16, NULL, N'a', N'1')
INSERT [dbo].[EjercicioPlanAlumno] ([idEjercicioPlanAlumno], [idEjercicio], [idPlanxAlumno], [repeticiones], [series], [intensidadCarga], [observaciones], [dia]) VALUES (29, 5, 17, 26, 11, NULL, N'', N'1')
INSERT [dbo].[EjercicioPlanAlumno] ([idEjercicioPlanAlumno], [idEjercicio], [idPlanxAlumno], [repeticiones], [series], [intensidadCarga], [observaciones], [dia]) VALUES (30, 3, 17, 15, 4, NULL, N'', N'2')
INSERT [dbo].[EjercicioPlanAlumno] ([idEjercicioPlanAlumno], [idEjercicio], [idPlanxAlumno], [repeticiones], [series], [intensidadCarga], [observaciones], [dia]) VALUES (31, 2, 18, 7, 5, NULL, N'', N'1')
INSERT [dbo].[EjercicioPlanAlumno] ([idEjercicioPlanAlumno], [idEjercicio], [idPlanxAlumno], [repeticiones], [series], [intensidadCarga], [observaciones], [dia]) VALUES (32, 1, 18, 10, 4, NULL, N'', N'2')
INSERT [dbo].[EjercicioPlanAlumno] ([idEjercicioPlanAlumno], [idEjercicio], [idPlanxAlumno], [repeticiones], [series], [intensidadCarga], [observaciones], [dia]) VALUES (33, 3, 18, 5, 4, NULL, N'', N'3')
INSERT [dbo].[EjercicioPlanAlumno] ([idEjercicioPlanAlumno], [idEjercicio], [idPlanxAlumno], [repeticiones], [series], [intensidadCarga], [observaciones], [dia]) VALUES (34, 2, 19, 7, 2, NULL, N'', N'1')
INSERT [dbo].[EjercicioPlanAlumno] ([idEjercicioPlanAlumno], [idEjercicio], [idPlanxAlumno], [repeticiones], [series], [intensidadCarga], [observaciones], [dia]) VALUES (35, 1, 19, 10, 4, NULL, N'', N'2')
INSERT [dbo].[EjercicioPlanAlumno] ([idEjercicioPlanAlumno], [idEjercicio], [idPlanxAlumno], [repeticiones], [series], [intensidadCarga], [observaciones], [dia]) VALUES (36, 3, 19, 5, 4, NULL, N'', N'3')
INSERT [dbo].[EjercicioPlanAlumno] ([idEjercicioPlanAlumno], [idEjercicio], [idPlanxAlumno], [repeticiones], [series], [intensidadCarga], [observaciones], [dia]) VALUES (37, 4, 19, 7, 2, NULL, N'', N'1')
INSERT [dbo].[EjercicioPlanAlumno] ([idEjercicioPlanAlumno], [idEjercicio], [idPlanxAlumno], [repeticiones], [series], [intensidadCarga], [observaciones], [dia]) VALUES (39, 5, 20, 26, 11, NULL, N'', N'1')
INSERT [dbo].[EjercicioPlanAlumno] ([idEjercicioPlanAlumno], [idEjercicio], [idPlanxAlumno], [repeticiones], [series], [intensidadCarga], [observaciones], [dia]) VALUES (40, 2, 20, 15, 10, NULL, N'', N'2')
INSERT [dbo].[EjercicioPlanAlumno] ([idEjercicioPlanAlumno], [idEjercicio], [idPlanxAlumno], [repeticiones], [series], [intensidadCarga], [observaciones], [dia]) VALUES (41, 3, 17, 16, 5, NULL, N'', N'3')
SET IDENTITY_INSERT [dbo].[EjercicioPlanAlumno] OFF
SET IDENTITY_INSERT [dbo].[EjercicioxPlan] ON 

INSERT [dbo].[EjercicioxPlan] ([idEjercicioxPlan], [idEjercicio], [idPlan], [repeticiones], [series], [observaciones], [dia]) VALUES (3, 3, 1, 5, 4, N'', N'3')
INSERT [dbo].[EjercicioxPlan] ([idEjercicioxPlan], [idEjercicio], [idPlan], [repeticiones], [series], [observaciones], [dia]) VALUES (4, 2, 1, 7, 3, N'', N'1')
INSERT [dbo].[EjercicioxPlan] ([idEjercicioxPlan], [idEjercicio], [idPlan], [repeticiones], [series], [observaciones], [dia]) VALUES (8, 5, 2, 26, 11, N'', N'1')
INSERT [dbo].[EjercicioxPlan] ([idEjercicioxPlan], [idEjercicio], [idPlan], [repeticiones], [series], [observaciones], [dia]) VALUES (13, 1, 3, 51, 16, N'', N'1')
INSERT [dbo].[EjercicioxPlan] ([idEjercicioxPlan], [idEjercicio], [idPlan], [repeticiones], [series], [observaciones], [dia]) VALUES (17, 1, 1, 10, 4, N'a', N'2')
INSERT [dbo].[EjercicioxPlan] ([idEjercicioxPlan], [idEjercicio], [idPlan], [repeticiones], [series], [observaciones], [dia]) VALUES (19, 2, 2, 15, 10, N'', N'2')
INSERT [dbo].[EjercicioxPlan] ([idEjercicioxPlan], [idEjercicio], [idPlan], [repeticiones], [series], [observaciones], [dia]) VALUES (20, 6, 2, 24, 11, N'', N'3')
SET IDENTITY_INSERT [dbo].[EjercicioxPlan] OFF
SET IDENTITY_INSERT [dbo].[Maquina] ON 

INSERT [dbo].[Maquina] ([idMaquina], [nombre], [descripcion], [fechaAlta], [fechaBaja], [estado]) VALUES (1, N'Bicicleta', N'', CAST(N'2021-09-07' AS Date), CAST(N'2021-10-02' AS Date), N'1')
INSERT [dbo].[Maquina] ([idMaquina], [nombre], [descripcion], [fechaAlta], [fechaBaja], [estado]) VALUES (2, N'Banco press', N'', CAST(N'2014-05-14' AS Date), CAST(N'2021-08-24' AS Date), N'1')
INSERT [dbo].[Maquina] ([idMaquina], [nombre], [descripcion], [fechaAlta], [fechaBaja], [estado]) VALUES (3, N'Prensa de piernas', N'', CAST(N'2015-08-14' AS Date), NULL, N'0')
INSERT [dbo].[Maquina] ([idMaquina], [nombre], [descripcion], [fechaAlta], [fechaBaja], [estado]) VALUES (4, N'Eliptica', N'', CAST(N'2021-01-11' AS Date), NULL, N'2')
INSERT [dbo].[Maquina] ([idMaquina], [nombre], [descripcion], [fechaAlta], [fechaBaja], [estado]) VALUES (5, N'Cinta de correr', N'', CAST(N'2021-03-05' AS Date), NULL, N'0')
INSERT [dbo].[Maquina] ([idMaquina], [nombre], [descripcion], [fechaAlta], [fechaBaja], [estado]) VALUES (6, N'Maquina de remo', N'', CAST(N'2016-11-24' AS Date), CAST(N'2021-08-24' AS Date), N'1')
INSERT [dbo].[Maquina] ([idMaquina], [nombre], [descripcion], [fechaAlta], [fechaBaja], [estado]) VALUES (7, N'Barra de Dominadas', N'', CAST(N'2021-08-24' AS Date), NULL, N'0')
INSERT [dbo].[Maquina] ([idMaquina], [nombre], [descripcion], [fechaAlta], [fechaBaja], [estado]) VALUES (8, N'Dorsalera', N'', CAST(N'2021-05-09' AS Date), CAST(N'2021-08-24' AS Date), N'1')
INSERT [dbo].[Maquina] ([idMaquina], [nombre], [descripcion], [fechaAlta], [fechaBaja], [estado]) VALUES (9, N'Mancuernas', N'', CAST(N'2021-09-14' AS Date), NULL, N'0')
INSERT [dbo].[Maquina] ([idMaquina], [nombre], [descripcion], [fechaAlta], [fechaBaja], [estado]) VALUES (10, N'Polea', N'', CAST(N'2021-09-15' AS Date), CAST(N'2021-08-24' AS Date), N'1')
SET IDENTITY_INSERT [dbo].[Maquina] OFF
SET IDENTITY_INSERT [dbo].[Planes] ON 

INSERT [dbo].[Planes] ([idPlan], [idTipoPlan], [nombre], [descripcion], [estado]) VALUES (1, 1, N'Principiantes sin antecedentes deportivos', N'', N'0')
INSERT [dbo].[Planes] ([idPlan], [idTipoPlan], [nombre], [descripcion], [estado]) VALUES (2, 2, N'Experimentados', N'', N'0')
INSERT [dbo].[Planes] ([idPlan], [idTipoPlan], [nombre], [descripcion], [estado]) VALUES (3, 3, N'Fortalecimiento de piernas', N'', N'0')
SET IDENTITY_INSERT [dbo].[Planes] OFF
SET IDENTITY_INSERT [dbo].[PlanxAlumno] ON 

INSERT [dbo].[PlanxAlumno] ([idPlanxAlumno], [idPlan], [idAlumno], [nro], [fechaDesde], [fechaHasta], [idProfesor]) VALUES (9, 1, 1, NULL, CAST(N'2021-09-28' AS Date), NULL, 6)
INSERT [dbo].[PlanxAlumno] ([idPlanxAlumno], [idPlan], [idAlumno], [nro], [fechaDesde], [fechaHasta], [idProfesor]) VALUES (11, 1, 12, NULL, CAST(N'2021-09-29' AS Date), NULL, 6)
INSERT [dbo].[PlanxAlumno] ([idPlanxAlumno], [idPlan], [idAlumno], [nro], [fechaDesde], [fechaHasta], [idProfesor]) VALUES (12, 1, 5, NULL, CAST(N'2021-10-06' AS Date), NULL, 3)
INSERT [dbo].[PlanxAlumno] ([idPlanxAlumno], [idPlan], [idAlumno], [nro], [fechaDesde], [fechaHasta], [idProfesor]) VALUES (13, 2, 17, NULL, CAST(N'2021-10-15' AS Date), NULL, 4)
INSERT [dbo].[PlanxAlumno] ([idPlanxAlumno], [idPlan], [idAlumno], [nro], [fechaDesde], [fechaHasta], [idProfesor]) VALUES (14, 3, 16, NULL, CAST(N'2021-10-15' AS Date), NULL, 6)
INSERT [dbo].[PlanxAlumno] ([idPlanxAlumno], [idPlan], [idAlumno], [nro], [fechaDesde], [fechaHasta], [idProfesor]) VALUES (15, 2, 6, NULL, CAST(N'2021-10-15' AS Date), NULL, 1)
INSERT [dbo].[PlanxAlumno] ([idPlanxAlumno], [idPlan], [idAlumno], [nro], [fechaDesde], [fechaHasta], [idProfesor]) VALUES (16, 2, 4, NULL, CAST(N'2021-10-15' AS Date), CAST(N'2021-10-15' AS Date), 5)
INSERT [dbo].[PlanxAlumno] ([idPlanxAlumno], [idPlan], [idAlumno], [nro], [fechaDesde], [fechaHasta], [idProfesor]) VALUES (17, 2, 5, NULL, CAST(N'2021-10-28' AS Date), NULL, 6)
INSERT [dbo].[PlanxAlumno] ([idPlanxAlumno], [idPlan], [idAlumno], [nro], [fechaDesde], [fechaHasta], [idProfesor]) VALUES (18, 1, 24, NULL, CAST(N'2021-11-05' AS Date), NULL, 5)
INSERT [dbo].[PlanxAlumno] ([idPlanxAlumno], [idPlan], [idAlumno], [nro], [fechaDesde], [fechaHasta], [idProfesor]) VALUES (19, 1, 23, NULL, CAST(N'2021-11-05' AS Date), NULL, 5)
INSERT [dbo].[PlanxAlumno] ([idPlanxAlumno], [idPlan], [idAlumno], [nro], [fechaDesde], [fechaHasta], [idProfesor]) VALUES (20, 2, 15, NULL, CAST(N'2021-11-22' AS Date), NULL, 4)
SET IDENTITY_INSERT [dbo].[PlanxAlumno] OFF
SET IDENTITY_INSERT [dbo].[Profesor] ON 

INSERT [dbo].[Profesor] ([idProfesor], [nombre], [apellido], [dni], [direccion], [telefono], [email], [fechaNac], [idCiudad], [observaciones], [estado]) VALUES (1, N'Fernando', N'Buendia', N'25635489', N'', N'3533406942', N'profesorFernando@gmail.com', CAST(N'1975-05-06' AS Date), 19, N'a', N'0')
INSERT [dbo].[Profesor] ([idProfesor], [nombre], [apellido], [dni], [direccion], [telefono], [email], [fechaNac], [idCiudad], [observaciones], [estado]) VALUES (2, N'Vilma', N'Palma', N'35489658', N'', N'', N'IgJuan@gmail.com', CAST(N'1985-03-07' AS Date), 8, N'', N'1')
INSERT [dbo].[Profesor] ([idProfesor], [nombre], [apellido], [dni], [direccion], [telefono], [email], [fechaNac], [idCiudad], [observaciones], [estado]) VALUES (3, N'Jordi', N'Lopez', N'14569568', N'SuCasa 123', N'3533695847', N'elProfeJordi@gmail.com', CAST(N'1966-08-25' AS Date), 8, N'', N'1')
INSERT [dbo].[Profesor] ([idProfesor], [nombre], [apellido], [dni], [direccion], [telefono], [email], [fechaNac], [idCiudad], [observaciones], [estado]) VALUES (4, N'Damian', N'Perez', N'1456985', N'', N'', N'deimenTeacheraaaa@gmail.com', CAST(N'1988-12-25' AS Date), 2, N'', N'1')
INSERT [dbo].[Profesor] ([idProfesor], [nombre], [apellido], [dni], [direccion], [telefono], [email], [fechaNac], [idCiudad], [observaciones], [estado]) VALUES (5, N'Lio', N'Messi', N'10100100', N'', N'3534756958', N'messi10@gmail.com', CAST(N'2021-08-24' AS Date), 14, N'', N'0')
INSERT [dbo].[Profesor] ([idProfesor], [nombre], [apellido], [dni], [direccion], [telefono], [email], [fechaNac], [idCiudad], [observaciones], [estado]) VALUES (6, N'Kun', N'Aguero', N'9999999', N'', N'', N'kuni@gmail.com', CAST(N'2021-08-24' AS Date), 12, N'', N'0')
INSERT [dbo].[Profesor] ([idProfesor], [nombre], [apellido], [dni], [direccion], [telefono], [email], [fechaNac], [idCiudad], [observaciones], [estado]) VALUES (7, N'A', N'a', N'1', N'', N'3533154795', N'a', CAST(N'2021-08-24' AS Date), 11, N'', N'0')
INSERT [dbo].[Profesor] ([idProfesor], [nombre], [apellido], [dni], [direccion], [telefono], [email], [fechaNac], [idCiudad], [observaciones], [estado]) VALUES (8, N'b', N'b', N'1', N'', N'', N'b', CAST(N'2021-08-24' AS Date), 2, N'', N'0')
INSERT [dbo].[Profesor] ([idProfesor], [nombre], [apellido], [dni], [direccion], [telefono], [email], [fechaNac], [idCiudad], [observaciones], [estado]) VALUES (9, N'c', N'c', N'1', N'', N'', N'c', CAST(N'2021-08-24' AS Date), 15, N'', N'0')
INSERT [dbo].[Profesor] ([idProfesor], [nombre], [apellido], [dni], [direccion], [telefono], [email], [fechaNac], [idCiudad], [observaciones], [estado]) VALUES (10, N'd', N'd', N'1', N'', N'', N'd', CAST(N'2021-08-24' AS Date), 7, N'', N'0')
SET IDENTITY_INSERT [dbo].[Profesor] OFF
SET IDENTITY_INSERT [dbo].[ProfesorxClase] ON 

INSERT [dbo].[ProfesorxClase] ([idProfesorxClase], [idProfesor], [idClase], [fechaDesde], [fechaHasta], [dia], [horaInicio]) VALUES (1, 5, 1, CAST(N'2021-08-25' AS Date), NULL, N'4', N'09:00:00')
INSERT [dbo].[ProfesorxClase] ([idProfesorxClase], [idProfesor], [idClase], [fechaDesde], [fechaHasta], [dia], [horaInicio]) VALUES (2, 2, 2, CAST(N'2021-08-24' AS Date), NULL, N'4', N'18:00:00')
INSERT [dbo].[ProfesorxClase] ([idProfesorxClase], [idProfesor], [idClase], [fechaDesde], [fechaHasta], [dia], [horaInicio]) VALUES (3, 4, 1, CAST(N'2021-09-19' AS Date), NULL, N'5', N'18:00:00')
INSERT [dbo].[ProfesorxClase] ([idProfesorxClase], [idProfesor], [idClase], [fechaDesde], [fechaHasta], [dia], [horaInicio]) VALUES (4, 6, 3, CAST(N'2021-09-23' AS Date), NULL, N'0', N'08:00:00')
INSERT [dbo].[ProfesorxClase] ([idProfesorxClase], [idProfesor], [idClase], [fechaDesde], [fechaHasta], [dia], [horaInicio]) VALUES (5, 3, 1, CAST(N'2021-05-11' AS Date), CAST(N'2021-11-03' AS Date), N'0', N'09:00:00')
INSERT [dbo].[ProfesorxClase] ([idProfesorxClase], [idProfesor], [idClase], [fechaDesde], [fechaHasta], [dia], [horaInicio]) VALUES (6, 1, 4, CAST(N'2021-09-23' AS Date), NULL, N'1', N'18:00:00')
INSERT [dbo].[ProfesorxClase] ([idProfesorxClase], [idProfesor], [idClase], [fechaDesde], [fechaHasta], [dia], [horaInicio]) VALUES (7, 3, 5, CAST(N'2021-09-21' AS Date), NULL, N'5', N'20:30:00')
INSERT [dbo].[ProfesorxClase] ([idProfesorxClase], [idProfesor], [idClase], [fechaDesde], [fechaHasta], [dia], [horaInicio]) VALUES (8, 6, 1, CAST(N'2021-05-14' AS Date), NULL, N'1', N'10:00:00')
INSERT [dbo].[ProfesorxClase] ([idProfesorxClase], [idProfesor], [idClase], [fechaDesde], [fechaHasta], [dia], [horaInicio]) VALUES (9, 4, 5, CAST(N'2021-09-28' AS Date), NULL, N'4', N'18:30:00')
INSERT [dbo].[ProfesorxClase] ([idProfesorxClase], [idProfesor], [idClase], [fechaDesde], [fechaHasta], [dia], [horaInicio]) VALUES (10, 2, 5, CAST(N'2021-09-28' AS Date), NULL, N'0', N'16:00:00')
INSERT [dbo].[ProfesorxClase] ([idProfesorxClase], [idProfesor], [idClase], [fechaDesde], [fechaHasta], [dia], [horaInicio]) VALUES (11, 3, 6, CAST(N'2021-09-29' AS Date), NULL, N'5', N'21:00:00')
INSERT [dbo].[ProfesorxClase] ([idProfesorxClase], [idProfesor], [idClase], [fechaDesde], [fechaHasta], [dia], [horaInicio]) VALUES (12, 1, 6, CAST(N'2021-09-29' AS Date), NULL, N'3', N'18:00:00')
INSERT [dbo].[ProfesorxClase] ([idProfesorxClase], [idProfesor], [idClase], [fechaDesde], [fechaHasta], [dia], [horaInicio]) VALUES (13, 1, 7, CAST(N'2021-10-15' AS Date), NULL, N'0', N'16:00:00')
INSERT [dbo].[ProfesorxClase] ([idProfesorxClase], [idProfesor], [idClase], [fechaDesde], [fechaHasta], [dia], [horaInicio]) VALUES (14, 2, 7, CAST(N'2021-10-15' AS Date), NULL, N'1', N'10:00:00')
INSERT [dbo].[ProfesorxClase] ([idProfesorxClase], [idProfesor], [idClase], [fechaDesde], [fechaHasta], [dia], [horaInicio]) VALUES (15, 2, 7, CAST(N'2021-10-16' AS Date), NULL, N'2', N'18:00:00')
INSERT [dbo].[ProfesorxClase] ([idProfesorxClase], [idProfesor], [idClase], [fechaDesde], [fechaHasta], [dia], [horaInicio]) VALUES (16, 1, 6, CAST(N'2021-11-05' AS Date), CAST(N'2021-11-20' AS Date), N'5', N'16:30:00')
INSERT [dbo].[ProfesorxClase] ([idProfesorxClase], [idProfesor], [idClase], [fechaDesde], [fechaHasta], [dia], [horaInicio]) VALUES (17, 1, 2, CAST(N'2021-11-21' AS Date), NULL, N'3', N'15:30:00')
INSERT [dbo].[ProfesorxClase] ([idProfesorxClase], [idProfesor], [idClase], [fechaDesde], [fechaHasta], [dia], [horaInicio]) VALUES (18, 1, 2, CAST(N'2021-11-21' AS Date), NULL, N'5', N'15:30:00')
SET IDENTITY_INSERT [dbo].[ProfesorxClase] OFF
SET IDENTITY_INSERT [dbo].[Provincia] ON 

INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (1, N'Buenos Aires')
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (2, N'Catamarca')
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (3, N'Chaco')
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (4, N'Chubut')
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (5, N'Cordoba')
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (6, N'Corrientes')
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (7, N'Entre Rios')
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (8, N'Formosa')
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (9, N'Jujuy')
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (10, N'La Pampa')
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (11, N'La Rioja')
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (12, N'Mendoza')
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (13, N'Misiones')
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (14, N'Neuquen')
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (15, N'Rio Negro')
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (16, N'Salta')
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (17, N'San Juan')
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (18, N'San Luis')
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (19, N'Santa Cruz')
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (20, N'Santa Fe')
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (21, N'Santiago del Estero')
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (22, N'Tierra del Fuego')
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (23, N'Tucuman')
SET IDENTITY_INSERT [dbo].[Provincia] OFF
SET IDENTITY_INSERT [dbo].[TipoEjercicio] ON 

INSERT [dbo].[TipoEjercicio] ([idTipoEjercicio], [nombre], [descripcion]) VALUES (1, N'Aerobico', N'Ejercicio físico el cual necesita de la respiración aeróbica para poder realizarse.')
INSERT [dbo].[TipoEjercicio] ([idTipoEjercicio], [nombre], [descripcion]) VALUES (2, N'Fuerza', N'El ejercicio de fuerza es el uso de la resistencia para lograr la contracción muscular, y así incrementar la resistencia anaeróbica, la fuerza muscular y el tamaño de los músculos.')
INSERT [dbo].[TipoEjercicio] ([idTipoEjercicio], [nombre], [descripcion]) VALUES (3, N'Flexibilidad', N'Los ejercicios de flexibilidad estiran los músculos y ayudan a mantener la flexibilidad corporal.')
SET IDENTITY_INSERT [dbo].[TipoEjercicio] OFF
SET IDENTITY_INSERT [dbo].[TipoPlan] ON 

INSERT [dbo].[TipoPlan] ([idTipoPlan], [nombre], [descripcion]) VALUES (1, N'Inicial', N'Plan para principiantes')
INSERT [dbo].[TipoPlan] ([idTipoPlan], [nombre], [descripcion]) VALUES (2, N'Intermedio', N'Plan para alumnos con cierto grado de experiencia')
INSERT [dbo].[TipoPlan] ([idTipoPlan], [nombre], [descripcion]) VALUES (3, N'Avanzado', N'Plan para alumnos muy experimentados')
SET IDENTITY_INSERT [dbo].[TipoPlan] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([idUsuario], [usuario], [contraseña]) VALUES (1, N'gimAdmin01', N'techgim')
INSERT [dbo].[Usuario] ([idUsuario], [usuario], [contraseña]) VALUES (2, N'ProfeAdmin', N'tg789')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
ALTER TABLE [dbo].[Alumno]  WITH CHECK ADD  CONSTRAINT [fk_Alumno_Ciudad] FOREIGN KEY([idCiudad])
REFERENCES [dbo].[Ciudad] ([idCiudad])
GO
ALTER TABLE [dbo].[Alumno] CHECK CONSTRAINT [fk_Alumno_Ciudad]
GO
ALTER TABLE [dbo].[AlumnoxClase]  WITH CHECK ADD  CONSTRAINT [fk_AlumnoxClase_Alumno] FOREIGN KEY([idAlumno])
REFERENCES [dbo].[Alumno] ([idAlumno])
GO
ALTER TABLE [dbo].[AlumnoxClase] CHECK CONSTRAINT [fk_AlumnoxClase_Alumno]
GO
ALTER TABLE [dbo].[AlumnoxClase]  WITH CHECK ADD  CONSTRAINT [fk_AlumnoxClase_ProfesorxClase] FOREIGN KEY([idProfesorxClase])
REFERENCES [dbo].[ProfesorxClase] ([idProfesorxClase])
GO
ALTER TABLE [dbo].[AlumnoxClase] CHECK CONSTRAINT [fk_AlumnoxClase_ProfesorxClase]
GO
ALTER TABLE [dbo].[Asistencia]  WITH CHECK ADD  CONSTRAINT [fk_Asistencia_Alumno] FOREIGN KEY([idAlumno])
REFERENCES [dbo].[Alumno] ([idAlumno])
GO
ALTER TABLE [dbo].[Asistencia] CHECK CONSTRAINT [fk_Asistencia_Alumno]
GO
ALTER TABLE [dbo].[Ciudad]  WITH CHECK ADD  CONSTRAINT [fk_Ciudad_Provincia] FOREIGN KEY([idProvincia])
REFERENCES [dbo].[Provincia] ([idProvincia])
GO
ALTER TABLE [dbo].[Ciudad] CHECK CONSTRAINT [fk_Ciudad_Provincia]
GO
ALTER TABLE [dbo].[Ejercicio]  WITH CHECK ADD  CONSTRAINT [fk_Ejercicio_Maquina] FOREIGN KEY([idMaquina])
REFERENCES [dbo].[Maquina] ([idMaquina])
GO
ALTER TABLE [dbo].[Ejercicio] CHECK CONSTRAINT [fk_Ejercicio_Maquina]
GO
ALTER TABLE [dbo].[Ejercicio]  WITH CHECK ADD  CONSTRAINT [fk_Ejercicio_TipoEjercicio] FOREIGN KEY([idTipoEjercicio])
REFERENCES [dbo].[TipoEjercicio] ([idTipoEjercicio])
GO
ALTER TABLE [dbo].[Ejercicio] CHECK CONSTRAINT [fk_Ejercicio_TipoEjercicio]
GO
ALTER TABLE [dbo].[EjercicioPlanAlumno]  WITH CHECK ADD  CONSTRAINT [fk_EjercicioPlanAlumno_Ejercicio] FOREIGN KEY([idEjercicio])
REFERENCES [dbo].[Ejercicio] ([idEjercicio])
GO
ALTER TABLE [dbo].[EjercicioPlanAlumno] CHECK CONSTRAINT [fk_EjercicioPlanAlumno_Ejercicio]
GO
ALTER TABLE [dbo].[EjercicioPlanAlumno]  WITH CHECK ADD  CONSTRAINT [fk_EjercicioPlanAlumno_PlanxAlumno] FOREIGN KEY([idPlanxAlumno])
REFERENCES [dbo].[PlanxAlumno] ([idPlanxAlumno])
GO
ALTER TABLE [dbo].[EjercicioPlanAlumno] CHECK CONSTRAINT [fk_EjercicioPlanAlumno_PlanxAlumno]
GO
ALTER TABLE [dbo].[EjercicioxPlan]  WITH CHECK ADD  CONSTRAINT [fk_EjercicioxPlan_Ejercicio] FOREIGN KEY([idEjercicio])
REFERENCES [dbo].[Ejercicio] ([idEjercicio])
GO
ALTER TABLE [dbo].[EjercicioxPlan] CHECK CONSTRAINT [fk_EjercicioxPlan_Ejercicio]
GO
ALTER TABLE [dbo].[EjercicioxPlan]  WITH CHECK ADD  CONSTRAINT [fk_EjercicioxPlan_Plan] FOREIGN KEY([idPlan])
REFERENCES [dbo].[Planes] ([idPlan])
GO
ALTER TABLE [dbo].[EjercicioxPlan] CHECK CONSTRAINT [fk_EjercicioxPlan_Plan]
GO
ALTER TABLE [dbo].[Planes]  WITH CHECK ADD  CONSTRAINT [fk_Planes_TipoPlan] FOREIGN KEY([idTipoPlan])
REFERENCES [dbo].[TipoPlan] ([idTipoPlan])
GO
ALTER TABLE [dbo].[Planes] CHECK CONSTRAINT [fk_Planes_TipoPlan]
GO
ALTER TABLE [dbo].[PlanxAlumno]  WITH CHECK ADD  CONSTRAINT [fk_PlanxAlumno_Alumno] FOREIGN KEY([idAlumno])
REFERENCES [dbo].[Alumno] ([idAlumno])
GO
ALTER TABLE [dbo].[PlanxAlumno] CHECK CONSTRAINT [fk_PlanxAlumno_Alumno]
GO
ALTER TABLE [dbo].[PlanxAlumno]  WITH CHECK ADD  CONSTRAINT [fk_PlanxAlumno_Planes] FOREIGN KEY([idPlan])
REFERENCES [dbo].[Planes] ([idPlan])
GO
ALTER TABLE [dbo].[PlanxAlumno] CHECK CONSTRAINT [fk_PlanxAlumno_Planes]
GO
ALTER TABLE [dbo].[PlanxAlumno]  WITH CHECK ADD  CONSTRAINT [fk_PlanxAlumno_Profesor] FOREIGN KEY([idProfesor])
REFERENCES [dbo].[Profesor] ([idProfesor])
GO
ALTER TABLE [dbo].[PlanxAlumno] CHECK CONSTRAINT [fk_PlanxAlumno_Profesor]
GO
ALTER TABLE [dbo].[Profesor]  WITH CHECK ADD  CONSTRAINT [fk_Profesor_Ciudad] FOREIGN KEY([idCiudad])
REFERENCES [dbo].[Ciudad] ([idCiudad])
GO
ALTER TABLE [dbo].[Profesor] CHECK CONSTRAINT [fk_Profesor_Ciudad]
GO
ALTER TABLE [dbo].[ProfesorxClase]  WITH CHECK ADD  CONSTRAINT [fk_ProfesorxClase_Clase] FOREIGN KEY([idClase])
REFERENCES [dbo].[Clase] ([idClase])
GO
ALTER TABLE [dbo].[ProfesorxClase] CHECK CONSTRAINT [fk_ProfesorxClase_Clase]
GO
ALTER TABLE [dbo].[ProfesorxClase]  WITH CHECK ADD  CONSTRAINT [fk_ProfesorxClase_Profesor] FOREIGN KEY([idProfesor])
REFERENCES [dbo].[Profesor] ([idProfesor])
GO
ALTER TABLE [dbo].[ProfesorxClase] CHECK CONSTRAINT [fk_ProfesorxClase_Profesor]
GO
ALTER TABLE [dbo].[TituloxProfesor]  WITH CHECK ADD  CONSTRAINT [fk_TituloxProfesor_Profesor] FOREIGN KEY([idProfesor])
REFERENCES [dbo].[Profesor] ([idProfesor])
GO
ALTER TABLE [dbo].[TituloxProfesor] CHECK CONSTRAINT [fk_TituloxProfesor_Profesor]
GO
ALTER TABLE [dbo].[TituloxProfesor]  WITH CHECK ADD  CONSTRAINT [fk_TituloxProfesor_Titulo] FOREIGN KEY([idTitulo])
REFERENCES [dbo].[Titulo] ([idTitulo])
GO
ALTER TABLE [dbo].[TituloxProfesor] CHECK CONSTRAINT [fk_TituloxProfesor_Titulo]
GO
USE [master]
GO
ALTER DATABASE [BDGimnasio] SET  READ_WRITE 
GO
