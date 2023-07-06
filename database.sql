USE [master]
GO
/****** Object:  Database [tintucgame2]    Script Date: 6/11/2022 4:42:01 PM ******/
CREATE DATABASE [tintucgame2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tintucgame2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\tintucgame2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tintucgame2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\tintucgame2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [tintucgame2] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tintucgame2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tintucgame2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tintucgame2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tintucgame2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tintucgame2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tintucgame2] SET ARITHABORT OFF 
GO
ALTER DATABASE [tintucgame2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tintucgame2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tintucgame2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tintucgame2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tintucgame2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tintucgame2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tintucgame2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tintucgame2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tintucgame2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tintucgame2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tintucgame2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tintucgame2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tintucgame2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tintucgame2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tintucgame2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tintucgame2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tintucgame2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tintucgame2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [tintucgame2] SET  MULTI_USER 
GO
ALTER DATABASE [tintucgame2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tintucgame2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tintucgame2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tintucgame2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tintucgame2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [tintucgame2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [tintucgame2] SET QUERY_STORE = OFF
GO
USE [tintucgame2]
GO
/****** Object:  Table [dbo].[category]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [char](36) NOT NULL,
	[title] [nvarchar](250) NULL,
	[description] [ntext] NULL,
	[metatitle] [nvarchar](250) NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feed]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feed](
	[id] [char](36) NOT NULL,
	[user_id] [char](36) NULL,
	[post_id] [char](36) NULL,
	[content] [ntext] NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_feed] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post](
	[id] [char](36) NOT NULL,
	[title] [ntext] NULL,
	[small_category_id] [char](36) NULL,
	[metatitle] [nvarchar](550) NULL,
	[description] [ntext] NULL,
	[content] [ntext] NULL,
	[created_at] [datetime] NULL,
	[author] [char](36) NULL,
	[image] [ntext] NULL,
	[status] [nvarchar](50) NULL,
	[view] [int] NULL,
 CONSTRAINT [PK_post] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[small_category]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[small_category](
	[id] [char](36) NOT NULL,
	[category_id] [char](36) NULL,
	[title] [nvarchar](250) NULL,
	[description] [ntext] NULL,
	[metatitle] [nvarchar](250) NULL,
 CONSTRAINT [PK_small_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [char](36) NOT NULL,
	[hoten] [nvarchar](50) NULL,
	[ngaysinh] [date] NULL,
	[diachi] [nvarchar](250) NULL,
	[gioitinh] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[taikhoan] [nvarchar](50) NULL,
	[matkhau] [nvarchar](50) NULL,
	[role] [varchar](50) NULL,
	[token] [nvarchar](250) NULL,
	[image] [nvarchar](250) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[category] ([id], [title], [description], [metatitle]) VALUES (N'501dbf18-bdaf-4f7d-afca-105e070b41c3', N'PS4', N'Game trên nền tảng tay cầm PS4.', N'ps4')
INSERT [dbo].[category] ([id], [title], [description], [metatitle]) VALUES (N'5550d05b-482e-4bf4-a948-7adebe8205c7', N'PS5', N'Game trên nền tảng tay cầm PS5.', N'ps5')
INSERT [dbo].[category] ([id], [title], [description], [metatitle]) VALUES (N'9242d338-9cb3-43f7-9e99-5e0d6cc5cb5e', N'Máy tính/PC', N'Game trên nền tảng máy tính, PC.', N'may-tinh-pc')
INSERT [dbo].[category] ([id], [title], [description], [metatitle]) VALUES (N'ba7d8d18-ba4c-4172-afef-df65919d59b8', N'Điện thoại/Mobile', N'Game trên nền tảng điện thoại di động, mobile.', N'dien-thoai')
INSERT [dbo].[category] ([id], [title], [description], [metatitle]) VALUES (N'f6a13420-cc9e-446c-aeac-0705bfa82d0f', N'Xbox', N'Game trên nền tảng tay cầm Xbox của Microsoft.', N'x-box')
GO
INSERT [dbo].[post] ([id], [title], [small_category_id], [metatitle], [description], [content], [created_at], [author], [image], [status], [view]) VALUES (N'02789178-a91c-46ec-b78e-fd7cb9ebed5f', N'\"Đè đầu\" eFootball, FIFA 22 nhận mưa lời khen trên Steam', N'25d00f0f-7ffa-49f3-bfb5-9ff2dcd5d541', N'de-dau-efootball-fifa-22-nhan-mua-loi-khen-tren-steam', N'<p>FIFA 22 nhận mưa lời khen tr&ecirc;n Steam.</p>', N'<h2>FIFA 22 nhận mưa lời khen tr&ecirc;n Steam.</h2><ul></ul><p>Trong khi tựa game eFootball 2022 mới đ&acirc;y của Konami trở th&agrave;nh một &quot;thảm họa&quot; ng&agrave;nh c&ocirc;ng nghiệp game, th&igrave; mới đ&acirc;y &quot;đối thủ truyền kiếp&quot; của PES (giờ đ&acirc;y đổi t&ecirc;n th&agrave;nh eFootball) l&agrave; FIFA 22 đ&atilde; nhận được rất nhiều đ&aacute;nh gi&aacute; t&iacute;ch cực của giới chuy&ecirc;n m&ocirc;n cũng như cộng đồng game thủ tr&ecirc;n to&agrave;n thế giới. Với m&agrave;n ch&agrave;o s&acirc;n cực tệ của đối thủ eFootball 2022 th&igrave; FIFA 22 c&oacute; thể dễ d&agrave;ng trở th&agrave;nh tựa game b&oacute;ng đ&aacute; hay nhất năm 2021.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2021/10/4/photo-1-1633357910406683796658.jpg\" target=\"_blank\"><img alt=\"Đè đầu eFootball, FIFA 22 nhận mưa lời khen trên Steam - Ảnh 1.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2021/10/4/photo-1-1633357910406683796658.jpg\" /></a></p><p>Theo đ&oacute; FIFA 22 của EA đ&atilde; ch&iacute;nh thức ph&aacute;t h&agrave;nh tr&ecirc;n nền tảng Steam v&agrave;o ng&agrave;y 30 th&aacute;ng 9 vừa qua. Hiện tại, hơn 700 người chơi đ&atilde; đưa ra đ&aacute;nh gi&aacute; cho tựa game n&agrave;y với tỷ lệ người chơi khen ngợi l&agrave; 77%. Đ&aacute;nh gi&aacute; tổng thể cho FIFA 22 cho đến nay l&agrave; Very Positive (rất t&iacute;ch cực) cho thấy th&agrave;nh c&ocirc;ng của FIFA 22 năm nay lớn như thế n&agrave;o. Nhiều game thủ cho rằng FIFA 22 tiếp tục phong c&aacute;ch thể thao cổ điển của d&ograve;ng game, hơn nữa chế độ nghề nghiệp cũng đ&atilde; được n&acirc;ng cấp so với thế hệ trước.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2021/10/4/photo-1-1633357911567114783006.jpg\" target=\"_blank\"><img alt=\"Đè đầu eFootball, FIFA 22 nhận mưa lời khen trên Steam - Ảnh 2.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2021/10/4/photo-1-1633357911567114783006.jpg\" /></a></p><p>Về đ&aacute;nh gi&aacute; kh&ocirc;ng tốt, nhiều game thủ cho rằng FIFA 22 n&agrave;y đ&atilde; kế thừa đặc điểm của series cũng như những khuyết điểm của series - thay đổi giao diện game, c&acirc;n bằng k&eacute;m, v.v. Cũng c&oacute; game thủ cho biết rằng độ tối ưu h&oacute;a tr&ecirc;n phi&ecirc;n bản PC l&agrave; k&eacute;m khi một số nội dung trong game c&oacute; lỗi v&agrave; tạo h&igrave;nh nh&acirc;n vật &quot;qu&aacute; b&eacute;o&quot;. Tuy nhi&ecirc;n nhưng đ&aacute;nh gi&aacute; ti&ecirc;u cực n&agrave;y rất &iacute;t v&agrave; kh&ocirc;ng đ&aacute;ng kể so với những đ&aacute;nh gi&aacute; t&iacute;ch cực.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2021/10/4/photo-2-1633357912113668435550.jpg\" target=\"_blank\"><img alt=\"Đè đầu eFootball, FIFA 22 nhận mưa lời khen trên Steam - Ảnh 3.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2021/10/4/photo-2-1633357912113668435550.jpg\" /></a></p><p>Trong khi đ&oacute;, đối thủ truyền kiếp&quot; của FIFA l&agrave; PES (giờ đ&acirc;y đổi t&ecirc;n th&agrave;nh eFootball) đ&atilde; c&oacute; một m&agrave;n ch&agrave;o s&acirc;n cực tệ khi mới ra mắt được v&agrave;i ng&agrave;y, eFootball 2022 đ&atilde; trở th&agrave;nh tựa game được đ&aacute;nh gi&aacute; tệ nhất tr&ecirc;n nền tảng Steam. Khi rất nhiều game thủ gặp lỗi về cầu thủ, gameplay, đồ họa,v.v.....Thật may khi FIFA 22 kh&ocirc;ng gặp phải những lỗi ngớ ngẩn như tr&ecirc;n.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2021/10/4/photo-3-1633357911612247329196.jpg\" target=\"_blank\"><img alt=\"Đè đầu eFootball, FIFA 22 nhận mưa lời khen trên Steam - Ảnh 4.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2021/10/4/photo-3-1633357911612247329196.jpg\" /></a></p><p>FIFA 22 hiện đ&atilde; ch&iacute;nh thức c&oacute; sẵn tr&ecirc;n c&aacute;c nền tảng PC, PS4, PS5, Xbox One, XSX / S, Stadia v&agrave; Switch. Tựa game hiện được b&aacute;n tr&ecirc;n Steam với gi&aacute; 990.000 VNĐ, game thủ quan t&acirc;m c&oacute; thể tải game theo đường link&nbsp;<a href="https://store.steampowered.com/app/1506830/FIFA_22/\" target=\"_blank\">dưới đ&acirc;y</a>.</p>', CAST(N'2022-06-08T15:18:58.000' AS DateTime), N'94badfa9-d935-4c16-b58c-814c9bcbe3e7', N'/posts/anh25.jpg', N'live', 0)
INSERT [dbo].[post] ([id], [title], [small_category_id], [metatitle], [description], [content], [created_at], [author], [image], [status], [view]) VALUES (N'0e923378-caa0-4bf3-b641-590e533a9e42', N'FIFA Online 4: Lingardinho \"nhảy múa\" cùng các siêu sao trong mua thẻ mới Legend of Loan', N'69f1b251-a914-4311-bb7e-174316333d70', N'fifa-online-4-lingardinho-nhay-mua-cung-cac-sieu-sao-trong-mua-the-moi-legend-of-loan', N'<p>Kh&ocirc;ng ph?i d? c&aacute;c game th? d?i qu&aacute; l&acirc;u, FIFA Online 4 ch&iacute;nh th?c cho ra m?t m&ugrave;a th? Legend of the Loan (LOL) v?i s? hi?n di?n c?a r?t nhi?u ng&ocirc;i sao d&igrave;nh d&aacute;m trong l&agrave;ng b&oacute;ng d&aacute; th? gi?i d&atilde; t?a s&aacute;ng du?i d?ng cho mu?n t?i CLB m?i.</p>', N'<h2><strong>Kh&ocirc;ng phải để c&aacute;c game thủ đợi qu&aacute; l&acirc;u, FIFA Online 4 ch&iacute;nh thức cho ra mắt m&ugrave;a thẻ Legend of the Loan (LOL) với sự hiện diện của rất nhiều ng&ocirc;i sao đ&igrave;nh đ&aacute;m trong l&agrave;ng b&oacute;ng đ&aacute; thế giới đ&atilde; tỏa s&aacute;ng dưới dạng cho mượn tại CLB mới.</strong></h2><p>H&atilde;y c&ugrave;ng kh&aacute;m ph&aacute; những c&aacute;i t&ecirc;n trong m&ugrave;a thẻ LOL hứa hẹn sẽ khuấy đảo tựa game b&oacute;ng đ&aacute; đ&igrave;nh đ&aacute;m n&agrave;y trong thời gian tới nh&eacute;!</p><p><strong>JESE LINGARD - KHI LINGARDINHO KH&Ocirc;NG C&Ograve;N TẤU H&Agrave;I</strong></p><p>Kh&ocirc;ng qu&aacute; kh&oacute; hiểu, khi cầu thủ sinh năm 1992 thuộc h&agrave;ng Top Players trong m&ugrave;a thẻ LOL sắp cập bến đến Việt Nam trong bản cập nhật tới. M&agrave;n tr&igrave;nh diễn ấn tượng của Lingard tại The Hammers dưới dạng cho mượn ở giai đoạn cuối m&ugrave;a giải 2020/2021 với 9 b&agrave;n thắng c&ugrave;ng 5 đường kiến tạo gi&uacute;p anh sở hữu OVR l&ecirc;n đến 106 ở m&ugrave;a thẻ LOL.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/11/photo-1-16522790119612045393784.jpg\" target=\"_blank\"><img alt=\"FIFA Online 4: Lingardinho nhảy múa cùng các siêu sao trong mua thẻ mới Legend of Loan - Ảnh 3.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/11/photo-1-16522790119612045393784.jpg\" /></a></p><p>Với team color MU, 2 ch&acirc;n 5-5 v&agrave; tố chất &quot;diễn h&agrave;i&quot; của m&igrave;nh, &quot;Lingardinho&quot; hứa hẹn sẽ l&agrave; một trong những quốc d&acirc;n tiếp theo cho c&aacute;c game thủ tại FIFA Online 4.</p><p><strong>CAVANI &amp; IBRAHIMOVIC - BỘ Đ&Ocirc;I TH&Aacute;CH THỨC MỌI H&Agrave;NG THỦ</strong></p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/11/photo-2-16522790119451957662792.jpg\" target=\"_blank\"><img alt=\"FIFA Online 4: Lingardinho nhảy múa cùng các siêu sao trong mua thẻ mới Legend of Loan - Ảnh 4.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/11/photo-2-16522790119451957662792.jpg\" /></a></p><p>Trong m&ugrave;a thẻ LOL, cả hai đều sở hữu OVR 107 c&ugrave;ng khả năng đ&aacute;nh đầu thượng hạng, chắc chắn đ&acirc;y sẽ l&agrave; những sự n&acirc;ng cấp l&yacute; tưởng cho h&agrave;ng c&ocirc;ng team color MU, PSG hay Milan.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/11/photo-3-165227901250257050102.jpg\" target=\"_blank\"><img alt=\"FIFA Online 4: Lingardinho nhảy múa cùng các siêu sao trong mua thẻ mới Legend of Loan - Ảnh 5.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/11/photo-3-165227901250257050102.jpg\" /></a></p><p>Nếu bạn đ&atilde; qu&aacute; ng&aacute;n ngẩm những đội h&igrave;nh hay team color Quốc d&acirc;n với Gullit, CR7 th&igrave; giờ đ&acirc;y team color LOL sẽ l&agrave; l&agrave;n gi&oacute; mới kh&ocirc;ng thể tuyệt vời hơn cho c&aacute;c game thủ muốn đổi gi&oacute; tại tựa game FO4.</p>', CAST(N'2022-06-08T15:50:32.000' AS DateTime), N'94badfa9-d935-4c16-b58c-814c9bcbe3e7', N'/posts/anh46.jpg', N'pending', 0)
INSERT [dbo].[post] ([id], [title], [small_category_id], [metatitle], [description], [content], [created_at], [author], [image], [status], [view]) VALUES (N'135df0c0-03a5-451b-9501-e9357b7c3426', N'Nguồn gốc và sức mạnh của Vayne Đường Trên - Nỗi ám ảnh thứ hai tại rank LMHT Việt chỉ sau Yasuo', N'0b15399b-1b89-4122-8aeb-ccc9a497e693', N'nguon-goc-va-suc-manh-cua-vayne-duong-tren-noi-am-anh-thu-hai-tai-rank-lmht-viet-chi-sau-yasuo', N'<p>Nguồn gốc v&agrave; sức mạnh của Vayne Đường Tr&ecirc;n - Nỗi &aacute;m ảnh thứ hai tại rank LMHT Việt chỉ sau Yasuo</p>', N'<h2>Vayne Đường Tr&ecirc;n dần dần trở th&agrave;nh một &quot;vấn nạn&quot; mới của rank Việt trong v&agrave;i năm trở lại đ&acirc;y.</h2><ul></ul><p>Trong v&agrave;i năm trở lại đ&acirc;y th&igrave;&nbsp;<a href="https://gamek.vn/vayne.htm\" target=\"_blank\">Vayne</a>&nbsp;Đường Tr&ecirc;n đ&atilde; dần dần trở th&agrave;nh một vấn nạn, một biểu tượng mới của việc &quot;ph&aacute; game&quot; v&agrave;o &quot;ảo tưởng về kỹ năng bản th&acirc;n&quot;. Thậm ch&iacute; lối chơi n&agrave;y c&ograve;n toxic tới mức số lượng game thủ gh&eacute;t Vayne Đường Tr&ecirc;n v&agrave; sẵn s&agrave;ng cấm n&oacute; trong mọi trận đấu đ&atilde; tăng l&ecirc;n ch&oacute;ng mặt, tiệm cận với số người gh&eacute;t Yasuo. Vậy đ&acirc;u l&agrave; nguồn gốc v&agrave; sức mạnh của nỗi &aacute;m ảnh mang t&ecirc;n Vayne Đường Tr&ecirc;n? H&atilde;y c&ugrave;ng t&igrave;m hiểu nh&eacute;.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/4/photo-1-1651631206118704560323.jpg\" target=\"_blank\"><img alt=\"Nguồn gốc và sức mạnh của Vayne Đường Trên - Nỗi ám ảnh thứ hai tại rank LMHT Việt chỉ sau Yasuo - Ảnh 1.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/4/photo-1-1651631206118704560323.jpg\" /></a></p><p>Rất nhiều meme về Vayne Đường Tr&ecirc;n đ&atilde; xuất hiện để cho thấy sự bức x&uacute;c của game thủ về lối chơi n&agrave;y</p><p>Để n&oacute;i về cơn sốt Vayne th&igrave; ch&uacute;ng ta h&atilde;y quay trở lại thời gian một ch&uacute;t về với năm 2013. Đ&acirc;y l&agrave; thời điểm được cho l&agrave; đỉnh cao phong độ của Xạ Thủ huyền thoại người Trung Quốc -&nbsp;<a href="https://gamek.vn/uzi.htm\" target=\"_blank\">Uzi</a>. Tại CKTG 2013, trận b&aacute;n kết giữa Royal Club v&agrave; OMG th&igrave; Uzi đ&atilde; c&oacute; một loạt pha xử l&yacute; kh&ocirc;ng tưởng khi sống s&oacute;t chỉ với một ch&uacute;t m&aacute;u v&agrave; bắn tan n&aacute;t đội h&igrave;nh OMG với Vayne. Kết hợp với việc một &quot;one champ Vayne&quot; v&ocirc; c&ugrave;ng nổi tiếng tr&ecirc;n YouTube khi đ&oacute; l&agrave; Gosu th&igrave; t&igrave;nh y&ecirc;u với c&ocirc; n&agrave;ng Thợ Săn B&oacute;ng Đ&ecirc;m n&agrave;y đ&atilde; b&ugrave;ng ch&aacute;y trong l&ograve;ng game thủ Việt.</p><p>Đương nhi&ecirc;n khi đ&oacute; th&igrave; Vayne vẫn dừng lại ở vị tr&iacute; Đường Dưới v&agrave; cần Hỗ Trợ để bảo k&ecirc;. Tuy nhi&ecirc;n khi LMHT c&agrave;ng ph&aacute;t triển, sự đa dạng chiến thuật được tạo ra th&igrave; Xạ Thủ kh&ocirc;ng chỉ c&oacute; thể chơi ở Đường Dưới nữa. V&agrave; rồi sự xuất hiện của si&ecirc;u sao toplane&nbsp;<a href="https://gamek.vn/theshy.htm\" target=\"_blank\">TheShy</a>&nbsp;như một giọt nước l&agrave;m tr&agrave;n ly vậy. Rất nhiều người đ&atilde; học theo những highlight đ&egrave; đường nghẹt thở, bắn tan n&aacute;t team địch với Vayne của TheShy v&agrave; khiến phong tr&agrave;o cầm c&ocirc; n&agrave;ng Thợ Săn B&oacute;ng Đ&ecirc;m l&ecirc;n top b&ugrave;ng nổ.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/4/photo-1-16516314166755818030.jpg\"><img alt=\"Nguồn gốc và sức mạnh của Vayne Đường Trên - Nỗi ám ảnh thứ hai tại rank LMHT Việt chỉ sau Yasuo - Ảnh 3.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/4/photo-1-16516314166755818030.jpg\" /></a></p><p>Việc được TheShy &quot;dạy hư&quot; đ&atilde; khiến phong tr&agrave;o Vayne Đường Tr&ecirc;n b&ugrave;ng nổ</p><p>Nguồn gốc l&agrave; vậy nhưng sức mạnh của Vayne Đường Tr&ecirc;n l&agrave; g&igrave; m&agrave; khiến n&oacute; trở th&agrave;nh một biểu tượng mới của việc &quot;ph&aacute; game&quot;? Đương nhi&ecirc;n l&agrave; ch&uacute;ng ta sẽ kh&ocirc;ng n&oacute;i tới kỹ năng của Vayne hoạt động ra sao bởi ai cũng biết v&agrave; hiểu hết rồi. Điều khiến Vayne trở th&agrave;nh một nỗi &aacute;c mộng ch&iacute;nh l&agrave; nằm ở việc game thủ sử dụng vị tướng n&agrave;y thường c&oacute; xu hướng tự tin th&aacute;i qu&aacute; v&agrave;o sức mạnh của c&ocirc; n&agrave;ng.</p><p>Đ&uacute;ng l&agrave; khi nằm trong tay cao thủ th&igrave; Vayne c&oacute; thể đ&egrave; đường một c&aacute;ch v&ocirc; c&ugrave;ng khủng khiếp nhờ sải tay d&agrave;i v&agrave; s&aacute;t thương chuẩn từ kỹ năng W - Mũi T&ecirc;n Bạc. Tuy nhi&ecirc;n người chơi th&ocirc;ng thường lại kh&ocirc;ng học hỏi được c&aacute;ch &quot;auto spacing&quot; hay n&ocirc;m na l&agrave; giữ khoảng c&aacute;ch để c&oacute; thể vừa cấu m&aacute;u đối thủ m&agrave; lại kh&ocirc;ng hề thọt farm. Rất nhiều người chơi chuy&ecirc;n ở vị tr&iacute; toplane c&oacute; thể tận dụng điều n&agrave;y để khiến Vayne Đường Tr&ecirc;n thọt về mặt kinh tế, d&ugrave; nh&igrave;n qua l&agrave; đang thắng lane.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/4/1-1651631553863404667139.png\"><img alt=\"Nguồn gốc và sức mạnh của Vayne Đường Trên - Nỗi ám ảnh thứ hai tại rank LMHT Việt chỉ sau Yasuo - Ảnh 4.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/4/1-1651631553863404667139.png\" /></a></p><p>C&oacute; rất nhiều c&aacute;ch để counter Vayne Đường Tr&ecirc;n chứ lối chơi n&agrave;y kh&ocirc;ng phải l&agrave; &quot;auto win&quot; như nhiều người nghĩ</p><p>Hệ quả l&agrave; rất nhiều người chơi Vayne Đường Tr&ecirc;n rơi v&agrave;o t&igrave;nh trạng bị đối thủ gank, solokill ngược v&agrave; rồi &quot;feed kh&ocirc;ng điểm dừng&quot;. Với một vị tướng chỉ c&oacute; s&aacute;t thương đơn mục ti&ecirc;u v&agrave; kh&ocirc;ng cung cấp độ đa dụng n&agrave;o kh&aacute;c th&igrave; một khi đ&atilde; thọt th&igrave; Vayne Đường Tr&ecirc;n sẽ th&agrave;nh &quot;tạ&quot; v&agrave; chẳng đ&oacute;ng g&oacute;p g&igrave; cho đồng đội. Rơi v&agrave;o t&igrave;nh huống đ&oacute; th&igrave; 4 người c&ograve;n lại trong team r&otilde; r&agrave;ng l&agrave; chẳng vui vẻ g&igrave;, dần dần th&igrave; &aacute;c cảm với lối chơi n&agrave;y cũng v&igrave; thế m&agrave; lớn hơn.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2020/8/28/vayne-15986215917781695699043.jpg\"><img alt=\"Nguồn gốc và sức mạnh của Vayne Đường Trên - Nỗi ám ảnh thứ hai tại rank LMHT Việt chỉ sau Yasuo - Ảnh 5.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2020/8/28/vayne-15986215917781695699043.jpg\" /></a></p><p>Vayne l&agrave; dạng tướng một khi đ&atilde; thọt l&agrave; cực kỳ &quot;tạ&quot; v&agrave; bị đẩy hẳn ra khỏi v&aacute;n đấu, đặc biệt l&agrave; ở vị tr&iacute; Đường Tr&ecirc;n</p><p>V&agrave; rồi như ch&uacute;ng ta đ&atilde; thấy, số lượng người chơi gh&eacute;t Vayne Đường Tr&ecirc;n đ&atilde; ng&agrave;y một trở n&ecirc;n lớn hơn v&agrave; thực tế th&igrave; game thủ c&oacute; l&yacute; do ch&iacute;nh đ&aacute;ng để l&agrave;m vậy. Chẳng ai muốn số phận trận đấu rank &quot;tryhard&quot; của m&igrave;nh bị đặt v&agrave;o tay một lối chơi vừa nhiều rủi ro lại c&ograve;n chẳng gi&uacute;p g&igrave; cho team như Vayne Đường Tr&ecirc;n cả.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/4/2-1651631708433286973964.png\" target=\"_blank\"><img alt=\"Nguồn gốc và sức mạnh của Vayne Đường Trên - Nỗi ám ảnh thứ hai tại rank LMHT Việt chỉ sau Yasuo - Ảnh 6.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/4/2-1651631708433286973964.png\" /></a></p>', CAST(N'2022-06-07T15:23:23.000' AS DateTime), N'94badfa9-d935-4c16-b58c-814c9bcbe3e7', N'/posts/anh26.jpg', N'live', 17)
INSERT [dbo].[post] ([id], [title], [small_category_id], [metatitle], [description], [content], [created_at], [author], [image], [status], [view]) VALUES (N'1790898a-c7f5-452c-a121-b351975998e7', N'10 lý do khiến người chơi cảm thấy Genshin Impact đúng là game đáng đóng tiền mạng (P.2)', N'4227e3dd-3cf1-4930-a579-7b3ff8e632c8', N'10-ly-do-khien-nguoi-choi-cam-thay-genshin-impact-dung-la-game-dang-dong-tien-mang-p2', N'<p>L&ecirc;n mạng l&agrave; phải được chơi những game hay chứ chẳng ai th&iacute;ch tốn thời gian cả.</p>', N'<h2>L&ecirc;n mạng l&agrave; phải được chơi những game hay chứ chẳng ai th&iacute;ch tốn thời gian cả.</h2><ul></ul><p><strong>6. Nh&acirc;n vật ch&iacute;nh c&oacute; hồn hơn</strong></p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/4/25/photo-1-16508767410332077751217.jpg\" target=\"_blank\"><img alt=\"10 lý do khiến người chơi cảm thấy Genshin Impact đúng là game đáng đóng tiền mạng (P.2) - Ảnh 1.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/4/25/photo-1-16508767410332077751217.jpg\" /></a></p><p>Ban đầu, nh&agrave; lữ h&agrave;nh chả kh&aacute;c g&igrave; một thế th&acirc;n của nh&acirc;n vật khi gia nhập v&agrave;o thế giới Teyvat. Thật vậy, nh&acirc;n vật n&agrave;y cũng tỏ ra ngạc nhi&ecirc;n khi được tiếp x&uacute;c với m&ocirc;i trường, con người cũng như những kẻ th&ugrave; trong Genshin. Điều n&agrave;y thật ra kh&ocirc;ng sai, nhưng qu&aacute; nhiều game đ&atilde; l&agrave;m điều n&agrave;y rồi. Việc n&agrave;y l&agrave;m cho người chơi cảm thấy nh&acirc;n vật ch&iacute;nh kh&aacute; hời hợt, bởi họ thiếu niềm tin hoặc cảm x&uacute;c của ri&ecirc;ng họ.</p><p>Tuy nhi&ecirc;n, cho đến phần Inazuma th&igrave; nh&acirc;n vật nh&agrave; lữ h&agrave;nh đ&atilde; được cải thiện một c&aacute;ch đ&aacute;ng kể. Giờ đ&acirc;y, nh&acirc;n vật n&agrave;y đ&atilde; c&oacute; cảm x&uacute;c v&agrave; g&oacute;p phần quan trọng v&agrave; c&acirc;u chuyện, thay v&igrave; chỉ đơn giản l&agrave; bị k&eacute;o v&agrave;o c&acirc;u chuyện v&agrave; tu&acirc;n theo những g&igrave; kẻ kh&aacute;c đưa ra.</p><p><strong>7. C&aacute;c sự kiện d&iacute;nh l&iacute;u tới cốt truyện v&agrave; cả chi tiết về th&acirc;n phận c&aacute;c nh&acirc;n vật&nbsp;</strong></p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/4/25/photo-1-16508796704441291110204.jpg\" target=\"_blank\"><img alt=\"10 lý do khiến người chơi cảm thấy Genshin Impact đúng là game đáng đóng tiền mạng (P.2) - Ảnh 2.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/4/25/photo-1-16508796704441291110204.jpg\" /></a></p><p>Genshin thường xuy&ecirc;n c&oacute; &iacute;t nhất một sự kiện lu&ocirc;n được duy tr&igrave; trong game. Từ những sự kiện nhỏ như nh&acirc;n đ&ocirc;i phần thưởng trong B&iacute; Cảnh hay gấp đ&ocirc;i phần qu&agrave; với Địa Mạch Sinh Th&agrave;nh, thế nhưng tất cả đều c&oacute; chung một thứ - lu&ocirc;n lu&ocirc;n c&oacute; phần qu&agrave; để tặng cho người chơi.</p><p>D&ugrave; vậy, phần thưởng kh&ocirc;ng phải l&agrave; yếu tố lớn nhất. Trong Genshin, tất cả c&aacute;c nh&acirc;n vật tham gia v&agrave;o trong phần cốt truyện của sự kiện ho&agrave;n to&agrave;n c&oacute; thể được tặng cho người chơi như một phần thưởng. C&aacute;c sự kiện cũng rất đa dạng, từ việc chơi trốn t&igrave;m, đi săn hầm ngục cho tới cả việc l&agrave;m pha chế tại quầy bar lu&ocirc;n.&nbsp;</p><p><strong>8. Sở hữu nh&acirc;n vật hay vũ kh&iacute; lu&ocirc;n l&agrave; điều khiến người chơi h&agrave;o hứng</strong></p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/4/25/photo-1-1650876729593757213354.jpg\" target=\"_blank\"><img alt=\"10 lý do khiến người chơi cảm thấy Genshin Impact đúng là game đáng đóng tiền mạng (P.2) - Ảnh 3.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/4/25/photo-1-1650876729593757213354.jpg\" /></a></p><p>Sẽ lu&ocirc;n c&oacute; l&yacute; do để người chơi d&iacute;nh tơi những tựa game gacha v&agrave; đăng nhập đều đặn h&agrave;ng ng&agrave;y v&agrave; l&agrave;m nhiệm vụ, d&ugrave; game gacha vẫn lu&ocirc;n rất t&agrave;n nhẫn với người chơi. Việc quay c&aacute;c nh&acirc;n vật cũng như vũ kh&iacute; lu&ocirc;n ở trong t&igrave;nh trạng ngẫu nhi&ecirc;n, khiến cho người cực kỳ mệt mỏi với việc kh&ocirc;ng quay ra được nh&acirc;n vật như &yacute; muốn.</p><p>Genshin d&ugrave; kh&aacute; &quot;t&agrave;n nhẫn&quot; bởi tỉ lệ ra nh&acirc;n vật 5 sao l&agrave; kh&ocirc;ng hề cao, nhưng c&aacute;c nh&agrave; ph&aacute;t triển cũng biết tạo ra sự kịch t&iacute;nh cho người chơi trong mỗi lần &quot;quay l&ocirc;&quot;. &Aacute;nh s&aacute;ng t&iacute;m sẽ được thay thế bằng &aacute;nh v&agrave;ng rực rỡ, c&ugrave;ng với đ&oacute; l&agrave; phần &acirc;m thanh khiến người chơi nhận ra rằng việc c&oacute; được một nh&acirc;n vật cấp cao l&agrave; kịch t&iacute;nh đến cỡ n&agrave;o.</p><p><strong>9. Hệ thống bảo hiểm h&agrave;o ph&oacute;ng hơn những g&igrave; người chơi tưởng tượng</strong></p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/4/25/photo-1-1650876721528880336003.jpg\" target=\"_blank\"><img alt=\"10 lý do khiến người chơi cảm thấy Genshin Impact đúng là game đáng đóng tiền mạng (P.2) - Ảnh 4.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/4/25/photo-1-1650876721528880336003.jpg\" /></a></p><p>Đầu ti&ecirc;n, ch&uacute;ng ta c&oacute; thể c&ocirc;ng nhận rằng Genshin l&agrave; một tựa game kh&ocirc;ng hề rẻ khi n&oacute;i tới chuyện nạp tiền. Tuy nhi&ecirc;n, với lượng nguy&ecirc;n thạch v&agrave; Mối Duy&ecirc;n Vương Vấn m&agrave; nh&agrave; l&agrave;m game cung cấp cho người chơi th&igrave; mọi thứ kh&ocirc;ng tới nỗi qu&aacute; h&uacute;t m&aacute;u với người chơi free.&nbsp;</p><p>B&ecirc;n cạnh đ&oacute;, hệ thống bảo hiểm của Genshin cũng xứng đ&aacute;ng được nhắc tới. 90 lần để c&oacute; được một nh&acirc;n vật 5 sao, 180 lần tối đa để c&oacute; được nh&acirc;n vật m&agrave; bạn mong muốn r&otilde; r&agrave;ng kh&ocirc;ng phải l&agrave; một con số l&ecirc;n tới mức &quot;v&ocirc; l&yacute;&quot;. Ngo&agrave;i ra, hệ thống bảo hiểm c&ograve;n được chuyển từ nh&acirc;n vật n&agrave;y qua nh&acirc;n vật sau l&agrave; điều &iacute;t game kh&aacute;c d&aacute;m l&agrave;m.&nbsp;</p><p><strong>10. Hệ thống nguy&ecirc;n tố trong game c&oacute; chiều s&acirc;u đ&aacute;ng ngạc nhi&ecirc;n v&agrave; cực kỳ mạnh mẽ</strong></p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/4/25/photo-1-1650876718210610118160.jpg\" target=\"_blank\"><img alt=\"10 lý do khiến người chơi cảm thấy Genshin Impact đúng là game đáng đóng tiền mạng (P.2) - Ảnh 5.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/4/25/photo-1-1650876718210610118160.jpg\" /></a></p><p>C&aacute;ch chiến đấu của Genshin nh&igrave;n qua th&igrave; thấy c&oacute; vẻ rất cơ bản v&agrave; đơn giản, nhưng hệ thống nguy&ecirc;n tố v&agrave; phản ứng lại l&agrave; một thứ rất th&uacute; vị m&agrave; người chơi kh&oacute; c&oacute; thể bỏ qua. C&oacute; rất nhiều yếu tố phức tạp xung quanh việc x&acirc;y dựng team để tạo n&ecirc;n phản ứng nguy&ecirc;n tố dạng chuỗi, thậm ch&iacute; ch&uacute;ng c&ograve;n rất mạnh mẽ nữa.</p><p>Việc c&oacute; thể t&iacute;nh to&aacute;n được hồi chi&ecirc;u của 4 nh&acirc;n vật kh&aacute;c nhau v&agrave; tr&aacute;o đổi một c&aacute;ch hợp l&yacute; l&agrave;m cho game trở n&ecirc;n th&uacute; vị hơn. Genshin l&agrave;m rất tốt khi giữ được sự đơn giản cho người chơi tr&ecirc;n điện thoại dễ d&agrave;ng, nhưng cũng đủ chiều s&acirc;u để c&oacute; thể giữ họ lại v&agrave; đăng nhập h&agrave;ng ng&agrave;y.</p>', CAST(N'2022-06-11T15:20:25.000' AS DateTime), N'94badfa9-d935-4c16-b58c-814c9bcbe3e7', N'/posts/anh35.jpg', N'live', 8)
INSERT [dbo].[post] ([id], [title], [small_category_id], [metatitle], [description], [content], [created_at], [author], [image], [status], [view]) VALUES (N'1d6d7afe-5cc1-461f-b1e6-065449cc2c45', N'dfgh534534', N'0b15399b-1b89-4122-8aeb-ccc9a497e693', N'ghj', N'<p>dfh</p>', N'<h2><strong>D&ugrave; kh&ocirc;ng muốn n&oacute;i ra nhưng c&oacute; lẽ game thủ Li&ecirc;n Qu&acirc;n l&acirc;u năm cũng đủ hiểu rằng mọi thứ đ&atilde; kh&ocirc;ng c&ograve;n được như xưa.</strong></h2><p>C&oacute; thể n&oacute;i, Team Flash l&agrave; một trong những đội tuyển&nbsp;<a href="https://gamek.vn/ke-hoach-tan-hut-cua-lien-quan-va-demon-slayer-van-chua-cham-dut-lan-nay-toi-luot-inosuke-va-zenitsu-20220503115800945.chn\" target=\"_blank\">Li&ecirc;n Qu&acirc;n</a>&nbsp;c&oacute; sức ảnh hưởng lớn nhất tại Việt Nam. Đ&acirc;y cũng l&agrave; đội tuyển c&oacute; lượng fan h&ugrave;ng hậu, l&agrave; người đ&atilde; đưa&nbsp;<a href="https://gamek.vn/ke-hoach-tan-hut-cua-lien-quan-va-demon-slayer-van-chua-cham-dut-lan-nay-toi-luot-inosuke-va-zenitsu-20220503115800945.chn\" target=\"_blank\">Li&ecirc;n Qu&acirc;n</a>&nbsp;l&ecirc;n tới đỉnh cao danh vọng thế giới với hai chức v&ocirc; địch quốc tế trong năm 2019, tạo n&ecirc;n những kỷ lục v&ocirc; tiền kho&aacute;ng hậu.</p><p>Ch&iacute;nh v&igrave; lẽ đ&oacute; n&ecirc;n kh&ocirc;ng kh&oacute; hiểu khi tại sao Team Flash lại c&oacute; sức ảnh hưởng rất lớn tới&nbsp;<a href="https://gamek.vn/ke-hoach-tan-hut-cua-lien-quan-va-demon-slayer-van-chua-cham-dut-lan-nay-toi-luot-inosuke-va-zenitsu-20220503115800945.chn\" target=\"_blank\">Li&ecirc;n Qu&acirc;n</a>&nbsp;Việt v&agrave; giống như một g&atilde; khổng lồ lớn nhất của tựa game MOBA quốc d&acirc;n n&agrave;y. Thế nhưng, d&ugrave; mạnh mẽ đến thế n&agrave;o th&igrave; Team Flash cũng kh&ocirc;ng thể chống lại được quy luật của thời gian, đ&oacute; ch&iacute;nh l&agrave; &ldquo;tre gi&agrave; măng mọc&rdquo; v&agrave; kh&ocirc;ng ai c&oacute; thể m&atilde;i m&atilde;i ngự trị tr&ecirc;n đỉnh cao.<img alt=\"Có lẽ đã đến lúc, fan Liên Quân lâu năm nên chấp nhận một sự thật cay đắng: Đế chế ấy sụp đổ thật rồi - Ảnh 1.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/3/photo-1-16515965478961778449291.jpg\" /></p><p>Team Flash cũng vậy, dấu hiệu của sự bất ổn đ&atilde; tới từ m&ugrave;a giải năm ngo&aacute;i. Tuy vẫn c&ograve;n &iacute;t nhiều th&agrave;nh c&ocirc;ng tại giải quốc nội nhưng tr&ecirc;n trường quốc tế cũng như từ ĐTDV m&ugrave;a Đ&ocirc;ng, mọi thứ đ&atilde; thay đổi ch&oacute;ng mặt. Vẫn l&agrave; những nh&acirc;n tố đ&oacute; nhưng Team Flash kh&ocirc;ng c&ograve;n c&oacute; thể &aacute;p đặt được lối chơi l&ecirc;n c&aacute;c đối thủ của m&igrave;nh, kh&ocirc;ng c&ograve;n l&agrave; một &ocirc;ng lớn khiến cho đối phương phải khiếp sợ.</p><p>Team Flash lần lượt nhận những thất bại muối mặt trước c&aacute;c đối thủ ng&agrave;y c&agrave;ng &ldquo;kinh khủng&rdquo;, từ Saigon Phantom cho tới V Gaming. Tới v&ograve;ng Play-off của ĐTDV m&ugrave;a Xu&acirc;n vừa qua, Team Flash đ&atilde; phải nhận thất bại &ldquo;muối mặt&rdquo; với tỉ số 4 &ndash; 1 trước V Gaming, đội tuyển m&agrave; mới đ&uacute;ng một năm trước th&ocirc;i vẫn chưa thể &ldquo;c&oacute; cửa&rdquo; với Team Flash.</p><p><img alt=\"Có lẽ đã đến lúc, fan Liên Quân lâu năm nên chấp nhận một sự thật cay đắng: Đế chế ấy sụp đổ thật rồi - Ảnh 2.\" src="https://gamek.mediacdn.vn/133514250583805952/2022/5/3/-16515965912121579179218.jpg\" /></p><p>D&ugrave; đ&atilde; thay đổi kh&aacute; nhiều về mặt nh&acirc;n sự cũng như c&oacute; thời gian để luyện tập gh&eacute;p nối những c&aacute;i t&ecirc;n cũ v&agrave; mới, thậm ch&iacute; kh&ocirc;ng ngần ngại đưa &ldquo;&ocirc;ng ho&agrave;ng đường giữa&rdquo; Xu&acirc;n B&aacute;ch về vị tr&iacute; trợ thủ, thay thế ProE. Nhưng rồi th&igrave; kết quả vẫn kh&ocirc;ng khả quan. D&ugrave; vẫn c&oacute; suất thi đấu AIC nhưng đ&oacute; l&agrave; kh&ocirc;ng đủ đối với niềm hy vọng của&nbsp;<a href="https://gamek.vn/ke-hoach-tan-hut-cua-lien-quan-va-demon-slayer-van-chua-cham-dut-lan-nay-toi-luot-inosuke-va-zenitsu-20220503115800945.chn\" target=\"_blank\">Li&ecirc;n Qu&acirc;n</a>&nbsp;Việt Nam. Team Flash ng&agrave;y trước l&agrave; ng&ocirc;i vị số 1 cho chức v&ocirc; địch, giờ đ&acirc;y phải đấu tranh để gi&agrave;nh một suất tham dự giải quốc tế. Đế chế ng&agrave;y xưa, vị thế ng&agrave;y xưa tan biến hết rồi. Game thủ&nbsp;<a href="https://gamek.vn/ke-hoach-tan-hut-cua-lien-quan-va-demon-slayer-van-chua-cham-dut-lan-nay-toi-luot-inosuke-va-zenitsu-20220503115800945.chn\" target=\"_blank\">Li&ecirc;n Qu&acirc;n</a>, fan của Team Flash đ&agrave;nh phải chấp nhận th&ocirc;i, d&ugrave; sự thật n&agrave;y c&oacute; cay đắng như thế n&agrave;o đi chăng nữa.</p><p><img alt=\"Có lẽ đã đến lúc, fan Liên Quân lâu năm nên chấp nhận một sự thật cay đắng: Đế chế ấy sụp đổ thật rồi - Ảnh 3.\" src="https://gamek.mediacdn.vn/133514250583805952/2022/5/3/photo-1-1651596633801460451513.jpg\" /></p><p>Team Flash rất c&oacute; thể sẽ quay trở lại, nhưng quay trở lại v&agrave;o thời điểm n&agrave;o th&igrave; vẫn l&agrave; c&acirc;u hỏi kh&ocirc;ng c&oacute; lời giải, &iacute;t nhất l&agrave; ở thời điểm hiện tại. Giờ đ&acirc;y, Team Flash c&oacute; lẽ sẽ phải d&agrave;nh nhiều thời gian để giải quyết vấn đề nội bộ - điều đ&atilde; được cộng đồng b&agrave;n t&aacute;n bấy l&acirc;u nay cũng như để t&igrave;m ra được một đội h&igrave;nh mạnh nhất cho tương lai. C&ograve;n b&acirc;y giờ th&igrave;, tạm biệt ĐTDV th&ocirc;i.</p>', CAST(N'2022-06-13T14:23:32.000' AS DateTime), N'94badfa9-d935-4c16-b58c-814c9bcbe3e7', N'/posts/anh10.jpg', N'pending', 0)
INSERT [dbo].[post] ([id], [title], [small_category_id], [metatitle], [description], [content], [created_at], [author], [image], [status], [view]) VALUES (N'1e0df6ef-625d-464a-b1af-cc823ec7a703', N'Apex Legends Mobile phát hành toàn cầu và đây là thứ game thủ Việt nhận được, Free Fire lại được thể “rung đùi”', N'3674b773-3585-49d4-8a63-690eb8974bf8', N'apex-legends-mobile-phat-hanh-toan-cau-va-day-la-thu-game-thu-viet-nhan-duoc-free-fire-lai-duoc-the-rung-dui', N'<p>Mới đ&acirc;y, Apex Legends Mobile đ&atilde; ph&aacute;t đi những th&ocirc;ng tin quan trọng.</p>', N'<h2><strong>Mới đ&acirc;y, Apex Legends Mobile đ&atilde; ph&aacute;t đi những th&ocirc;ng tin quan trọng.</strong></h2><p>V&agrave;o đầu th&aacute;ng 3, Apex Legends Mobile đ&atilde; ra mắt dưới dạng thử nghiệm tại một v&agrave;i quốc gia/khu vực bao gồm Argentina, Colombia, Mexico, Peru, Indonesia, Malaysia, Philippines, Singapore, &Uacute;c v&agrave; New Zealand. Thời điểm đ&oacute;, game thủ tại c&aacute;c quốc gia n&agrave;y c&oacute; thể tải về Apex Legends Mobile tại App Store v&agrave; Google Play.</p><p><img alt=\"Apex Legends Mobile phát hành toàn cầu và đây là thứ game thủ Việt nhận được, Free Fire lại được thể “rung đùi” - Ảnh 1.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/3/22/photo-1-1647941562034788903777.jpg\" /></p><p>Mới đ&acirc;y, Apex Legends Mobile cho biết đ&atilde; ch&iacute;nh thức mở đăng k&yacute; tr&ecirc;n phạm vi to&agrave;n cầu. Điều n&agrave;y đồng nghĩa với việc ng&agrave;y ph&aacute;t h&agrave;nh của tựa game n&agrave;y kh&ocirc;ng c&ograve;n xa nữa. Theo th&ocirc;ng tin được ph&aacute;t đi th&igrave; Apex Legends Mobile sẽ được ph&aacute;t h&agrave;nh to&agrave;n cầu v&agrave;o m&ugrave;a h&egrave; n&agrave;y. Tuy nhi&ecirc;n, khi v&agrave;o Google Play th&igrave; Apex Legends Mobile kh&ocirc;ng cho ph&eacute;p game thủ Việt đăng k&yacute; trước.<img alt=\"Apex Legends Mobile phát hành toàn cầu và đây là thứ game thủ Việt nhận được, Free Fire lại được thể “rung đùi” - Ảnh 2.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/3/22/-16479416213531499283814.jpg\" /></p><p>Rất c&oacute; khả năng trong tương lai gần th&igrave; game thủ Việt cũng kh&ocirc;ng được ph&eacute;p tải về Apex Legends Mobile tr&ecirc;n cả hai kho tải ch&iacute;nh thức ở Việt Nam. Với đặc th&ugrave; l&agrave; một game bắn s&uacute;ng mang hơi hướm bạo lực n&ecirc;n đương nhi&ecirc;n sẽ cần phải c&oacute; NPH chịu tr&aacute;ch nhiệm về việc kiểm duyệt nội dung cũng như bảo đảm giảm thiểu tối đa c&aacute;c yếu tố bạo lực trong game. M&agrave; hiện tại th&igrave; vẫn chưa c&oacute; đơn vị n&agrave;o trong nước c&oacute; động th&aacute;i hợp t&aacute;c ph&aacute;t h&agrave;nh Apex Legends Mobile.</p><p>Điều n&agrave;y đồng nghĩa với việc l&agrave; Free Fire tiếp tục sẽ l&agrave; tựa game bắn s&uacute;ng sinh tồn số một tại thị trường Việt Nam khi gần như kh&ocirc;ng c&oacute; đối thủ. PUBG Mobile được xem l&agrave; đối thủ cạnh tranh lớn nhất của Free Fire nhưng nếu đặt l&ecirc;n b&agrave;n c&acirc;n so s&aacute;nh về tương quan người chơi th&igrave; PUBG Mobile hay Badlanders cũng kh&oacute; c&oacute; thể l&agrave; đối thủ của Free Fire. Apex Legends Mobile với lợi thế về đồ họa v&agrave; gameplay cũng như hỗ trợ tối đa của EA lẫn Tencent sẽ tạo n&ecirc;n một thế cục cạnh tranh hấp dẫn với c&aacute;c tựa game đi trước, nhưng gi&agrave;nh được vị thế của Free Fire th&igrave;&hellip; e chừng kh&oacute;.</p>', CAST(N'2022-06-13T15:23:39.000' AS DateTime), N'94badfa9-d935-4c16-b58c-814c9bcbe3e7', N'/posts/anh42.jpg', N'live', 11)
INSERT [dbo].[post] ([id], [title], [small_category_id], [metatitle], [description], [content], [created_at], [author], [image], [status], [view]) VALUES (N'2eea1e4a-e03c-44d3-a5d8-acc9d734d5cf', N'Trang bị mới sắp được Riot đưa vào LMHT tại Tiền Mùa Giải 2022 phải chăng đã có mặt ở Liên Minh: Tốc Chiến?', N'58985559-d13a-490c-98bc-5b551b477061', N'trang-bi-moi-sap-duoc-riot-dua-vao-lmht-tai-tien-mua-giai-2022-phai-chang-da-co-mat-o-lien-minh-toc-chien', N'<p>Nếu đ&acirc;y l&agrave; sự thật th&igrave; c&aacute;c tướng chống chịu c&oacute; nhiều khống chế trong LMHT sẽ trở n&ecirc;n &quot;tr&acirc;u b&ograve;&quot; hơn kh&aacute; nhiều.</p>', N'<h2>Nếu đ&acirc;y l&agrave; sự thật th&igrave; c&aacute;c tướng chống chịu c&oacute; nhiều khống chế trong LMHT sẽ trở n&ecirc;n &quot;tr&acirc;u b&ograve;&quot; hơn kh&aacute; nhiều.</h2><ul></ul><p>C&aacute;ch đ&acirc;y khoảng 1 tuần th&igrave;&nbsp;<a href="https://gamek.vn/riot-games.htm\" target=\"_blank\">Riot Games</a>&nbsp;đ&atilde; đăng tải một b&agrave;i viết rất d&agrave;i l&ecirc;n trang chủ để n&oacute;i về c&aacute;c kế hoạch m&agrave; họ sắp &aacute;p dụng cho&nbsp;<a href="https://gamek.vn/lmht.htm\" target=\"_blank\">LMHT</a>. Trong số đ&oacute; th&igrave; Riot đ&atilde; nh&aacute; h&agrave;ng 5 trang bị mới sẽ được th&ecirc;m v&agrave;o cửa h&agrave;ng LMHT tại&nbsp;<a href="https://gamek.vn/tien-mua-giai-2022.htm\" target=\"_blank\">Tiền M&ugrave;a Giải 2022</a>. Mặc d&ugrave; chưa hề c&ocirc;ng bố t&ecirc;n gọi cũng như chỉ số cung cấp nhưng c&aacute;c item n&agrave;y cũng thu h&uacute;t sự quan t&acirc;m lớn từ ph&iacute;a cộng đồng.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2021/10/1/photo-1-1633055980903409639024.jpg\" target=\"_blank\"><img alt=\"Trang bị mới sắp được Riot đưa vào LMHT tại Tiền Mùa Giải 2022 phải chăng đã có mặt ở Liên Minh: Tốc Chiến? - Ảnh 1.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2021/10/1/photo-1-1633055980903409639024.jpg\" /></a></p><p>Riot Games đ&atilde; bắt đầu c&ocirc;ng bố những th&ocirc;ng tin đầu ti&ecirc;n về Tiền M&ugrave;a Giải 2022</p><p>Mới đ&acirc;y th&igrave; cộng đồng LMHT đ&atilde; ph&aacute;t hiện ra rằng một trong số những item mới được Riot giới thiệu dường như đ&atilde; c&oacute; mặt ở Li&ecirc;n Minh: Tốc Chiến. Cụ thể th&igrave; ch&uacute;ng ta c&oacute; một item Huyền Thoại chống chịu mới sẽ cung cấp rất nhiều năng lượng cho tướng sử dụng. M&oacute;n đồ n&agrave;y cho ph&eacute;p tướng sử dụng năng lượng của m&igrave;nh để tạo khi&ecirc;n khi l&agrave;m bất động hoặc l&agrave;m chậm đối thủ. V&agrave; thật tr&ugrave;ng hợp l&agrave;m sao khi trong Li&ecirc;n Minh: Tốc Chiến c&oacute; item Gi&aacute;p Băng Vĩnh Cửu với hiệu ứng tương tự.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2021/10/1/2-1633054721096847134810.png\" target=\"_blank\"><img alt=\"Trang bị mới sắp được Riot đưa vào LMHT tại Tiền Mùa Giải 2022 phải chăng đã có mặt ở Liên Minh: Tốc Chiến? - Ảnh 2.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2021/10/1/2-1633054721096847134810.png\" /></a></p><p>Riot giới thiệu rằng trang bị Huyền Thoại chống chịu mới sẽ cung cấp nhiều năng lượng v&agrave; tướng c&oacute; thể d&ugrave;ng t&agrave;i nguy&ecirc;n n&agrave;y để tạo khi&ecirc;n khi l&agrave;m bất động, l&agrave;m chậm đối thủ</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2021/10/1/3-1633056442990675629297.png\" target=\"_blank\"><img alt=\"Trang bị mới sắp được Riot đưa vào LMHT tại Tiền Mùa Giải 2022 phải chăng đã có mặt ở Liên Minh: Tốc Chiến? - Ảnh 3.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2021/10/1/3-1633056442990675629297.png\" /></a></p><p>Game thủ đ&atilde; ph&aacute;t hiện ra một item c&oacute; hiệu ứng tương tự đ&atilde; c&oacute; mặt trong Li&ecirc;n Minh: Tốc Chiến</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2021/10/1/photo-1-16330547397961369427008.jpg\" target=\"_blank\"><img alt=\"Trang bị mới sắp được Riot đưa vào LMHT tại Tiền Mùa Giải 2022 phải chăng đã có mặt ở Liên Minh: Tốc Chiến? - Ảnh 4.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2021/10/1/photo-1-16330547397961369427008.jpg\" /></a></p><p>Trong Li&ecirc;n Minh: Tốc Chiến ch&uacute;ng ta c&oacute; một item mang t&ecirc;n Gi&aacute;p Băng v&agrave; n&oacute; được l&ecirc;n từ Nước Mắt Nữ Thần n&ecirc;n sẽ cung cấp rất nhiều năng lượng</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2021/10/1/photo-1-163305475600018286276.jpg\" target=\"_blank\"><img alt=\"Trang bị mới sắp được Riot đưa vào LMHT tại Tiền Mùa Giải 2022 phải chăng đã có mặt ở Liên Minh: Tốc Chiến? - Ảnh 5.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2021/10/1/photo-1-163305475600018286276.jpg\" /></a></p><p>Hiệu ứng khi biến th&agrave;nh Gi&aacute;p Băng Vĩnh Cửu cũng l&agrave; ti&ecirc;u hao năng lượng v&agrave; tạo khi&ecirc;n khi hạn chế di chuyển tướng địch</p><p>Với việc hiệu ứng của Gi&aacute;p Băng Vĩnh Cửu gần như l&agrave; giống hệt với m&ocirc; tả từ ph&iacute;a Riot th&igrave; ch&uacute;ng ta c&agrave;ng c&oacute; niềm tin rằng trang bị n&agrave;y sắp được đem từ Li&ecirc;n Minh: Tốc Chiến v&agrave;o LMHT. Điểm mạnh của m&oacute;n đồ n&agrave;y đ&oacute; l&agrave; n&oacute; gi&uacute;p cho c&aacute;c tướng Chống chịu giải quyết ho&agrave;n to&agrave;n vấn đề năng lượng v&agrave; trở n&ecirc;n cực kỳ l&igrave; lợm khi n&acirc;ng cấp th&agrave;nh Gi&aacute;p Băng Vĩnh Cửu.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2020/3/26/malphite-15851902775912070230826.jpg\" target=\"_blank\"><img alt=\"Trang bị mới sắp được Riot đưa vào LMHT tại Tiền Mùa Giải 2022 phải chăng đã có mặt ở Liên Minh: Tốc Chiến? - Ảnh 6.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2020/3/26/malphite-15851902775912070230826.jpg\" /></a></p><p>Malphite c&oacute; lẽ l&agrave; vị tướng vui nhất nếu trang bị Gi&aacute;p Băng Vĩnh Cửu thực sự được đưa v&agrave;o LMHT</p><p>Hơn nữa, gi&aacute; th&agrave;nh của item n&agrave;y cũng tương đối rẻ nếu so với c&aacute;c trang bị Huyền Thoại chống chịu trong LMHT hiện tại (2600 v&agrave;ng) cũng l&agrave; lợi thế lớn. C&aacute;i gi&aacute; rẻ đồng nghĩa với việc game thủ c&oacute; thể sở hữu ngưỡng sức mạnh 2-3 trang bị sớm hơn, c&oacute; th&ecirc;m chỉ số từ item Thần Thoại v&agrave; trở n&ecirc;n &quot;tr&acirc;u b&ograve;&quot; hơn trước. Nếu Gi&aacute;p Băng v&agrave; Gi&aacute;p Băng Vĩnh Cửu thực sự được th&ecirc;m v&agrave;o LMHT ở Tiền M&ugrave;a Giải 2022 th&igrave; n&oacute; sẽ trở th&agrave;nh item tương đối mạnh.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2020/12/15/-1608001496793118939718.jpg\" target=\"_blank\"><img alt=\"Trang bị mới sắp được Riot đưa vào LMHT tại Tiền Mùa Giải 2022 phải chăng đã có mặt ở Liên Minh: Tốc Chiến? - Ảnh 7.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2020/12/15/-1608001496793118939718.jpg\" /></a></p><p>Đương nhi&ecirc;n l&agrave; để l&agrave;m việc n&agrave;y th&igrave; Riot cần phải chỉnh sửa chỉ số, gi&aacute; tiền của item tr&ecirc;n để n&oacute; ph&ugrave; hợp với m&ocirc;i trường LMHT. Thậm ch&iacute; Riot to&agrave;n to&agrave;n c&oacute; thể lấy nội tại của Gi&aacute;p Băng Vĩnh Cửu để đưa v&agrave;o một trang bị mới ho&agrave;n to&agrave;n trong tương lai. C&oacute; lẽ ch&uacute;ng ta vẫn sẽ phải chờ tới khi th&ocirc;ng tin về Tiền M&ugrave;a Giải 2022 ch&iacute;nh thức được c&ocirc;ng bố th&igrave; mới c&oacute; thể chắc chắn việc Riot c&oacute; đem Gi&aacute;p Băng Vĩnh Cửu từ Li&ecirc;n Minh: Tốc Chiến sang LMHT hay kh&ocirc;ng.</p>', CAST(N'2022-06-13T15:24:10.000' AS DateTime), N'e7538cc4-7069-4d66-98df-cd2e4a505e15', N'/posts/anh43.jpg', N'live', 24)
INSERT [dbo].[post] ([id], [title], [small_category_id], [metatitle], [description], [content], [created_at], [author], [image], [status], [view]) VALUES (N'30307076-849a-4318-8ebf-07e7b684348e', N'Với việc cài điều khoản này, cha mẹ rất khó, thậm chí không thể đổ lỗi cho Garena khi con mình chơi Free Fire', N'3674b773-3585-49d4-8a63-690eb8974bf8', N'free-fire-la-game-18-hiem-hoi-co-ca-cau-hoi-danh-cho-phu-huynh-kem-mot-dieu-khoan-rat-khon-ngoan-cua-nph', N'<p>M?i d&acirc;y, Garena d&atilde; ph?i dang d&agrave;n th?a nh?n tr&ecirc;n Fanpage c?a Li&ecirc;n Qu&acirc;n Mobile v? scandal n&agrave;y. 123</p>', N'<h2><strong>Mới đ&acirc;y, Garena đ&atilde; phải đăng đ&agrave;n thừa nhận tr&ecirc;n Fanpage của Li&ecirc;n Qu&acirc;n Mobile về scandal n&agrave;y.</strong></h2><p>Vừa qua, tr&ecirc;n Fanpage Cao Thủ Li&ecirc;n Qu&acirc;n đ&atilde; đăng đ&agrave;n th&ocirc;ng b&aacute;o về việc xử phạt tuyển thủ. Nội dung cụ thể như sau:</p><p><em>1. Tuyển thủ TRẦN &quot;NAMHI&quot; NHẬT NAM thuộc đội tuyển MEMO Game</em></p><p><em>2. Tuyển thủ L&Ecirc; &quot;ANH T&Acirc;N&quot; ANH T&Acirc;N thuộc đội tuyển MEMO Game</em></p><p><em>Chi tiết: Vi phạm Điều 10.10.4 (Ch&ecirc; bai v&agrave; ph&acirc;n biệt đối xử) v&agrave; Điều 10.10.6 (Phỉ b&aacute;ng trong game) thuộc Điều lệ của Đấu Trường Danh Vọng m&ugrave;a Xu&acirc;n 2022.</em></p><p><em>Căn cứ theo Điều 13 về c&aacute;c khung h&igrave;nh phạt, Ban tổ chức quyết định xử phạt như sau:</em></p><p><em>- Cấm thi đấu 6 th&aacute;ng đối với hai VĐV MG AnhT&acirc;n v&agrave; MG NamHi</em></p><p><em>- Quyết định xử phạt c&oacute; hiệu lực từ ng&agrave;y 18/4/2022.</em></p><p><em>- Đội tuyển MEMO Game được ph&eacute;p bổ sung 02 th&agrave;nh vi&ecirc;n thay thế để đ&aacute;p ứng số lượng tuyển thủ tối thiểu theo quy định của BTC trước 15h00 ng&agrave;y 20/04/2022. Sau thời hạn, nếu đội tuyển kh&ocirc;ng đủ số lượng th&agrave;nh vi&ecirc;n tối thiểu, BTC sẽ xử l&yacute; theo quy định.</em></p><p><em>Nếu c&oacute; những bằng chứng tố c&aacute;o về c&aacute;c h&agrave;nh động phi thể thao trong cộng đồng Li&ecirc;n Qu&acirc;n Mobile Việt Nam, c&aacute;c bạn h&atilde;y gửi th&ocirc;ng tin về cho ch&uacute;ng t&ocirc;i tại địa chỉ lqm_congdong@ved.com.vn. Mọi trường hợp sẽ đều được xử l&yacute; theo đ&uacute;ng quy định c&ocirc;ng bằng v&agrave; nghi&ecirc;m minh.</em></p><p><img alt=\"Scandal rúng động Liên Quân: Garena bị tố bao che, xóa bình luận game thủ, cuối cùng cũng phải thừa nhận phốt? - Ảnh 1.\" src="https://gamek.mediacdn.vn/133514250583805952/2022/4/18/-16502731658531140123876.jpg\" /></p><p>Trước đ&oacute;, tr&ecirc;n Fanpage của Li&ecirc;n Qu&acirc;n Mobile, rất nhiều game thủ đ&atilde; b&agrave;y tỏ sự phẫn nộ đối với những h&agrave;nh vi v&agrave; lời n&oacute;i được xem l&agrave; phi thể thao v&agrave; thiếu văn h&oacute;a của một v&agrave;i tuyển thủ tr&ecirc;n livestream. Tuy nhi&ecirc;n, một số người chơi cho biết khi b&igrave;nh luận tr&ecirc;n Fanpage của Li&ecirc;n Qu&acirc;n th&igrave; comment đ&atilde; bị bay m&agrave;u. Một game thủ chia sẻ sự bức x&uacute;c của m&igrave;nh: &ldquo;<em>Buồn cười qu&aacute; c&aacute;c &ocirc;ng ạ. Hiện tại tr&ecirc;n c&aacute;c trang Li&ecirc;n Qu&acirc;n, nhiều kh&aacute;n giả b&agrave;y tỏ sự bức x&uacute;c khi Garena vẫn kh&ocirc;ng c&oacute; động th&aacute;i n&agrave;o về việc tuyển thủ thi đấu chuy&ecirc;n nghiệp l&agrave; Namhi, AnhTan của MemoGame đấu rank b</em><em>ật mic chửi bới ph&acirc;n biệt, mỉa mai với từ ngữ xấu.</em><img alt=\"Scandal rúng động Liên Quân: Garena bị tố bao che, xóa bình luận game thủ, cuối cùng cũng phải thừa nhận phốt? - Ảnh 2.\" src="https://gamek.mediacdn.vn/133514250583805952/2022/4/18/photo-1-16502731827641536180051-16502732387151932386130-16502739235451322229521.jpg\" /></p><p><em>Hơn thế nữa, 80% cmt l&ecirc;n &aacute;n v&agrave; g&oacute;p &yacute; với Gar</em><em>ena d&ugrave; nhẹ nh&agrave;ng, lịch sự nhất đều bị xo&aacute;</em>.&rdquo;<img alt=\"Scandal rúng động Liên Quân: Garena bị tố bao che, xóa bình luận game thủ, cuối cùng cũng phải thừa nhận phốt? - Ảnh 3.\" src="https://gamek.mediacdn.vn/133514250583805952/2022/4/18/16502732493062099380985-1650273293929383652934-16502739683971136423386.jpg\" /></p><p>C&oacute; lẽ sau khi chứng kiến phản ứng mạnh mẽ của cộng đồng th&igrave; cuối c&ugrave;ng, Garena đ&atilde; phải l&ecirc;n tiếng h&agrave;nh động hoặc chờ đợi thu thập đủ bằng chứng. Tuy nhi&ecirc;n th&igrave; điều n&agrave;y c&oacute; xoa dịu được sự phẫn nộ của game thủ hay kh&ocirc;ng th&igrave; lại l&agrave; c&acirc;u chuyện kh&aacute;c khi m&agrave; xem ra, người chơi Li&ecirc;n Qu&acirc;n đ&atilde; bức x&uacute;c lắm rồi.</p>', CAST(N'2022-06-13T14:17:55.000' AS DateTime), N'e7538cc4-7069-4d66-98df-cd2e4a505e15', N'/posts/anh41.jpg', N'decline', 0)
INSERT [dbo].[post] ([id], [title], [small_category_id], [metatitle], [description], [content], [created_at], [author], [image], [status], [view]) VALUES (N'3cf5714f-b367-4eea-aec5-9acc5c5f0795', N'Làn sóng phản ứng giận dữ của game thủ Liên Quân, nhưng hoá ra sự thật lại oan ức cho Garena rồi', N'e1f28388-b686-4d1e-9a89-df78d1f36c27', N'lan-song-phan-ung-gian-du-tieu-cuc-cua-game-thu-lien-quan-hiem-thay-trong-lich-su-sau-loat-scandal-rung-dong', N'<p>Hiếm c&oacute; khi n&agrave;o, cộng đồng Li&ecirc;n Qu&acirc;n lại c&oacute; phản ứng gay gắt với NPH như thế n&agrave;y.</p>', N'<h2>Hiếm c&oacute; khi n&agrave;o, cộng đồng Li&ecirc;n Qu&acirc;n lại c&oacute; phản ứng gay gắt với NPH như thế n&agrave;y.</h2><ul></ul><p>Trong những ng&agrave;y qua, dấu hiệu r&otilde; rệt nhất của cộng đồng&nbsp;<a href="https://gamek.vn/bich-phuong-khoe-chuoi-thang-lien-quan-lot-xac-voi-giao-an-len-do-moi-tuyen-bo-1-cau-khien-cdm-ngo-ngang-20220421105331582.chn\" target=\"_blank\">Li&ecirc;n Qu&acirc;n</a>&nbsp;đ&oacute; ch&iacute;nh l&agrave; sự phẫn nộ của người chơi được đẩy l&ecirc;n đến đỉnh điểm. Tr&ecirc;n Fanpage của tựa game n&agrave;y, h&agrave;ng loạt c&aacute;c b&agrave;i đăng của admin đều vấp phải l&agrave;n s&oacute;ng phản ứng của người chơi m&agrave; dễ nh&igrave;n ra nhất đ&oacute; l&agrave; h&agrave;ng loạt c&aacute;c reaction phẫn nộ v&agrave; giận dữ.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/4/22/-1650597150916580065790.jpg\" target=\"_blank\"><img alt=\"Làn sóng phản ứng giận dữ của game thủ Liên Quân căng nhất trong lịch sử sau loạt scandal rúng động, chuyện gì đang xảy ra? - Ảnh 1.\" src="https://gamek.mediacdn.vn/133514250583805952/2022/4/22/-1650597150916580065790.jpg\" /></a></p><p>Tuy kh&ocirc;ng phải lần đầu ti&ecirc;n cộng đồng&nbsp;<a href="https://gamek.vn/bich-phuong-khoe-chuoi-thang-lien-quan-lot-xac-voi-giao-an-len-do-moi-tuyen-bo-1-cau-khien-cdm-ngo-ngang-20220421105331582.chn\" target=\"_blank\">Li&ecirc;n Qu&acirc;n</a>&nbsp;c&oacute; c&aacute;ch phản ứng tương tự đối với NPH Garena. Thế nhưng để đẩy l&ecirc;n cao tr&agrave;o như thế n&agrave;y th&igrave; cũng được xem l&agrave; sự kiện hiếm thấy trong lịch sử của&nbsp;<a href="https://gamek.vn/bich-phuong-khoe-chuoi-thang-lien-quan-lot-xac-voi-giao-an-len-do-moi-tuyen-bo-1-cau-khien-cdm-ngo-ngang-20220421105331582.chn\" target=\"_blank\">Li&ecirc;n Qu&acirc;n</a>&nbsp;Mobile. Vậy điều g&igrave; đang xảy ra? Nguy&ecirc;n nh&acirc;n n&agrave;o dẫn đến sự việc được cho mang lại những t&aacute;c động kh&ocirc;ng tốt n&agrave;y?</p><p>Theo cộng đồng game thủ&nbsp;<a href="https://gamek.vn/scandal-rung-dong-lien-quan-garena-bi-to-bao-che-xoa-binh-luan-game-thu-cuoi-cung-cung-phai-thua-nhan-phot-20220418162732381.chn\" target=\"_blank\">Li&ecirc;n Qu&acirc;n</a>&nbsp;cho biết, điều khiến cho người chơi thể hiện sự giận dữ v&agrave; phẫn nộ tới từ hai l&yacute; do chủ yếu:</p><p>Thứ nhất: Dư &acirc;m của sự kiện 10/3 vừa qua đ&atilde; t&aacute;c động tới t&acirc;m l&yacute; của game thủ. Nhiều người đang tỏ ra ho&agrave;i nghi về c&aacute;ch m&agrave;&nbsp;<a href="https://gamek.vn/scandal-rung-dong-lien-quan-garena-bi-to-bao-che-xoa-binh-luan-game-thu-cuoi-cung-cung-phai-thua-nhan-phot-20220418162732381.chn\" target=\"_blank\">Li&ecirc;n Qu&acirc;n</a>&nbsp;Mobile tổ chức sự kiện v&agrave; thứ m&agrave; game thủ nhận được sau chuỗi ng&agrave;y thực hiện nhiệm vụ. Một game thủ cho biết, cộng đồng đang nghi ngờ về quảng c&aacute;o skin bậc S+ đợt sự kiện 30/4 sắp tới.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/4/22/-16505971523901132845888.jpg\" target=\"_blank\"><img alt=\"Làn sóng phản ứng giận dữ của game thủ Liên Quân căng nhất trong lịch sử sau loạt scandal rúng động, chuyện gì đang xảy ra? - Ảnh 2.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/4/22/-16505971523901132845888.jpg\" /></a></p><p>Thứ hai: Nguy&ecirc;n nh&acirc;n n&agrave;y được cho l&agrave; chủ đạo khi cộng đồng phẫn nộ bởi thường xuy&ecirc;n bị lỗi out game, mất kết nối trong thời gian vừa qua dẫn đến tụt giảm điểm uy t&iacute;n. Nguy&ecirc;n nh&acirc;n của sự việc n&agrave;y thực chất lại tới từ l&yacute; do kh&aacute;ch quan. Bởi lẽ từ 21h30 ng&agrave;y 15/4, tuyến c&aacute;p quang biển quốc tế Asia Pacific Gateway (APG) gặp sự cố tr&ecirc;n ph&acirc;n đoạn S1.7 c&aacute;ch khu vực Đ&ocirc;ng Nam &Aacute; khoảng 910 km.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/4/22/16505971515241294851563-165059718725580895987.jpg\" target=\"_blank\"><img alt=\"Làn sóng phản ứng giận dữ của game thủ Liên Quân căng nhất trong lịch sử sau loạt scandal rúng động, chuyện gì đang xảy ra? - Ảnh 3.\" src="https://gamek.mediacdn.vn/133514250583805952/2022/4/22/16505971515241294851563-165059718725580895987.jpg\" /></a></p><p>Trong lần gặp sự cố đầu ti&ecirc;n của năm 2022, tr&ecirc;n ph&acirc;n đoạn S1.7, tuyến c&aacute;p quang biển quốc tế APG gặp lỗi đứt sợi. Hiện tại đơn vị quản l&yacute; tuyến c&aacute;p chưa th&ocirc;ng tin đến c&aacute;c nh&agrave; mạng về kế hoạch sửa chữa, khắc phục sự cố. Ch&iacute;nh nguy&ecirc;n nh&acirc;n n&agrave;y đ&atilde; khiến cho trải nghiệm của game thủ&nbsp;<a href="https://gamek.vn/scandal-rung-dong-lien-quan-garena-bi-to-bao-che-xoa-binh-luan-game-thu-cuoi-cung-cung-phai-thua-nhan-phot-20220418162732381.chn\" target=\"_blank\">Li&ecirc;n Qu&acirc;n</a>&nbsp;kh&ocirc;ng được như mong muốn.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/4/22/-1650597152070139819543.jpg\" target=\"_blank\"><img alt=\"Làn sóng phản ứng giận dữ của game thủ Liên Quân căng nhất trong lịch sử sau loạt scandal rúng động, chuyện gì đang xảy ra? - Ảnh 4.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/4/22/-1650597152070139819543.jpg\" /></a></p><p>Tr&ecirc;n Fanpage&nbsp;<a href="https://gamek.vn/scandal-rung-dong-lien-quan-garena-bi-to-bao-che-xoa-binh-luan-game-thu-cuoi-cung-cung-phai-thua-nhan-phot-20220418162732381.chn\" target=\"_blank\">Li&ecirc;n Qu&acirc;n</a>, Garena cũng đ&atilde; đưa ra hướng xử l&yacute; để b&ugrave; đắp cho người chơi bị trừ điểm uy t&iacute;n: Để khắc phục vấn đề, ngo&agrave;i những cam kết trong th&ocirc;ng b&aacute;o đ&atilde; đăng trước đ&oacute;, Hội đồng&nbsp;<a href="https://gamek.vn/scandal-rung-dong-lien-quan-garena-bi-to-bao-che-xoa-binh-luan-game-thu-cuoi-cung-cung-phai-thua-nhan-phot-20220418162732381.chn\" target=\"_blank\">Li&ecirc;n Qu&acirc;n</a>&nbsp;sẽ kh&ocirc;i phục cho c&aacute;c kiện tướng 30 điểm uy t&iacute;n (tổng điểm uy t&iacute;n tối đa 100 điểm) v&agrave; tặng th&ecirc;m 1 thẻ bảo hộ sao tr&ecirc;n to&agrave;n server.</p><p>C&oacute; thể thấy rằng, Garena đ&atilde; c&oacute; những th&ocirc;ng b&aacute;o kịp thời để xoa dịu game thủ của m&igrave;nh. Hy vọng rằng sự kiện 30/4 sắp tới,&nbsp;<a href="https://gamek.vn/scandal-rung-dong-lien-quan-garena-bi-to-bao-che-xoa-binh-luan-game-thu-cuoi-cung-cung-phai-thua-nhan-phot-20220418162732381.chn\" target=\"_blank\">Li&ecirc;n Qu&acirc;n</a>&nbsp;sẽ kh&ocirc;ng đưa game thủ của m&igrave;nh v&agrave;o một &ldquo;c&uacute; hớ&rdquo; n&agrave;o tương tự như dịp Giỗ tổ H&ugrave;ng Vương vừa qua.</p>', CAST(N'2022-06-13T15:14:34.000' AS DateTime), N'e7538cc4-7069-4d66-98df-cd2e4a505e15', N'/posts/anh38.jpg', N'live', 9)
INSERT [dbo].[post] ([id], [title], [small_category_id], [metatitle], [description], [content], [created_at], [author], [image], [status], [view]) VALUES (N'44e3aa7c-538e-46fa-a3f7-045e5b3d8cac', N'Có lẽ đã đến lúc, fan Liên Quân lâu năm nên chấp nhận một sự thật cay đắng: Đế chế ấy sụp đổ thật rồi', N'e1f28388-b686-4d1e-9a89-df78d1f36c27', N'co-le-da-den-luc-fan-lien-quan-lau-nam-nen-chap-nhan-mot-su-that-cay-dang-de-che-ay-sup-do-that-roi', N'<p>D&ugrave; kh&ocirc;ng muốn n&oacute;i ra nhưng c&oacute; lẽ game thủ Li&ecirc;n Qu&acirc;n l&acirc;u năm cũng đủ hiểu rằng mọi thứ đ&atilde; kh&ocirc;ng c&ograve;n được như xưa.</p>', N'<h2><strong>D&ugrave; kh&ocirc;ng muốn n&oacute;i ra nhưng c&oacute; lẽ game thủ Li&ecirc;n Qu&acirc;n l&acirc;u năm cũng đủ hiểu rằng mọi thứ đ&atilde; kh&ocirc;ng c&ograve;n được như xưa.</strong></h2><p>C&oacute; thể n&oacute;i, Team Flash l&agrave; một trong những đội tuyển&nbsp;<a href="https://gamek.vn/ke-hoach-tan-hut-cua-lien-quan-va-demon-slayer-van-chua-cham-dut-lan-nay-toi-luot-inosuke-va-zenitsu-20220503115800945.chn\" target=\"_blank\">Li&ecirc;n Qu&acirc;n</a>&nbsp;c&oacute; sức ảnh hưởng lớn nhất tại Việt Nam. Đ&acirc;y cũng l&agrave; đội tuyển c&oacute; lượng fan h&ugrave;ng hậu, l&agrave; người đ&atilde; đưa&nbsp;<a href="https://gamek.vn/ke-hoach-tan-hut-cua-lien-quan-va-demon-slayer-van-chua-cham-dut-lan-nay-toi-luot-inosuke-va-zenitsu-20220503115800945.chn\" target=\"_blank\">Li&ecirc;n Qu&acirc;n</a>&nbsp;l&ecirc;n tới đỉnh cao danh vọng thế giới với hai chức v&ocirc; địch quốc tế trong năm 2019, tạo n&ecirc;n những kỷ lục v&ocirc; tiền kho&aacute;ng hậu.</p><p>Ch&iacute;nh v&igrave; lẽ đ&oacute; n&ecirc;n kh&ocirc;ng kh&oacute; hiểu khi tại sao Team Flash lại c&oacute; sức ảnh hưởng rất lớn tới&nbsp;<a href="https://gamek.vn/ke-hoach-tan-hut-cua-lien-quan-va-demon-slayer-van-chua-cham-dut-lan-nay-toi-luot-inosuke-va-zenitsu-20220503115800945.chn\" target=\"_blank\">Li&ecirc;n Qu&acirc;n</a>&nbsp;Việt v&agrave; giống như một g&atilde; khổng lồ lớn nhất của tựa game MOBA quốc d&acirc;n n&agrave;y. Thế nhưng, d&ugrave; mạnh mẽ đến thế n&agrave;o th&igrave; Team Flash cũng kh&ocirc;ng thể chống lại được quy luật của thời gian, đ&oacute; ch&iacute;nh l&agrave; &ldquo;tre gi&agrave; măng mọc&rdquo; v&agrave; kh&ocirc;ng ai c&oacute; thể m&atilde;i m&atilde;i ngự trị tr&ecirc;n đỉnh cao.<img alt=\"Có lẽ đã đến lúc, fan Liên Quân lâu năm nên chấp nhận một sự thật cay đắng: Đế chế ấy sụp đổ thật rồi - Ảnh 1.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/3/photo-1-16515965478961778449291.jpg\" /></p><p>Team Flash cũng vậy, dấu hiệu của sự bất ổn đ&atilde; tới từ m&ugrave;a giải năm ngo&aacute;i. Tuy vẫn c&ograve;n &iacute;t nhiều th&agrave;nh c&ocirc;ng tại giải quốc nội nhưng tr&ecirc;n trường quốc tế cũng như từ ĐTDV m&ugrave;a Đ&ocirc;ng, mọi thứ đ&atilde; thay đổi ch&oacute;ng mặt. Vẫn l&agrave; những nh&acirc;n tố đ&oacute; nhưng Team Flash kh&ocirc;ng c&ograve;n c&oacute; thể &aacute;p đặt được lối chơi l&ecirc;n c&aacute;c đối thủ của m&igrave;nh, kh&ocirc;ng c&ograve;n l&agrave; một &ocirc;ng lớn khiến cho đối phương phải khiếp sợ.</p><p>Team Flash lần lượt nhận những thất bại muối mặt trước c&aacute;c đối thủ ng&agrave;y c&agrave;ng &ldquo;kinh khủng&rdquo;, từ Saigon Phantom cho tới V Gaming. Tới v&ograve;ng Play-off của ĐTDV m&ugrave;a Xu&acirc;n vừa qua, Team Flash đ&atilde; phải nhận thất bại &ldquo;muối mặt&rdquo; với tỉ số 4 &ndash; 1 trước V Gaming, đội tuyển m&agrave; mới đ&uacute;ng một năm trước th&ocirc;i vẫn chưa thể &ldquo;c&oacute; cửa&rdquo; với Team Flash.</p><p><img alt=\"Có lẽ đã đến lúc, fan Liên Quân lâu năm nên chấp nhận một sự thật cay đắng: Đế chế ấy sụp đổ thật rồi - Ảnh 2.\" src="https://gamek.mediacdn.vn/133514250583805952/2022/5/3/-16515965912121579179218.jpg\" /></p><p>D&ugrave; đ&atilde; thay đổi kh&aacute; nhiều về mặt nh&acirc;n sự cũng như c&oacute; thời gian để luyện tập gh&eacute;p nối những c&aacute;i t&ecirc;n cũ v&agrave; mới, thậm ch&iacute; kh&ocirc;ng ngần ngại đưa &ldquo;&ocirc;ng ho&agrave;ng đường giữa&rdquo; Xu&acirc;n B&aacute;ch về vị tr&iacute; trợ thủ, thay thế ProE. Nhưng rồi th&igrave; kết quả vẫn kh&ocirc;ng khả quan. D&ugrave; vẫn c&oacute; suất thi đấu AIC nhưng đ&oacute; l&agrave; kh&ocirc;ng đủ đối với niềm hy vọng của&nbsp;<a href="https://gamek.vn/ke-hoach-tan-hut-cua-lien-quan-va-demon-slayer-van-chua-cham-dut-lan-nay-toi-luot-inosuke-va-zenitsu-20220503115800945.chn\" target=\"_blank\">Li&ecirc;n Qu&acirc;n</a>&nbsp;Việt Nam. Team Flash ng&agrave;y trước l&agrave; ng&ocirc;i vị số 1 cho chức v&ocirc; địch, giờ đ&acirc;y phải đấu tranh để gi&agrave;nh một suất tham dự giải quốc tế. Đế chế ng&agrave;y xưa, vị thế ng&agrave;y xưa tan biến hết rồi. Game thủ&nbsp;<a href="https://gamek.vn/ke-hoach-tan-hut-cua-lien-quan-va-demon-slayer-van-chua-cham-dut-lan-nay-toi-luot-inosuke-va-zenitsu-20220503115800945.chn\" target=\"_blank\">Li&ecirc;n Qu&acirc;n</a>, fan của Team Flash đ&agrave;nh phải chấp nhận th&ocirc;i, d&ugrave; sự thật n&agrave;y c&oacute; cay đắng như thế n&agrave;o đi chăng nữa.</p><p><img alt=\"Có lẽ đã đến lúc, fan Liên Quân lâu năm nên chấp nhận một sự thật cay đắng: Đế chế ấy sụp đổ thật rồi - Ảnh 3.\" src="https://gamek.mediacdn.vn/133514250583805952/2022/5/3/photo-1-1651596633801460451513.jpg\" /></p><p>Team Flash rất c&oacute; thể sẽ quay trở lại, nhưng quay trở lại v&agrave;o thời điểm n&agrave;o th&igrave; vẫn l&agrave; c&acirc;u hỏi kh&ocirc;ng c&oacute; lời giải, &iacute;t nhất l&agrave; ở thời điểm hiện tại. Giờ đ&acirc;y, Team Flash c&oacute; lẽ sẽ phải d&agrave;nh nhiều thời gian để giải quyết vấn đề nội bộ - điều đ&atilde; được cộng đồng b&agrave;n t&aacute;n bấy l&acirc;u nay cũng như để t&igrave;m ra được một đội h&igrave;nh mạnh nhất cho tương lai. C&ograve;n b&acirc;y giờ th&igrave;, tạm biệt ĐTDV th&ocirc;i.</p>', CAST(N'2022-06-13T15:24:03.000' AS DateTime), N'e7538cc4-7069-4d66-98df-cd2e4a505e15', N'/posts/anh36.jpg', N'live', 6)
INSERT [dbo].[post] ([id], [title], [small_category_id], [metatitle], [description], [content], [created_at], [author], [image], [status], [view]) VALUES (N'48fdd0a7-bbd9-40fc-9dab-359be54253f3', N'Vì sao Genshin Impact càng chơi lâu càng thấy \"khổ\"?', N'4227e3dd-3cf1-4930-a579-7b3ff8e632c8', N'vi-sao-genshin-impact-cang-choi-lau-cang-thay-kho', N'<p>Đạt tới level cao l&agrave; điều nhiều người chơi mong muốn, thế nhưng vẫn c&oacute; rất nhiều điều kh&oacute; khăn.</p>', N'<h2>Đạt tới level cao l&agrave; điều nhiều người chơi mong muốn, thế nhưng vẫn c&oacute; rất nhiều điều kh&oacute; khăn.</h2><ul></ul><p>&nbsp;</p><p><strong>1. T&agrave;i nguy&ecirc;n nhanh ch&oacute;ng cạn kiệt</strong></p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/4/29/photo-1-16512513533421777245849.png\" target=\"_blank\"><img alt=\"Vì sao Genshin Impact càng chơi lâu càng thấy khổ? - Ảnh 1.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/4/29/photo-1-16512513533421777245849.png\" /></a></p><p>Tại AR thấp, ch&uacute;ng ta sẽ chỉ bận rộn chạy theo c&aacute;c nhiệm vụ, sự kiện v&agrave; kh&aacute;m ph&aacute; c&aacute;c c&acirc;u đố ẩn. C&aacute;c nh&acirc;n vật cũng chưa cần g&acirc;y ra damage 6 số nhưng vẫn đủ để c&acirc;n lượng content của game. V&igrave; vậy, người chơi tốn rất &iacute;t t&agrave;i nguy&ecirc;n v&agrave;o việc n&acirc;ng cấp nh&acirc;n vật, vũ kh&iacute;, thường chỉ tập trung v&agrave;o nh&acirc;n vật m&igrave;nh th&iacute;ch hoặc một đội h&igrave;nh đ&aacute;ng tin cậy.</p><p>Thế nhưng từ AR 40 trở l&ecirc;n, Mora v&agrave; s&aacute;ch Exp sẽ l&agrave; hai t&agrave;i nguy&ecirc;n si&ecirc;u xa xỉ, dễ kiếm hơn nhưng cũng nhanh ch&oacute;ng &quot;bay m&agrave;u&quot; mỗi khi người chơi n&acirc;ng nh&acirc;n vật mới. C&aacute;ch duy nhất để kiếm th&ecirc;m Mora v&agrave; Exp kh&ocirc;ng phải l&agrave; l&agrave;m nhiệm vụ nữa, m&agrave; l&agrave; tham gia sự kiện, mua g&oacute;i &quot;Nhật K&yacute; H&agrave;nh Tr&igrave;nh&quot; hoặc sử dụng Nhựa để farm.</p><p><strong>2. Nguy&ecirc;n liệu n&acirc;ng cấp kh&ocirc;ng bao giờ đủ</strong></p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/4/29/photo-1-1651251265199412015910.jpg\" target=\"_blank\"><img alt=\"Vì sao Genshin Impact càng chơi lâu càng thấy khổ? - Ảnh 2.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/4/29/photo-1-1651251265199412015910.jpg\" /></a></p><p>&nbsp;Tương tự như hai t&agrave;i nguy&ecirc;n cơ bản trong game l&agrave; Mora v&agrave; Exp, kiếm đủ nguy&ecirc;n liệu n&acirc;ng cấp nh&acirc;n vật trong Genshin Impact cũng khiến nhiều người chơi gặp kh&oacute; khăn. Nguy&ecirc;n liệu từ những kẻ địch thường gặp như Hilichurl hay Slime th&igrave; lu&ocirc;n thừa th&atilde;i. Nhưng khi c&aacute;c nh&acirc;n vật mới đ&ograve;i hỏi nguy&ecirc;n liệu mới để n&acirc;ng cấp, người chơi ở AR 50+ cũng mất đến v&agrave;i tuần hoặc v&agrave;i th&aacute;ng mới c&oacute; thể farm đủ.&nbsp;Ngo&agrave;i ra, một số nguy&ecirc;n liệu c&oacute; thể h&aacute;i lượm cũng mất thời gian để t&iacute;ch g&oacute;p phải v&agrave;i tuần chứ chẳng dễ t&iacute; n&agrave;o.&nbsp;</p><p><strong>3. Nhựa l&agrave; item &quot;xa xỉ&quot; nhất</strong></p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/4/29/photo-3-16512509508931955112900.jpg\" target=\"_blank\"><img alt=\"Vì sao Genshin Impact càng chơi lâu càng thấy khổ? - Ảnh 3.\" src="https://gamek.mediacdn.vn/133514250583805952/2022/4/29/photo-3-16512509508931955112900.jpg\" /></a></p><p>Đ&acirc;y c&oacute; lẽ l&agrave; điều duy nhất m&agrave; ở level thấp hay level vẫn chẳng thay đổi. Thậm ch&iacute;, khi l&ecirc;n AR 50+, người chơi sẽ c&ograve;n tốn nhiều nhựa hơn v&igrave; thiếu thốn nguy&ecirc;n liệu. Mọi hoạt động trong Genshin Impact, từ farm Mora, Exp, nguy&ecirc;n liệu n&acirc;ng cấp cho đến khi&ecirc;u chiến Boss tuần đều đ&ograve;i hỏi Nhựa Nguy&ecirc;n Chất.</p><p>Kh&aacute;c với level thấp, sau khi lượng Nhựa hồi h&agrave;ng ng&agrave;y đ&atilde; hết, những người chơi ở level cao sẽ chẳng biết l&agrave;m g&igrave; kh&aacute;c ngo&agrave;i ngắm m&acirc;y ngắm gi&oacute; hoặc tho&aacute;t game.</p><p><strong>4. Hết thứ để kh&aacute;m ph&aacute;</strong></p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/4/29/photo-1-1651251219357466701697.jpg\" target=\"_blank\"><img alt=\"Vì sao Genshin Impact càng chơi lâu càng thấy khổ? - Ảnh 4.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/4/29/photo-1-1651251219357466701697.jpg\" /></a></p><p>Đi c&ugrave;ng vấn đề cạn Nhựa ch&iacute;nh l&agrave; &quot;cạn thứ để l&agrave;m&quot; của những người chơi ở AR 50+. Hiện tại, Genshin Impact đ&atilde; c&oacute; nhiều content hơn so với khi mới ra mắt. Nhưng kể cả vậy th&igrave; tiến độ game vẫn kh&aacute; chậm v&agrave; &iacute;t nội dung. C&aacute;c nhiệm vụ cần l&agrave;m h&agrave;ng ng&agrave;y chỉ tốn từ 30 ph&uacute;t đến 1 tiếng. Điều n&agrave;y khiến nhiều người chơi cảm thấy nh&agrave;m ch&aacute;n v&agrave; kh&ocirc;ng c&oacute; động lực để chơi tiếp. Mặt kh&aacute;c, việt &quot;tiết kiệm content&quot; n&agrave;y lại gi&uacute;p c&aacute;c player c&oacute; &iacute;t thời gian giảm được g&aacute;nh nặng c&agrave;y cuốc trong game.</p><p>Genshin Impact cũng đ&atilde; tung ra c&aacute;c khu vực mới thường xuy&ecirc;n hơn v&agrave; nhiều c&acirc;u đố, b&iacute; ẩn cần giải đ&aacute;p hơn. Thế nhưng đối với những người chơi AR 50+, việc qu&eacute;t sạch content ở c&aacute;c khu vực n&agrave;y c&oacute; thể chỉ cần một tuần, thậm ch&iacute; v&agrave;i ng&agrave;y. V&igrave; vậy, &quot;cơn đ&oacute;i content&quot; của người chơi level cao kh&ocirc;ng bao giờ biến mất cả.</p><p><strong>5. L&ecirc;n level si&ecirc;u chậm</strong></p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/4/29/photo-7-16512509515281332851648.png\" target=\"_blank\"><img alt=\"Vì sao Genshin Impact càng chơi lâu càng thấy khổ? - Ảnh 5.\" src="https://gamek.mediacdn.vn/133514250583805952/2022/4/29/photo-7-16512509515281332851648.png\" /></a></p><p>Sau khi đạt AR 55, việc l&ecirc;n level sẽ chậm lại rất nhiều. Đ&oacute; cũng l&agrave; l&yacute; do m&agrave; chỉ c&oacute; rất &iacute;t người chơi Genshin Impact đạt AR 58 trở l&ecirc;n, v&agrave; số người đ&atilde; max level (60) chỉ c&oacute; thể đếm tr&ecirc;n đầu ng&oacute;n tay. Tất nhi&ecirc;n, l&ecirc;n level chậm kh&ocirc;ng g&acirc;y nhiều trở ngại cho người chơi, thậm ch&iacute; giảm &aacute;p lực cho việc &quot;c&agrave;y cấp&quot; như nhiều tựa game kh&aacute;c.</p>', CAST(N'2022-06-10T15:21:11.000' AS DateTime), N'e7538cc4-7069-4d66-98df-cd2e4a505e15', N'/posts/anh32.jpg', N'live', 5)
INSERT [dbo].[post] ([id], [title], [small_category_id], [metatitle], [description], [content], [created_at], [author], [image], [status], [view]) VALUES (N'4e3b2098-2ade-4531-8315-6cb5ca0fe53a', N'Mùa rank mới chưa sang, cập nhật mới chưa tới mà Liên Quân đã đứng trước bờ vực \"toang\" như thế này', N'e1f28388-b686-4d1e-9a89-df78d1f36c27', N'mua-rank-moi-chua-sang-cap-nhat-moi-chua-toi-ma-lien-quan-da-dung-truoc-bo-vuc-toang-nhu-the-nay', N'<p>D&ugrave; m&ugrave;a rank cũ vẫn chưa hết song game thủ Li&ecirc;n Qu&acirc;n rất c&oacute; thể sẽ phải đối diện với c&acirc;u chuyện đau đầu.</p>', N'<h2>D&ugrave; m&ugrave;a rank cũ vẫn chưa hết song game thủ Li&ecirc;n Qu&acirc;n rất c&oacute; thể sẽ phải đối diện với c&acirc;u chuyện đau đầu.</h2><ul></ul><p>C&oacute; thể n&oacute;i, Li&ecirc;n Qu&acirc;n l&agrave; một trong số những tựa game MOBA quốc d&acirc;n ở thời điểm hiện tại. Song điều đ&oacute; v&ocirc; h&igrave;nh chung lại khiến cho Garena cũng như game thủ của tựa game n&agrave;y rơi v&agrave;o ho&agrave;n cảnh lo lắng v&agrave; hoang mang. Cụ thể, Li&ecirc;n Qu&acirc;n l&agrave; một trong số những tựa game MOBA bị hack nhiều bậc nhất ở thời điểm hiện tại.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/4/23/photo-1-16506875314821684676581.png\" target=\"_blank\"><img alt=\"Mùa rank mới chưa sang, cập nhật mới chưa tới mà Liên Quân đã đứng trước bờ vực toang như thế này - Ảnh 1.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/4/23/photo-1-16506875314821684676581.png\" /></a></p><p>Bất chấp việc Garena vẫn đ&atilde; v&agrave; đang c&oacute; những biện ph&aacute;p xử l&yacute; v&agrave; khắc phục như kh&oacute;a h&agrave;ng loạt t&agrave;i khoản của hacker theo &quot;thời gian thực&quot;. Nhưng điều n&agrave;y kh&ocirc;ng c&oacute; nghĩa l&yacute; g&igrave; khi m&agrave; t&agrave;i khoản sử dụng hack mọc l&ecirc;n theo &quot;cấp số cộng&quot; v&agrave; kh&oacute;a t&agrave;i khoản n&agrave;y th&igrave; lại c&oacute; th&ecirc;m h&agrave;ng chục hacker mới mọc l&ecirc;n.</p><p>Tr&ecirc;n c&aacute;c nền tảng mạng x&atilde; hội phổ biến như Facebook, Zalo hay Tele... đều c&oacute; những hang ổ của hacker v&agrave; ch&uacute;ng lu&ocirc;n c&oacute; những thủ đoạn để khiến cho Garena phải đau đầu. Cụ thể mới đ&acirc;y, d&ugrave; m&ugrave;a rank của Li&ecirc;n Qu&acirc;n vẫn chưa chấm dứt song hacker đ&atilde; sẵn s&agrave;ng cho một phi&ecirc;n bản hack cho m&ugrave;a giải mới, thậm ch&iacute; l&agrave; cho cả bản cập nhật mới của Li&ecirc;n Qu&acirc;n trong tương lai.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/4/23/edit-co-16506877001501674097455.jpeg\" target=\"_blank\"><img alt=\"Mùa rank mới chưa sang, cập nhật mới chưa tới mà Liên Quân đã đứng trước bờ vực toang như thế này - Ảnh 2.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/4/23/edit-co-16506877001501674097455.jpeg\" /></a></p><p>Đ&acirc;y l&agrave; một vấn nạn m&agrave; c&oacute; lẽ Garena hay thậm ch&iacute; l&agrave; cả TiMi cũng kh&oacute; c&oacute; thể khắc phục triệt để v&agrave; game thủ Li&ecirc;n Qu&acirc;n chắc sẽ phải sống chung với lũ trong một thời gian rất d&agrave;i nữa. Hack map, tầm nh&igrave;n v&agrave; đủ thứ &quot;tr&ecirc;n trời dưới biển&quot; đ&atilde; khiến cho chất lượng của Li&ecirc;n Qu&acirc;n tụt giảm khi m&agrave; bậc rank c&agrave;ng cao th&igrave; nguy cơ đối diện với hacker c&agrave;ng lớn. Đ&oacute; l&agrave; sự thật m&agrave; game thủ Li&ecirc;n Qu&acirc;n phải chấp nhận.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/4/23/photo-1-16506877934021413261618.jpg\" target=\"_blank\"><img alt=\"Mùa rank mới chưa sang, cập nhật mới chưa tới mà Liên Quân đã đứng trước bờ vực toang như thế này - Ảnh 3.\" src="https://gamek.mediacdn.vn/133514250583805952/2022/4/23/photo-1-16506877934021413261618.jpg\" /></a></p><p>Quay trở lại với c&acirc;u chuyện hack m&ugrave;a giải mới th&igrave; thủ đoạn v&agrave; c&aacute;ch thức m&agrave; hacker rao b&aacute;n bản hack ng&agrave;y một tinh vi. C&aacute;c loại hack cũng &quot;thượng v&agrave;ng hạ c&aacute;m&quot; khi từ miễn ph&iacute; đến trả ph&iacute; &quot;chấp cả ban&quot; của Garena đều c&oacute;. Suy cho c&ugrave;ng, chỉ game thủ Li&ecirc;n Qu&acirc;n ch&acirc;n ch&iacute;nh l&agrave; chịu thiệt m&agrave; th&ocirc;i.</p>', CAST(N'2022-06-11T15:20:13.000' AS DateTime), N'e7538cc4-7069-4d66-98df-cd2e4a505e15', N'/posts/anh37.jpg', N'live', 0)
INSERT [dbo].[post] ([id], [title], [small_category_id], [metatitle], [description], [content], [created_at], [author], [image], [status], [view]) VALUES (N'4ed39216-c6a9-4109-8671-df17d91e55b7', N'Doublelift dường như vẫn chưa muốn kết thúc drama với TSM khi tuyên bố: \"Họ đang phá hoại LCS\"', N'0b15399b-1b89-4122-8aeb-ccc9a497e693', N'doublelift-duong-nhu-van-chua-muon-ket-thuc-drama-voi-tsm-khi-tuyen-bo-ho-dang-pha-hoai-lcs', N'<p>Doublelift dường như vẫn chưa muốn kết th&uacute;c drama với TSM khi tuy&ecirc;n bố: &quot;Họ đang ph&aacute; hoại LCS&quot;</p>', N'<h2>Doublelift thậm ch&iacute; c&ograve;n chỉ đ&iacute;ch danh &ocirc;ng chủ của TSM với tư c&aacute;ch người chịu tr&aacute;ch nhiệm cho việc n&agrave;y.</h2><ul></ul><p>Nếu phải nhắc tới một tổ chức th&agrave;nh c&ocirc;ng cả về th&agrave;nh t&iacute;ch thi đấu v&agrave; gi&aacute; trị thương mại tại Bắc Mỹ th&igrave; Team SoloMid l&agrave; c&aacute;i t&ecirc;n đầu ti&ecirc;n người ta c&oacute; thể nghĩ tới. Kh&ocirc;ng chỉ sở hữu một lịch sử l&acirc;u đời với nhiều lần v&ocirc; địch giải đấu LCS,&nbsp;<a href="https://gamek.vn/tsm.htm\" target=\"_blank\">TSM</a>&nbsp;c&ograve;n l&agrave;m rất tốt phần h&igrave;nh ảnh khi k&yacute; kết hợp đồng với nhiều streamer đ&igrave;nh đ&aacute;m. Hệ quả l&agrave; hoạt động kinh doanh b&ecirc;n ngo&agrave;i lĩnh vực Esports của tổ chức n&agrave;y cũng cực kỳ ph&aacute;t triển trong v&agrave;i năm trở lại đ&acirc;y.</p><p>Tuy nhi&ecirc;n kh&ocirc;ng r&otilde; v&igrave; l&yacute; do g&igrave; m&agrave; v&agrave;o cuối năm 2021, &ocirc;ng chủ của TSM l&agrave; Reginald lại muốn x&acirc;y dựng một đội h&igrave;nh giao tiếp bằng tiếng Trung. V&igrave; vậy m&agrave; TSM đ&atilde; mua một loạt tuyển thủ từ giải đấu LPL, LDL như Keiduo, Shen Yi, Yursan.... với mức gi&aacute; cao. Mặc d&ugrave; vậy quyết định n&agrave;y đ&atilde; khiến TSM thi đấu v&ocirc; c&ugrave;ng tệ, vướng cả v&agrave;o drama ăn chặn tiền lương với HLV Peter Zhang. Kết quả l&agrave; TSM c&oacute; một m&ugrave;a giải thất bại thảm hại v&igrave; kh&ocirc;ng c&oacute; v&eacute; chơi playoffs LCS M&ugrave;a Xu&acirc;n 2022.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/3/photo-1-16515375231091914133793.jpg\" target=\"_blank\"><img alt=\"Doublelift dường như vẫn chưa muốn kết thúc drama với TSM khi tuyên bố: Họ đang phá hoại LCS - Ảnh 1.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/3/photo-1-16515375231091914133793.jpg\" /></a></p><p>Đội h&igrave;nh mới của TSM đ&atilde; c&oacute; một m&ugrave;a giải v&ocirc; c&ugrave;ng tệ hại</p><p>Sau đ&oacute; th&igrave; TSM lại đổi đội h&igrave;nh v&agrave; mua về Đường Giữa, Hỗ Trợ mới, lần n&agrave;y th&igrave; họ chọn những tuyển thủ gốc H&agrave;n như Takeover, Mia từ giải đấu LLA. C&oacute; lẽ với tư c&aacute;ch l&agrave; một người gắn b&oacute; v&agrave; theo d&otilde;i với TSM nhiều năm,&nbsp;<a href="https://gamek.vn/doublelift.htm\" target=\"_blank\">Doublelift</a>&nbsp;đ&atilde; kh&ocirc;ng thể nhịn được c&aacute;ch mua người tệ hại n&agrave;y v&agrave; l&ecirc;n tiếng chỉ tr&iacute;ch &ocirc;ng chủ Reginald. Doublelift thậm ch&iacute; c&ograve;n cho rằng h&agrave;nh động của TSM đang l&agrave;m chất lượng của giải LCS đi xuống v&agrave; kh&ocirc;ng kh&aacute;c g&igrave; ph&aacute; hoại cả.</p><p>Doublelift Reacts to new TSM Support rumors, how people want out of TSM</p><p>Doublelift:&nbsp;<em>&quot;Thật l&ograve;ng m&agrave; n&oacute;i th&igrave; TSM trong mấy năm trở lại đ&acirc;y đang k&eacute;o chất lượng của giải LCS đi xuống. L&yacute; do l&agrave; bởi họ đưa ra những quyết định về nh&acirc;n sự qu&aacute; tồi tệ v&agrave; khiến đội h&igrave;nh thi đấu c&oacute; th&agrave;nh t&iacute;ch yếu k&eacute;m. Họ cũng chẳng hề đối xử tốt với ch&iacute;nh tuyển thủ của m&igrave;nh v&agrave; l&agrave;m họ mất động lực thi đấu. Chuyện n&agrave;y xảy ra như cơm bữa ở TSM ấy n&ecirc;n b&acirc;y giờ chẳng ai muốn k&yacute; hợp đồng với họ.</em></p><p><em>Kết quả l&agrave; như c&aacute;c &ocirc;ng thấy đấy, TSM phải sang tận c&aacute;c khu vực như LLA, LPL nơi chẳng c&oacute; mấy người biết đến họ để t&igrave;m nh&acirc;n sự. V&agrave; rồi họ mang về những người chơi kh&ocirc;ng ph&ugrave; hợp, th&agrave;nh t&iacute;ch th&igrave; cứ thế trượt dốc, đ&acirc;y chẳng kh&aacute;c n&agrave;o h&agrave;nh động ph&aacute; hoại cả&quot;.</em></p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/3/photo-1-16515376880001019998862.jpg\" target=\"_blank\"><img alt=\"Doublelift dường như vẫn chưa muốn kết thúc drama với TSM khi tuyên bố: Họ đang phá hoại LCS - Ảnh 3.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/3/photo-1-16515376880001019998862.jpg\" /></a></p><p>Doublelift lại c&oacute; th&ecirc;m cớ để chỉ tr&iacute;ch Reginald v&agrave; TSM khi họ c&oacute; những quyết định chuyển nhượng đi v&agrave;o l&ograve;ng đất</p><p>Nếu c&aacute;c bạn c&ograve;n nhớ th&igrave; c&aacute;ch đ&acirc;y v&agrave;i th&aacute;ng, Doublelift v&agrave; Reginald đ&atilde; nổ ra một drama kh&aacute; lớn v&agrave; khiến cho&nbsp;<a href="https://gamek.vn/riot-games.htm\" target=\"_blank\">Riot Games</a>&nbsp;phải v&agrave;o cuộc để điều tra h&agrave;nh vi bạo h&agrave;nh với tuyển thủ của &ocirc;ng chủ TSM. Sau đ&oacute; th&igrave; một loại c&ocirc;ng thần l&acirc;u năm của TSM như Bjergsen, Leena Xu đều t&igrave;m c&aacute;ch rời khỏi tổ chức n&agrave;y. Kết hợp với những pha chuyển nhượng đi v&agrave;o l&ograve;ng đất như tr&ecirc;n th&igrave; cộng đồng cũng hiểu được rằng Doublelift l&agrave; người đ&uacute;ng trong vụ việc đ&oacute; v&agrave; TSM giờ chỉ c&ograve;n c&aacute;i t&ecirc;n m&agrave; th&ocirc;i.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/3/photo-1-1651537769095501175681.jpg\" target=\"_blank\"><img alt=\"Doublelift dường như vẫn chưa muốn kết thúc drama với TSM khi tuyên bố: Họ đang phá hoại LCS - Ảnh 4.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/3/photo-1-1651537769095501175681.jpg\" /></a></p>', CAST(N'2022-06-11T15:23:00.000' AS DateTime), N'e7538cc4-7069-4d66-98df-cd2e4a505e15', N'/posts/anh29.jpg', N'live', 0)
INSERT [dbo].[post] ([id], [title], [small_category_id], [metatitle], [description], [content], [created_at], [author], [image], [status], [view]) VALUES (N'4fc316c6-cb2a-4006-a885-cb57e576c307', N'Ngày càng nhiều tướng có hình dạng người xuất hiện trong LMHT, lý do nào đã khiến \"hội quái vật\" mất chỗ đứng?', N'0b15399b-1b89-4122-8aeb-ccc9a497e693', N'ngay-cang-nhieu-tuong-co-hinh-dang-nguoi-xuat-hien-trong-lmht-ly-do-nao-da-khien-hoi-quai-vat-mat-cho-dung', N'<p>Ng&agrave;y c&agrave;ng nhiều tướng c&oacute; h&igrave;nh dạng người xuất hiện trong LMHT, l&yacute; do n&agrave;o đ&atilde; khiến &quot;hội qu&aacute;i vật&quot; mất chỗ đứng?</p>', N'<h2>Đ&atilde; l&acirc;u rồi trong LMHT kh&ocirc;ng c&oacute; th&ecirc;m vị tướng mới n&agrave;o dị h&igrave;nh hoặc thuộc hẳn nh&oacute;m qu&aacute;i vật.</h2><ul></ul><p><a href="https://gamek.vn/lien-minh-huyen-thoai.htm\" target=\"_blank\">Li&ecirc;n Minh Huyền Thoại</a>&nbsp;đ&atilde; trải qua qu&atilde;ng thời gian rất d&agrave;i, kể từ khi lần đầu ra mắt cộng đồng game thủ v&agrave;o năm 2009. Đến hiện tại l&agrave; m&ugrave;a 12,&nbsp;<a href="https://gamek.vn/lmht.htm\" target=\"_blank\">LMHT</a>&nbsp;vẫn kh&ocirc;ng ngừng thay đổi v&agrave; ph&aacute;t triển. Dấu hiệu r&otilde; nhất cho thấy Riot vẫn đang c&oacute; lộ tr&igrave;nh cho tựa game &quot;con cưng&quot; của m&igrave;nh ch&iacute;nh l&agrave; c&aacute;c&nbsp;<a href="https://gamek.vn/tuong.htm\" target=\"_blank\">tướng</a>&nbsp;mới cứ ra mắt đều đặn. T&iacute;nh đến thời điểm hiện tại, đ&atilde; c&oacute; khoảng 158 tướng xuất hiện trong LMHT. Đồng thời, cũng đ&atilde; c&oacute; những c&aacute;i t&ecirc;n kh&aacute;c được &quot;nh&aacute; h&agrave;ng&quot; sẽ sớm g&oacute;p mặt trong Summoner&#39;s Rift.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/3/tuong-lmht-1-16515922184401902628737.jpg\" target=\"_blank\"><img alt=\"Ngày càng nhiều tướng có hình dạng người xuất hiện trong LMHT, lý do nào đã khiến hội quái vật mất chỗ đứng? - Ảnh 1.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/3/tuong-lmht-1-16515922184401902628737.jpg\" /></a></p><p>LMHT hiện đang c&oacute; 158 vị tướng, bao gồm cả Zeri mới ra mắt</p><p>Nhưng c&oacute; 1 sự thật ch&iacute;nh l&agrave;, c&aacute;c tướng qu&aacute;i vật - vốn cũng l&agrave; một phần kh&ocirc;ng thể thiếu trong c&otilde;i Runeterra rộng lớn lại đang ng&agrave;y c&agrave;ng &iacute;t xuất hiện hơn trong LMHT. T&iacute;nh cho đến thời điểm hiện tại, đ&atilde; qua gần một nửa của m&ugrave;a giải thứ 12, nhưng t&iacute;nh kể từ sự kiện Hoa Linh Lục Địa th&igrave; chỉ c&oacute; mỗi Lillia v&agrave; Vex l&agrave; 2 vị tướng dị h&igrave;nh xuất hiện trong LMHT. Nhưng Lillia lại l&agrave; 1 &quot;hot girl&quot; thứ thiệt trong khi Vex thuộc tộc người l&ugrave;n Yordles.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/3/tuong-lmht-2-16515923328271314345313.png\" target=\"_blank\"><img alt=\"Ngày càng nhiều tướng có hình dạng người xuất hiện trong LMHT, lý do nào đã khiến hội quái vật mất chỗ đứng? - Ảnh 2.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/3/tuong-lmht-2-16515923328271314345313.png\" /></a></p><p>Vex v&agrave; Lillia l&agrave; 2 tướng dị h&igrave;nh hiếm hoi ra mắt kể từ đầu năm 2021 đến hiện tại</p><p>C&ograve;n lại tất cả những vị tướng kh&aacute;c đều c&oacute; h&igrave;nh dạng người. V&agrave; kể cả nếu t&iacute;nh Vex cũng như Lillia th&igrave; những tướng dị h&igrave;nh hoặc qu&aacute;i vật ra mắt trong thời gian gần đ&acirc;y cũng qu&aacute; &iacute;t. Nguy&ecirc;n nh&acirc;n l&agrave; v&igrave; đ&acirc;u?</p><p><strong>Kh&oacute; thiết kế, từ h&igrave;nh dạng đến bộ kỹ năng</strong></p><p>C&oacute; 1 sự thật ch&iacute;nh l&agrave;, nếu c&aacute;c tướng dị h&igrave;nh trong LMHT, như tộc Yordles hay những tướng như Hecarim, Lillia đ&atilde; rất kh&oacute; để thiết kế bộ kỹ năng cũng như h&igrave;nh d&aacute;ng, animation... th&igrave; c&aacute;c tướng qu&aacute;i vật lại c&agrave;ng kh&oacute; thiết kế hơn. M&agrave; tr&ecirc;n thực tế, những tướng qu&aacute;i vật hoặc dị h&igrave;nh ở giai đoạn sau n&agrave;y, như Zac, Ivern hay Ornn... cũng đều dựa tr&ecirc;n nh&acirc;n dạng con người m&agrave; thiết kế. C&aacute;c tướng thuần qu&aacute;i vật như Vel&#39;Koz hay Skarner gần như đ&atilde; kh&ocirc;ng c&ograve;n xuất hiện th&ecirc;m c&aacute;i t&ecirc;n n&agrave;o mới nữa.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/3/tuong-lmht-3-16515925577691054620633.jpg\" target=\"_blank\"><img alt=\"Ngày càng nhiều tướng có hình dạng người xuất hiện trong LMHT, lý do nào đã khiến hội quái vật mất chỗ đứng? - Ảnh 3.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/3/tuong-lmht-3-16515925577691054620633.jpg\" /></a></p><p>Thiết kế c&aacute;c tướng qu&aacute;i vật hay dị h&igrave;nh chưa bao giờ l&agrave; dễ d&agrave;ng, khi vừa phải lột tả được sự đ&aacute;ng sợ, vừa kh&ocirc;ng qu&aacute; xấu x&iacute;</p><p>Ch&iacute;nh v&igrave; kh&oacute; thiết kế như vậy, c&aacute;c tướng n&agrave;y mỗi khi rework hay chỉnh sửa đều tốn thời gian rất l&acirc;u. Skarner m&atilde;i cho đến thời gian gần đ&acirc;y mới được đưa v&agrave;o danh s&aacute;ch rework trong khi vị tướng n&agrave;y đ&atilde; gần như biến mất ho&agrave;n to&agrave;n khỏi Summoner&#39;s Rift.</p><p>Ấy l&agrave; c&ograve;n chưa kể, việc rework đ&ocirc;i khi sẽ trở n&ecirc;n v&ocirc; &iacute;ch bởi Riot vẫn kh&ocirc;ng thể thiết kế một bộ kỹ năng vừa ph&ugrave; hợp với t&iacute;nh chất của vị tướng đ&oacute;, vừa ph&ugrave; hợp cốt truyện m&agrave; lại hiệu quả trong LMHT. Điển h&igrave;nh ch&iacute;nh l&agrave; trường hợp của Fiddlestick khi cho đến giờ, vị tướng n&agrave;y vẫn &quot;im hơi lặng tiếng&quot; d&ugrave; đ&atilde; được rework từ l&acirc;u.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/3/tuong-lmht-4-1651592623408883306284.jpg\" target=\"_blank\"><img alt=\"Ngày càng nhiều tướng có hình dạng người xuất hiện trong LMHT, lý do nào đã khiến hội quái vật mất chỗ đứng? - Ảnh 4.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/3/tuong-lmht-4-1651592623408883306284.jpg\" /></a></p><p>Fiddlestick - trường hợp rework thất bại, gần như mất t&iacute;ch lu&ocirc;n cho đến hiện tại</p><p><strong>Chưa thể x&acirc;y dựng những sự kiện hay cốt truyện c&oacute; li&ecirc;n quan</strong></p><p>C&oacute; 1 sự thật ch&iacute;nh l&agrave;, trong qu&atilde;ng thời gian gần đ&acirc;y, mỗi khi chuẩn bị ra mắt tướng mới th&igrave; Riot sẽ đưa vị tướng n&agrave;y v&agrave;o 1 cốt truyện/sự kiện n&agrave;o đ&oacute;. Điển h&igrave;nh như Yone v&agrave; Lillia (Hoa Linh Lục Địa), Senna, Viego, Vex, Gwen, Akshan (Đại Suy Vong - Vệ Binh &Aacute;nh S&aacute;ng)... Thậm ch&iacute;, 2 vị tướng mới ra mắt đ&acirc;y l&agrave; Renata Glasc v&agrave; Zeri cũng được cho l&agrave; c&oacute; li&ecirc;n quan đến series Arcane m&ocirc; tả cuộc chiến giữa Zaun v&agrave; Piltover.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/3/tuong-lmht-5-16515927688981263627131.png\" target=\"_blank\"><img alt=\"Ngày càng nhiều tướng có hình dạng người xuất hiện trong LMHT, lý do nào đã khiến hội quái vật mất chỗ đứng? - Ảnh 5.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/3/tuong-lmht-5-16515927688981263627131.png\" /></a></p><p>Từ năm 2021, Riot thường c&oacute; xu hướng giới thiệu tướng mới k&egrave;m theo những sự kiện kết nối nhiều cốt truyện lại với nhau, như trường hợp Đại Suy Vong - Vệ Binh &Aacute;nh S&aacute;ng</p><p>Trong khi đ&oacute;, Riot lại chưa c&oacute; 1 kế hoạch cụ thể n&agrave;o để khai th&aacute;c c&acirc;u chuyện về những tướng dị h&igrave;nh hay qu&aacute;i vật. Nếu những tướng dị h&igrave;nh như Vex, Lillia... c&ograve;n c&oacute; cơ hội tham gia v&agrave;o c&aacute;c sự kiện lớn th&igrave; những tướng qu&aacute;i vật gần như &quot;hết cửa&quot;. D&ugrave; rằng cộng đồng vẫn sẽ mong chờ c&acirc;u chuyện về c&aacute;c qu&aacute;i vật từ Hư V&ocirc; hay c&aacute;c lo&agrave;i đ&atilde; xuất hiện trong LMHT như Brackern (Skarner), nhưng sẽ v&ocirc; c&ugrave;ng kh&oacute; để đa dạng vai tr&ograve; của ch&uacute;ng hay tạo sự kết nối với c&aacute;c tướng kh&aacute;c trong LMHT.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/3/tuong-lmht-6-16515928746491989134768.jpg\" target=\"_blank\"><img alt=\"Ngày càng nhiều tướng có hình dạng người xuất hiện trong LMHT, lý do nào đã khiến hội quái vật mất chỗ đứng? - Ảnh 6.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/3/tuong-lmht-6-16515928746491989134768.jpg\" /></a></p><p>Như Xerath c&oacute; li&ecirc;n quan đến Shurima nhưng sẽ kh&ocirc;ng dễ để kết nối với cốt truyện của Nasus, Azir, Renekton... để tạo th&agrave;nh 1 sự kiện ho&agrave;nh tr&aacute;ng v&agrave; Riot cũng chưa c&oacute; l&yacute; do để l&agrave;m điều đ&oacute;</p><p><strong>Riot kh&ocirc;ng thể khai th&aacute;c skin từ những tướng n&agrave;y</strong></p><p>Ngo&agrave;i ra, 1 l&yacute; do (m&agrave; c&oacute; lẽ l&agrave; chủ chốt) ch&iacute;nh l&agrave; Riot sẽ rất kh&oacute; để khai th&aacute;c skin li&ecirc;n quan đến c&aacute;c tướng dị h&igrave;nh hay c&aacute;c tướng qu&aacute;i vật. Điều n&agrave;y đ&atilde; được thể hiện qua rất nhiều lần ra skin mới của Riot. V&agrave; c&oacute; lẽ kh&ocirc;ng cần n&oacute;i cũng biết, c&aacute;c tướng sở hữu nhiều skin nhất (v&agrave; cũng l&agrave; những skin b&aacute;n chạy nhất) cho đến giờ của LMHT đều l&agrave; những c&aacute;i t&ecirc;n đẹp từ mặt tới d&aacute;ng.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/3/tuong-lmht-7-16515930037511471529057.png\" target=\"_blank\"><img alt=\"Ngày càng nhiều tướng có hình dạng người xuất hiện trong LMHT, lý do nào đã khiến hội quái vật mất chỗ đứng? - Ảnh 7.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/3/tuong-lmht-7-16515930037511471529057.png\" /></a></p><p>Hai trong số những tướng c&oacute; nhiều skin nhất LMHT đều l&agrave; hot boy, hot girl</p><p>C&aacute;c skin cho c&aacute;c tướng c&oacute; nh&acirc;n dạng người kh&ocirc;ng chỉ dễ thiết kế m&agrave; c&ograve;n ph&ugrave; hợp với thị hiếu thẩm mỹ của cộng đồng LMHT. D&ugrave; biết l&agrave; c&aacute;c qu&aacute;i vật hay c&aacute;c tướng c&oacute; ngoại h&igrave;nh dị vẫn rất cool ngầu, nhưng nếu kh&ocirc;ng ph&ugrave; hợp meta th&igrave; chắc chắn, chẳng ai bỏ tiền ra để mua skin những tướng n&agrave;y l&agrave;m g&igrave;. Trong khi đ&oacute;, sẽ c&oacute; người sẵn s&agrave;ng m&oacute;c hầu bao cho Lux Thập Đại Nguy&ecirc;n Tố hay Miss Fortune Nữ Thần Kh&ocirc;ng Gian d&ugrave; đ&ocirc;i khi, ch&uacute;ng chẳng c&ograve;n được d&ugrave;ng qu&aacute; nhiều nữa.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/3/tuong-lmht-8-1651593291312754005705.png\" target=\"_blank\"><img alt=\"Ngày càng nhiều tướng có hình dạng người xuất hiện trong LMHT, lý do nào đã khiến hội quái vật mất chỗ đứng? - Ảnh 8.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/3/tuong-lmht-8-1651593291312754005705.png\" /></a></p><p>C&oacute; lẽ kh&ocirc;ng mấy ai c&ograve;n nhớ lần cuối c&ugrave;ng Ornn c&oacute; skin mới l&agrave; khi n&agrave;o nữa</p><p>Trong thời gian tới, sẽ c&oacute; 1 tướng mới từ Hư V&ocirc; xuất hiện, như ch&iacute;nh Riot đ&atilde; &quot;nh&aacute; h&agrave;ng&quot; c&aacute;ch đ&acirc;y &iacute;t l&acirc;u. Chỉ c&oacute; điều, con số tướng qu&aacute;i vật v&agrave; tướng c&oacute; h&igrave;nh d&aacute;ng kỳ dị xuất hiện trong 2 m&ugrave;a giải, t&iacute;nh đến hiện tại, chỉ mới ở con số 3 vẫn l&agrave; qu&aacute; &iacute;t. Nhưng c&oacute; lẽ, Riot cũng sẽ chẳng bận t&acirc;m, nhất l&agrave; khi c&aacute;c tướng c&oacute; nh&acirc;n dạng người vẫn đang chiếm phần lớn trong meta v&agrave; cả trong việc mang lại lợi nhuận b&aacute;n skin khổng lồ.</p>', CAST(N'2022-06-12T15:23:14.000' AS DateTime), N'e7538cc4-7069-4d66-98df-cd2e4a505e15', N'/posts/anh27.jpg', N'live', 10)
INSERT [dbo].[post] ([id], [title], [small_category_id], [metatitle], [description], [content], [created_at], [author], [image], [status], [view]) VALUES (N'6bafe40b-b8a3-4fd9-9394-4f8ef5048773', N'Những chỉnh sửa lớn nhất làm thay đổi cả nền LMHT: Xóa bỏ bảng ngọc bổ trợ cũ xứng đáng được vinh danh', N'0b15399b-1b89-4122-8aeb-ccc9a497e693', N'nhung-chinh-sua-lon-nhat-lam-thay-doi-ca-nen-lmht-xoa-bo-bang-ngoc-bo-tro-cu-xung-dang-duoc-vinh-danh', N'<p>Những chỉnh sửa lớn nhất l&agrave;m thay đổi cả nền LMHT: X&oacute;a bỏ bảng ngọc bổ trợ cũ xứng đ&aacute;ng được vinh danh</p>', N'<h2>Trong số c&aacute;c thay đổi n&agrave;y, việc x&oacute;a bỏ bảng ngọc bổ trợ cũ c&oacute; lẽ l&agrave; quyết định đ&uacute;ng đắn nhất của Riot cho LMHT.</h2><ul></ul><p>Từ khi bắt đầu ra mắt cộng đồng game thủ đến nay,&nbsp;<a href="https://gamek.vn/lmht.htm\" target=\"_blank\">LMHT</a>&nbsp;đ&atilde; trải qua rất nhiều bản cập nhật lớn nhỏ. C&oacute; những cập nhật gần như chẳng thay đổi g&igrave; qu&aacute; nhiều so với phi&ecirc;n bản trước đ&oacute;. Nhưng cũng c&oacute; kh&ocirc;ng &iacute;t cuộc &quot;đại tr&ugrave;ng tu&quot; đ&atilde; l&agrave;m đổi mới ho&agrave;n to&agrave;n diện mạo của LMHT. Thời gian tr&ocirc;i qua, nhiều sự thay đổi m&agrave; khi ngẫm lại, cộng đồng LMHT mới nhận ra ch&uacute;ng quan trọng v&agrave; ảnh hưởng lớn đến tựa game MOBA &quot;quốc d&acirc;n&quot; n&agrave;y như thế n&agrave;o.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/2/thaydoi-lmht-1-16515075144911849253437.png\" target=\"_blank\"><img alt=\"Những chỉnh sửa lớn nhất làm thay đổi cả nền LMHT: Xóa bỏ bảng ngọc bổ trợ cũ xứng đáng được vinh danh - Ảnh 1.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/2/thaydoi-lmht-1-16515075144911849253437.png\" /></a></p><p>LMHT đ&atilde; trải qua rất nhiều thay đổi, v&agrave; kh&ocirc;ng &iacute;t trong số đ&oacute; đ&atilde; mang đến diện mạo mới ho&agrave;n to&agrave;n cho tựa game đ&igrave;nh đ&aacute;m n&agrave;y</p><p><strong>Giới hạn vị tr&iacute; cắm mắt</strong></p><p>Trước đ&acirc;y, v&agrave;o thời kỳ đầu của LMHT, tựa game n&agrave;y kh&ocirc;ng giới hạn vị tr&iacute; cắm mắt. Người chơi c&oacute; thể cắm bất kỳ đ&acirc;u v&agrave; do đ&oacute;, kh&ocirc;ng &iacute;t game thủ đ&atilde; tận dụng điều n&agrave;y để... ph&aacute; game hay chỉ đơn giản l&agrave; thể hiện sự hờn dỗi của m&igrave;nh khi gặp 1 game đấu kh&ocirc;ng như &yacute;, đồng đội kh&ocirc;ng hỗ trợ hay đơn giản chỉ v&igrave;... th&iacute;ch th&igrave; l&agrave;m th&ocirc;i. Chẳng hạn như ch&iacute;nh Hỗ Trợ của Team WE trước đ&acirc;y cũng từng c&oacute; 1 trận b&aacute;n hết trang bị để cắm mắt l&agrave;m s&aacute;ng hết cả bản đồ nhưng lại l&agrave;m&nbsp;<a href="https://gamek.vn/riot.htm\" target=\"_blank\">Riot</a>&nbsp;v&ocirc; c&ugrave;ng kh&oacute; chịu.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/2/thaydoi-lmht-2-1651507584234866104041.jpg\" target=\"_blank\"><img alt=\"Những chỉnh sửa lớn nhất làm thay đổi cả nền LMHT: Xóa bỏ bảng ngọc bổ trợ cũ xứng đáng được vinh danh - Ảnh 2.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/2/thaydoi-lmht-2-1651507584234866104041.jpg\" /></a></p><p>Cắm mắt, kiểm so&aacute;t tầm nh&igrave;n l&agrave; việc v&ocirc; c&ugrave;ng quan trọng v&agrave; từng c&oacute; thời, Riot kh&ocirc;ng giới hạn vị tr&iacute; cắm mắt trong LMHT</p><p>V&agrave; do đ&oacute;, NPH n&agrave;y quyết định sẽ c&oacute; những chỉnh sửa cho c&aacute;c vị tr&iacute; cắm mắt trong game. Để rồi cho đến thời điểm hiện tại, từng vị tr&iacute; cắm mắt cũng c&oacute; thể ảnh hưởng đến trận đấu. Đặc biệt l&agrave; v&agrave;o giai đoạn quyết định cuối game hoặc trước c&aacute;c giao tranh quan trọng. Đ&ocirc;i khi, 1 đội bị qu&eacute;t sạch ho&agrave;n to&agrave;n chỉ do một vị tr&iacute; cắm mắt qu&aacute; ch&iacute; mạng từ đối thủ.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/2/thaydoi-lmht-3-1651507678236562937266.png\" target=\"_blank\"><img alt=\"Những chỉnh sửa lớn nhất làm thay đổi cả nền LMHT: Xóa bỏ bảng ngọc bổ trợ cũ xứng đáng được vinh danh - Ảnh 3.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/2/thaydoi-lmht-3-1651507678236562937266.png\" /></a></p><p>Ở thời điểm b&acirc;y giờ, mỗi con mắt được đặt ra l&agrave; cả những toan t&iacute;nh chiến thuật c&oacute; thể thay đổi cục diện trận đấu</p><p><strong>Cơ chế chọn role trong rank</strong></p><p>Trong 1 team LMHT lu&ocirc;n c&oacute; 5 vị tr&iacute; v&agrave; mỗi vị tr&iacute; đều c&oacute; đ&oacute;ng g&oacute;p v&agrave; ảnh hưởng đến th&agrave;nh t&iacute;ch chung của cả đội. Tuy nhi&ecirc;n, c&oacute; 1 thực tế ch&iacute;nh l&agrave;: gần như kh&ocirc;ng c&oacute; game thủ n&agrave;o muốn bị chơi ở vị tr&iacute; Hỗ Trợ. V&igrave; nhiều l&yacute; do m&agrave; c&oacute; thể kể đến cơ bản như vị tr&iacute; n&agrave;y kh&ocirc;ng thể c&oacute; nhiều mạng hạ gục, vị tr&iacute; n&agrave;y qu&aacute; bị động v&agrave; nh&agrave;m ch&aacute;n, d&ugrave; Hỗ Trợ hay m&agrave; đồng đội dở th&igrave; cũng kh&ocirc;ng thể chiến thắng... T&oacute;m lại, c&oacute; v&ocirc; v&agrave;n l&yacute; do để vị tr&iacute; Hỗ Trợ trở th&agrave;nh &quot;con ghẻ&quot; trong mắt đại đa số cộng đồng LMHT.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/2/thaydoi-lmht-4-16515077786102141990768.png\" target=\"_blank\"><img alt=\"Những chỉnh sửa lớn nhất làm thay đổi cả nền LMHT: Xóa bỏ bảng ngọc bổ trợ cũ xứng đáng được vinh danh - Ảnh 4.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/2/thaydoi-lmht-4-16515077786102141990768.png\" /></a></p><p>Trong thời kỳ đầu, LMHT kh&ocirc;ng cho ph&eacute;p người chơi chọn role khi leo rank v&agrave; ai pick tướng chậm sẽ phải chơi Hỗ Trợ</p><p>Trước khi cơ chế chọn role trong rank được ra mắt, người chơi khi được gh&eacute;p team, nếu chậm tay th&igrave; gần như chắc chắn phải chơi ở vị tr&iacute; Hỗ Trợ. V&agrave; do đ&oacute;, sẽ dễ mang lại cảm x&uacute;c ức chế nếu kh&ocirc;ng thể đổi role hay c&oacute; trận đấu kh&ocirc;ng như &yacute; muốn. V&agrave; sự thay đổi của Riot cho ph&eacute;p người chơi chọn role trước khi t&igrave;m trận rank đ&atilde; thực sự thay đổi cả l&agrave;ng LMHT. Kh&ocirc;ng chỉ c&aacute;c game thủ m&agrave; những tuyển thủ cũng dễ tập luyện, try hard đ&uacute;ng vị tr&iacute; thi đấu của m&igrave;nh.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/2/thaydoi-lmht-5-1651507883303544639330.jpg\" target=\"_blank\"><img alt=\"Những chỉnh sửa lớn nhất làm thay đổi cả nền LMHT: Xóa bỏ bảng ngọc bổ trợ cũ xứng đáng được vinh danh - Ảnh 5.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/2/thaydoi-lmht-5-1651507883303544639330.jpg\" /></a></p><p>Việc cho ph&eacute;p người chơi chọn role đ&atilde; gi&uacute;p game thủ LMHT giải tỏa ức chế khi phải chơi những role kh&ocirc;ng như &yacute;</p><p>Dĩ nhi&ecirc;n, vẫn c&oacute; đ&ocirc;i l&uacute;c sẽ gặp những game thủ v&ocirc; &yacute; thức, chọn role n&agrave;y nhưng lại pick tướng &quot;lạ&quot; v&agrave; thi đấu kh&ocirc;ng hiệu quả. Nhưng việc cho ph&eacute;p người chơi lựa chọn vị tr&iacute; thi đấu y&ecirc;u th&iacute;ch cũng g&oacute;p phần thu h&uacute;t người chơi ở chế độ rank LMHT hơn rất nhiều.</p><p><strong>X&oacute;a bỏ hệ thống bảng ngọc bổ trợ cũ</strong></p><p>Đối với game thủ LMHT l&acirc;u năm, c&oacute; lẽ một trong những k&yacute; ức đ&aacute;ng nhớ nhất ch&iacute;nh l&agrave; bảng&nbsp;<a href="https://gamek.vn/ngoc-bo-tro.htm\" target=\"_blank\">ngọc bổ trợ</a>&nbsp;cũ. C&ograve;n nhớ, khi LMHT mới ra mắt, hệ thống bảng ngọc bổ trợ đ&atilde; khiến kh&ocirc;ng &iacute;t game thủ th&iacute;ch th&uacute;. Tuy nhi&ecirc;n, điều n&agrave;y cũng l&agrave; trở ngại cực lớn. Cần phải biết, l&uacute;c đ&oacute; đa số game thủ LMHT đều chỉ ở lứa tuổi học sinh trung học. Dĩ nhi&ecirc;n cũng c&oacute; những người đ&atilde; trưởng th&agrave;nh v&agrave; đi l&agrave;m nhưng lượng người chơi trẻ vẫn chiếm số đ&ocirc;ng.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/2/thaydoi-lmht-6-16515080543801366559821.jpg\" target=\"_blank\"><img alt=\"Những chỉnh sửa lớn nhất làm thay đổi cả nền LMHT: Xóa bỏ bảng ngọc bổ trợ cũ xứng đáng được vinh danh - Ảnh 6.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/2/thaydoi-lmht-6-16515080543801366559821.jpg\" /></a></p><p>Bảng ngọc cũ - kỷ niệm kh&oacute; qu&ecirc;n của kh&ocirc;ng &iacute;t game thủ LMHT thời kỳ đầu</p><p>Do đ&oacute;, việc bảng ngọc bổ trợ cũ cần bỏ tiền ra mua đ&atilde; tạo n&ecirc;n một r&agrave;o cản rất lớn cho những game thủ mới muốn tiếp cận LMHT. Ấy l&agrave; c&ograve;n chưa kể v&ocirc; số c&aacute;ch build ngọc &quot;dị&quot; đ&atilde; được &quot;ph&aacute;t minh&quot; ở thời điểm n&agrave;y, như AD full gi&aacute;p hay tanker &quot;1 hit 1 mạng&quot;. Thậm ch&iacute;, kh&ocirc;ng &iacute;t tướng khi v&agrave;o trận đ&atilde; &quot;cầm sẵn&quot; 1 thanh B.F khiến những người chơi kh&aacute;c chỉ c&ograve;n c&aacute;ch &quot;giương cờ trắng&quot;.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/2/thaydoi-lmht-7-16515081261582026354342.png\"><img alt=\"Những chỉnh sửa lớn nhất làm thay đổi cả nền LMHT: Xóa bỏ bảng ngọc bổ trợ cũ xứng đáng được vinh danh - Ảnh 7.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/2/thaydoi-lmht-7-16515081261582026354342.png\" /></a></p><p>Thay đổi n&agrave;y mới xứng đ&aacute;ng với niềm tự h&agrave;o &quot;200 năm kinh nghiệm&quot; l&agrave;m game của Riot</p><p>V&agrave; thay đổi bảng ngọc n&agrave;y của Riot ch&iacute;nh l&agrave; việc được cả cộng đồng LMHT hoan ngh&ecirc;nh nhiệt liệt. V&agrave; c&oacute; lẽ, nếu Riot lu&ocirc;n tự h&agrave;o với &quot;200 năm kinh nghiệm l&agrave;m game&quot; của m&igrave;nh, th&igrave; việc x&oacute;a bỏ bảng ngọc bổ trợ cũ, cho đến tận hiện tại, c&oacute; lẽ l&agrave; thứ duy nhất c&oacute; thể xem l&agrave; bằng chứng cho kinh nghiệm l&agrave;m game d&agrave;y dạn của Riot.</p>', CAST(N'2022-06-11T15:22:53.000' AS DateTime), N'e7538cc4-7069-4d66-98df-cd2e4a505e15', N'/posts/anh30.jpg', N'live', 15)
INSERT [dbo].[post] ([id], [title], [small_category_id], [metatitle], [description], [content], [created_at], [author], [image], [status], [view]) VALUES (N'6d2c5e5a-c1fa-4f6b-a5b9-4e6029700dda', N'Xuất hiện tướng mới Liên Quân, chưa xác định được danh tính, dự đoán sẽ cực bá với bộ chiêu thức khủng khiếp', N'e1f28388-b686-4d1e-9a89-df78d1f36c27', N'xuat-hien-tuong-moi-lien-quan-chua-xac-dinh-duoc-danh-tinh-du-doan-se-cuc-ba-voi-bo-chieu-thuc-khung-khiep', N'<p>C&oacute; thể trong thời gian tới, Li&ecirc;n Qu&acirc;n sẽ xuất hiện một vị tướng v&ocirc; c&ugrave;ng b&aacute; đạo.</p>', N'<h2><strong>C&oacute; thể trong thời gian tới, Li&ecirc;n Qu&acirc;n sẽ xuất hiện một vị tướng v&ocirc; c&ugrave;ng b&aacute; đạo.</strong></h2><p>Mới đ&acirc;y, theo Nox AOV News th&igrave;&nbsp;<a href="https://gamek.vn/eimi-fukada-viet-loi-xuc-dong-khi-bien-thanh-skin-lien-quan-sss-huu-han-ten-trang-phuc-moi-that-ba-dao-20220408170510249.chn\" target=\"_blank\">Li&ecirc;n Qu&acirc;n</a>&nbsp;sắp sửa c&oacute; th&ecirc;m một vị tướng mới. Hiện tại, chưa r&otilde; th&ocirc;ng tin cụ thể về vị tướng n&agrave;y bao gồm: T&ecirc;n gọi, vị tr&iacute;, t&ecirc;n của bộ kỹ năng v&agrave; sẽ l&agrave; tướng chuyển thể hay tự s&aacute;ng tạo của&nbsp;<a href="https://gamek.vn/eimi-fukada-viet-loi-xuc-dong-khi-bien-thanh-skin-lien-quan-sss-huu-han-ten-trang-phuc-moi-that-ba-dao-20220408170510249.chn\" target=\"_blank\">Li&ecirc;n Qu&acirc;n</a>. Song ch&iacute;nh những th&ocirc;ng tin n&agrave;y đ&atilde; khiến cho cộng đồng người chơi cảm thấy v&ocirc; c&ugrave;ng h&agrave;o hứng v&agrave; t&ograve; m&ograve;.<img alt=\"Xuất hiện tướng mới Liên Quân, chưa xác định được danh tính, dự đoán sẽ cực bá với bộ chiêu thức khủng khiếp - Ảnh 1.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/4/11/photo-1-1649670895033728523470.jpg\" /></p><p>Th&ocirc;ng qua h&igrave;nh ảnh th&igrave; nhiều người sẽ lầm tưởng đ&acirc;y l&agrave; Tel&rsquo;Annas Thứ Nguy&ecirc;n Vệ Thần, song với nhiều game thủ&nbsp;<a href="https://gamek.vn/eimi-fukada-viet-loi-xuc-dong-khi-bien-thanh-skin-lien-quan-sss-huu-han-ten-trang-phuc-moi-that-ba-dao-20220408170510249.chn\" target=\"_blank\">Li&ecirc;n Qu&acirc;n</a>&nbsp;kỳ cựu nhận định rằng, bỏ qua lớp ngoại trang g&acirc;y nhầm lẫn th&igrave; đ&acirc;y sẽ l&agrave; một vị tướng tương đối b&aacute; đạo sẽ xuất hiện trong tựa game MOBA quốc d&acirc;n n&agrave;y trong thời gian tới.</p><p>C&oacute; b&igrave;nh luận cho rằng, đ&acirc;y l&agrave; vị tướng T&acirc;y Thi chuyển thể từ Vương Giả Vinh Diệu, nhưng với nhiều &ldquo;nguồn tin&rdquo; h&agrave;nh lang th&igrave; lại nhận định vị tướng mới n&agrave;y l&agrave; s&aacute;t thủ v&agrave; kh&ocirc;ng phải T&acirc;y Thi. C&oacute; game thủ nhận x&eacute;t &ldquo;<em>S&aacute;t thủ c&oacute; hẳn hai kỹ năng khống chế, đ&atilde; vậy c&ograve;n c&oacute; một kỹ năng chỉ thẳng v&agrave;o đầu. Dự l&agrave; sẽ b&aacute; cho xem&rdquo;.</em></p><p>Tất nhi&ecirc;n, đ&acirc;y vẫn chỉ l&agrave; th&ocirc;ng tin chưa ch&iacute;nh thức nhưng chắc chắn vị tướng n&agrave;y sẽ l&agrave; một c&aacute;i t&ecirc;n rất đ&aacute;ng mong đợi trong thời gian tới. Chỉ tiếc l&agrave; kh&ocirc;ng biết liệu bao giờ th&igrave; tướng n&agrave;y sẽ ch&iacute;nh thức cập nhật trong m&aacute;y chủ&nbsp;<a href="https://gamek.vn/eimi-fukada-viet-loi-xuc-dong-khi-bien-thanh-skin-lien-quan-sss-huu-han-ten-trang-phuc-moi-that-ba-dao-20220408170510249.chn\" target=\"_blank\">Li&ecirc;n Qu&acirc;n</a>&nbsp;Mặt Trời m&agrave; th&ocirc;i.</p>', CAST(N'2022-06-12T15:20:02.000' AS DateTime), N'e7538cc4-7069-4d66-98df-cd2e4a505e15', N'/posts/anh23.jpg', N'live', 0)
INSERT [dbo].[post] ([id], [title], [small_category_id], [metatitle], [description], [content], [created_at], [author], [image], [status], [view]) VALUES (N'83aac932-fa1a-43f7-bacc-1b6bfb5cfd28', N'Scandal rúng động Liên Quân: Garena bị tố bao che, xóa bình luận game thủ, cuối cùng cũng phải thừa nhận phốt?', N'e1f28388-b686-4d1e-9a89-df78d1f36c27', N'scandal-rung-dong-lien-quan-garena-bi-to-bao-che-xoa-binh-luan-game-thu-cuoi-cung-cung-phai-thua-nhan-phot', N'<p>Mới đ&acirc;y, Garena đ&atilde; phải đăng đ&agrave;n thừa nhận tr&ecirc;n Fanpage của Li&ecirc;n Qu&acirc;n Mobile về scandal n&agrave;y.</p>', N'<h2><strong>Mới đ&acirc;y, Garena đ&atilde; phải đăng đ&agrave;n thừa nhận tr&ecirc;n Fanpage của Li&ecirc;n Qu&acirc;n Mobile về scandal n&agrave;y.</strong></h2><p>Vừa qua, tr&ecirc;n Fanpage Cao Thủ Li&ecirc;n Qu&acirc;n đ&atilde; đăng đ&agrave;n th&ocirc;ng b&aacute;o về việc xử phạt tuyển thủ. Nội dung cụ thể như sau:</p><p><em>1. Tuyển thủ TRẦN &quot;NAMHI&quot; NHẬT NAM thuộc đội tuyển MEMO Game</em></p><p><em>2. Tuyển thủ L&Ecirc; &quot;ANH T&Acirc;N&quot; ANH T&Acirc;N thuộc đội tuyển MEMO Game</em></p><p><em>Chi tiết: Vi phạm Điều 10.10.4 (Ch&ecirc; bai v&agrave; ph&acirc;n biệt đối xử) v&agrave; Điều 10.10.6 (Phỉ b&aacute;ng trong game) thuộc Điều lệ của Đấu Trường Danh Vọng m&ugrave;a Xu&acirc;n 2022.</em></p><p><em>Căn cứ theo Điều 13 về c&aacute;c khung h&igrave;nh phạt, Ban tổ chức quyết định xử phạt như sau:</em></p><p><em>- Cấm thi đấu 6 th&aacute;ng đối với hai VĐV MG AnhT&acirc;n v&agrave; MG NamHi</em></p><p><em>- Quyết định xử phạt c&oacute; hiệu lực từ ng&agrave;y 18/4/2022.</em></p><p><em>- Đội tuyển MEMO Game được ph&eacute;p bổ sung 02 th&agrave;nh vi&ecirc;n thay thế để đ&aacute;p ứng số lượng tuyển thủ tối thiểu theo quy định của BTC trước 15h00 ng&agrave;y 20/04/2022. Sau thời hạn, nếu đội tuyển kh&ocirc;ng đủ số lượng th&agrave;nh vi&ecirc;n tối thiểu, BTC sẽ xử l&yacute; theo quy định.</em></p><p><em>Nếu c&oacute; những bằng chứng tố c&aacute;o về c&aacute;c h&agrave;nh động phi thể thao trong cộng đồng Li&ecirc;n Qu&acirc;n Mobile Việt Nam, c&aacute;c bạn h&atilde;y gửi th&ocirc;ng tin về cho ch&uacute;ng t&ocirc;i tại địa chỉ lqm_congdong@ved.com.vn. Mọi trường hợp sẽ đều được xử l&yacute; theo đ&uacute;ng quy định c&ocirc;ng bằng v&agrave; nghi&ecirc;m minh.</em></p><p><img alt=\"Scandal rúng động Liên Quân: Garena bị tố bao che, xóa bình luận game thủ, cuối cùng cũng phải thừa nhận phốt? - Ảnh 1.\" src="https://gamek.mediacdn.vn/133514250583805952/2022/4/18/-16502731658531140123876.jpg\" /></p><p>Trước đ&oacute;, tr&ecirc;n Fanpage của Li&ecirc;n Qu&acirc;n Mobile, rất nhiều game thủ đ&atilde; b&agrave;y tỏ sự phẫn nộ đối với những h&agrave;nh vi v&agrave; lời n&oacute;i được xem l&agrave; phi thể thao v&agrave; thiếu văn h&oacute;a của một v&agrave;i tuyển thủ tr&ecirc;n livestream. Tuy nhi&ecirc;n, một số người chơi cho biết khi b&igrave;nh luận tr&ecirc;n Fanpage của Li&ecirc;n Qu&acirc;n th&igrave; comment đ&atilde; bị bay m&agrave;u. Một game thủ chia sẻ sự bức x&uacute;c của m&igrave;nh: &ldquo;<em>Buồn cười qu&aacute; c&aacute;c &ocirc;ng ạ. Hiện tại tr&ecirc;n c&aacute;c trang Li&ecirc;n Qu&acirc;n, nhiều kh&aacute;n giả b&agrave;y tỏ sự bức x&uacute;c khi Garena vẫn kh&ocirc;ng c&oacute; động th&aacute;i n&agrave;o về việc tuyển thủ thi đấu chuy&ecirc;n nghiệp l&agrave; Namhi, AnhTan của MemoGame đấu rank b</em><em>ật mic chửi bới ph&acirc;n biệt, mỉa mai với từ ngữ xấu.</em><img alt=\"Scandal rúng động Liên Quân: Garena bị tố bao che, xóa bình luận game thủ, cuối cùng cũng phải thừa nhận phốt? - Ảnh 2.\" src="https://gamek.mediacdn.vn/133514250583805952/2022/4/18/photo-1-16502731827641536180051-16502732387151932386130-16502739235451322229521.jpg\" /></p><p><em>Hơn thế nữa, 80% cmt l&ecirc;n &aacute;n v&agrave; g&oacute;p &yacute; với Gar</em><em>ena d&ugrave; nhẹ nh&agrave;ng, lịch sự nhất đều bị xo&aacute;</em>.&rdquo;<img alt=\"Scandal rúng động Liên Quân: Garena bị tố bao che, xóa bình luận game thủ, cuối cùng cũng phải thừa nhận phốt? - Ảnh 3.\" src="https://gamek.mediacdn.vn/133514250583805952/2022/4/18/16502732493062099380985-1650273293929383652934-16502739683971136423386.jpg\" /></p><p>C&oacute; lẽ sau khi chứng kiến phản ứng mạnh mẽ của cộng đồng th&igrave; cuối c&ugrave;ng, Garena đ&atilde; phải l&ecirc;n tiếng h&agrave;nh động hoặc chờ đợi thu thập đủ bằng chứng. Tuy nhi&ecirc;n th&igrave; điều n&agrave;y c&oacute; xoa dịu được sự phẫn nộ của game thủ hay kh&ocirc;ng th&igrave; lại l&agrave; c&acirc;u chuyện kh&aacute;c khi m&agrave; xem ra, người chơi Li&ecirc;n Qu&acirc;n đ&atilde; bức x&uacute;c lắm rồi.</p>', CAST(N'2022-06-09T14:09:55.000' AS DateTime), N'e7538cc4-7069-4d66-98df-cd2e4a505e15', N'/posts/anh39.jpg', N'live', 0)
INSERT [dbo].[post] ([id], [title], [small_category_id], [metatitle], [description], [content], [created_at], [author], [image], [status], [view]) VALUES (N'8ec18d68-b45c-4d10-bb1a-9d60d72bd12a', N'Dính cáo buộc hành hung bạn gái, sao trẻ Manchester United bị xóa tên khỏi FIFA 22', N'25d00f0f-7ffa-49f3-bfb5-9ff2dcd5d541', N'dinh-cao-buoc-hanh-hung-ban-gai-sao-tre-manchester-united-bi-xoa-ten-khoi-fifa-22', N'<p>Mới đ&acirc;y, sao trẻ của c&acirc;u lạc bộ Manchester United đ&atilde; bị gạch t&ecirc;n khỏi tựa game FIFA 22 sau những c&aacute;o buộc li&ecirc;n quan đến ph&aacute;p l&yacute;.</p>', N'<h2>Mới đ&acirc;y, sao trẻ của c&acirc;u lạc bộ Manchester United đ&atilde; bị gạch t&ecirc;n khỏi tựa game FIFA 22 sau những c&aacute;o buộc li&ecirc;n quan đến ph&aacute;p l&yacute;.</h2><ul></ul><p>V&agrave;i năm trở lại đ&acirc;y, Mason Greenwood được xem l&agrave; một trong những cầu thủ trẻ t&agrave;i năng nhất nước Anh. Tiền đạo sinh năm 2001 n&agrave;y đang ng&agrave;y c&agrave;ng khẳng định được vai tr&ograve; trong m&agrave;u &aacute;o c&acirc;u lạc bộ Manchester United. Tuy sở hữu t&agrave;i năng hiếm c&oacute; nhưng kh&ocirc;ng &iacute;t lần Mason Greenwood khiến c&aacute;c fan phải ng&aacute;n ngẩm bởi những rắc rối đời tư kh&ocirc;ng đ&aacute;ng c&oacute;.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/2/3/photo-1-16438215876021755729560.jpg\" target=\"_blank\"><img alt=\"Dính cáo buộc hành hung bạn gái, sao trẻ Manchester United bị xóa tên khỏi FIFA 22 - Ảnh 1.\" src="https://gamek.mediacdn.vn/133514250583805952/2022/2/3/photo-1-16438215876021755729560.jpg\" /></a></p><p>Mới đ&acirc;y, g&aacute;i cũ của Greenwood l&agrave; Harriet Robson đ&atilde; tố c&aacute;o cầu thủ n&agrave;y c&aacute;c tội danh h&agrave;nh hung v&agrave; đe dọa giết người. Sau đ&oacute;, tiền đạo người Anh đ&atilde; bị bắt tạm giam v&agrave;o chiều ng&agrave;y 30/1.</p><p>&nbsp;</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/2/3/photo-1-16438215912291763761563.jpg\" target=\"_blank\"><img alt=\"Dính cáo buộc hành hung bạn gái, sao trẻ Manchester United bị xóa tên khỏi FIFA 22 - Ảnh 2.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/2/3/photo-1-16438215912291763761563.jpg\" /></a></p><p>&nbsp;</p><p>&nbsp;</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/2/3/photo-2-16438215897061350250083.jpg\" target=\"_blank\"><img alt=\"Dính cáo buộc hành hung bạn gái, sao trẻ Manchester United bị xóa tên khỏi FIFA 22 - Ảnh 3.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/2/3/photo-2-16438215897061350250083.jpg\" /></a></p><p>&nbsp;</p><p>&nbsp;</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/2/3/photo-3-16438215917351914367434.jpg\" target=\"_blank\"><img alt=\"Dính cáo buộc hành hung bạn gái, sao trẻ Manchester United bị xóa tên khỏi FIFA 22 - Ảnh 4.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/2/3/photo-3-16438215917351914367434.jpg\" /></a></p><p>&nbsp;</p><p>Sau khi vụ việc xảy ra, kh&ocirc;ng &iacute;t đơn vị t&agrave;i trợ được cho l&agrave; muốn chấm dứt hợp đồng với Greenwood. Điển h&igrave;nh như mới đ&acirc;y, cầu thủ n&agrave;y đ&atilde; bị EA Sports (nh&agrave; ph&aacute;t h&agrave;nh game b&oacute;ng đ&aacute; FIFA) x&oacute;a khỏi phi&ecirc;n bản FIFA 22. Cũng theo nh&agrave; ph&aacute;t h&agrave;nh, sự xuất hiện trở lại của Mason Greenwood tại FIFA 22 sẽ phụ thuộc v&agrave;o ph&aacute;n quyết cuối c&ugrave;ng từ ph&iacute;a cảnh s&aacute;t.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/2/3/photo-4-16438215897431518368537.jpg\" target=\"_blank\"><img alt=\"Dính cáo buộc hành hung bạn gái, sao trẻ Manchester United bị xóa tên khỏi FIFA 22 - Ảnh 5.\" src="https://gamek.mediacdn.vn/133514250583805952/2022/2/3/photo-4-16438215897431518368537.jpg\" /></a></p><p>Trước th&ocirc;ng tin n&agrave;y, nhiều fan của FIFA 22 v&agrave; c&acirc;u lạc bộ Manchester United đ&atilde; tỏ ra kh&ocirc;ng mấy vui vẻ:</p><p>- &quot;Từ giờ m&igrave;nh phải chọn đội h&igrave;nh ra s&acirc;n m&agrave; kh&ocirc;ng c&oacute; Greenwood.&quot;</p><p>- &quot;Qu&aacute; buồn cho một t&agrave;i năng s&aacute;ng gi&aacute;!&quot;</p><p>- &quot;Hy vọng sự nghiệp của Greenwood sẽ kh&ocirc;ng bị hủy hoại sau sự việc lần n&agrave;y!&quot;</p><p>Được biết, đ&acirc;y kh&ocirc;ng phải l&agrave; lần đầu ti&ecirc;n cầu thủ n&agrave;y vướng phải những rắc rối đời tư. Trước đ&acirc;y, Greenwood từng bị loại khỏi danh s&aacute;ch tập trung của tuyển Anh sau khi dẫn g&aacute;i mại d&acirc;m về kh&aacute;ch sạn v&agrave; vi phạm c&aacute;c y&ecirc;u cầu gi&atilde;n c&aacute;ch x&atilde; hội.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/2/3/photo-5-16438215907411922150850.jpg\" target=\"_blank\"><img alt=\"Dính cáo buộc hành hung bạn gái, sao trẻ Manchester United bị xóa tên khỏi FIFA 22 - Ảnh 6.\" src="https://gamek.mediacdn.vn/133514250583805952/2022/2/3/photo-5-16438215907411922150850.jpg\" /></a></p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/2/3/photo-6-16438215897221839234601.jpg\" target=\"_blank\"><img alt=\"Dính cáo buộc hành hung bạn gái, sao trẻ Manchester United bị xóa tên khỏi FIFA 22 - Ảnh 7.\" src="https://gamek.mediacdn.vn/133514250583805952/2022/2/3/photo-6-16438215897221839234601.jpg\" /></a></p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/2/3/photo-7-1643821590230918053187.jpg\" target=\"_blank\"><img alt=\"Dính cáo buộc hành hung bạn gái, sao trẻ Manchester United bị xóa tên khỏi FIFA 22 - Ảnh 8.\" src="https://gamek.mediacdn.vn/133514250583805952/2022/2/3/photo-7-1643821590230918053187.jpg\" /></a></p><p>Ảnh: Internet</p>', CAST(N'2022-06-11T15:23:30.000' AS DateTime), N'e7538cc4-7069-4d66-98df-cd2e4a505e15', N'/posts/anh24.jpg', N'live', 0)
INSERT [dbo].[post] ([id], [title], [small_category_id], [metatitle], [description], [content], [created_at], [author], [image], [status], [view]) VALUES (N'98b3e91c-93cb-4bc4-97e0-988e89e6dffe', N'Vì Genshin Impact, bỗng dưng Liên Minh: Tốc Chiến và Free Fire gặp hạn “vạ lây” mà chẳng hiểu vì sao', N'58985559-d13a-490c-98bc-5b551b477061', N'vi-genshin-impact-bong-dung-lien-minh-toc-chien-va-free-fire-gap-han-va-lay-ma-chang-hieu-vi-sao', N'<p>Mới đ&acirc;y, Garena đ&atilde; phải đăng đ&agrave;n thừa nhận tr&ecirc;n Fanpage của Li&ecirc;n Qu&acirc;n Mobile về scandal n&agrave;y.</p>', N'<h2><strong>Mới đ&acirc;y, Garena đ&atilde; phải đăng đ&agrave;n thừa nhận tr&ecirc;n Fanpage của Li&ecirc;n Qu&acirc;n Mobile về scandal n&agrave;y.</strong></h2><p>Vừa qua, tr&ecirc;n Fanpage Cao Thủ Li&ecirc;n Qu&acirc;n đ&atilde; đăng đ&agrave;n th&ocirc;ng b&aacute;o về việc xử phạt tuyển thủ. Nội dung cụ thể như sau:</p><p><em>1. Tuyển thủ TRẦN &quot;NAMHI&quot; NHẬT NAM thuộc đội tuyển MEMO Game</em></p><p><em>2. Tuyển thủ L&Ecirc; &quot;ANH T&Acirc;N&quot; ANH T&Acirc;N thuộc đội tuyển MEMO Game</em></p><p><em>Chi tiết: Vi phạm Điều 10.10.4 (Ch&ecirc; bai v&agrave; ph&acirc;n biệt đối xử) v&agrave; Điều 10.10.6 (Phỉ b&aacute;ng trong game) thuộc Điều lệ của Đấu Trường Danh Vọng m&ugrave;a Xu&acirc;n 2022.</em></p><p><em>Căn cứ theo Điều 13 về c&aacute;c khung h&igrave;nh phạt, Ban tổ chức quyết định xử phạt như sau:</em></p><p><em>- Cấm thi đấu 6 th&aacute;ng đối với hai VĐV MG AnhT&acirc;n v&agrave; MG NamHi</em></p><p><em>- Quyết định xử phạt c&oacute; hiệu lực từ ng&agrave;y 18/4/2022.</em></p><p><em>- Đội tuyển MEMO Game được ph&eacute;p bổ sung 02 th&agrave;nh vi&ecirc;n thay thế để đ&aacute;p ứng số lượng tuyển thủ tối thiểu theo quy định của BTC trước 15h00 ng&agrave;y 20/04/2022. Sau thời hạn, nếu đội tuyển kh&ocirc;ng đủ số lượng th&agrave;nh vi&ecirc;n tối thiểu, BTC sẽ xử l&yacute; theo quy định.</em></p><p><em>Nếu c&oacute; những bằng chứng tố c&aacute;o về c&aacute;c h&agrave;nh động phi thể thao trong cộng đồng Li&ecirc;n Qu&acirc;n Mobile Việt Nam, c&aacute;c bạn h&atilde;y gửi th&ocirc;ng tin về cho ch&uacute;ng t&ocirc;i tại địa chỉ lqm_congdong@ved.com.vn. Mọi trường hợp sẽ đều được xử l&yacute; theo đ&uacute;ng quy định c&ocirc;ng bằng v&agrave; nghi&ecirc;m minh.</em></p><p><img alt=\"Scandal rúng động Liên Quân: Garena bị tố bao che, xóa bình luận game thủ, cuối cùng cũng phải thừa nhận phốt? - Ảnh 1.\" src="https://gamek.mediacdn.vn/133514250583805952/2022/4/18/-16502731658531140123876.jpg\" /></p><p>Trước đ&oacute;, tr&ecirc;n Fanpage của Li&ecirc;n Qu&acirc;n Mobile, rất nhiều game thủ đ&atilde; b&agrave;y tỏ sự phẫn nộ đối với những h&agrave;nh vi v&agrave; lời n&oacute;i được xem l&agrave; phi thể thao v&agrave; thiếu văn h&oacute;a của một v&agrave;i tuyển thủ tr&ecirc;n livestream. Tuy nhi&ecirc;n, một số người chơi cho biết khi b&igrave;nh luận tr&ecirc;n Fanpage của Li&ecirc;n Qu&acirc;n th&igrave; comment đ&atilde; bị bay m&agrave;u. Một game thủ chia sẻ sự bức x&uacute;c của m&igrave;nh: &ldquo;<em>Buồn cười qu&aacute; c&aacute;c &ocirc;ng ạ. Hiện tại tr&ecirc;n c&aacute;c trang Li&ecirc;n Qu&acirc;n, nhiều kh&aacute;n giả b&agrave;y tỏ sự bức x&uacute;c khi Garena vẫn kh&ocirc;ng c&oacute; động th&aacute;i n&agrave;o về việc tuyển thủ thi đấu chuy&ecirc;n nghiệp l&agrave; Namhi, AnhTan của MemoGame đấu rank b</em><em>ật mic chửi bới ph&acirc;n biệt, mỉa mai với từ ngữ xấu.</em><img alt=\"Scandal rúng động Liên Quân: Garena bị tố bao che, xóa bình luận game thủ, cuối cùng cũng phải thừa nhận phốt? - Ảnh 2.\" src="https://gamek.mediacdn.vn/133514250583805952/2022/4/18/photo-1-16502731827641536180051-16502732387151932386130-16502739235451322229521.jpg\" /></p><p><em>Hơn thế nữa, 80% cmt l&ecirc;n &aacute;n v&agrave; g&oacute;p &yacute; với Gar</em><em>ena d&ugrave; nhẹ nh&agrave;ng, lịch sự nhất đều bị xo&aacute;</em>.&rdquo;<img alt=\"Scandal rúng động Liên Quân: Garena bị tố bao che, xóa bình luận game thủ, cuối cùng cũng phải thừa nhận phốt? - Ảnh 3.\" src="https://gamek.mediacdn.vn/133514250583805952/2022/4/18/16502732493062099380985-1650273293929383652934-16502739683971136423386.jpg\" /></p><p>C&oacute; lẽ sau khi chứng kiến phản ứng mạnh mẽ của cộng đồng th&igrave; cuối c&ugrave;ng, Garena đ&atilde; phải l&ecirc;n tiếng h&agrave;nh động hoặc chờ đợi thu thập đủ bằng chứng. Tuy nhi&ecirc;n th&igrave; điều n&agrave;y c&oacute; xoa dịu được sự phẫn nộ của game thủ hay kh&ocirc;ng th&igrave; lại l&agrave; c&acirc;u chuyện kh&aacute;c khi m&agrave; xem ra, người chơi Li&ecirc;n Qu&acirc;n đ&atilde; bức x&uacute;c lắm rồi.</p>', CAST(N'2022-06-07T14:23:17.000' AS DateTime), N'94badfa9-d935-4c16-b58c-814c9bcbe3e7', N'/posts/anh45.jpg', N'live', 12)
INSERT [dbo].[post] ([id], [title], [small_category_id], [metatitle], [description], [content], [created_at], [author], [image], [status], [view]) VALUES (N'c234b73b-e3ac-4ce2-98ff-61e343cb1714', N'Những thứ hiếm gặp đến kỳ quặc trong thế giới Genshin Impact', N'4227e3dd-3cf1-4930-a579-7b3ff8e632c8', N'nhung-thu-hiem-gap-den-ky-quac-trong-the-gioi-genshin-impact', N'<p>C&oacute; qu&aacute; nhiều thứ kỳ kỳ m&agrave; bạn chẳng mấy khi gặp được Genshin Impact, m&agrave; hoặc cũng c&oacute; thể l&agrave; do bạn kh&ocirc;ng để &yacute;.</p>', N'<h2>C&oacute; qu&aacute; nhiều thứ kỳ kỳ m&agrave; bạn chẳng mấy khi gặp được Genshin Impact, m&agrave; hoặc cũng c&oacute; thể l&agrave; do bạn kh&ocirc;ng để &yacute;.</h2><ul></ul><p>&nbsp;</p><p><strong>1. &quot;Bảo Ngọc C&aacute; Chạch&quot;</strong></p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/1/photo-1-16513384107421115818102.jpg\" target=\"_blank\"><img alt=\"Những thứ hiếm gặp đến kỳ quặc trong thế giới Genshin Impact - Ảnh 1.\" src="https://gamek.mediacdn.vn/133514250583805952/2022/5/1/photo-1-16513384107421115818102.jpg\" /></a></p><p>Bảo Ngọc C&aacute; Chạch l&agrave; một nguy&ecirc;n liệu c&oacute; thể nhận được khi thu thập C&aacute; Chạch ở Địch Hoa Ch&acirc;u, Liyue. Lo&agrave;i c&aacute; n&agrave;y c&oacute; rất &iacute;t v&agrave; kh&oacute; bắt gặp được, đồng thời, nguy&ecirc;n liệu thu thập được từ n&oacute; cũng kh&ocirc;ng c&oacute; t&aacute;c dụng g&igrave; trong việc n&acirc;ng cấp nh&acirc;n vật hay vũ kh&iacute;.</p><p><strong>2. Nhện</strong></p><p>Nhện l&agrave; một trong những kẻ địch kh&oacute; bắt gặp nhất trong Genshin Impact, mặc d&ugrave; trong những game thế giới mở, lo&agrave;i sinh vật n&agrave;y rất hay được đưa v&agrave;o.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/1/photo-1-1651338414291923222089.jpg\" target=\"_blank\"><img alt=\"Những thứ hiếm gặp đến kỳ quặc trong thế giới Genshin Impact - Ảnh 2.\" src="https://gamek.mediacdn.vn/133514250583805952/2022/5/1/photo-1-1651338414291923222089.jpg\" /></a></p><p>Người chơi GI chỉ c&oacute; thể bắt gặp Nhện trong một số B&iacute; Cảnh hoặc địa điểm cụ thể, chẳng hạn như ở Dốc Phỉ Th&uacute;y sau khi người chơi l&agrave;m nhiệm vụ 9 Trụ Cứu Thế. Một số con nhện c&oacute; thể được t&igrave;m thấy ở &Acirc;u T&agrave;ng Sơn, gần một H&ograve;m Địa Linh.</p><p><strong>3. Mắt B&atilde;o</strong></p><p>Những người chơi ở AR thấp sẽ bắt gặp Mắt B&atilde;o nhiều lần. L&uacute;c n&agrave;y, Mắt B&atilde;o đ&oacute;ng vai tr&ograve; một con boss nhỏ c&oacute; thể bay tr&ecirc;n cao v&agrave; c&oacute; nhiều HP hơn những kẻ địch kh&aacute;c. Nhưng khi người chơi l&ecirc;n AR cao hơn, Mắt B&atilde;o sẽ &iacute;t xuất hiện đi rất nhiều, chỉ c&oacute; thể bắt gặp ở một số nhiệm vụ ủy th&aacute;c hằng ng&agrave;y.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/1/photo-2-16513384148061290404985.jpg\" target=\"_blank\"><img alt=\"Những thứ hiếm gặp đến kỳ quặc trong thế giới Genshin Impact - Ảnh 3.\" src="https://gamek.mediacdn.vn/133514250583805952/2022/5/1/photo-2-16513384148061290404985.jpg\" /></a></p><p>Mắt B&atilde;o cũng kh&ocirc;ng rơi bất cứ nguy&ecirc;n liệu n&agrave;o, n&ecirc;n người chơi c&agrave;ng kh&ocirc;ng c&oacute; l&yacute; do đi t&igrave;m ch&uacute;ng. Nhưng nếu muốn bắt gặp lại, bạn c&oacute; thể đến &Acirc;u T&agrave;ng Sơn v&agrave; chạm tr&aacute;n với 2 Mắt B&atilde;o ở sườn n&uacute;i.</p><p><strong>5. Gặp Hilichurl Kỳ Lạ</strong></p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/1/photo-1-1651338607820232965514.jpg\" target=\"_blank\"><img alt=\"Những thứ hiếm gặp đến kỳ quặc trong thế giới Genshin Impact - Ảnh 4.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/1/photo-1-1651338607820232965514.jpg\" /></a></p><p>&nbsp;Đối với những người chơi kh&ocirc;ng qu&aacute; quan t&acirc;m tới th&agrave;nh tựu game, Hilichurl Kỳ Lạ rất kh&oacute; để bắt gặp v&agrave; dễ g&acirc;y bất ngờ. Hilichurl n&agrave;y được l&agrave;m dựa theo CEO của miHoYo, c&ocirc;ng ty ph&aacute;t triển Genshin Impact, với tạo h&igrave;nh v&agrave; skill h&agrave;i hước.</p><p>Hilichurl Kỳ Kạ được t&igrave;m thấy ở c&aacute;c vị tr&iacute; kh&aacute;c nhau mỗi ng&agrave;y v&agrave; một khi bị đ&aacute;nh bại, con kh&aacute;c c&oacute; thể sẽ xuất hiện. Phần thưởng khi đ&aacute;nh bại Hilichurl Kỳ Lạ cũng kh&aacute; ngẫu nhi&ecirc;n, nhưng thường l&agrave; bắp cải &ndash; một trong những Easter Egg th&uacute; vị được c&agrave;i cắm v&agrave;o game.</p><p><strong>6. Nhặt được Th&aacute;nh Di Vật ho&agrave;n hảo</strong></p><p>Nhiều người chơi v&iacute; von rằng nhận được Th&aacute;nh Di Vật ho&agrave;n hảo c&ograve;n kh&oacute; hơn cả nhận được nh&acirc;n vật 5 sao, v&agrave; điều n&agrave;y cũng kh&ocirc;ng sai. Chẳng c&oacute; nỗi đau n&agrave;o lớn hơn khi c&aacute;c m&oacute;n Th&aacute;nh Di Vật v&agrave;ng ch&oacute;i m&agrave; bạn nhận được lại c&oacute; chỉ số DEF, HP v&agrave; tinh th&ocirc;ng nguy&ecirc;n tố. Hiếm hoi hơn nữa l&agrave; rơi c&aacute;c m&oacute;n Th&aacute;nh Di Vật tăng s&aacute;t thương nguy&ecirc;n tố c&oacute; chỉ số phụ đ&uacute;ng &yacute;.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/1/photo-8-1651338414938720051296.jpg\" target=\"_blank\"><img alt=\"Những thứ hiếm gặp đến kỳ quặc trong thế giới Genshin Impact - Ảnh 5.\" src="https://gamek.mediacdn.vn/133514250583805952/2022/5/1/photo-8-1651338414938720051296.jpg\" /></a></p><p>Tuy nhi&ecirc;n, trong tương lai, c&oacute; thể Th&aacute;nh Di Vật sẽ kh&ocirc;ng c&ograve;n l&agrave; nỗi đau của c&aacute;c người chơi Genshin Impact nữa, v&igrave; c&oacute; thể tận dụng cho c&aacute;c nh&acirc;n vật thi&ecirc;n về c&aacute;c chỉ số như DEF, HP v&agrave; hiệu quả nạp. Thế nhưng ch&uacute;ng ta vẫn cần phải chấp nhận rằng sở hữu một m&oacute;n Th&aacute;nh Di Vật với chỉ số ho&agrave;n hảo l&agrave; điều kh&ocirc;ng thể.</p>', CAST(N'2022-06-11T15:21:18.000' AS DateTime), N'94badfa9-d935-4c16-b58c-814c9bcbe3e7', N'/posts/anh31.jpg', N'live', 0)
INSERT [dbo].[post] ([id], [title], [small_category_id], [metatitle], [description], [content], [created_at], [author], [image], [status], [view]) VALUES (N'e7fd16bd-71c5-4e88-b2f8-3f9dc0bbc7f8', N'Genshin Impact: Cách khắc phục khi người chơi đổi nhầm Mối Duyên Tương Ngộ', N'4227e3dd-3cf1-4930-a579-7b3ff8e632c8', N'genshin-impact-cach-khac-phuc-khi-nguoi-choi-doi-nham-moi-duyen-tuong-ngo', N'<p>Nếu đổi nhầm Nguy&ecirc;n Thạch th&agrave;nh Mối Duy&ecirc;n Tương Ngộ, người chơi Genshin Impact vẫn c&oacute; cơ hội đổi lại.</p>', N'<h2>Nếu đổi nhầm Nguy&ecirc;n Thạch th&agrave;nh Mối Duy&ecirc;n Tương Ngộ, người chơi Genshin Impact vẫn c&oacute; cơ hội đổi lại.</h2><ul></ul><p>Kể từ khi ra mắt v&agrave;o năm 2020, Genshin Impact đ&atilde; trở th&agrave;nh một trong những tựa game gacha th&agrave;nh c&ocirc;ng nhất. Để gacha, người chơi phải sử dụng đơn vị tiền tệ đặc biệt (Nguy&ecirc;n Thạch) trong game để đổi lấy Mối Duy&ecirc;n Vương Vấn hoặc Mối Duy&ecirc;n Tương Ngộ. C&aacute;c banner nh&acirc;n vật sẽ k&eacute;o d&agrave;i khoảng 22 ng&agrave;y, sử dụng Mối Duy&ecirc;n Vương Vấn để gacha.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/4/25/genshin-impact-acquiant-fate-1650876177787980290863.jpg\" target=\"_blank\"><img alt=\"Genshin Impact: Cách khắc phục khi người chơi đổi nhầm Mối Duyên Tương Ngộ - Ảnh 1.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/4/25/genshin-impact-acquiant-fate-1650876177787980290863.jpg\" /></a></p><p>Mỗi Mối Duy&ecirc;n Vương Vấn sẽ tốn 160 Nguy&ecirc;n Thạch. Khi đổi nguy&ecirc;n thạch sang đơn vị gacha, nhiều người đ&atilde; đổi nhầm th&agrave;nh Mối Duy&ecirc;n Tương Ngộ (m&agrave;u xanh), vốn l&agrave; đơn vị chỉ d&ugrave;ng được cho banner thường. Những &quot;sự cố&quot; n&agrave;y khiến cho nhiều player rơi v&agrave;o t&igrave;nh huống dở kh&oacute;c dở cười, khi t&iacute;ch được rất nhiều Nguy&ecirc;n Thạch nhưng lại đổi nhầm đơn vị gacha.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/4/25/genshin-impact-antiquate-intertwined-fate-how-to-1650876372304350430808.jpg\" target=\"_blank\"><img alt=\"Genshin Impact: Cách khắc phục khi người chơi đổi nhầm Mối Duyên Tương Ngộ - Ảnh 2.\" src="https://gamek.mediacdn.vn/133514250583805952/2022/4/25/genshin-impact-antiquate-intertwined-fate-how-to-1650876372304350430808.jpg\" /></a></p><p>Để giải quyết vấn đề kh&oacute; chịu n&agrave;y, một người d&ugrave;ng Reddit đ&atilde; chia sẻ kinh nghiệm cho những ai lỡ đổi Nguy&ecirc;n Thạch th&agrave;nh Mối Duy&ecirc;n Tương Ngộ. Hy vọng những th&ocirc;ng tin n&agrave;y c&oacute; thể gi&uacute;p đỡ c&aacute;c player v&ocirc; t&igrave;nh mắc phải sai lầm tr&ecirc;n trong tương lai.</p><p>Theo chia sẻ của người d&ugrave;ng u/Junichi, anh đ&atilde; v&ocirc; t&igrave;nh đổi số lượng lớn Nguy&ecirc;n Thạch th&agrave;nh Mối Duy&ecirc;n Tương Ngộ. Tuy nhi&ecirc;n, người d&ugrave;ng n&agrave;y cũng cho biết vẫn c&oacute; thể ho&agrave;n lại số Nguy&ecirc;n Thạch đ&atilde; đổi &ndash; điều tưởng như l&agrave; kh&ocirc;ng thể xảy ra.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/4/25/screenshot20220327213447-16508763971271328444613.jpg\" target=\"_blank\"><img alt=\"Genshin Impact: Cách khắc phục khi người chơi đổi nhầm Mối Duyên Tương Ngộ - Ảnh 3.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/4/25/screenshot20220327213447-16508763971271328444613.jpg\" /></a></p><p>Theo người chơi n&agrave;y, sau khi v&ocirc; t&igrave;nh đổi nhầm, c&oacute; bốn bước ch&iacute;nh m&agrave; player cần phải thực hiện ngay lập tức:</p><p>1, Gửi mail đến Hoyoverse c&agrave;ng nhanh c&agrave;ng tốt.</p><p>2, Tr&igrave;nh b&agrave;y cụ thể về việc đổi nhầm Nguy&ecirc;n Thạch th&agrave;nh Mối Duy&ecirc;n Tương Ngộ một c&aacute;ch ngắn gọn, s&uacute;c t&iacute;ch.</p><p>3, Cung cấp h&igrave;nh chụp m&agrave;n h&igrave;nh l&agrave;m bằng chứng. C&aacute;c h&igrave;nh ảnh n&agrave;y cũng n&ecirc;n bao gồm cả h&igrave;nh trước khi sự cố đổi nhầm xảy ra.</p><p>4, Kh&ocirc;ng sử dụng vi&ecirc;n Mối Duy&ecirc;n Tương Ngộ n&agrave;o. Đ&acirc;y l&agrave; điều quan trọng nhất trong tất cả.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/4/25/04251-16508762711801228226463.jpg\" target=\"_blank\"><img alt=\"Genshin Impact: Cách khắc phục khi người chơi đổi nhầm Mối Duyên Tương Ngộ - Ảnh 4.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/4/25/04251-16508762711801228226463.jpg\" /></a></p><p>Người chơi n&agrave;y th&ocirc;ng b&aacute;o đ&atilde; được đổi Mối Duy&ecirc;n Tương Ngộ th&agrave;nh Mối Duy&ecirc;n Vương vấn v&agrave;o ng&agrave;y 11/04.</p><p>Ngo&agrave;i ra, player n&agrave;y cũng cho biết Hoyoverse sẽ hỏi về cả thời gian (m&uacute;i thời gian theo sever đang chơi) khi sự cố xảy ra. Điều n&agrave;y cũng c&oacute; nghĩa nếu người chơi cố t&igrave;nh lợi dụng kẽ hở n&agrave;o đ&oacute; để đổi lấy Mối Duy&ecirc;n miễn ph&iacute;, th&igrave; sẽ bị ph&aacute;t hiện ngay.</p><p>Banner thường v&agrave; Mối Duy&ecirc;n Tương Ngộ đang dần dần bị &quot;bỏ rơi&quot; trong Genshin Impact. Người chơi vẫn c&oacute; thể sở hữu c&aacute;c nh&acirc;n vật trong banner thường trong banner nh&acirc;n vật. Ngo&agrave;i ra, gi&aacute; trị của Mối Duy&ecirc;n Vương Vấn v&agrave; Mối Duy&ecirc;n Tương Ngộ l&agrave; tương đương nhau, v&igrave; vậy, banner thường đ&atilde; trở n&ecirc;n cực kỳ k&eacute;m hấp dẫn trong mắt player.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/4/25/unnamed-file-2975-16508764321942028777632.jpg\" target=\"_blank\"><img alt=\"Genshin Impact: Cách khắc phục khi người chơi đổi nhầm Mối Duyên Tương Ngộ - Ảnh 5.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/4/25/unnamed-file-2975-16508764321942028777632.jpg\" /></a></p><p>Theo một số tin tức r&ograve; rỉ gần đ&acirc;y, c&aacute;c bản cập nhật sắp tới của Genshin c&oacute; thể sẽ th&ecirc;m v&agrave;o t&iacute;nh năng hoặc cơ chế gacha mới cho banner thường, gi&uacute;p người chơi tốn &iacute;t Nguy&ecirc;n Thạch hơn, thậm ch&iacute; l&agrave; kh&ocirc;ng hề tốn Nguy&ecirc;n Thạch. Tuy nhi&ecirc;n, đ&acirc;y vẫn l&agrave; th&ocirc;ng tin chưa được x&aacute;c thực. Nhưng chắc chắn, cơ chế gacha của Genshin Impact sẽ c&ograve;n nhiều thay đổi nữa trong tương lai, gi&uacute;p người chơi mới dễ sở hữu nh&acirc;n vật 5 sao hơn.</p>', CAST(N'2022-06-11T15:20:38.000' AS DateTime), N'94badfa9-d935-4c16-b58c-814c9bcbe3e7', N'/posts/anh34.jpg', N'live', 0)
INSERT [dbo].[post] ([id], [title], [small_category_id], [metatitle], [description], [content], [created_at], [author], [image], [status], [view]) VALUES (N'ede4889c-cf3c-406d-b29c-a50ef3df9f56', N'Tựa game cà khịa Free Fire là đồ “không có cửa” chính thức bị khai tử, nhìn ảnh này mà thấy tức!', N'3674b773-3585-49d4-8a63-690eb8974bf8', N'tua-game-ca-khia-free-fire-la-do-khong-co-cua-chinh-thuc-bi-khai-tu-choi-bn-voi-lua-khong-tho-duoc-dau', N'<p>Tựa game từng c&agrave; khịa Free Fire l&agrave; đồ &ldquo;kh&ocirc;ng c&oacute; cửa&rdquo; ch&iacute;nh thức bị khai tử, đ&uacute;ng l&agrave; &ldquo;kh&ocirc;ng được đ&ugrave;a với lửa&rdquo;</p>', N'<h2><strong>Tựa game từng c&agrave; khịa Free Fire l&agrave; đồ &ldquo;kh&ocirc;ng c&oacute; cửa&rdquo; ch&iacute;nh thức bị khai tử, đ&uacute;ng l&agrave; &ldquo;kh&ocirc;ng được đ&ugrave;a với lửa&rdquo;</strong></h2><p>V&agrave;o thời điểm Rules of Survival mới được ph&aacute;t h&agrave;nh tại thị trường Việt Nam, tựa game n&agrave;y đ&atilde; &ldquo;tấn c&ocirc;ng&rdquo; trực tiếp v&agrave;o đối thủ của m&igrave;nh. Th&uacute; vị đ&oacute; kh&ocirc;ng phải l&agrave; PUBG Mobile (đơn giản l&agrave; bởi ng&agrave;y đ&oacute; chưa c&oacute; th&ocirc;ng tin về sản phẩm n&agrave;y) m&agrave; đ&oacute; lại l&agrave; Free Fire, một tựa game được ph&aacute;t triển bởi studio Việt l&agrave; 111dots Studio.</p><p>Ng&agrave;y đ&oacute;, Rules of Survival đ&atilde; đưa một t&iacute;nh năng của game sinh tồn li&ecirc;n quan đến c&aacute;nh cửa để so s&aacute;nh. L&yacute; do l&agrave; bởi v&igrave; Free Fire l&agrave; game &ldquo;kh&ocirc;ng c&oacute; cửa&rdquo;. Nếu nghĩ theo cả nghĩa đen lẫn nghĩa b&oacute;ng th&igrave; c&oacute; thể hiểu &yacute; định của Rules of Survival ngầm &aacute;m chỉ rằng, Free Fire l&agrave; một tựa game &ldquo;kh&ocirc;ng xứng tầm&rdquo;.</p><p><img alt=\"Tựa game cà khịa Free Fire là đồ “không có cửa” chính thức bị khai tử, chơi b*n với lửa không thọ được đâu - Ảnh 1.\" src="https://gamek.mediacdn.vn/133514250583805952/2022/4/28/165116428085567803933-165116430311949747813.jpg\" /></p><p>Thậm ch&iacute;, Rules of Survival c&ograve;n đưa cả h&igrave;nh ảnh của Free Fire l&ecirc;n để so s&aacute;nh trực tiếp với mục đ&iacute;ch d&igrave;m h&agrave;ng đối thủ. Nhưng c&aacute;i kết sau đ&oacute; th&igrave; ai cũng đ&atilde; r&otilde;. Free Fire th&igrave; l&ecirc;n như diều gặp gi&oacute; khi từ một tựa game sinh tồn đơn thuần đ&atilde; trở th&agrave;nh hiện tượng của l&agrave;ng game thế giới. Li&ecirc;n tiếp đứng trong top 10 tr&ograve; chơi doanh thu lớn nhất to&agrave;n cầu h&agrave;ng th&aacute;ng.</p><p>Trong khi đ&oacute;, Rules of Survival vật vờ như một chiếc b&oacute;ng kể từ thời điểm PUBG Mobile được ph&aacute;t h&agrave;nh. Th&uacute; vị l&agrave; kh&ocirc;ng phải tựa game của NetEase m&agrave; ch&iacute;nh Free Fire mới l&agrave; đối trọng của PUBG Mobile tr&ecirc;n phạm vi to&agrave;n cầu chứ kh&ocirc;ng t&iacute;nh ri&ecirc;ng tại một thị trường cố định n&agrave;o.</p><p>Ở chiều ngược lại th&igrave; mới đ&acirc;y, Rules of Survival đ&atilde; ch&iacute;nh thức bị khai tử bởi d&ugrave; c&oacute; cố gắng duy tr&igrave; ph&aacute;t h&agrave;nh tới năm thứ 4 đi chăng nữa th&igrave; số lượng người chơi của tựa game n&agrave;y cũng đ&atilde; sụt giảm nặng nề. Trong khi sự cạnh tranh của d&ograve;ng game sinh tồn di động th&igrave; ng&agrave;y c&agrave;ng khốc liệt. Đến cả những c&aacute;i t&ecirc;n mới được ph&aacute;t h&agrave;nh như PUBG Mobile 2 cũng kh&ocirc;ng thể c&oacute; được một chỗ đứng vững chắc chứ đừng n&oacute;i đến một phi&ecirc;n bản &ldquo;clone&rdquo; như Rules of Survival đ&atilde; ra mắt từ năm 2017.<img alt=\"Tựa game cà khịa Free Fire là đồ “không có cửa” chính thức bị khai tử, chơi b*n với lửa không thọ được đâu - Ảnh 2.\" src="https://gamek.mediacdn.vn/133514250583805952/2022/4/28/-16511642834781616942835.jpg\" /></p><p>Nh&igrave;n lại th&agrave;nh tựu của Rules of Survival th&igrave; đ&acirc;y giống như một &ldquo;h&ograve;n đ&aacute; n&eacute;m xuống ao b&egrave;o&rdquo; bởi tr&ograve; chơi n&agrave;y từng thu h&uacute;t được sự ch&uacute; &yacute; của cộng đồng khi l&agrave; sản phẩm game sinh tồn gần như l&agrave; đầu ti&ecirc;n tr&ecirc;n nền tảng di động. Thời điểm đ&oacute;, Rules of Survival cố gắng &ldquo;nh&aacute;i&rdquo; to&agrave;n bộ t&iacute;nh năng của PUBG. Nhưng kể từ sau khi PUBG Mobile được ph&aacute;t h&agrave;nh, Rules of Survival c&agrave;ng ng&agrave;y c&agrave;ng rơi v&agrave;o qu&ecirc;n l&atilde;ng. Cũng từ đ&oacute;, kh&ocirc;ng thấy Rules of Survival c&agrave; khịa Free Fire nữa. Giờ mới thấy, ai mới đ&uacute;ng l&agrave; game &ldquo;kh&ocirc;ng c&oacute; cửa&rdquo;.</p>', CAST(N'2022-06-11T15:14:45.000' AS DateTime), N'94badfa9-d935-4c16-b58c-814c9bcbe3e7', N'/posts/anh40.jpg', N'live', 0)
INSERT [dbo].[post] ([id], [title], [small_category_id], [metatitle], [description], [content], [created_at], [author], [image], [status], [view]) VALUES (N'ee8c325a-7de2-47a0-8be9-13ef7b0e23f6', N'BLV Hoàng Luân lên tiếng về drama DNS: \"BTC không có nghĩa vụ cung cấp bằng chứng\", khẳng định \"Riot cũng có tiền lệ\"', N'0b15399b-1b89-4122-8aeb-ccc9a497e693', N'blv-hoang-luan-len-tieng-ve-drama-dns-btc-khong-co-nghia-vu-cung-cap-bang-chung-khang-dinh-riot-cung-co-tien-le', N'<p>BLV Ho&agrave;ng Lu&acirc;n l&ecirc;n tiếng về drama DNS: &quot;BTC kh&ocirc;ng c&oacute; nghĩa vụ cung cấp bằng chứng&quot;, khẳng định &quot;Riot cũng c&oacute; tiền lệ&quot;</p>', N'<h2>BLV Ho&agrave;ng Lu&acirc;n mới đ&acirc;y đ&atilde; l&ecirc;n tiếng về drama DNS - BTC VCS.</h2><ul></ul><p>Những ng&agrave;y qua, cộng đồng&nbsp;<a href="https://gamek.vn/vcs.htm\" target=\"_blank\">VCS</a>&nbsp;d&agrave;nh rất nhiều sự ch&uacute; &yacute; cho vụ việc xảy ra giữa&nbsp;<a href="https://gamek.vn/dns-gaming.htm\" target=\"_blank\">DNS Gaming</a>&nbsp;v&agrave; BTC VCS. Theo đ&oacute;, sau khi bị BTC VCS đưa ra &aacute;n phạt về h&agrave;nh vi d&agrave;n xếp trận đấu, ph&iacute;a DNS đ&atilde; phản ph&aacute;o cực gắt v&agrave; tuy&ecirc;n bố sẵn s&agrave;ng đối chất với b&ecirc;n ph&iacute;a BTC giải đấu&nbsp;<a href="https://gamek.vn/lmht.htm\" target=\"_blank\">LMHT</a>&nbsp;cao nhất Việt Nam. Trong khi đ&oacute;, cộng đồng VCS cũng chia 5 xẻ bảy v&agrave; nổ ra v&ocirc; số tranh c&atilde;i về vụ việc.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/3/dns-btcvcs-drama-1-1651546816074440417810.png\" target=\"_blank\"><img alt=\"BLV Hoàng Luân lên tiếng về drama DNS: BTC không có nghĩa vụ cung cấp bằng chứng, khẳng định Riot cũng có tiền lệ - Ảnh 1.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/3/dns-btcvcs-drama-1-1651546816074440417810.png\" /></a></p><p>Th&ocirc;ng b&aacute;o xử phạt DNS của BTC VCS</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/3/dns-btcvcs-drama-2-16515468813991298133427.png\" target=\"_blank\"><img alt=\"BLV Hoàng Luân lên tiếng về drama DNS: BTC không có nghĩa vụ cung cấp bằng chứng, khẳng định Riot cũng có tiền lệ - Ảnh 2.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/3/dns-btcvcs-drama-2-16515468813991298133427.png\" /></a></p><p>Ph&iacute;a đại diện DNS tuy&ecirc;n bố sẵn s&agrave;ng đối chất nếu BTC VCS c&oacute; bằng chứng</p><p>Mới đ&acirc;y nhất,&nbsp;<a href="https://gamek.vn/blv-hoang-luan.htm\" target=\"_blank\">BLV Ho&agrave;ng Lu&acirc;n</a>&nbsp;- 1 c&aacute;i t&ecirc;n cực kỳ c&oacute; tiếng n&oacute;i trong cộng đồng VCS đ&atilde; l&ecirc;n tiếng về vụ việc. Trong buổi stream mới đ&acirc;y, nam BLV danh tiếng của l&agrave;ng LMHT Việt đ&atilde; nhận được rất nhiều c&acirc;u hỏi về vụ việc của DNS - BTC VCS. Trước đ&acirc;y, BLV Ho&agrave;ng Lu&acirc;n cũng l&agrave; th&agrave;nh vi&ecirc;n trong BTC VCS. Nhưng ở thời điểm hiện tại, anh đ&atilde; rời khỏi vai tr&ograve; n&agrave;y v&agrave; chỉ c&ograve;n đảm nhiệm c&ocirc;ng việc b&igrave;nh luận c&aacute;c trận đấu ở VCS v&agrave; một số trận ở LCK.</p><p>Theo đ&oacute;, BLV Ho&agrave;ng Lu&acirc;n đ&atilde; trả lời thẳng thắn về vụ việc DNS:&nbsp;<em>&quot;Cộng đồng tạo sức &eacute;p cho BTC VCS l&agrave; đ&uacute;ng, để ph&iacute;a BTC sẽ c&oacute; những th&ocirc;ng b&aacute;o r&otilde; r&agrave;ng hơn trong thời gian tới. Tuy nhi&ecirc;n, c&oacute; 1 điều n&agrave;y m&agrave; nhiều người nghe xong sẽ buồn, sẽ cho rằng giải kh&ocirc;ng chuy&ecirc;n nghiệp, ch&iacute;nh l&agrave;: BTC kh&ocirc;ng c&oacute; nghĩa vụ phải cung cấp bằng chứng cho cộng đồng. V&agrave; điều n&agrave;y ngay cả ở Riot cũng đ&atilde; c&oacute; tiền lệ. Như trước đ&acirc;y ch&iacute;nh Riot từng buộc 1 chủ đội phải b&aacute;n đội tuyển của m&igrave;nh trong v&ograve;ng 24 giờ v&igrave; l&yacute; do n&agrave;o đ&oacute; m&agrave; ph&iacute;a Riot kh&ocirc;ng hề cung cấp bằng chứng.&quot;</em></p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/3/pelu-dramadns-btcvcs-1-16515555727981674106763.png\"><img alt=\"BLV Hoàng Luân lên tiếng về drama DNS: BTC không có nghĩa vụ cung cấp bằng chứng, khẳng định Riot cũng có tiền lệ - Ảnh 3.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/3/pelu-dramadns-btcvcs-1-16515555727981674106763.png\" /></a></p><p>BLV Ho&agrave;ng Lu&acirc;n khẳng định tr&ecirc;n stream: &quot;BTC VCS kh&ocirc;ng c&oacute; nghĩa vụ cung cấp bằng chứng cho cộng đồng&quot;</p><p>BLV Ho&agrave;ng Lu&acirc;n cũng lấy trường hợp của tuyển thủ PHT b&ecirc;n ph&iacute;a OverPower Esports v&agrave; c&aacute;c trường hợp b&aacute;n độ b&ecirc;n ph&iacute;a LPL. Ri&ecirc;ng b&ecirc;n LPL, đa số c&aacute;c bằng chứng đều cũng chỉ do d&acirc;n mạng đưa l&ecirc;n MXH Weibo v&agrave; ph&iacute;a BTC giải đấu cao nhất LMHT Trung Quốc cũng kh&ocirc;ng đưa ra bằng chứng n&agrave;o.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/3/pelu-dramadns-btcvcs-3-16515557325901467274991.jpg\" target=\"_blank\"><img alt=\"BLV Hoàng Luân lên tiếng về drama DNS: BTC không có nghĩa vụ cung cấp bằng chứng, khẳng định Riot cũng có tiền lệ - Ảnh 4.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/3/pelu-dramadns-btcvcs-3-16515557325901467274991.jpg\" /></a></p><p>Trường hợp của Bo trước đ&acirc;y, LPL cũng kh&ocirc;ng đưa ra bằng chứng m&agrave; c&aacute;c chứng cứ n&agrave;y đa số đến từ MXH Weibo</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/3/pelu-dramadns-btcvcs-4-1651555783118629916265.png\" target=\"_blank\"><img alt=\"BLV Hoàng Luân lên tiếng về drama DNS: BTC không có nghĩa vụ cung cấp bằng chứng, khẳng định Riot cũng có tiền lệ - Ảnh 5.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/3/pelu-dramadns-btcvcs-4-1651555783118629916265.png\" /></a></p><p>Th&ocirc;ng b&aacute;o xử phạt PHT v&igrave; h&agrave;nh vi c&aacute; cược</p><p>Tuy nhi&ecirc;n nam BLV Ho&agrave;ng Lu&acirc;n cũng cho rằng, ph&iacute;a BTC VCS cũng c&oacute; thể l&agrave;m tốt hơn nữa, đặc biệt l&agrave; trong việc bi&ecirc;n soạn nội dung của th&ocirc;ng b&aacute;o xử phạt. Nhưng ch&iacute;nh nam BLV cũng khẳng định:&nbsp;<em>&quot;Nếu ở g&oacute;c nh&igrave;n của Lu, m&agrave; hỏi BTC VCS c&oacute; nhận tiền b&aacute;n độ hay kh&ocirc;ng th&igrave; c&acirc;u trả lời l&agrave; kh&ocirc;ng.&quot;</em></p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/5/3/pelu-dramadns-btcvcs-2-16515558137551475358656.png\" target=\"_blank\"><img alt=\"BLV Hoàng Luân lên tiếng về drama DNS: BTC không có nghĩa vụ cung cấp bằng chứng, khẳng định Riot cũng có tiền lệ - Ảnh 6.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/5/3/pelu-dramadns-btcvcs-2-16515558137551475358656.png\" /></a></p><p>BLV Ho&agrave;ng Lu&acirc;n cũng khẳng định kh&ocirc;ng c&oacute; chuyện BTC VCS nhận tiền l&agrave;m độ</p><p>Từ những chia sẻ của BLV Ho&agrave;ng Lu&acirc;n, rất c&oacute; thể trong những ng&agrave;y tới, ph&iacute;a BTC VCS sẽ c&oacute; th&ecirc;m những th&ocirc;ng b&aacute;o mới sau sức &eacute;p từ ph&iacute;a cộng đồng VCS. Nhưng quan trọng hơn cả, vẫn l&agrave; th&aacute;i độ trung lập của người h&acirc;m mộ để tr&aacute;nh ảnh hưởng ti&ecirc;u cực đến tất cả c&aacute;c b&ecirc;n c&oacute; li&ecirc;n quan.</p>', CAST(N'2022-06-11T15:23:07.000' AS DateTime), N'94badfa9-d935-4c16-b58c-814c9bcbe3e7', N'/posts/anh28.jpg', N'live', 4)
INSERT [dbo].[post] ([id], [title], [small_category_id], [metatitle], [description], [content], [created_at], [author], [image], [status], [view]) VALUES (N'ef0e78ee-aa3b-449d-b602-80f3805352c2', N'Sau khi đồng ý mua Twitter, Elon Musk bất ngờ được game thủ gợi ý mua lại Genshin Impact, DOTA 2', N'4227e3dd-3cf1-4930-a579-7b3ff8e632c8', N'sau-khi-dong-y-mua-twitter-elon-musk-bat-ngo-duoc-game-thu-goi-y-mua-lai-genshin-impact-dota-2', N'<p>Trend mới hiểu n&ocirc;m na l&agrave; &quot;Elon Musk mua mọi thứ&quot; đang trở n&ecirc;n phổ biến trong cộng đồng game thủ.</p>', N'<h2>Trend mới hiểu n&ocirc;m na l&agrave; &quot;Elon Musk mua mọi thứ&quot; đang trở n&ecirc;n phổ biến trong cộng đồng game thủ.</h2><ul></ul><p>Trong v&agrave;i ng&agrave;y vừa qua th&igrave; vị tỷ ph&uacute; đ&igrave;nh đ&aacute;m&nbsp;<a href="https://gamek.vn/elon-musk.htm\" target=\"_blank\">Elon Musk</a>&nbsp;chắc chắn l&agrave; c&aacute;i t&ecirc;n hot nhất tr&ecirc;n Internet khi &ocirc;ng đ&atilde; đồng &yacute; mua lại mạng x&atilde; hội Twitter với gi&aacute; 44 tỷ USD. B&ecirc;n cạnh số tiền khổng lồ th&igrave; thương vụ n&agrave;y cho thấy Elon Musk l&agrave; một doanh nh&acirc;n cực kỳ t&aacute;o bạo, d&aacute;m n&oacute;i d&aacute;m l&agrave;m v&agrave; sẵn s&agrave;ng mua những thứ tưởng chừng kh&ocirc;ng thể bị đem b&aacute;n.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/4/27/photo-1-1651030045116939288920.jpg\" target=\"_blank\"><img alt=\"Sau khi đồng ý mua Twitter, Elon Musk bất ngờ được game thủ gợi ý mua lại Genshin Impact, DOTA 2 - Ảnh 1.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/4/27/photo-1-1651030045116939288920.jpg\" /></a></p><p>Elon Musk mới đ&acirc;y đ&atilde; đồng &yacute; mua lại Twitter với gi&aacute; 44 tỷ USD</p><p>Tiếp đ&oacute; th&igrave; khi trả lời phỏng vấn về việc mua lại Twitter, Elon Musk cho rằng nền tảng n&agrave;y cần phải trả lại cho người d&ugrave;ng sự tự do vốn c&oacute; về việc n&oacute;i l&ecirc;n suy nghĩ của m&igrave;nh. Vị tỷ ph&uacute; n&agrave;y cũng hứa hẹn về việc gi&uacute;p cho Twitter ph&aacute;t triển, trở n&ecirc;n tốt hơn. V&igrave; vậy m&agrave; Elon Musk nhanh ch&oacute;ng trở th&agrave;nh biểu tượng về sự thay đổi, ph&aacute;t triển...</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/4/27/photo-1-16510300894185386216.jpg\" target=\"_blank\"><img alt=\"Sau khi đồng ý mua Twitter, Elon Musk bất ngờ được game thủ gợi ý mua lại Genshin Impact, DOTA 2 - Ảnh 2.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/4/27/photo-1-16510300894185386216.jpg\" /></a></p><p>R&otilde; r&agrave;ng với một sự kiện lớn v&agrave; được nhiều người biết như vậy th&igrave; Elon Musk chắc chắn trở th&agrave;nh chủ đề b&agrave;n t&aacute;n v&agrave; &quot;chế meme&quot; tr&ecirc;n Internet. Dĩ nhi&ecirc;n l&agrave; cộng đồng game thủ cũng kh&ocirc;ng đứng ngo&agrave;i c&acirc;u chuyện n&agrave;y v&agrave; nhanh ch&oacute;ng tham gia v&agrave;o c&ocirc;ng cuộc &quot;chế meme&quot; về Elon Musk. Đi đầu phải n&oacute;i tới cộng đồng&nbsp;<a href="https://gamek.vn/dota-2.htm\" target=\"_blank\">DOTA 2</a>&nbsp;khi họ cho rằng Elon Musk n&ecirc;n mua lại tr&ograve; chơi MOBA đ&igrave;nh đ&aacute;m n&agrave;y v&agrave; x&oacute;a lu&ocirc;n vị tướng Tinker.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/4/27/-16510290504521310231900.jpg\" target=\"_blank\"><img alt=\"Sau khi đồng ý mua Twitter, Elon Musk bất ngờ được game thủ gợi ý mua lại Genshin Impact, DOTA 2 - Ảnh 3.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/4/27/-16510290504521310231900.jpg\" /></a></p><p>Game thủ DOTA 2 đ&atilde; nhanh tay chế meme về việc Elon Musk mua lại tr&ograve; chơi n&agrave;y v&agrave; x&oacute;a Tinker</p><p>Tiếp đ&oacute; th&igrave; tới cộng đồng game thủ&nbsp;<a href="https://gamek.vn/genshin-impact.htm\" target=\"_blank\">Genshin Impact</a>&nbsp;cũng tham gia v&agrave;o việc n&agrave;y v&agrave; nh&acirc;n vật họ muốn x&oacute;a l&agrave; Qiqi. Nếu c&aacute;c bạn chưa biết th&igrave; Qiqi l&agrave; một nh&acirc;n vật 5 sao tương đối yếu ở trong Genshin Impact n&ecirc;n mỗi khi roll ra c&ocirc; b&eacute; n&agrave;y ở banner thường hoặc &quot;lệch rate&quot; ở banner nh&acirc;n vật th&igrave; game thủ tỏ ra cực kỳ kh&oacute; chịu.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/4/27/photo-1-16510291836981159316256.jpg\" target=\"_blank\"><img alt=\"Sau khi đồng ý mua Twitter, Elon Musk bất ngờ được game thủ gợi ý mua lại Genshin Impact, DOTA 2 - Ảnh 4.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/4/27/photo-1-16510291836981159316256.jpg\" /></a></p><p>Game thủ Genshin Impact cũng l&agrave;m điều tương tự với c&ocirc; b&eacute; Qiqi</p><p>Đương nhi&ecirc;n l&agrave; vẫn c&oacute; người y&ecirc;u qu&yacute; Qiqi nhưng cũng c&oacute; kh&ocirc;ng &iacute;t game thủ gh&eacute;t nh&acirc;n vật n&agrave;y. V&igrave; vậy m&agrave; Qiqi mới bị đem v&agrave;o meme của Elon Musk. B&ecirc;n cạnh đ&oacute; th&igrave; trong qu&aacute; khứ, Elon Musk cũng từng nhắc tới Genshin Impact trong c&aacute;c d&ograve;ng Tweet của m&igrave;nh n&ecirc;n vị tỷ ph&uacute; n&agrave;y cũng được cộng đồng Genshin Impact quan t&acirc;m.</p><p><a href="https://gamek.mediacdn.vn/133514250583805952/2022/4/27/photo-1-16510299843521705140574-1651030002189385713657.png\" target=\"_blank\"><img alt=\"Sau khi đồng ý mua Twitter, Elon Musk bất ngờ được game thủ gợi ý mua lại Genshin Impact, DOTA 2 - Ảnh 5.\" src="https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/4/27/photo-1-16510299843521705140574-1651030002189385713657.png\" /></a></p><p>Trước đ&acirc;y Elon Musk từng ngỏ &yacute; muốn xuất hiện trong Genshin Impact</p><p>Kh&ocirc;ng r&otilde; l&agrave; trong tương lai th&igrave; vị tỷ phủ n&agrave;y c&oacute; mua lại một h&atilde;ng game n&agrave;o đ&oacute; hay kh&ocirc;ng. Nếu c&oacute; th&igrave; n&oacute; kh&ocirc;ng kh&aacute;c g&igrave; một sự kiện trọng đại của l&agrave;ng game khi n&oacute; chứng minh được rằng m&igrave;nh c&oacute; gi&aacute; trị chẳng k&eacute;m cạnh c&aacute;c ng&agrave;nh giải tr&iacute; truyền thống.</p>', CAST(N'2022-06-10T15:21:04.000' AS DateTime), N'94badfa9-d935-4c16-b58c-814c9bcbe3e7', N'/posts/anh33.jpg', N'live', 0)
GO
INSERT [dbo].[small_category] ([id], [category_id], [title], [description], [metatitle]) VALUES (N'0b15399b-1b89-4122-8aeb-ccc9a497e693', N'9242d338-9cb3-43f7-9e99-5e0d6cc5cb5e', N'Liên Minh Huyền Thoại', N'Liên Minh Huyền Thoại là một trò chơi video thể loại đấu trường trận chiến trực tuyến nhiều người chơi được Riot Games phát triển và phát hành trên nền tảng Windows và MacOS, lấy cảm hứng từ bản mod Defense of the Ancients cho trò chơi video Warcraft III: Frozen Throne.', N'lien-minh-huyen-thoai')
INSERT [dbo].[small_category] ([id], [category_id], [title], [description], [metatitle]) VALUES (N'25d00f0f-7ffa-49f3-bfb5-9ff2dcd5d541', N'501dbf18-bdaf-4f7d-afca-105e070b41c3', N'FIFA 22', N'Được dịch từ tiếng Anh-FIFA 22 là một trò chơi video mô phỏng bóng đá được xuất bản bởi Electronic Arts. Đây là phần thứ 29 trong loạt FIFA và được phát hành trên toàn thế giới vào ngày 1 tháng 10 năm 2021 cho Microsoft Windows, Nintendo Switch, PlayStation 4, PlayStation 5, Xbox One và Xbox Series X / S.', N'fifa-22')
INSERT [dbo].[small_category] ([id], [category_id], [title], [description], [metatitle]) VALUES (N'2f430914-7ad8-460b-a0b9-dc34633174bc', N'5550d05b-482e-4bf4-a948-7adebe8205c7', N'Demon\"s Souls', N'Được dịch từ tiếng Anh-Demon\"s Souls là một trò chơi nhập vai hành động được phát triển bởi Bluepoint Games, với sự hỗ trợ từ Japan Studio và được xuất bản bởi Sony Interactive Entertainment. Trò chơi được phát hành dưới dạng tựa khởi động cho PlayStation 5 vào tháng 11 năm 2020.', N'demon-souls')
INSERT [dbo].[small_category] ([id], [category_id], [title], [description], [metatitle]) VALUES (N'3275520e-f804-460f-b538-13d831e5b5ee', N'5550d05b-482e-4bf4-a948-7adebe8205c7', N'Elden Ring', N'Elden Ring là trò chơi hành động nhập vai do FromSoftware phát triển và Bandai Namco Entertainment phát hành trên các hệ máy PlayStation 4, PlayStation 5, Xbox One, Xbox Series X/S và hệ điều hành Microsoft Windows vào ngày 25 tháng 2 năm 2022.', N'elden-ring')
INSERT [dbo].[small_category] ([id], [category_id], [title], [description], [metatitle]) VALUES (N'3674b773-3585-49d4-8a63-690eb8974bf8', N'ba7d8d18-ba4c-4172-afef-df65919d59b8', N'Free Fire', N'Garena Free Fire là một trò chơi điện tử nhiều người chơi thuộc thể loại bắn súng góc nhìn người thứ ba do 111dots Studio phát triển và Garena phát hành.', N'free-fire')
INSERT [dbo].[small_category] ([id], [category_id], [title], [description], [metatitle]) VALUES (N'4227e3dd-3cf1-4930-a579-7b3ff8e632c8', N'9242d338-9cb3-43f7-9e99-5e0d6cc5cb5e', N'Genshin Impact', N'Genshin Impact là một trò chơi hành động nhập vai do miHoYo của Trung Quốc phát triển và được xuất bản lần đầu vào năm 2020. Genshin Impact là IP được miHoYo phát triển tiếp nối sau IP trước là series Honkai. Genshin Impact được đặt trong bối cảnh của một thế giới giả tưởng có tên Teyvat.', N'genshin-impact')
INSERT [dbo].[small_category] ([id], [category_id], [title], [description], [metatitle]) VALUES (N'58985559-d13a-490c-98bc-5b551b477061', N'ba7d8d18-ba4c-4172-afef-df65919d59b8', N'Liên Minh Tốc Chiến', N'Liên Minh Huyền Thoại: Tốc Chiến hay rút gọn lại là Tốc Chiến là một trò chơi điện tử đấu trường trận chiến trực tuyến nhiều người chơi được phát triển và phát hành bởi Riot Games, dành cho các thiết bị di dộng Android, iOS và máy chơi game cầm tay. Trò chơi là phiên bản di động của Liên Minh Huyền Thoại.', N'lien-minh-toc-chien')
INSERT [dbo].[small_category] ([id], [category_id], [title], [description], [metatitle]) VALUES (N'58d831c5-a45b-4fb4-ba05-fe6df356e4b2', N'5550d05b-482e-4bf4-a948-7adebe8205c7', N'Horizon Forbidden West', N'Được dịch từ tiếng Anh-Horizon Forbidden West là một trò chơi hành động nhập vai năm 2022 được phát triển bởi Guerrilla Games và được xuất bản bởi Sony Interactive Entertainment.', N'horizon-forbidden')
INSERT [dbo].[small_category] ([id], [category_id], [title], [description], [metatitle]) VALUES (N'69f1b251-a914-4311-bb7e-174316333d70', N'9242d338-9cb3-43f7-9e99-5e0d6cc5cb5e', N'FIFA ONLINE 4', N'FIFA Online 4 là tựa game thể thao môn bóng đá Online nối tiếp FIFA Online 3 do Nexon và EA Sports phát hành và đã chính thức ra mắt lần đầu tiên vào ngày 17 tháng 5 năm 2018 ở Hàn Quốc trên hệ máy PC. Phiên bản điện thoại được ra mắt lần đầu vào tháng 7 năm 2018 cũng tại Hàn Quốc.', N'fifa-online-4')
INSERT [dbo].[small_category] ([id], [category_id], [title], [description], [metatitle]) VALUES (N'83898190-b4f4-4889-aaf7-f2848e5a6798', N'f6a13420-cc9e-446c-aeac-0705bfa82d0f', N'Fall Guys', N'Fall Guys: Ultimate Knockout là một trò chơi battle royale và đi cảnh do Mediatonic phát triển vào năm 2020 và Devolver Digital phát hành. Trò chơi được công bố tại sự kiện E3 tháng 6 năm 2019 và phát hành ngày 4 tháng 8 năm 2020 trên Nintendo Switch, Xbox One, và Xbox Series X/S.', N'fall-guys')
INSERT [dbo].[small_category] ([id], [category_id], [title], [description], [metatitle]) VALUES (N'd930e740-9c92-4cb1-9a95-14da3c89a079', N'501dbf18-bdaf-4f7d-afca-105e070b41c3', N'Spider Man 2018', N'Được dịch từ tiếng Anh-Marvel\"s Spider-Man là một trò chơi phiêu lưu hành động năm 2018 được phát triển bởi Insomniac Games và được xuất bản bởi Sony Interactive Entertainment.', N'spider-man-2018')
INSERT [dbo].[small_category] ([id], [category_id], [title], [description], [metatitle]) VALUES (N'e1f28388-b686-4d1e-9a89-df78d1f36c27', N'ba7d8d18-ba4c-4172-afef-df65919d59b8', N'Liên Quân Mobile', N'Garena Liên Quân Mobile là một trò chơi đấu trường trận chiến trực tuyến nhiều người chơi do Timi Studio, một studio trực thuộc Tencent Games phát triển và phát hành bởi Garena, phân phối trên các nền tảng di động Android, iOS và Nintendo Switch, bắt đầu từ cuối năm 2016.', N'lien-quan-mobile')
GO
INSERT [dbo].[user] ([id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [token], [image]) VALUES (N'05772863-f113-479e-a3c3-b36a20e3e1ce', NULL, NULL, NULL, NULL, N'test2@gmail.comfgh', N'dfg', N'2423', NULL, NULL, NULL)
INSERT [dbo].[user] ([id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [token], [image]) VALUES (N'106cf578-e433-4b9f-938f-390f54ceaa24', NULL, NULL, NULL, NULL, N'test2@gmail.com', N'sdg', N'sdf', N'User', NULL, NULL)
INSERT [dbo].[user] ([id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [token], [image]) VALUES (N'126c91bb-b279-4e79-81fa-9158e1b3df7c', N'test1', CAST(N'2000-02-01' AS Date), N'Hải Dương', N'nam', N'test1@gmail.com', N'test1', N'123', N'user', NULL, NULL)
INSERT [dbo].[user] ([id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [token], [image]) VALUES (N'25ddde63-f89b-440e-bd68-6f45a4a6ccb5', NULL, NULL, NULL, NULL, N'hehe@gmail.com', N'hehe', N'123', N'User', NULL, NULL)
INSERT [dbo].[user] ([id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [token], [image]) VALUES (N'58611b9b-c009-43a7-bce9-83b0836c2ea6', N'Bùi Thành Đông', CAST(N'2022-01-01' AS Date), N'Hải Dương', N'gay', N'dong@gmail.com', N'dongvl', N'123', N'User', NULL, NULL)
INSERT [dbo].[user] ([id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [token], [image]) VALUES (N'75de07a8-5d15-41fb-9674-8dd0bed47b5a', N'Bùi Thành Đông', NULL, N'Hải Dương', N'gay', N'dong@gmail.com', N'dongvl', N'123', N'User', NULL, NULL)
INSERT [dbo].[user] ([id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [token], [image]) VALUES (N'8bee0291-39fb-4600-8105-9e37cb32e034', NULL, NULL, NULL, NULL, N'test2@gmail.com', N'sfgds', N'afds', N'User', NULL, NULL)
INSERT [dbo].[user] ([id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [token], [image]) VALUES (N'8e0fded5-674a-4877-b55e-a41f9b37d2c3', N'Admin', CAST(N'2022-02-02' AS Date), N'Hải Dương', N'thẳng', N'admin@gmail.com', N'admin', N'admin', N'Admin', NULL, NULL)
INSERT [dbo].[user] ([id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [token], [image]) VALUES (N'94badfa9-d935-4c16-b58c-814c9bcbe3e7', N'staff1', CAST(N'2022-05-25' AS Date), N'Hà Nội', N'Nam', N'staff1@gmail.com', N'staff1', N'123', N'Staff', NULL, NULL)
INSERT [dbo].[user] ([id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [token], [image]) VALUES (N'a5339282-2362-4a65-b648-1724306834c5', NULL, NULL, NULL, NULL, N'test2@gmail.com', N'sdf', N'sdf', N'User', NULL, NULL)
INSERT [dbo].[user] ([id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [token], [image]) VALUES (N'aca46deb-13c7-4ba6-8dd6-911148221cdf', N'manager1', CAST(N'2022-05-27' AS Date), N'Hà Tĩnh', N'Nam', N'manager1@gmail.com', N'manager1', N'123', N'Manager', NULL, NULL)
INSERT [dbo].[user] ([id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [token], [image]) VALUES (N'b2cd76fb-adf4-46d2-b4f5-fb92b5ca4fcc', NULL, NULL, NULL, NULL, N'hihi@gmail.com', N'hihi', N'123', N'User', NULL, NULL)
INSERT [dbo].[user] ([id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [token], [image]) VALUES (N'b4842e9d-1be8-495c-8d19-9269ed211bc7', NULL, NULL, NULL, NULL, N'huhu@gmail.com', N'huhu', N'123', N'User', NULL, NULL)
INSERT [dbo].[user] ([id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [token], [image]) VALUES (N'dd6e5a56-a82f-4114-ab14-9b4593e2d605', NULL, NULL, NULL, NULL, N'ho@gmail.com', N'hoho', N'123', N'User', NULL, NULL)
INSERT [dbo].[user] ([id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [token], [image]) VALUES (N'e7538cc4-7069-4d66-98df-cd2e4a505e15', N'staff2', CAST(N'2022-05-25' AS Date), N'Hải Dương', N'Nữ', N'staff2@gmail.com', N'staff2', N'123', N'Staff', NULL, NULL)
INSERT [dbo].[user] ([id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [token], [image]) VALUES (N'eb8f65ad-956b-4cb8-a99c-61cf7c408f52', N'manager2', CAST(N'2022-05-25' AS Date), N'HCM', N'Nam', N'manager2@gmail.com', N'manager2', N'123', N'Staff', NULL, NULL)
INSERT [dbo].[user] ([id], [hoten], [ngaysinh], [diachi], [gioitinh], [email], [taikhoan], [matkhau], [role], [token], [image]) VALUES (N'f9f8f3a3-92f1-4ba0-83e1-4269ae418e99', NULL, NULL, NULL, NULL, N'kaka@gmail.com', N'kaka', N'123', N'User', NULL, NULL)
GO
ALTER TABLE [dbo].[post] ADD  CONSTRAINT [DF_post_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[post] ADD  CONSTRAINT [DF_post_status]  DEFAULT (N'pending') FOR [status]
GO
ALTER TABLE [dbo].[post] ADD  CONSTRAINT [DF_post_view]  DEFAULT ((0)) FOR [view]
GO
ALTER TABLE [dbo].[feed]  WITH CHECK ADD  CONSTRAINT [FK_feed_user] FOREIGN KEY([post_id])
REFERENCES [dbo].[post] ([id])
GO
ALTER TABLE [dbo].[feed] CHECK CONSTRAINT [FK_feed_user]
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [FK_post_small_category] FOREIGN KEY([author])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [FK_post_small_category]
GO
ALTER TABLE [dbo].[small_category]  WITH CHECK ADD  CONSTRAINT [FK_small_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[small_category] CHECK CONSTRAINT [FK_small_category]
GO
/****** Object:  StoredProcedure [dbo].[sp_category_all]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[sp_category_all]
AS
    BEGIN
        SELECT *                       
        FROM category 
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_category_create]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_category_create]
(@id              nvarchar(50), 
 @title          nvarchar(250) ,
 @description         ntext  ,
 @metatitle nvarchar(250)
)
AS
    BEGIN
      INSERT INTO category
                (
				 	 [id]               , 
					 title         ,
					 description  ,
					 metatitle
					             
				)
                VALUES
                (
				 @id               , 
				 @title           ,
				
				 @description    ,       
				@metatitle
				);
        SELECT '';
    END;



GO
/****** Object:  StoredProcedure [dbo].[sp_category_delete]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_category_delete]
(@id              char(36) 
)
AS
    BEGIN
		delete from category where id = @id;
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_category_get_by_id]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[sp_category_get_by_id](@id NVARCHAR(50))
AS
    BEGIN
        SELECT *                        
        FROM post
      where  id = @id;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_category_smallcategory]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[sp_category_smallcategory](@id NVARCHAR(50))
AS
    BEGIN
        SELECT *                        
        FROM small_category where category_id = @id
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_category_update]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_category_update]
(@id              nvarchar(50), 
 @title          nvarchar(250) ,
 @description         ntext  ,
 @metatitle	nvarchar(250)
)
AS
    BEGIN
      UPDATE category set
					 title  = @title       ,
					 description = @description  ,        
					 metatitle = @metatitle
				
                WHERE
                id = @id
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_feed_create]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_feed_create]
(@id              nvarchar(50), 
 @user_id          nvarchar(50) ,
 @post_id         nvarchar(50),
 @content         ntext 
)
AS
    BEGIN
      INSERT INTO feed
                (
				 	 [id]               , 
					 user_id           ,
					 post_id          ,
					 content           ,
					 created_at
				)
                VALUES
                (
				 @id               , 
				 @user_id           ,
				 @post_id          ,	
				 @content,
				 CURRENT_TIMESTAMP
				);
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_post_accept]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[sp_post_accept](@id NVARCHAR(50))
AS
BEGIN
    UPDATE post SET status = 'live', created_at = CURRENT_TIMESTAMP
	WHERE id = @id
        
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_post_all]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_post_all] (@page_index  INT, 
                                       @page_size   INT
									  
									   
									   )
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY u.created_at ASC)) AS RowNumber, 
                             u.id              , 
							 u.title           ,
							 u.metatitle          ,
							 u.description           ,
							 u.content           ,
							 u.author           ,
							 u.image         ,
							 u.created_at           ,
							 u.[view]  ,
							 u.status  ,
							 u.small_category_id ,
							 t.title as small_category_title,
							 c.title as big_category,
							 c.id as big_category_id,
							 e.hoten as author_name
                        INTO #Results1
                        FROM post AS u inner join small_category as t on u.small_category_id = t.id inner join category as c on c.id = t.category_id inner join [user] as e on e.id = u.author
						WHERE (u.status = 'live');
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY u.created_at ASC)) AS RowNumber, 
                             u.id              , 
							 u.title           ,
							 u.metatitle          ,
							 u.description           ,
							 u.content           ,
							 u.author           ,
							 u.image         ,
							 u.created_at           ,
							 u.[view]  ,
							 u.status  ,
							 u.small_category_id, 
							  t.title as small_category_title,
							 c.title as big_category,
							 c.id as big_category_id,
							 e.hoten as author_name
                        INTO #Results2
                        FROM post AS u inner join small_category as t on u.small_category_id = t.id inner join category as c on c.id = t.category_id inner join [user] as e on e.id = u.author
						WHERE (u.status = 'live');
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;
                        DROP TABLE #Results2;
        END;
    END;

GO
/****** Object:  StoredProcedure [dbo].[sp_post_banners]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_post_banners] (@page_index  INT, 
                                       @page_size   INT
									   )
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY u.created_at DESC)) AS RowNumber, 
                             u.id              , 
							 u.title           ,
							 u.metatitle          ,
							 u.description           ,
							 u.content           ,
							 u.author           ,
							 u.image         ,
							 u.created_at           ,
							 u.[view]  ,
							 u.status  ,
							 u.small_category_id ,
							 t.title as small_category_title,
							 c.title as big_category,
							 c.id as big_category_id,
							 [user].hoten as author_name
                        INTO #Results1
                        FROM post AS u inner join small_category as t on u.small_category_id = t.id inner join category as c on c.id = t.category_id inner join [user] on [user].id = u.author
						WHERE u.small_category_id = t.id
						ORDER BY u.created_at;
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY u.created_at DESC)) AS RowNumber, 
                             u.id              , 
							 u.title           ,
							 u.metatitle          ,
							 u.description           ,
							 u.content           ,
							 u.author           ,
							 u.image         ,
							 u.created_at           ,
							 u.[view]  ,
							 u.status  ,
							 u.small_category_id, 
							  t.title as small_category_title,
							 c.title as big_category,
							 c.id as big_category_id,
							 [user].hoten as author_name
                        INTO #Results2
                        FROM post AS u inner join small_category as t on u.small_category_id = t.id inner join category as c on c.id = t.category_id inner join [user] on [user].id = u.author
						WHERE u.small_category_id = t.id
						ORDER BY u.created_at;
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;
                        DROP TABLE #Results2;
        END;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_post_category]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_post_category] (@page_index  INT, 
                                       @page_size   INT,
									   @category nvarchar(50)
									   )
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY u.created_at DESC)) AS RowNumber, 
                             u.id              , 
							 u.title           ,
							 u.metatitle          ,
							 u.description           ,
							 u.content           ,
							 u.author           ,
							 u.image         ,
							 u.created_at           ,
							 u.[view]  ,
							 u.status  ,
							 u.small_category_id ,
							 t.title as small_category_title,
							 c.title as big_category,
							 c.id as big_category_id,
							 [user].hoten as author_name
                        INTO #Results1
                        FROM post AS u inner join small_category as t on u.small_category_id = t.id inner join category as c on c.id = t.category_id inner join [user] on [user].id = u.author
						WHERE t.metatitle = @category AND u.status = 'live'
						ORDER BY u.created_at;
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY u.created_at DESC)) AS RowNumber, 
                             u.id              , 
							 u.title           ,
							 u.metatitle          ,
							 u.description           ,
							 u.content           ,
							 u.author           ,
							 u.image         ,
							 u.created_at           ,
							 u.[view]  ,
							 u.status  ,
							 u.small_category_id, 
							  t.title as small_category_title,
							 c.title as big_category,
							 c.id as big_category_id,
							 [user].hoten as author_name
                        INTO #Results2
                        FROM post AS u inner join small_category as t on u.small_category_id = t.id inner join category as c on c.id = t.category_id inner join [user] on [user].id = u.author
						WHERE t.metatitle = @category AND u.status = 'live'
						ORDER BY u.created_at;
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;
                        DROP TABLE #Results2;
        END;
    END;
	exec dbo.sp_post_same 1,5,'e1f28388-b686-4d1e-9a89-df78d1f36c27'
GO
/****** Object:  StoredProcedure [dbo].[sp_post_create]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_post_create]
(@id              nvarchar(50), 
 @title          nvarchar(250) ,
 @small_category_id         nvarchar(50),
 @metatitle          nvarchar(250)  ,
 @description         ntext  ,
 @content          ntext ,
 @author         nvarchar(50) ,
 @image         nvarchar(350)  

)
AS
    BEGIN
      INSERT INTO [post]
                (
				 	 [id]               , 
					 title           ,
					 small_category_id          ,
					 metatitle           ,
					 description           ,
					 content           ,
					 author         ,
					 image         ,
					 created_at
				)
                VALUES
                (
				 @id               , 
				 @title           ,
				 @small_category_id          ,
				 @metatitle           ,
				 @description           ,
				 @content           ,
				 @author         ,
				 @image,           
				 CURRENT_TIMESTAMP
				);
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_post_decline]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[sp_post_decline](@id NVARCHAR(50))
AS
BEGIN
    UPDATE post SET status = 'decline'
	WHERE id = @id
        
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_post_delete]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_post_delete]
(@id              char(36) 
)
AS
    BEGIN
		delete from post where id = @id;
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_post_get_by_id]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[sp_post_get_by_id](@id NVARCHAR(50))
AS
    BEGIN
        SELECT *                        
        FROM post
      where  id = @id;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_post_get_by_meta]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[sp_post_get_by_meta](@meta NVARCHAR(50))
AS
    BEGIN
        SELECT *                        
        FROM post
      where  metatitle = @meta
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_post_home]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_post_home] (@page_index  INT, 
                                       @page_size   INT
									   )
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY u.created_at DESC)) AS RowNumber, 
                             u.id              , 
							 u.title           ,
							 u.metatitle          ,
							 u.description           ,
							 u.content           ,
							 u.author           ,
							 u.image         ,
							 u.created_at           ,
							 u.[view]  ,
							 u.status  ,
							 u.small_category_id ,
							 t.title as small_category_title,
							 c.title as big_category,
							 c.id as big_category_id,
							 [user].hoten as author_name
                        INTO #Results1
                        FROM post AS u inner join small_category as t on u.small_category_id = t.id inner join category as c on c.id = t.category_id inner join [user] on [user].id = u.author						
						WHERE u.status = 'live'
						ORDER BY u.created_at DESC;
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY u.created_at DESC)) AS RowNumber, 
                             u.id              , 
							 u.title           ,
							 u.metatitle          ,
							 u.description           ,
							 u.content           ,
							 u.author           ,
							 u.image         ,
							 u.created_at           ,
							 u.[view]  ,
							 u.status  ,
							 u.small_category_id, 
							  t.title as small_category_title,
							 c.title as big_category,
							 c.id as big_category_id,
							 [user].hoten as author_name
                        INTO #Results2
                        FROM post AS u inner join small_category as t on u.small_category_id = t.id inner join category as c on c.id = t.category_id inner join [user] on [user].id = u.author
						WHERE u.status = 'live'
						ORDER BY u.created_at DESC;
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;
                        DROP TABLE #Results2;
        END;
    END;

exec dbo.sp_post_home 1,1
GO
/****** Object:  StoredProcedure [dbo].[sp_post_lastweek]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_post_lastweek] (@page_index  INT, 
                                       @page_size   INT
									   )
AS
    BEGIN
		SET DATEFIRST 1
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY u.[view] DESC, u.created_at DESC)) AS RowNumber, 
                             u.id              , 
							 u.title           ,
							 u.metatitle          ,
							 u.description           ,
							 u.content           ,
							 u.author           ,
							 u.image         ,
							 u.created_at           ,
							 u.[view]  ,
							 u.status  ,
							 u.small_category_id ,
							 t.title as small_category_title,
							 c.title as big_category,
							 c.id as big_category_id,
							 [user].hoten as author_name
                        INTO #Results1
                        FROM post AS u inner join small_category as t on u.small_category_id = t.id inner join category as c on c.id = t.category_id inner join [user] on [user].id = u.author
						WHERE u.created_at >= DATEADD(day, -(DATEPART(WEEKDAY, GETDATE()) + 6), CONVERT(DATE, GETDATE())) 
  AND u.created_at <  DATEADD(day, 1 - DATEPART(WEEKDAY, GETDATE()), CONVERT(DATE, GETDATE())) AND u.status = 'live';
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY u.created_at ASC)) AS RowNumber, 
                             u.id              , 
							 u.title           ,
							 u.metatitle          ,
							 u.description           ,
							 u.content           ,
							 u.author           ,
							 u.image         ,
							 u.created_at           ,
							 u.[view]  ,
							 u.status  ,
							 u.small_category_id, 
							  t.title as small_category_title,
							 c.title as big_category,
							 c.id as big_category_id,
							 [user].hoten as author_name
                        INTO #Results2
                        FROM post AS u inner join small_category as t on u.small_category_id = t.id inner join category as c on c.id = t.category_id inner join [user] on [user].id = u.author
						WHERE u.created_at >= DATEADD(day, -(DATEPART(WEEKDAY, GETDATE()) + 6), CONVERT(DATE, GETDATE())) 
  AND u.created_at <  DATEADD(day, 1 - DATEPART(WEEKDAY, GETDATE()), CONVERT(DATE, GETDATE())) AND u.status ='live';
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;
                        DROP TABLE #Results2;
        END;
    END;

GO
/****** Object:  StoredProcedure [dbo].[sp_post_meta]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_post_meta] (@meta  NVARCHAR(500)
									   )
AS
    BEGIN
        select *, [user].hoten as author_name from post inner join [user] on post.author = [user].id where metatitle = @meta
    END;

GO
/****** Object:  StoredProcedure [dbo].[sp_post_myposts]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_post_myposts] (@page_index  INT, 
                                       @page_size   INT,
									   @id nvarchar(150)
									   
									   )
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY u.created_at DESC)) AS RowNumber, 
                             u.id              , 
							 u.title           ,
							 u.metatitle          ,
							 u.description           ,
							 u.content           ,
							 u.author           ,
							 u.image         ,
							 u.created_at           ,
							 u.[view]  ,
							 u.status  ,
							 u.small_category_id ,
							 t.title as small_category_title,
							 c.title as big_category,
							 c.id as big_category_id,
							 f.content as feed
                        INTO #Results1
                        FROM post AS u inner join small_category as t on u.small_category_id = t.id inner join category as c on c.id = t.category_id left JOIN feed as f
ON       f.id =
         (
         SELECT  TOP 1 id 
         FROM    feed
         WHERE   feed.post_id = u.id order by feed.created_at desc
         )
						WHERE (u.author = @id);
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY u.created_at DESC)) AS RowNumber, 
                             u.id              , 
							 u.title           ,
							 u.metatitle          ,
							 u.description           ,
							 u.content           ,
							 u.author           ,
							 u.image         ,
							 u.created_at           ,
							 u.[view]  ,
							 u.status  ,
							 u.small_category_id, 
							  t.title as small_category_title,
							 c.title as big_category,
							 c.id as big_category_id,
							 f.content as feed
                        INTO #Results2
                        FROM post AS u inner join small_category as t on u.small_category_id = t.id inner join category as c on c.id = t.category_id left JOIN feed as f
ON       f.id =
         (
         SELECT  TOP 1 id 
         FROM    feed
         WHERE   feed.post_id = u.id order by feed.created_at desc
         )
						WHERE (u.author = @id);
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;
                        DROP TABLE #Results2;
        END;
    END;

--select post.*, feed.content from post inner join feed on post.id = feed.post_id 
-- select post.*, feed.content
-- from post inner join feed on post.id = feed.post_id
-- cross apply 
--     (select top 1 feed.created_at
--      from feed 
--      where post.id = feed.post_id
--      order by feed.created_at desc) as ds


--SELECT   post.*, feed.content
--FROM     Orders
--JOIN     LineItems
--ON       LineItems.LineItemGUID =
--         (
--         SELECT  TOP 1 LineItemGUID 
--         FROM    LineItems
--         WHERE   OrderID = Orders.OrderID
--         )
SELECT   post.*, feed.content
FROM     post
Left JOIN     feed
ON       feed.id =
         (
         SELECT  TOP 1 id 
         FROM    feed
         WHERE   feed.post_id = post.id order by created_at desc
         )
GO
/****** Object:  StoredProcedure [dbo].[sp_post_pendingposts]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_post_pendingposts] (@page_index  INT, 
                                       @page_size   INT
									  
									   
									   )
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY u.created_at DESC)) AS RowNumber, 
                             u.id              , 
							 u.title           ,
							 u.metatitle          ,
							 u.description           ,
							 u.content           ,
							 u.author           ,
							 u.image         ,
							 u.created_at           ,
							 u.[view]  ,
							 u.status  ,
							 u.small_category_id ,
							 t.title as small_category_title,
							 c.title as big_category,
							 c.id as big_category_id,
							 e.hoten as author_name
                        INTO #Results1
                        FROM post AS u inner join small_category as t on u.small_category_id = t.id inner join category as c on c.id = t.category_id inner join [user] as e on e.id = u.author
						WHERE (u.status = 'pending');
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY u.created_at DESC)) AS RowNumber, 
                             u.id              , 
							 u.title           ,
							 u.metatitle          ,
							 u.description           ,
							 u.content           ,
							 u.author           ,
							 u.image         ,
							 u.created_at           ,
							 u.[view]  ,
							 u.status  ,
							 u.small_category_id, 
							  t.title as small_category_title,
							 c.title as big_category,
							 c.id as big_category_id,
							 e.hoten as author_name
                        INTO #Results2
                        FROM post AS u inner join small_category as t on u.small_category_id = t.id inner join category as c on c.id = t.category_id inner join [user] as e on e.id = u.author
						WHERE (u.status = 'pending');
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;
                        DROP TABLE #Results2;
        END;
    END;

GO
/****** Object:  StoredProcedure [dbo].[sp_post_same]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_post_same] (@page_index  INT, 
                                       @page_size   INT,
									   @small_category nvarchar(50)
									   )
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY u.created_at DESC)) AS RowNumber, 
                             u.id              , 
							 u.title           ,
							 u.metatitle          ,
							 u.description           ,
							 u.content           ,
							 u.author           ,
							 u.image         ,
							 u.created_at           ,
							 u.[view]  ,
							 u.status  ,
							 u.small_category_id ,
							 t.title as small_category_title,
							 c.title as big_category,
							 c.id as big_category_id,
							 [user].hoten as author_name
                        INTO #Results1
                        FROM post AS u inner join small_category as t on u.small_category_id = t.id inner join category as c on c.id = t.category_id inner join [user] on [user].id = u.author
						WHERE u.small_category_id = @small_category AND u.status = 'live'
						ORDER BY u.created_at;
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY u.created_at DESC)) AS RowNumber, 
                             u.id              , 
							 u.title           ,
							 u.metatitle          ,
							 u.description           ,
							 u.content           ,
							 u.author           ,
							 u.image         ,
							 u.created_at           ,
							 u.[view]  ,
							 u.status  ,
							 u.small_category_id, 
							  t.title as small_category_title,
							 c.title as big_category,
							 c.id as big_category_id,
							 [user].hoten as author_name
                        INTO #Results2
                        FROM post AS u inner join small_category as t on u.small_category_id = t.id inner join category as c on c.id = t.category_id inner join [user] on [user].id = u.author
						WHERE u.small_category_id = @small_category AND u.status = 'live'
						ORDER BY u.created_at;
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;
                        DROP TABLE #Results2;
        END;
    END;
	exec dbo.sp_post_same 1,5,'e1f28388-b686-4d1e-9a89-df78d1f36c27'
GO
/****** Object:  StoredProcedure [dbo].[sp_post_thisweek]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_post_thisweek] (@page_index  INT, 
                                       @page_size   INT
									   )
AS
    BEGIN
		SET DATEFIRST 1
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY u.[view] DESC, u.created_at DESC)) AS RowNumber, 
                             u.id              , 
							 u.title           ,
							 u.metatitle          ,
							 u.description           ,
							 u.content           ,
							 u.author           ,
							 u.image         ,
							 u.created_at           ,
							 u.[view]  ,
							 u.status  ,
							 u.small_category_id ,
							 t.title as small_category_title,
							 c.title as big_category,
							 c.id as big_category_id,
							 [user].hoten as author_name
                        INTO #Results1
                        FROM post AS u inner join small_category as t on u.small_category_id = t.id inner join category as c on c.id = t.category_id inner join [user] on [user].id = u.author
						WHERE u.created_at >= DATEADD(day, 1 - DATEPART(WEEKDAY, GETDATE()), CONVERT(DATE, GETDATE())) 
  AND u.created_at <  DATEADD(day, 8 - DATEPART(WEEKDAY, GETDATE()), CONVERT(DATE, GETDATE())) AND u.status = 'live';
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY u.[view] DESC, u.created_at DESC)) AS RowNumber, 
                             u.id              , 
							 u.title           ,
							 u.metatitle          ,
							 u.description           ,
							 u.content           ,
							 u.author           ,
							 u.image         ,
							 u.created_at           ,
							 u.[view]  ,
							 u.status  ,
							 u.small_category_id, 
							  t.title as small_category_title,
							 c.title as big_category,
							 c.id as big_category_id,
							 [user].hoten as author_name
                        INTO #Results2
                        FROM post AS u inner join small_category as t on u.small_category_id = t.id inner join category as c on c.id = t.category_id inner join [user] on [user].id = u.author
						WHERE u.created_at >= DATEADD(day, 1 - DATEPART(WEEKDAY, GETDATE()), CONVERT(DATE, GETDATE())) 
  AND u.created_at <  DATEADD(day, 8 - DATEPART(WEEKDAY, GETDATE()), CONVERT(DATE, GETDATE())) AND u.status = 'live';
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;
                        DROP TABLE #Results2;
        END;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_post_update]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_post_update]
(@id              nvarchar(50), 
 @title          nvarchar(250) ,
 @description         ntext  ,
 @metatitle	nvarchar(250),
 @small_category_id nvarchar(50),
 @content ntext,
 @image nvarchar(300)
)
AS
    BEGIN
      UPDATE post set
					 title  = @title       ,
					 description = @description  ,      
					 metatitle = @metatitle,
					 content = @content,
					 small_category_id = @small_category_id,
					 image = @image,
					 status = 'pending'
                WHERE
                id = @id
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_post_update_manager]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_post_update_manager]
(@id              nvarchar(50), 
 @title          nvarchar(250) ,
 @description         ntext  ,
 @metatitle	nvarchar(250),
 @small_category_id nvarchar(50),
 @content ntext,
 @image nvarchar(300)
)
AS
    BEGIN
      UPDATE post set
					 title  = @title       ,
					 description = @description  ,      
					 metatitle = @metatitle,
					 content = @content,
					 small_category_id = @small_category_id,
					 image = @image
                WHERE
                id = @id
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_small_category_all]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[sp_small_category_all]
AS
    BEGIN
        SELECT *                       
        FROM small_category 
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_small_category_create]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_small_category_create]
(@id              nvarchar(50), 
 @title          nvarchar(250) ,
 @description         ntext  ,
 @category_id	nvarchar(50), 
 @metatitle  nvarchar(250)
)
AS
    BEGIN
      INSERT INTO small_category
                (
				 	 [id]               , 
					 title         ,
					 description  ,        
					 category_id,
					 metatitle
				)
                VALUES
                (
				 @id               , 
				 @title           ,
				
				 @description     ,
				 @category_id,
				 @metatitle
				
				);
        SELECT '';
    END;

GO
/****** Object:  StoredProcedure [dbo].[sp_small_category_delete]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_small_category_delete]
(@id              char(36) 
)
AS
    BEGIN
		delete from small_category where id = @id;
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_small_category_get_by_id]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[sp_small_category_get_by_id](@id NVARCHAR(50))
AS
    BEGIN
        SELECT *                        
        FROM post
      where  id = @id;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_small_category_update]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_small_category_update]
(@id              nvarchar(50), 
 @title          nvarchar(250) ,
 @description         ntext  ,
 @category_id	nvarchar(50),
 @metatitle  nvarchar(250)
)
AS
    BEGIN
      UPDATE small_category set
					 title  = @title       ,
					 description = @description  ,        
					 category_id = @category_id,
					 metatitle = @metatitle
				
                WHERE
                id = @id
        SELECT '';
    END;

select * from category as c inner join small_category as s on c.id = s.category_id
GO
/****** Object:  StoredProcedure [dbo].[sp_user_create]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_user_create]
(@id              nvarchar(50), 
 @hoten          nvarchar(50) ,
 @ngaysinh         date  ,
 @diachi          nvarchar(250)  ,
 @gioitinh         nvarchar(50)  ,
 @email          varchar(50) ,
 @taikhoan         varchar(50) ,
 @matkhau         varchar(50)  ,
 @role          varchar(50) ,
 @image nvarchar(250) 
)
AS
    BEGIN
      INSERT INTO [user]
                (
				 	 [id]               , 
					 hoten           ,
					 ngaysinh          ,
					 diachi           ,
					 gioitinh           ,
					 email           ,
					 taikhoan         ,
					 matkhau           ,
					 role    ,
					 image
				)
                VALUES
                (
				 @id               , 
				 @hoten           ,
				 @ngaysinh          ,
				 @diachi           ,
				 @gioitinh           ,
				 @email           ,
				 @taikhoan         ,
				 @matkhau           ,
				 @role ,
				 @image
				);
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_user_delete]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_user_delete]
(@id              varchar(50) 
)
AS
    BEGIN
		delete from [user] where id = @id;
        SELECT '';
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_user_get_by_id]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_user_get_by_id](@id VARCHAR(50))
AS
    BEGIN
        SELECT  [id]               , 
					 hoten           ,
					 ngaysinh          ,
					 diachi           ,
					 gioitinh           ,
					 email           ,
					 taikhoan         ,
					 matkhau           ,
					 role      ,
					 image  
        FROM [user]
      where  [id] = @id;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_user_get_by_username_password]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_user_get_by_username_password](@taikhoan varchar(30), @matkhau varchar(60))
AS
    BEGIN
        SELECT  [id]               , 
					 hoten           ,
					 ngaysinh          ,
					 diachi           ,
					 gioitinh           ,
					 email           ,
					 taikhoan         ,
					 role      ,
					 image  
        FROM [user]
      where  taikhoan = @taikhoan and matkhau = @matkhau ;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_user_getstafflist]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_user_getstafflist] (@page_index  INT, 
                                       @page_size   INT									 
									   )
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY u.hoten ASC)) AS RowNumber, 
                             u.id              , 
							 u.hoten           ,
							 u.ngaysinh          ,
							 u.diachi           ,
							 u.gioitinh           ,
							 u.email           ,
							 u.taikhoan         ,
							 u.matkhau           ,
							 u.role  ,
							 u.image  
                        INTO #Results1
                        FROM [user] AS u
						WHERE (u.role <> 'Admin') AND (u.role <> 'User') ;
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                         SELECT(ROW_NUMBER() OVER(
                              ORDER BY u.hoten ASC)) AS RowNumber, 
                             u.id              , 
							 u.hoten           ,
							 u.ngaysinh          ,
							 u.diachi           ,
							 u.gioitinh           ,
							 u.email           ,
							 u.taikhoan         ,
							 u.matkhau           ,
							 u.role     ,
							 u.image  
                        INTO #Results2
                        FROM [user] AS u
						WHERE (u.role <> 'Admin') AND (u.role <> 'User') ;
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;
                        DROP TABLE #Results2;
        END;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_user_search]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_user_search] (@page_index  INT, 
                                       @page_size   INT,
									   @hoten nvarchar(150),
									    @taikhoan varchar(30)
									   )
AS
    BEGIN
        DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0)
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER(
                              ORDER BY u.hoten ASC)) AS RowNumber, 
                             u.id              , 
							 u.hoten           ,
							 u.ngaysinh          ,
							 u.diachi           ,
							 u.gioitinh           ,
							 u.email           ,
							 u.taikhoan         ,
							 u.matkhau           ,
							 u.role  ,
							 u.image  
                        INTO #Results1
                        FROM [user] AS u
						WHERE (u.taikhoan <> 'Admin') and ((@hoten = '') OR (u.hoten LIKE '%' + @hoten + '%')) and  ((@taikhoan = '') OR (u.taikhoan = @taikhoan));
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
            END;
            ELSE
            BEGIN
                SET NOCOUNT ON;
                         SELECT(ROW_NUMBER() OVER(
                              ORDER BY u.hoten ASC)) AS RowNumber, 
                             u.id              , 
							 u.hoten           ,
							 u.ngaysinh          ,
							 u.diachi           ,
							 u.gioitinh           ,
							 u.email           ,
							 u.taikhoan         ,
							 u.matkhau           ,
							 u.role     ,
							 u.image  
                        INTO #Results2
                        FROM [user] AS u
						WHERE (u.taikhoan <> 'Admin') and ((@hoten = '') OR (u.hoten LIKE '%' + @hoten + '%')) and  ((@taikhoan = '') OR (u.taikhoan = @taikhoan));
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;
                        DROP TABLE #Results2;
        END;
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_user_update]    Script Date: 6/11/2022 4:42:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_user_update]
(@id              nvarchar(50), 
 @hoten          nvarchar(150) ,
 @ngaysinh         date  ,
 @diachi          nvarchar(250)  ,
 @gioitinh         nvarchar(30)  ,
 @email          varchar(150) ,
 @taikhoan         varchar(30) ,
 @matkhau         varchar(60)  ,
 @role          varchar(30),
 @image         varchar(300)
)
AS
    BEGIN
   update [user] set 
				hoten= @hoten           ,
				ngaysinh= @ngaysinh          ,
				diachi= @diachi           ,
				gioitinh= @gioitinh           ,
				email= @email           ,
				taikhoan = @taikhoan,
				matkhau = @matkhau           ,
				role= @role ,
				image = @image 
				where id = @id;
			 
        SELECT '';
    END;
GO
USE [master]
GO
ALTER DATABASE [tintucgame2] SET  READ_WRITE 
GO
