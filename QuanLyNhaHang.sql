USE [master]
GO
/****** Object:  Database [QuanLyNhaHang]    Script Date: 01/31/2021 21:14:35 ******/
CREATE DATABASE [QuanLyNhaHang] ON  PRIMARY 
( NAME = N'QuanLyNhaHang', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\QuanLyNhaHang.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyNhaHang_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\QuanLyNhaHang_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyNhaHang] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyNhaHang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyNhaHang] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [QuanLyNhaHang] SET ANSI_NULLS OFF
GO
ALTER DATABASE [QuanLyNhaHang] SET ANSI_PADDING OFF
GO
ALTER DATABASE [QuanLyNhaHang] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [QuanLyNhaHang] SET ARITHABORT OFF
GO
ALTER DATABASE [QuanLyNhaHang] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [QuanLyNhaHang] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [QuanLyNhaHang] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [QuanLyNhaHang] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [QuanLyNhaHang] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [QuanLyNhaHang] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [QuanLyNhaHang] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [QuanLyNhaHang] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [QuanLyNhaHang] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [QuanLyNhaHang] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [QuanLyNhaHang] SET  DISABLE_BROKER
GO
ALTER DATABASE [QuanLyNhaHang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [QuanLyNhaHang] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [QuanLyNhaHang] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [QuanLyNhaHang] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [QuanLyNhaHang] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [QuanLyNhaHang] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [QuanLyNhaHang] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [QuanLyNhaHang] SET  READ_WRITE
GO
ALTER DATABASE [QuanLyNhaHang] SET RECOVERY SIMPLE
GO
ALTER DATABASE [QuanLyNhaHang] SET  MULTI_USER
GO
ALTER DATABASE [QuanLyNhaHang] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [QuanLyNhaHang] SET DB_CHAINING OFF
GO
USE [QuanLyNhaHang]
GO
/****** Object:  User [new_res]    Script Date: 01/31/2021 21:14:35 ******/
CREATE USER [new_res] FOR LOGIN [MINH] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [new]    Script Date: 01/31/2021 21:14:35 ******/
CREATE USER [new] FOR LOGIN [admin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [admin]    Script Date: 01/31/2021 21:14:35 ******/
CREATE USER [admin] FOR LOGIN [PHANMINH] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Role [abc]    Script Date: 01/31/2021 21:14:35 ******/
CREATE ROLE [abc] AUTHORIZATION [admin]
GO
/****** Object:  Role [new_ress]    Script Date: 01/31/2021 21:14:35 ******/
CREATE ROLE [new_ress] AUTHORIZATION [admin]
GO
/****** Object:  Role [new_role]    Script Date: 01/31/2021 21:14:35 ******/
CREATE ROLE [new_role] AUTHORIZATION [admin]
GO
/****** Object:  Role [test]    Script Date: 01/31/2021 21:14:35 ******/
CREATE ROLE [test] AUTHORIZATION [admin]
GO
/****** Object:  Table [dbo].[NhomMonAn]    Script Date: 01/31/2021 21:14:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhomMonAn](
	[MaNhomMA] [varchar](10) NOT NULL,
	[TenNhomMA] [nvarchar](50) NULL,
 CONSTRAINT [PK_NhomMonAn] PRIMARY KEY CLUSTERED 
(
	[MaNhomMA] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[SuaYeuCauMonAn]    Script Date: 01/31/2021 21:14:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SuaYeuCauMonAn](@MaHD varchar(10),@MaMA varchar(10), @DonGiaMA int,
			@SoLuongMA int,@DaPhucVu int,@ChuaPhucVu int,@TrangThai bit)
AS
BEGIN
UPDATE [QuanLyNhaHang].[dbo].[YeuCauMonAn]
   SET [MaHD] = @MaHD
      ,[MaMA] = @MaMA
      ,[DonGiaMA] = @DonGiaMA
      ,[SoLuongMA] = @SoLuongMA
      ,[DaPhucVu] = @DaPhucVu
      ,[ChuaPhucVu] = @ChuaPhucVu
      ,[TrangThai] = @TrangThai
 WHERE	[MaHD] = @MaHD and [MaMA] = @MaMA
END
GO
/****** Object:  UserDefinedFunction [dbo].[TongTienHoaDon]    Script Date: 01/31/2021 21:14:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TongTienHoaDon](@MaHD varchar(10))
RETURNS INT AS
BEGIN
	DECLARE @tong INT
	SELECT @Tong=SUM(Y.DonGiaMA*Y.SoLuongMA)
	FROM YeuCauMonAn Y
	WHERE @MaHD=Y.MaHD
	RETURN @Tong
END
GO
/****** Object:  Table [dbo].[ThucPham]    Script Date: 01/31/2021 21:14:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ThucPham](
	[MaTP] [varchar](10) NOT NULL,
	[TenTP] [nvarchar](50) NULL,
	[DVTinh] [nvarchar](10) NULL,
	[GiaBan] [int] NULL,
 CONSTRAINT [PK_ThucPham] PRIMARY KEY CLUSTERED 
(
	[MaTP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[ThemYeuCauMonAn]    Script Date: 01/31/2021 21:14:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ThemYeuCauMonAn](@MaHD varchar(10),@MaMA varchar(10), @DonGiaMA int,
			@SoLuongMA int,@DaPhucVu int,@ChuaPhucVu int,@TrangThai bit)
AS
BEGIN
IF TRIGGER_NESTLEVEL()>1
	return
INSERT INTO [QuanLyNhaHang].[dbo].[YeuCauMonAn]
           ([MaHD]
           ,[MaMA]
           ,[DonGiaMA]
           ,[SoLuongMA]
           ,[DaPhucVu]
           ,[ChuaPhucVu]
           ,[TrangThai])
     VALUES
           (@MaHD
           ,@MaMA
           ,@DonGiaMA
           ,@SoLuongMA
           ,@DaPhucVu
           ,@ChuaPhucVu
           ,@TrangThai)

END
GO
/****** Object:  StoredProcedure [dbo].[ThemMonAn]    Script Date: 01/31/2021 21:14:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ThemMonAn](@MaHD varchar(10),@MaNhomMA varchar(10), @DonGiaMA int,@SoLuongMA int,@DaPhucVu int,@ChuaPhucVu int,@TrangThai bit)
AS
BEGIN
INSERT INTO [QuanLyNhaHang].[dbo].[YeuCauMonAn]
           ([MaHD]
           ,[MaMA]
           ,[DonGiaMA]
           ,[SoLuongMA]
           ,[DaPhucVu]
           ,[ChuaPhucVu]
           ,[TrangThai])
     VALUES
           (@MaHD
           ,@MaNhomMA
           ,@DonGiaMA
           ,@SoLuongMA
           ,@DaPhucVu
           ,@ChuaPhucVu
           ,@TrangThai)
END
GO
/****** Object:  Table [dbo].[ChiNhanh]    Script Date: 01/31/2021 21:14:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiNhanh](
	[MaCN] [varchar](10) NOT NULL,
	[TenCN] [nvarchar](50) NULL,
	[DiaChiCN] [nvarchar](100) NULL,
 CONSTRAINT [PK_ChiNhanh] PRIMARY KEY CLUSTERED 
(
	[MaCN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BoPhanNhanVien]    Script Date: 01/31/2021 21:14:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BoPhanNhanVien](
	[MaBP] [varchar](10) NOT NULL,
	[TenBP] [nvarchar](50) NULL,
 CONSTRAINT [PK_BoPhanNhanVien] PRIMARY KEY CLUSTERED 
(
	[MaBP] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 01/31/2021 21:14:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [varchar](10) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[DiaChiKH] [nvarchar](100) NULL,
	[SDT] [text] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 01/31/2021 21:14:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [varchar](10) NOT NULL,
	[TenNCC] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](100) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 01/31/2021 21:14:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [varchar](10) NOT NULL,
	[HoTenNV] [nvarchar](100) NULL,
	[Luong] [int] NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nvarchar](20) NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[MaCN] [varchar](10) NULL,
	[MaBP] [varchar](10) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MonAn]    Script Date: 01/31/2021 21:14:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MonAn](
	[MaMA] [varchar](10) NOT NULL,
	[TenMA] [nvarchar](50) NOT NULL,
	[DVT] [nvarchar](10) NULL,
	[GiaBan] [int] NULL,
	[MaNhomMA] [varchar](10) NULL,
	[TrangThai] [nvarchar](50) NULL,
 CONSTRAINT [PK_MonAn] PRIMARY KEY CLUSTERED 
(
	[MaMA] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhieuYeuCau]    Script Date: 01/31/2021 21:14:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhieuYeuCau](
	[MaPYC] [varchar](10) NOT NULL,
	[MaNV] [varchar](10) NULL,
	[NgayYC] [datetime] NULL,
 CONSTRAINT [PK_PhieuYeuCau] PRIMARY KEY CLUSTERED 
(
	[MaPYC] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhieuNhapThucPham]    Script Date: 01/31/2021 21:14:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhieuNhapThucPham](
	[MaPhieu] [varchar](50) NOT NULL,
	[TenPhieu] [nvarchar](50) NULL,
	[NgayNhapPhieu] [date] NULL,
	[MaNV] [varchar](10) NULL,
	[MaNCC] [varchar](10) NULL,
 CONSTRAINT [PK_PhieuNhapThucPham] PRIMARY KEY CLUSTERED 
(
	[MaPhieu] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[ThemMoiMonAn]    Script Date: 01/31/2021 21:14:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ThemMoiMonAn](@MaMA varchar(10),@TenMA nvarchar(50),@DVT nvarchar(10),@GiaBan int,@MaNhomMA varchar(10),@TrangThaiMonAn bit)
AS
BEGIN
INSERT INTO [QuanLyNhaHang].[dbo].[MonAn]
           ([MaMA]
           ,[TenMA]
           ,[DVT]
           ,[GiaBan]
           ,[MaNhomMA]
           ,[TrangThaiMonAn])
     VALUES
           (@MaMA
           ,@TenMA
           ,@DVT
           ,@GiaBan
           ,@MaNhomMA
           ,@TrangThaiMonAn)
END
GO
/****** Object:  UserDefinedFunction [dbo].[SoLuongOrder]    Script Date: 01/31/2021 21:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SoLuongOrder]()
RETURNS TABLE RETURN
	SELECT M.MaMA,M.TenMA, COUNT(Y.MaMA) AS SoLuong
	FROM YeuCauMonAn Y INNER JOIN MonAn M ON Y.MaMA=M.MaMA
	GROUP BY M.MaMA,M.TenMA

--EXECUTE SELECT * FROM SoLuongOrder
GO
/****** Object:  StoredProcedure [dbo].[TrangThaiMonAn]    Script Date: 01/31/2021 21:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TrangThaiMonAn](@MaMA varchar(10),@TenMA nvarchar(50),@DVT nvarchar(10),@GiaBan int,@MaNhomMA varchar(10),@TrangThaiMonAn bit,@TrangThai bit)
AS
BEGIN
UPDATE [QuanLyNhaHang].[dbo].[MonAn]
 --  SET [TrangThai] = N'Đã phục vụ'
 --WHERE (TrangThaiMonAn=1)
 SET [TrangThai] = N'Chưa phục vụ'
 WHERE (TrangThaiMonAn=0)

END
GO
/****** Object:  Table [dbo].[BanAn]    Script Date: 01/31/2021 21:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BanAn](
	[MaBan] [varchar](10) NOT NULL,
	[Tang] [varchar](3) NULL,
	[Kieuban] [nvarchar](50) NULL,
	[MaPYC] [varchar](10) NULL,
 CONSTRAINT [PK_BanAn] PRIMARY KEY CLUSTERED 
(
	[MaBan] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[SoLanCungCap]    Script Date: 01/31/2021 21:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SoLanCungCap](@MaNCC varchar(10))
RETURNS INT AS
BEGIN
	DECLARE @SoLan INT
	SELECT @SoLan=COUNT(P.MaNCC)
	FROM PhieuNhapThucPham P
	WHERE P.MaNCC=@MaNCC
	RETURN @SoLan
END
GO
/****** Object:  StoredProcedure [dbo].[NhapThucPham]    Script Date: 01/31/2021 21:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[NhapThucPham](@MaPhieu varchar(50),@TenPhieu nvarchar(50), @NgayNhapPhieu date,@MaNV varchar(10),@MaNCC varchar(10))
AS
BEGIN
INSERT INTO [QuanLyNhaHang].[dbo].[PhieuNhapThucPham]
           ([MaPhieu]
           ,[TenPhieu]
           ,[NgayNhapPhieu]
           ,[MaNV]
           ,[MaNCC])
     VALUES
           (@MaPhieu
           ,@TenPhieu
           ,@NgayNhapPhieu
           ,@MaNV
           ,@MaNCC)
END
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 01/31/2021 21:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [varchar](10) NOT NULL,
	[NgayHD] [date] NULL,
	[MaNV] [varchar](10) NULL,
	[MaKH] [varchar](10) NULL,
	[MaPYC] [varchar](10) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietYeuCau]    Script Date: 01/31/2021 21:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiTietYeuCau](
	[MaPYC] [varchar](10) NOT NULL,
	[MaMA] [varchar](10) NOT NULL,
	[DonGiaMA] [int] NULL,
	[SoLuongMA] [int] NULL,
 CONSTRAINT [PK_YeuCauMonAn] PRIMARY KEY CLUSTERED 
(
	[MaPYC] ASC,
	[MaMA] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietThucPham]    Script Date: 01/31/2021 21:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiTietThucPham](
	[MaTP] [varchar](10) NOT NULL,
	[MaPhieu] [varchar](50) NOT NULL,
	[SoLuongTP] [int] NULL,
	[DonGiaTP] [int] NULL,
 CONSTRAINT [PK_ChiTietThucPham] PRIMARY KEY CLUSTERED 
(
	[MaTP] ASC,
	[MaPhieu] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[BaoCaoHoaDon]    Script Date: 01/31/2021 21:14:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[BaoCaoHoaDon](@MaHD varchar(10),@NgayHD date,@TenHD nvarchar(50),@MaNV varchar(10),@MaKH varchar(10),@TrangThai bit)
AS
BEGIN
INSERT INTO [QuanLyNhaHang].[dbo].[HoaDon]
           (MaHD
           ,NgayHD
           ,TenHD
           ,MaNV
           ,MaKH
           ,TrangThai)
     VALUES
           (@MaHD,@NgayHD,@TenHD,@MaNV,@MaKH,@TrangThai)
END
GO
/****** Object:  ForeignKey [FK__NhanVien__MaBP__693CA210]    Script Date: 01/31/2021 21:14:39 ******/
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK__NhanVien__MaBP__693CA210] FOREIGN KEY([MaBP])
REFERENCES [dbo].[BoPhanNhanVien] ([MaBP])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK__NhanVien__MaBP__693CA210]
GO
/****** Object:  ForeignKey [FK__NhanVien__MaCN__68487DD7]    Script Date: 01/31/2021 21:14:39 ******/
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK__NhanVien__MaCN__68487DD7] FOREIGN KEY([MaCN])
REFERENCES [dbo].[ChiNhanh] ([MaCN])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK__NhanVien__MaCN__68487DD7]
GO
/****** Object:  ForeignKey [FK_MonAn_NhomMonAn]    Script Date: 01/31/2021 21:14:39 ******/
ALTER TABLE [dbo].[MonAn]  WITH CHECK ADD  CONSTRAINT [FK_MonAn_NhomMonAn] FOREIGN KEY([MaNhomMA])
REFERENCES [dbo].[NhomMonAn] ([MaNhomMA])
GO
ALTER TABLE [dbo].[MonAn] CHECK CONSTRAINT [FK_MonAn_NhomMonAn]
GO
/****** Object:  ForeignKey [FK_PhieuYeuCau_NhanVien]    Script Date: 01/31/2021 21:14:39 ******/
ALTER TABLE [dbo].[PhieuYeuCau]  WITH CHECK ADD  CONSTRAINT [FK_PhieuYeuCau_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhieuYeuCau] CHECK CONSTRAINT [FK_PhieuYeuCau_NhanVien]
GO
/****** Object:  ForeignKey [FK__PhieuNhap__MaNCC__6D0D32F4]    Script Date: 01/31/2021 21:14:39 ******/
ALTER TABLE [dbo].[PhieuNhapThucPham]  WITH CHECK ADD  CONSTRAINT [FK__PhieuNhap__MaNCC__6D0D32F4] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[PhieuNhapThucPham] CHECK CONSTRAINT [FK__PhieuNhap__MaNCC__6D0D32F4]
GO
/****** Object:  ForeignKey [FK__PhieuNhapT__MaNV__6C190EBB]    Script Date: 01/31/2021 21:14:39 ******/
ALTER TABLE [dbo].[PhieuNhapThucPham]  WITH CHECK ADD  CONSTRAINT [FK__PhieuNhapT__MaNV__6C190EBB] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhieuNhapThucPham] CHECK CONSTRAINT [FK__PhieuNhapT__MaNV__6C190EBB]
GO
/****** Object:  ForeignKey [FK_BanAn_PhieuYeuCau]    Script Date: 01/31/2021 21:14:40 ******/
ALTER TABLE [dbo].[BanAn]  WITH CHECK ADD  CONSTRAINT [FK_BanAn_PhieuYeuCau] FOREIGN KEY([MaPYC])
REFERENCES [dbo].[PhieuYeuCau] ([MaPYC])
GO
ALTER TABLE [dbo].[BanAn] CHECK CONSTRAINT [FK_BanAn_PhieuYeuCau]
GO
/****** Object:  ForeignKey [FK__HoaDon__MaKH__6EF57B66]    Script Date: 01/31/2021 21:14:40 ******/
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK__HoaDon__MaKH__6EF57B66] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK__HoaDon__MaKH__6EF57B66]
GO
/****** Object:  ForeignKey [FK__HoaDon__MaNV__6E01572D]    Script Date: 01/31/2021 21:14:40 ******/
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK__HoaDon__MaNV__6E01572D] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK__HoaDon__MaNV__6E01572D]
GO
/****** Object:  ForeignKey [FK_HoaDon_PhieuYeuCau]    Script Date: 01/31/2021 21:14:40 ******/
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_PhieuYeuCau] FOREIGN KEY([MaPYC])
REFERENCES [dbo].[PhieuYeuCau] ([MaPYC])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_PhieuYeuCau]
GO
/****** Object:  ForeignKey [FK_YeuCauMonAn_MonAn]    Script Date: 01/31/2021 21:14:40 ******/
ALTER TABLE [dbo].[ChiTietYeuCau]  WITH CHECK ADD  CONSTRAINT [FK_YeuCauMonAn_MonAn] FOREIGN KEY([MaMA])
REFERENCES [dbo].[MonAn] ([MaMA])
GO
ALTER TABLE [dbo].[ChiTietYeuCau] CHECK CONSTRAINT [FK_YeuCauMonAn_MonAn]
GO
/****** Object:  ForeignKey [FK_YeuCauMonAn_PhieuYeuCau]    Script Date: 01/31/2021 21:14:40 ******/
ALTER TABLE [dbo].[ChiTietYeuCau]  WITH CHECK ADD  CONSTRAINT [FK_YeuCauMonAn_PhieuYeuCau] FOREIGN KEY([MaPYC])
REFERENCES [dbo].[PhieuYeuCau] ([MaPYC])
GO
ALTER TABLE [dbo].[ChiTietYeuCau] CHECK CONSTRAINT [FK_YeuCauMonAn_PhieuYeuCau]
GO
/****** Object:  ForeignKey [FK_ChiTietThucPham_PhieuNhapThucPham]    Script Date: 01/31/2021 21:14:40 ******/
ALTER TABLE [dbo].[ChiTietThucPham]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietThucPham_PhieuNhapThucPham] FOREIGN KEY([MaPhieu])
REFERENCES [dbo].[PhieuNhapThucPham] ([MaPhieu])
GO
ALTER TABLE [dbo].[ChiTietThucPham] CHECK CONSTRAINT [FK_ChiTietThucPham_PhieuNhapThucPham]
GO
/****** Object:  ForeignKey [MaTP]    Script Date: 01/31/2021 21:14:40 ******/
ALTER TABLE [dbo].[ChiTietThucPham]  WITH CHECK ADD  CONSTRAINT [MaTP] FOREIGN KEY([MaTP])
REFERENCES [dbo].[ThucPham] ([MaTP])
GO
ALTER TABLE [dbo].[ChiTietThucPham] CHECK CONSTRAINT [MaTP]
GO
