USE [master]
GO
/****** Object:  Database [tintucgame2]    Script Date: 5/31/2022 8:55:37 PM ******/
CREATE DATABASE [tintucgame2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tintucgame2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\tintucgame2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tintucgame2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\tintucgame2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
ALTER DATABASE [tintucgame2] SET QUERY_STORE = OFF
GO
USE [tintucgame2]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [tintucgame2]
GO
/****** Object:  Table [dbo].[category]    Script Date: 5/31/2022 8:55:38 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feed]    Script Date: 5/31/2022 8:55:38 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post]    Script Date: 5/31/2022 8:55:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post](
	[id] [char](36) NOT NULL,
	[title] [nvarchar](250) NULL,
	[small_category_id] [nvarchar](50) NULL,
	[metatitle] [nvarchar](250) NULL,
	[description] [ntext] NULL,
	[content] [ntext] NULL,
	[created_at] [datetime] NULL,
	[author] [char](36) NULL,
	[image] [nvarchar](350) NULL,
	[status] [nvarchar](50) NULL,
	[view] [int] NULL,
 CONSTRAINT [PK_post] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[small_category]    Script Date: 5/31/2022 8:55:38 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 5/31/2022 8:55:38 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[category] ([id], [title], [description], [metatitle]) VALUES (N'2cb324a1-6d3d-4bf5-bfb4-a9cfdf7a206b', N'Máy tính PC', N'Game trên nền tảng máy tính, PC', N'may-tinh-pc')
INSERT [dbo].[category] ([id], [title], [description], [metatitle]) VALUES (N'59748c6e-e5eb-4d64-95ea-941cb74985a1', N'Điện thoại/Mobile', N'Game trên nền tảng di động, mobile', N'dien-thoai-mobile')
GO
INSERT [dbo].[post] ([id], [title], [small_category_id], [metatitle], [description], [content], [created_at], [author], [image], [status], [view]) VALUES (N'6de16de7-3bd1-46ad-9883-0a2e287699f5', N'dfdghgf123', N'f94aa82b-2f06-4a43-8df0-9aec89bb6662', N'ghjeyrt', N'<p>fghfgh</p>
', N'<p>ghjghjgh</p>
', CAST(N'2022-05-25T22:49:55.010' AS DateTime), N'94badfa9-d935-4c16-b58c-814c9bcbe3e7', N'/posts/anh4.jpg', N'pending', 0)
INSERT [dbo].[post] ([id], [title], [small_category_id], [metatitle], [description], [content], [created_at], [author], [image], [status], [view]) VALUES (N'7b060e38-acc9-4b13-b4d4-ac98fc3d6d8b', N'gfh', N'c0390ae9-0549-49e8-98ed-66761c2916de', N'ghj', N'<p>dfg</p>
', N'<p>fgh</p>
', CAST(N'2022-05-25T22:01:36.887' AS DateTime), N'94badfa9-d935-4c16-b58c-814c9bcbe3e7', N'/posts/anh1.jpg', N'pending', 0)
INSERT [dbo].[post] ([id], [title], [small_category_id], [metatitle], [description], [content], [created_at], [author], [image], [status], [view]) VALUES (N'c0888075-1625-4922-b009-e0a706247d51', N'dfg456', N'f94aa82b-2f06-4a43-8df0-9aec89bb6662', N'gfh', N'<p>ghj</p>
', N'<p>lol</p>
', CAST(N'2022-05-25T21:01:36.887' AS DateTime), N'94badfa9-d935-4c16-b58c-814c9bcbe3e7', N'/posts/anh5.jpg', N'pending', 0)
INSERT [dbo].[post] ([id], [title], [small_category_id], [metatitle], [description], [content], [created_at], [author], [image], [status], [view]) VALUES (N'e51fcb46-e3da-4c9a-a2da-2e9d915ac987', N'dfg', N'c0390ae9-0549-49e8-98ed-66761c2916de', N'gfh', N'<p>dfg</p>
', N'<p>dfg</p>
', CAST(N'2022-05-25T22:34:36.887' AS DateTime), N'94badfa9-d935-4c16-b58c-814c9bcbe3e7', N'/posts/anh1.jpg', N'pending', 0)
INSERT [dbo].[post] ([id], [title], [small_category_id], [metatitle], [description], [content], [created_at], [author], [image], [status], [view]) VALUES (N'f33720c3-f941-42d8-a53b-6901c7850349', N'fgh', N'c0390ae9-0549-49e8-98ed-66761c2916de', N'dfg', N'<p>fgh</p>
', N'<p>ghj</p>
', CAST(N'2022-05-25T22:11:36.887' AS DateTime), N'94badfa9-d935-4c16-b58c-814c9bcbe3e7', N'/posts/anh1.jpg', N'pending', 0)
GO
INSERT [dbo].[small_category] ([id], [category_id], [title], [description], [metatitle]) VALUES (N'c0390ae9-0549-49e8-98ed-66761c2916de', N'2cb324a1-6d3d-4bf5-bfb4-a9cfdf7a206b', N'Genshin Impact', N'Genshin Impact là một trò chơi hành động nhập vai do miHoYo của Trung Quốc phát triển và được xuất bản lần đầu vào năm 2020. Genshin Impact là IP được miHoYo phát triển tiếp nối sau IP trước là series Honkai. Genshin Impact được đặt trong bối cảnh của một thế giới giả tưởng có tên Teyvat.', N'genshin-impact')
INSERT [dbo].[small_category] ([id], [category_id], [title], [description], [metatitle]) VALUES (N'f94aa82b-2f06-4a43-8df0-9aec89bb6662', N'2cb324a1-6d3d-4bf5-bfb4-a9cfdf7a206b', N'Liên Minh Huyền Thoại', N'Liên Minh Huyền Thoại là một trò chơi video thể loại đấu trường trận chiến trực tuyến nhiều người chơi được Riot Games phát triển và phát hành trên nền tảng Windows và MacOS, lấy cảm hứng từ bản mod Defense of the Ancients cho trò chơi video Warcraft III: Frozen Throne.', N'lien-minh-huyen-thoai')
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
/****** Object:  StoredProcedure [dbo].[sp_category_all]    Script Date: 5/31/2022 8:55:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_category_create]    Script Date: 5/31/2022 8:55:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_category_delete]    Script Date: 5/31/2022 8:55:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_category_get_by_id]    Script Date: 5/31/2022 8:55:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_category_smallcategory]    Script Date: 5/31/2022 8:55:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_category_update]    Script Date: 5/31/2022 8:55:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_feed_create]    Script Date: 5/31/2022 8:55:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_post_accept]    Script Date: 5/31/2022 8:55:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_post_all]    Script Date: 5/31/2022 8:55:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[sp_post_all]
AS
    BEGIN
        SELECT *                       
        FROM post 
    END;
GO
/****** Object:  StoredProcedure [dbo].[sp_post_create]    Script Date: 5/31/2022 8:55:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_post_decline]    Script Date: 5/31/2022 8:55:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_post_delete]    Script Date: 5/31/2022 8:55:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_post_get_by_id]    Script Date: 5/31/2022 8:55:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_post_get_by_meta]    Script Date: 5/31/2022 8:55:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_post_myposts]    Script Date: 5/31/2022 8:55:38 PM ******/
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
							 c.id as big_category_id
                        INTO #Results1
                        FROM post AS u inner join small_category as t on u.small_category_id = t.id inner join category as c on c.id = t.category_id
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
							 c.id as big_category_id
                        INTO #Results2
                        FROM post AS u inner join small_category as t on u.small_category_id = t.id inner join category as c on c.id = t.category_id
						WHERE (u.author = @id);
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;
                        DROP TABLE #Results2;
        END;
    END;

GO
/****** Object:  StoredProcedure [dbo].[sp_post_pendingposts]    Script Date: 5/31/2022 8:55:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_post_update]    Script Date: 5/31/2022 8:55:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_small_category_all]    Script Date: 5/31/2022 8:55:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_small_category_create]    Script Date: 5/31/2022 8:55:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_small_category_delete]    Script Date: 5/31/2022 8:55:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_small_category_get_by_id]    Script Date: 5/31/2022 8:55:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_small_category_update]    Script Date: 5/31/2022 8:55:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_user_create]    Script Date: 5/31/2022 8:55:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_user_delete]    Script Date: 5/31/2022 8:55:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_user_get_by_id]    Script Date: 5/31/2022 8:55:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_user_get_by_username_password]    Script Date: 5/31/2022 8:55:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_user_getstafflist]    Script Date: 5/31/2022 8:55:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_user_search]    Script Date: 5/31/2022 8:55:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_user_update]    Script Date: 5/31/2022 8:55:38 PM ******/
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
