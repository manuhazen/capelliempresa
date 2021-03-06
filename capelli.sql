USE [master]
GO
/****** Object:  Database [capelli]    Script Date: 8/4/2021 9:37:24 AM ******/
/****** Object:  20-EIIN-1-129 Emmanuel Jimenez Perez ******/
/****** Object:  20-EIIN-1-169 Marielys Jazmin Tavarez    Script Date: 8/4/2021 9:37:24 AM ******/

CREATE DATABASE [capelli]

GO
ALTER DATABASE [capelli] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [capelli].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [capelli] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [capelli] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [capelli] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [capelli] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [capelli] SET ARITHABORT OFF 
GO
ALTER DATABASE [capelli] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [capelli] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [capelli] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [capelli] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [capelli] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [capelli] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [capelli] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [capelli] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [capelli] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [capelli] SET  DISABLE_BROKER 
GO
ALTER DATABASE [capelli] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [capelli] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [capelli] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [capelli] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [capelli] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [capelli] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [capelli] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [capelli] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [capelli] SET  MULTI_USER 
GO
ALTER DATABASE [capelli] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [capelli] SET DB_CHAINING OFF 
GO
ALTER DATABASE [capelli] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [capelli] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [capelli] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [capelli] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [capelli] SET QUERY_STORE = OFF
GO
USE [capelli]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 8/4/2021 9:37:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[cliente_id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[apellido] [nvarchar](255) NOT NULL,
	[telefono] [nvarchar](255) NOT NULL,
	[correo] [nvarchar](255) NOT NULL,
	[direccion] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cliente_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 8/4/2021 9:37:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[empleado_id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nchar](255) NOT NULL,
	[apellido] [nvarchar](255) NOT NULL,
	[telefono] [nvarchar](255) NOT NULL,
	[correo] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[empleado_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 8/4/2021 9:37:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[inventario_id] [int] IDENTITY(1,1) NOT NULL,
	[producto_id] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[tipo] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[orden_id] [int] NOT NULL,
	[order_item_id] [int] NOT NULL,
	[precio] [decimal](8, 2) NOT NULL,
	[costo] [decimal](8, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[inventario_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ordenes]    Script Date: 8/4/2021 9:37:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ordenes](
	[orden_id] [int] IDENTITY(1,1) NOT NULL,
	[cliente_id] [int] NOT NULL,
	[empleado_id] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[monto_total] [decimal](8, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orden_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenesItems]    Script Date: 8/4/2021 9:37:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenesItems](
	[item_id] [int] IDENTITY(1,1) NOT NULL,
	[orden_id] [int] NOT NULL,
	[producto_id] [int] NOT NULL,
	[price] [decimal](8, 2) NOT NULL,
	[cantidad] [int] NOT NULL,
	[monto] [decimal](8, 2) NOT NULL,
	[impuestos] [decimal](8, 2) NOT NULL,
	[descuentos] [decimal](8, 2) NOT NULL,
	[total] [decimal](8, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 8/4/2021 9:37:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[producto_id] [int] IDENTITY(1,1) NOT NULL,
	[calidad] [int] NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[producto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([cliente_id], [nombre], [apellido], [telefono], [correo], [direccion]) VALUES (1, N'Jesus ', N'De La Cruz', N'8098062336', N'jesus.delacruz@gmail.com', N'C/Las Ciguas #45')
INSERT [dbo].[Clientes] ([cliente_id], [nombre], [apellido], [telefono], [correo], [direccion]) VALUES (2, N'Luis Miguel', N'Martinez', N'8295688996', N'lmartinez23@outlook.com', N'Residencial Las marianas, Apartamento 3A')
INSERT [dbo].[Clientes] ([cliente_id], [nombre], [apellido], [telefono], [correo], [direccion]) VALUES (3, N'Maria Luisa', N'Rodriguez', N'8490023443', N'mlrodriguez89@gmail.com', N'C/23 #45, Cristo Rey')
INSERT [dbo].[Clientes] ([cliente_id], [nombre], [apellido], [telefono], [correo], [direccion]) VALUES (4, N'Fernando', N'Gutierrez', N'8095699621', N'fgutierrez@gmail.com', N'C/Tercera, Los Minas')
INSERT [dbo].[Clientes] ([cliente_id], [nombre], [apellido], [telefono], [correo], [direccion]) VALUES (5, N'Fabiola', N'De La Cruz', N'8299002356', N'fabioladelacruz@gmail.com', N'C/Jacobo Majluta #45, Residencial El Paso')
INSERT [dbo].[Clientes] ([cliente_id], [nombre], [apellido], [telefono], [correo], [direccion]) VALUES (6, N'Antonia', N'Payano', N'8490033450', N'adelacruz89@gmail.com', N'C/Los Pinos #98, Los')
INSERT [dbo].[Clientes] ([cliente_id], [nombre], [apellido], [telefono], [correo], [direccion]) VALUES (7, N'Manuel', N'Giron', N'8099009090', N'manuel.giron04@gmail.com', N'C/Luis Gutierrez #55, Villa Laura')
INSERT [dbo].[Clientes] ([cliente_id], [nombre], [apellido], [telefono], [correo], [direccion]) VALUES (8, N'Joel ', N'De Leon', N'8095687876', N'deleon09@outlook.es', N'C/Jacobo Majluta #44, Villa Hermosa')
INSERT [dbo].[Clientes] ([cliente_id], [nombre], [apellido], [telefono], [correo], [direccion]) VALUES (9, N'Luisa', N'Paulino', N'8493456543', N'luisa.paulino@gmail.com', N'C/Kennedy #56')
INSERT [dbo].[Clientes] ([cliente_id], [nombre], [apellido], [telefono], [correo], [direccion]) VALUES (10, N'Lorena', N'Morel', N'8291234567', N'lmorel@gmail.com', N'C/Los reales #21')
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Empleados] ON 

INSERT [dbo].[Empleados] ([empleado_id], [nombre], [apellido], [telefono], [correo]) VALUES (1, N'Antonia                                                                                                                                                                                                                                                        ', N'Payano', N'8490033450', N'adelacruz89@gmail.com')
INSERT [dbo].[Empleados] ([empleado_id], [nombre], [apellido], [telefono], [correo]) VALUES (2, N'Joel                                                                                                                                                                                                                                                           ', N'De Leon', N'8095687876', N'deleon09@outlook.es')
INSERT [dbo].[Empleados] ([empleado_id], [nombre], [apellido], [telefono], [correo]) VALUES (3, N'Luisa                                                                                                                                                                                                                                                          ', N'Paulino', N'8493456543', N'luisa.paulino@gmail.com')
INSERT [dbo].[Empleados] ([empleado_id], [nombre], [apellido], [telefono], [correo]) VALUES (4, N'Lorena                                                                                                                                                                                                                                                         ', N'Morel', N'8291234567', N'lmorel@gmail.com')
INSERT [dbo].[Empleados] ([empleado_id], [nombre], [apellido], [telefono], [correo]) VALUES (5, N'Jesus                                                                                                                                                                                                                                                          ', N'De La Cruz', N'8098062336', N'jesus.delacruz@gmail.com')
INSERT [dbo].[Empleados] ([empleado_id], [nombre], [apellido], [telefono], [correo]) VALUES (6, N'Maria Luisa                                                                                                                                                                                                                                                    ', N'Rodriguez', N'8099009090', N'mlrodriguez89@gmail.com')
INSERT [dbo].[Empleados] ([empleado_id], [nombre], [apellido], [telefono], [correo]) VALUES (7, N'Luis Miguel                                                                                                                                                                                                                                                    ', N'Martinez', N'8295688996', N'lmartinez23@outlook.com')
INSERT [dbo].[Empleados] ([empleado_id], [nombre], [apellido], [telefono], [correo]) VALUES (8, N'Fernando                                                                                                                                                                                                                                                       ', N'Gutierrez', N'8095699621', N'fgutierrez@gmail.com')
INSERT [dbo].[Empleados] ([empleado_id], [nombre], [apellido], [telefono], [correo]) VALUES (9, N'Fabiola                                                                                                                                                                                                                                                        ', N'De La Cruz', N'8299002356', N'fabioladelacruz@gmail.com')
INSERT [dbo].[Empleados] ([empleado_id], [nombre], [apellido], [telefono], [correo]) VALUES (10, N'Manuel                                                                                                                                                                                                                                                         ', N'Giron', N'8099009090', N'manuel.giron04@gmail.com')
SET IDENTITY_INSERT [dbo].[Empleados] OFF
GO
SET IDENTITY_INSERT [dbo].[Inventario] ON 

INSERT [dbo].[Inventario] ([inventario_id], [producto_id], [fecha], [tipo], [cantidad], [orden_id], [order_item_id], [precio], [costo]) VALUES (5, 1, CAST(N'2021-01-02T00:00:00.000' AS DateTime), 1, 12, 1, 1, CAST(50.00 AS Decimal(8, 2)), CAST(30.00 AS Decimal(8, 2)))
INSERT [dbo].[Inventario] ([inventario_id], [producto_id], [fecha], [tipo], [cantidad], [orden_id], [order_item_id], [precio], [costo]) VALUES (6, 1, CAST(N'2021-01-02T00:00:00.000' AS DateTime), 1, 12, 1, 1, CAST(50.00 AS Decimal(8, 2)), CAST(30.00 AS Decimal(8, 2)))
INSERT [dbo].[Inventario] ([inventario_id], [producto_id], [fecha], [tipo], [cantidad], [orden_id], [order_item_id], [precio], [costo]) VALUES (7, 1, CAST(N'2021-01-02T00:00:00.000' AS DateTime), 1, 12, 1, 1, CAST(50.00 AS Decimal(8, 2)), CAST(30.00 AS Decimal(8, 2)))
INSERT [dbo].[Inventario] ([inventario_id], [producto_id], [fecha], [tipo], [cantidad], [orden_id], [order_item_id], [precio], [costo]) VALUES (8, 1, CAST(N'2021-01-02T00:00:00.000' AS DateTime), 1, 12, 1, 1, CAST(50.00 AS Decimal(8, 2)), CAST(30.00 AS Decimal(8, 2)))
INSERT [dbo].[Inventario] ([inventario_id], [producto_id], [fecha], [tipo], [cantidad], [orden_id], [order_item_id], [precio], [costo]) VALUES (9, 1, CAST(N'2021-01-02T00:00:00.000' AS DateTime), 1, 12, 1, 1, CAST(50.00 AS Decimal(8, 2)), CAST(30.00 AS Decimal(8, 2)))
INSERT [dbo].[Inventario] ([inventario_id], [producto_id], [fecha], [tipo], [cantidad], [orden_id], [order_item_id], [precio], [costo]) VALUES (10, 1, CAST(N'2021-01-02T00:00:00.000' AS DateTime), 1, 12, 1, 1, CAST(50.00 AS Decimal(8, 2)), CAST(30.00 AS Decimal(8, 2)))
INSERT [dbo].[Inventario] ([inventario_id], [producto_id], [fecha], [tipo], [cantidad], [orden_id], [order_item_id], [precio], [costo]) VALUES (11, 1, CAST(N'2021-01-02T00:00:00.000' AS DateTime), 1, 12, 1, 1, CAST(50.00 AS Decimal(8, 2)), CAST(30.00 AS Decimal(8, 2)))
INSERT [dbo].[Inventario] ([inventario_id], [producto_id], [fecha], [tipo], [cantidad], [orden_id], [order_item_id], [precio], [costo]) VALUES (12, 1, CAST(N'2021-01-02T00:00:00.000' AS DateTime), 1, 12, 1, 1, CAST(50.00 AS Decimal(8, 2)), CAST(30.00 AS Decimal(8, 2)))
INSERT [dbo].[Inventario] ([inventario_id], [producto_id], [fecha], [tipo], [cantidad], [orden_id], [order_item_id], [precio], [costo]) VALUES (13, 1, CAST(N'2021-01-02T00:00:00.000' AS DateTime), 1, 12, 1, 1, CAST(50.00 AS Decimal(8, 2)), CAST(30.00 AS Decimal(8, 2)))
INSERT [dbo].[Inventario] ([inventario_id], [producto_id], [fecha], [tipo], [cantidad], [orden_id], [order_item_id], [precio], [costo]) VALUES (14, 1, CAST(N'2021-01-02T00:00:00.000' AS DateTime), 1, 12, 1, 1, CAST(50.00 AS Decimal(8, 2)), CAST(30.00 AS Decimal(8, 2)))
INSERT [dbo].[Inventario] ([inventario_id], [producto_id], [fecha], [tipo], [cantidad], [orden_id], [order_item_id], [precio], [costo]) VALUES (15, 1, CAST(N'2021-01-02T00:00:00.000' AS DateTime), 1, 12, 1, 1, CAST(50.00 AS Decimal(8, 2)), CAST(30.00 AS Decimal(8, 2)))
INSERT [dbo].[Inventario] ([inventario_id], [producto_id], [fecha], [tipo], [cantidad], [orden_id], [order_item_id], [precio], [costo]) VALUES (16, 1, CAST(N'2021-01-02T00:00:00.000' AS DateTime), 1, 12, 1, 1, CAST(50.00 AS Decimal(8, 2)), CAST(30.00 AS Decimal(8, 2)))

SET IDENTITY_INSERT [dbo].[Inventario] OFF
GO
SET IDENTITY_INSERT [dbo].[Ordenes] ON 

INSERT [dbo].[Ordenes] ([orden_id], [cliente_id], [empleado_id], [fecha], [monto_total]) VALUES (1, 1, 1, CAST(N'2021-01-02T00:00:00.000' AS DateTime), CAST(300.00 AS Decimal(8, 2)))
INSERT [dbo].[Ordenes] ([orden_id], [cliente_id], [empleado_id], [fecha], [monto_total]) VALUES (2, 2, 2, CAST(N'2021-01-02T00:00:00.000' AS DateTime), CAST(150.00 AS Decimal(8, 2)))
INSERT [dbo].[Ordenes] ([orden_id], [cliente_id], [empleado_id], [fecha], [monto_total]) VALUES (3, 3, 3, CAST(N'2021-01-05T00:00:00.000' AS DateTime), CAST(200.00 AS Decimal(8, 2)))
INSERT [dbo].[Ordenes] ([orden_id], [cliente_id], [empleado_id], [fecha], [monto_total]) VALUES (4, 4, 4, CAST(N'2021-01-11T00:00:00.000' AS DateTime), CAST(100.00 AS Decimal(8, 2)))
INSERT [dbo].[Ordenes] ([orden_id], [cliente_id], [empleado_id], [fecha], [monto_total]) VALUES (5, 5, 5, CAST(N'2021-01-11T00:00:00.000' AS DateTime), CAST(380.00 AS Decimal(8, 2)))
INSERT [dbo].[Ordenes] ([orden_id], [cliente_id], [empleado_id], [fecha], [monto_total]) VALUES (6, 6, 6, CAST(N'2021-01-13T00:00:00.000' AS DateTime), CAST(450.00 AS Decimal(8, 2)))
INSERT [dbo].[Ordenes] ([orden_id], [cliente_id], [empleado_id], [fecha], [monto_total]) VALUES (7, 7, 7, CAST(N'2021-01-15T00:00:00.000' AS DateTime), CAST(150.00 AS Decimal(8, 2)))
INSERT [dbo].[Ordenes] ([orden_id], [cliente_id], [empleado_id], [fecha], [monto_total]) VALUES (8, 8, 8, CAST(N'2021-01-15T00:00:00.000' AS DateTime), CAST(150.00 AS Decimal(8, 2)))
INSERT [dbo].[Ordenes] ([orden_id], [cliente_id], [empleado_id], [fecha], [monto_total]) VALUES (9, 9, 9, CAST(N'2021-01-15T00:00:00.000' AS DateTime), CAST(150.00 AS Decimal(8, 2)))
INSERT [dbo].[Ordenes] ([orden_id], [cliente_id], [empleado_id], [fecha], [monto_total]) VALUES (10, 10, 10, CAST(N'2021-01-15T00:00:00.000' AS DateTime), CAST(150.00 AS Decimal(8, 2)))
SET IDENTITY_INSERT [dbo].[Ordenes] OFF
GO
SET IDENTITY_INSERT [dbo].[OrdenesItems] ON 

INSERT [dbo].[OrdenesItems] ([item_id], [orden_id], [producto_id], [price], [cantidad], [monto], [impuestos], [descuentos], [total]) VALUES (1, 1, 1, CAST(15.00 AS Decimal(8, 2)), 2, CAST(30.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), CAST(30.00 AS Decimal(8, 2)))
INSERT [dbo].[OrdenesItems] ([item_id], [orden_id], [producto_id], [price], [cantidad], [monto], [impuestos], [descuentos], [total]) VALUES (2, 1, 2, CAST(30.00 AS Decimal(8, 2)), 1, CAST(30.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), CAST(30.00 AS Decimal(8, 2)))
INSERT [dbo].[OrdenesItems] ([item_id], [orden_id], [producto_id], [price], [cantidad], [monto], [impuestos], [descuentos], [total]) VALUES (3, 2, 3, CAST(36.00 AS Decimal(8, 2)), 3, CAST(108.00 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), CAST(110.00 AS Decimal(8, 2)))
INSERT [dbo].[OrdenesItems] ([item_id], [orden_id], [producto_id], [price], [cantidad], [monto], [impuestos], [descuentos], [total]) VALUES (4, 2, 4, CAST(36.00 AS Decimal(8, 2)), 3, CAST(108.00 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), CAST(110.00 AS Decimal(8, 2)))
INSERT [dbo].[OrdenesItems] ([item_id], [orden_id], [producto_id], [price], [cantidad], [monto], [impuestos], [descuentos], [total]) VALUES (5, 3, 5, CAST(36.00 AS Decimal(8, 2)), 3, CAST(108.00 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), CAST(110.00 AS Decimal(8, 2)))
INSERT [dbo].[OrdenesItems] ([item_id], [orden_id], [producto_id], [price], [cantidad], [monto], [impuestos], [descuentos], [total]) VALUES (6, 4, 6, CAST(36.00 AS Decimal(8, 2)), 3, CAST(108.00 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), CAST(110.00 AS Decimal(8, 2)))
INSERT [dbo].[OrdenesItems] ([item_id], [orden_id], [producto_id], [price], [cantidad], [monto], [impuestos], [descuentos], [total]) VALUES (7, 5, 7, CAST(36.00 AS Decimal(8, 2)), 3, CAST(108.00 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), CAST(110.00 AS Decimal(8, 2)))
INSERT [dbo].[OrdenesItems] ([item_id], [orden_id], [producto_id], [price], [cantidad], [monto], [impuestos], [descuentos], [total]) VALUES (8, 6, 8, CAST(36.00 AS Decimal(8, 2)), 3, CAST(108.00 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), CAST(110.00 AS Decimal(8, 2)))
INSERT [dbo].[OrdenesItems] ([item_id], [orden_id], [producto_id], [price], [cantidad], [monto], [impuestos], [descuentos], [total]) VALUES (9, 7, 9, CAST(36.00 AS Decimal(8, 2)), 3, CAST(108.00 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), CAST(110.00 AS Decimal(8, 2)))
INSERT [dbo].[OrdenesItems] ([item_id], [orden_id], [producto_id], [price], [cantidad], [monto], [impuestos], [descuentos], [total]) VALUES (10, 8, 10, CAST(36.00 AS Decimal(8, 2)), 3, CAST(108.00 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), CAST(110.00 AS Decimal(8, 2)))
INSERT [dbo].[OrdenesItems] ([item_id], [orden_id], [producto_id], [price], [cantidad], [monto], [impuestos], [descuentos], [total]) VALUES (11, 9, 1, CAST(36.00 AS Decimal(8, 2)), 3, CAST(108.00 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), CAST(110.00 AS Decimal(8, 2)))
INSERT [dbo].[OrdenesItems] ([item_id], [orden_id], [producto_id], [price], [cantidad], [monto], [impuestos], [descuentos], [total]) VALUES (12, 10, 10, CAST(36.00 AS Decimal(8, 2)), 3, CAST(108.00 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), CAST(110.00 AS Decimal(8, 2)))
INSERT [dbo].[OrdenesItems] ([item_id], [orden_id], [producto_id], [price], [cantidad], [monto], [impuestos], [descuentos], [total]) VALUES (13, 10, 4, CAST(36.00 AS Decimal(8, 2)), 3, CAST(108.00 AS Decimal(8, 2)), CAST(2.00 AS Decimal(8, 2)), CAST(0.00 AS Decimal(8, 2)), CAST(110.00 AS Decimal(8, 2)))
SET IDENTITY_INSERT [dbo].[OrdenesItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([producto_id], [calidad], [nombre]) VALUES (1, 5, N'Pelo Indu Humano')
INSERT [dbo].[Productos] ([producto_id], [calidad], [nombre]) VALUES (2, 3, N'Pelo Semi Natural')
INSERT [dbo].[Productos] ([producto_id], [calidad], [nombre]) VALUES (3, 3, N'Halo extensiones cabello humano')
INSERT [dbo].[Productos] ([producto_id], [calidad], [nombre]) VALUES (4, 4, N'Extensiones pre-estiradas 20 pulgadas')
INSERT [dbo].[Productos] ([producto_id], [calidad], [nombre]) VALUES (5, 2, N'Trenzas de caja Boho')
INSERT [dbo].[Productos] ([producto_id], [calidad], [nombre]) VALUES (6, 3, N'Pelo Rizado 18 pulgadas')
INSERT [dbo].[Productos] ([producto_id], [calidad], [nombre]) VALUES (7, 2, N'Cabello afro rizado')
INSERT [dbo].[Productos] ([producto_id], [calidad], [nombre]) VALUES (8, 5, N'Extensiones cabello humano onda profunda')
INSERT [dbo].[Productos] ([producto_id], [calidad], [nombre]) VALUES (9, 5, N'Brasileño curly virgin')
INSERT [dbo].[Productos] ([producto_id], [calidad], [nombre]) VALUES (10, 5, N'Lote natural sin procesar')
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [inventario_orden_id_foreign] FOREIGN KEY([orden_id])
REFERENCES [dbo].[Ordenes] ([orden_id])
GO
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [inventario_orden_id_foreign]
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [inventario_order_item_id_foreign] FOREIGN KEY([order_item_id])
REFERENCES [dbo].[OrdenesItems] ([item_id])
GO
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [inventario_order_item_id_foreign]
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [inventario_producto_id_foreign] FOREIGN KEY([producto_id])
REFERENCES [dbo].[Productos] ([producto_id])
GO
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [inventario_producto_id_foreign]
GO
ALTER TABLE [dbo].[Ordenes]  WITH CHECK ADD  CONSTRAINT [ordenes_cliente_id_foreign] FOREIGN KEY([cliente_id])
REFERENCES [dbo].[Clientes] ([cliente_id])
GO
ALTER TABLE [dbo].[Ordenes] CHECK CONSTRAINT [ordenes_cliente_id_foreign]
GO
ALTER TABLE [dbo].[Ordenes]  WITH CHECK ADD  CONSTRAINT [ordenes_empleado_id_foreign] FOREIGN KEY([empleado_id])
REFERENCES [dbo].[Empleados] ([empleado_id])
GO
ALTER TABLE [dbo].[Ordenes] CHECK CONSTRAINT [ordenes_empleado_id_foreign]
GO
ALTER TABLE [dbo].[OrdenesItems]  WITH CHECK ADD  CONSTRAINT [ordenesitems_orden_id_foreign] FOREIGN KEY([orden_id])
REFERENCES [dbo].[Ordenes] ([orden_id])
GO
ALTER TABLE [dbo].[OrdenesItems] CHECK CONSTRAINT [ordenesitems_orden_id_foreign]
GO
ALTER TABLE [dbo].[OrdenesItems]  WITH CHECK ADD  CONSTRAINT [ordenesitems_producto_id_foreign] FOREIGN KEY([producto_id])
REFERENCES [dbo].[Productos] ([producto_id])
GO
ALTER TABLE [dbo].[OrdenesItems] CHECK CONSTRAINT [ordenesitems_producto_id_foreign]
GO
USE [master]
GO
ALTER DATABASE [capelli] SET  READ_WRITE 
GO
