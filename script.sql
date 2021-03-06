USE [master]
GO
/****** Object:  Database [PruebaTecnica]    Script Date: 19/10/2021 3:35:39 a. m. ******/
CREATE DATABASE [PruebaTecnica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PruebaTecnica', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PruebaTecnica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PruebaTecnica_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PruebaTecnica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PruebaTecnica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PruebaTecnica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PruebaTecnica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PruebaTecnica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PruebaTecnica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PruebaTecnica] SET ARITHABORT OFF 
GO
ALTER DATABASE [PruebaTecnica] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PruebaTecnica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PruebaTecnica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PruebaTecnica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PruebaTecnica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PruebaTecnica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PruebaTecnica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PruebaTecnica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PruebaTecnica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PruebaTecnica] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PruebaTecnica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PruebaTecnica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PruebaTecnica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PruebaTecnica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PruebaTecnica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PruebaTecnica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PruebaTecnica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PruebaTecnica] SET RECOVERY FULL 
GO
ALTER DATABASE [PruebaTecnica] SET  MULTI_USER 
GO
ALTER DATABASE [PruebaTecnica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PruebaTecnica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PruebaTecnica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PruebaTecnica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PruebaTecnica] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PruebaTecnica', N'ON'
GO
USE [PruebaTecnica]
GO
/****** Object:  User [user_app]    Script Date: 19/10/2021 3:35:39 a. m. ******/
CREATE USER [user_app] FOR LOGIN [user_app] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [user_app]
GO
ALTER ROLE [db_datareader] ADD MEMBER [user_app]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [user_app]
GO
/****** Object:  Table [dbo].[DetalleFactura]    Script Date: 19/10/2021 3:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleFactura](
	[IdFactura] [int] NULL,
	[IdProducto] [int] NULL,
	[ValorUnitario] [int] NULL,
	[Cantidad] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 19/10/2021 3:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas](
	[IdFactura] [int] IDENTITY(1,1) NOT NULL,
	[NumeroFactura] [varchar](20) NULL,
	[Fecha] [date] NULL,
	[TipodePago] [varchar](30) NULL,
	[DocumentoCliente] [varchar](30) NULL,
	[NombreCliente] [varchar](60) NULL,
	[Subtotal] [int] NULL,
	[Descuento] [numeric](4, 2) NULL,
	[IVA] [numeric](4, 2) NULL,
	[TotalDescuento] [int] NULL,
	[TotalImpuesto] [int] NULL,
	[Total] [int] NULL,
 CONSTRAINT [PK_Facturas] PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productoo]    Script Date: 19/10/2021 3:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productoo](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Producto] [varchar](60) NULL,
 CONSTRAINT [PK_Productoo] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Facturas] ON 

INSERT [dbo].[Facturas] ([IdFactura], [NumeroFactura], [Fecha], [TipodePago], [DocumentoCliente], [NombreCliente], [Subtotal], [Descuento], [IVA], [TotalDescuento], [TotalImpuesto], [Total]) VALUES (3, N'er3434', CAST(N'2020-12-18' AS Date), N'efectivo', N'368884', N'Yamile Vergara', 1444874, CAST(5.14 AS Numeric(4, 2)), CAST(19.74 AS Numeric(4, 2)), 5000, 25000, 139000)
INSERT [dbo].[Facturas] ([IdFactura], [NumeroFactura], [Fecha], [TipodePago], [DocumentoCliente], [NombreCliente], [Subtotal], [Descuento], [IVA], [TotalDescuento], [TotalImpuesto], [Total]) VALUES (4, N'c1234', CAST(N'2020-09-01' AS Date), N'Efectivo', N'36985214', N'Cristian Hurtado', 50000, CAST(4.32 AS Numeric(4, 2)), CAST(19.00 AS Numeric(4, 2)), 5800, 7300, 54000)
INSERT [dbo].[Facturas] ([IdFactura], [NumeroFactura], [Fecha], [TipodePago], [DocumentoCliente], [NombreCliente], [Subtotal], [Descuento], [IVA], [TotalDescuento], [TotalImpuesto], [Total]) VALUES (5, N'c999', CAST(N'2021-09-16' AS Date), N'Efectivo', N'53075164', N'Cristian Roa', 50000, CAST(4.32 AS Numeric(4, 2)), CAST(19.00 AS Numeric(4, 2)), 5800, 7300, 54000)
INSERT [dbo].[Facturas] ([IdFactura], [NumeroFactura], [Fecha], [TipodePago], [DocumentoCliente], [NombreCliente], [Subtotal], [Descuento], [IVA], [TotalDescuento], [TotalImpuesto], [Total]) VALUES (8, N'fr6543', CAST(N'2021-10-19' AS Date), N'tarjeta', N'234556', N'ddgjj', 0, CAST(0.00 AS Numeric(4, 2)), CAST(0.00 AS Numeric(4, 2)), 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Facturas] OFF
GO
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD  CONSTRAINT [FK_DetalleFactura_Facturas] FOREIGN KEY([IdFactura])
REFERENCES [dbo].[Facturas] ([IdFactura])
GO
ALTER TABLE [dbo].[DetalleFactura] CHECK CONSTRAINT [FK_DetalleFactura_Facturas]
GO
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD  CONSTRAINT [FK_DetalleFactura_Productoo] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Productoo] ([IdProducto])
GO
ALTER TABLE [dbo].[DetalleFactura] CHECK CONSTRAINT [FK_DetalleFactura_Productoo]
GO
/****** Object:  StoredProcedure [dbo].[sp_creaDet]    Script Date: 19/10/2021 3:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_creaDet] 
	-- Add the parameters for the stored procedure here
	@IdFactura int
	,@IdProducto int
	,@ValorUnit int
	,@Cantidad int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @Error int =0

    -- Insert statements for procedure here
	INSERT INTO [dbo].[DetalleFactura]
           ([IdFactura]
           ,[IdProducto]
           ,[ValorUnitario]
           ,[Cantidad])
     VALUES
           (@IdFactura
           ,@IdProducto
           ,@ValorUnit
           ,@Cantidad)

		   set @Error =1
		   select @Error as Result
END
GO
/****** Object:  StoredProcedure [dbo].[sp_creaFactura]    Script Date: 19/10/2021 3:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_creaFactura] 
	-- Add the parameters for the stored procedure here
	@NumeroFactura varchar(20)
	,@Fecha date
	,@TipodePago varchar(30)
	,@Cedula varchar(30)
	,@Nombre varchar(60)
	,@Subtotal int
	,@Descuento numeric(4,2)
	,@IVA numeric(4,2)
	,@TotalDescuento int 
	,@TotalImpuesto int 
	,@Total int 


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Facturas]
           ([NumeroFactura]
           ,[Fecha]
           ,[TipodePago]
           ,[DocumentoCliente]
           ,[NombreCliente]
           ,[Subtotal]
           ,[Descuento]
           ,[IVA]
           ,[TotalDescuento]
           ,[TotalImpuesto]
           ,[Total])
     VALUES
           (@NumeroFactura
           ,getdate()
           ,@TipodePago
           ,@Cedula
           ,@Nombre
           ,@Subtotal
           ,@Descuento
           ,@IVA
           ,@TotalDescuento
           ,@TotalImpuesto
           ,@Total)

		   select top(1) IdFactura from Facturas
		   order by IdFactura desc
END
GO
/****** Object:  StoredProcedure [dbo].[sp_creaProducto]    Script Date: 19/10/2021 3:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_creaProducto] 
	-- Add the parameters for the stored procedure here
	@Producto varchar(60)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @Valor int=0
    -- Insert statements for procedure here
	INSERT INTO [dbo].[Productoo]
           ([Producto])
     VALUES
           (@Producto)

		   set @Valor = 1

		   select @Valor as Result
END
GO
/****** Object:  StoredProcedure [dbo].[sp_delDetalle]    Script Date: 19/10/2021 3:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_delDetalle]
	-- Add the parameters for the stored procedure here
	@IdFactura int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @Result int =0

    -- Insert statements for procedure here
	DELETE FROM [dbo].[DetalleFactura]
      WHERE IdFactura = @IdFactura

	  set @Result =1

	  select @Result as Result
END
GO
/****** Object:  StoredProcedure [dbo].[sp_delFactura]    Script Date: 19/10/2021 3:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_delFactura]
	-- Add the parameters for the stored procedure here
	@IdFactura int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @Result int=0

    -- Insert statements for procedure here
	DELETE FROM [dbo].[Facturas]
      WHERE IdFactura = @IdFactura

	  set @Result =1
	  select @Result as Result
END
GO
/****** Object:  StoredProcedure [dbo].[sp_delProducto]    Script Date: 19/10/2021 3:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_delProducto] 
	-- Add the parameters for the stored procedure here
	@IdProducto int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [dbo].[Productoo]
      WHERE IdProducto = @IdProducto
END
GO
/****** Object:  StoredProcedure [dbo].[sp_editFactura]    Script Date: 19/10/2021 3:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_editFactura] 
	-- Add the parameters for the stored procedure here
	 @IdFactura int
	,@NumeroFactura varchar(20)
	,@Fecha date
	,@TipodePago varchar(30)
	,@Cedula varchar(30)
	,@Nombre varchar(60)
	,@Subtotal int
	,@Descuento numeric(2,2)
	,@IVA numeric(2,2)
	,@TotalDescuento int 
	,@TotalImpuesto int 
	,@Total int 


AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @Respu int =0

    -- Insert statements for procedure here
	UPDATE [dbo].[Facturas]
   SET [NumeroFactura] = @NumeroFactura
      ,[Fecha] = @Fecha
      ,[TipodePago] = @TipodePago
      ,[DocumentoCliente] = @Cedula
      ,[NombreCliente] = @Nombre
      ,[Subtotal] = @Subtotal
      ,[Descuento] = @Descuento
      ,[IVA] = @IVA
      ,[TotalDescuento] = @TotalDescuento
      ,[TotalImpuesto] = @TotalImpuesto
      ,[Total] = @Total
 WHERE IdFactura = @IdFactura
 set @Respu =1

 select @Respu as Result

END
GO
/****** Object:  StoredProcedure [dbo].[sp_editProducto]    Script Date: 19/10/2021 3:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_editProducto] 
	-- Add the parameters for the stored procedure here
	@IdProducto int
	,@Producto varchar(60)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Productoo]
   SET [Producto] = @Producto
 WHERE Idproducto = @IdProducto
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getFactbyId]    Script Date: 19/10/2021 3:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_getFactbyId] 
	-- Add the parameters for the stored procedure here
	@IdFactura int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [IdFactura]
      ,[NumeroFactura]
      ,[Fecha]
      ,[TipodePago]
      ,[DocumentoCliente]
      ,[NombreCliente]
      ,[Subtotal]
      ,[Descuento]
      ,[IVA]
      ,[TotalDescuento]
      ,[TotalImpuesto]
      ,[Total]
  FROM [PruebaTecnica].[dbo].[Facturas]
  where IdFactura =@IdFactura
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getFacturas]    Script Date: 19/10/2021 3:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_getFacturas] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [IdFactura]
      ,[NumeroFactura]
      ,[Fecha]
      ,[TipodePago]
      ,[DocumentoCliente]
      ,[NombreCliente]
      ,[Subtotal]
      ,[Descuento]
      ,[IVA]
      ,[TotalDescuento]
      ,[TotalImpuesto]
      ,[Total]
  FROM [PruebaTecnica].[dbo].[Facturas]
END
GO
USE [master]
GO
ALTER DATABASE [PruebaTecnica] SET  READ_WRITE 
GO
