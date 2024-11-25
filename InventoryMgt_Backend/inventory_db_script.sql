USE [master]
GO
/****** Object:  Database [InventoryMgt]    Script Date: 06-04-2024 12:53:04 ******/
CREATE DATABASE [InventoryMgt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InventoryMgt', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\InventoryMgt.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'InventoryMgt_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\InventoryMgt_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [InventoryMgt] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InventoryMgt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InventoryMgt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InventoryMgt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InventoryMgt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InventoryMgt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InventoryMgt] SET ARITHABORT OFF 
GO
ALTER DATABASE [InventoryMgt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InventoryMgt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InventoryMgt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InventoryMgt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InventoryMgt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InventoryMgt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InventoryMgt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InventoryMgt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InventoryMgt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InventoryMgt] SET  ENABLE_BROKER 
GO
ALTER DATABASE [InventoryMgt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InventoryMgt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InventoryMgt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InventoryMgt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InventoryMgt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InventoryMgt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InventoryMgt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InventoryMgt] SET RECOVERY FULL 
GO
ALTER DATABASE [InventoryMgt] SET  MULTI_USER 
GO
ALTER DATABASE [InventoryMgt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InventoryMgt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InventoryMgt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InventoryMgt] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [InventoryMgt] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [InventoryMgt] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'InventoryMgt', N'ON'
GO
ALTER DATABASE [InventoryMgt] SET QUERY_STORE = ON
GO
ALTER DATABASE [InventoryMgt] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [InventoryMgt]
GO
/****** Object:  User [NT AUTHORITY\SYSTEM]    Script Date: 06-04-2024 12:53:05 ******/
CREATE USER [NT AUTHORITY\SYSTEM] FOR LOGIN [NT AUTHORITY\SYSTEM] WITH DEFAULT_SCHEMA=[db_owner]
GO
ALTER ROLE [db_owner] ADD MEMBER [NT AUTHORITY\SYSTEM]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 06-04-2024 12:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[CategoryId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 06-04-2024 12:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase]    Script Date: 06-04-2024 12:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NULL,
	[ProductId] [int] NULL,
	[PurchaseDate] [datetime] NOT NULL,
	[Quantity] [float] NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Price] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 06-04-2024 12:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NULL,
	[ProductId] [int] NOT NULL,
	[SellingDate] [datetime] NOT NULL,
	[Quantity] [float] NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 06-04-2024 12:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NULL,
	[ProductId] [int] NULL,
	[Quantity] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Stock] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Stock] ADD  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[Stock] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Purchase]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[usp_AddCategory]    Script Date: 06-04-2024 12:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_AddCategory](@CategoryName nvarchar(50),@CategoryId int null)
as
begin
insert into Category(CreateDate,UpdateDate,IsDeleted,CategoryName,CategoryId)
values(getdate(),getdate(),0,@CategoryName,@CategoryId);

select c.*,parent.CategoryName as ParentCategoryName
from category c left join category parent
on c.CategoryId=parent.Id where c.Id=scope_identity()
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_AddProduct]    Script Date: 06-04-2024 12:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Usp_AddProduct]
(
  @ProductName nvarchar(50), @CategoryId int, @Price decimal(18,2)
)
as
begin
declare @lastId int
insert into Product (CreateDate,UpdateDate,IsDeleted,ProductName,CategoryId,Price)
values(getdate(),getdate(),0,@ProductName,@CategoryId,@Price)
select @lastId=SCOPE_IDENTITY()

select p.*,c.CategoryName from Product p join Category c on p.CategoryId = c.Id
where p.IsDeleted=0 and c.IsDeleted=0 and p.Id=@lastId

end
GO
/****** Object:  StoredProcedure [dbo].[usp_AddPurchase]    Script Date: 06-04-2024 12:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_AddPurchase]
 @ProductId int , @PurchaseDate datetime ,
 @Quantity float,@Price decimal(18,2) ,@Description nvarchar(100)
as begin
begin Transaction;
 begin try
  declare @createdPurchaseId int;

  insert into Purchase(CreateDate,UpdateDate,IsDeleted,ProductId,PurchaseDate,Quantity,Price,[Description])
  values
  (getdate(),getdate(),0,@ProductId,@PurchaseDate,@Quantity,@Price,@Description);

  set @createdPurchaseId=SCOPE_IDENTITY();

  -- managing stock
  if exists(select 1 from Stock where ProductId=@ProductId)
  begin
    update Stock set Quantity=Quantity+@Quantity where ProductId=@ProductId;
  end
  else
  begin
    insert into Stock(ProductId,Quantity) values (@ProductId,@Quantity)
  end
  
  COMMIT TRANSACTION;
  --  returning created purchase entry

   select purchase.*,product.ProductName from
   Purchase purchase join Product product
   on purchase.ProductId = product.Id
   where purchase.IsDeleted=0 and product.IsDeleted=0 and purchase.Id=@createdPurchaseId
 end try

 begin catch
   ROLLBACK TRANSACTION;
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
    DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
    DECLARE @ErrorState INT = ERROR_STATE();
    RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
 end catch
end
GO
/****** Object:  StoredProcedure [dbo].[usp_AddSale]    Script Date: 06-04-2024 12:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[usp_AddSale]
 @ProductId int , @SellingDate datetime,
 @Quantity float, @Price decimal(18,2) ,@Description nvarchar(100)
as begin
  begin transaction;
    begin try
	  declare @createdSaleId int

	  insert into Sale(CreateDate,UpdateDate,IsDeleted,ProductId,SellingDate,Quantity,Price,[Description])
      values
      (getdate(),getdate(),0,@ProductId,@SellingDate,@Quantity,@Price,@Description);
	 
	  -- select recently created id
	  set @createdSaleId=SCOPE_IDENTITY();

	  -- *** Manage Stock *** 
	  if exists(select 1 from stock where ProductId=@ProductId)
	  begin
	   update stock set Quantity = Quantity-@Quantity where ProductId=@ProductId
	  end

	  COMMIT TRANSACTION;
	  -- select the resent created item from sale
	  select s.*,p.ProductName from dbo.Sale s join Product p 
       on s.ProductId=p.Id where s.IsDeleted=0 and p.IsDeleted=0 and s.Id=@createdSaleId
	end try

	begin catch
	 rollback transaction;
	 DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
     DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
     DECLARE @ErrorState INT = ERROR_STATE();
     RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[usp_DeletePurchase]    Script Date: 06-04-2024 12:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_DeletePurchase] @Id int
as
begin
 begin transaction;
 begin try
  declare @productId int,@quantity int;

  select @productId=productId,@quantity=Quantity from Purchase where Id=@Id;

  update Purchase set IsDeleted=1 where Id=@Id;

  if exists(select 1 from stock where productId=@productId)
   begin
    update Stock set Quantity=Quantity-@quantity where ProductId=@productId;
   end
  commit transaction;
 end try
 begin catch
  rollback transaction;
  DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
    DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
    DECLARE @ErrorState INT = ERROR_STATE();
    RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
 end catch
end
GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteSale]    Script Date: 06-04-2024 12:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_DeleteSale]
@id int 
as begin
 begin transaction;
 begin try
  declare @productId int,@quantity int;

  select @productId=productId,@quantity=Quantity from Sale where Id=@Id;

  update Sale set IsDeleted=1 where Id=@Id;

  if exists(select 1 from stock where productId=@productId)
   begin
    update Stock set Quantity=Quantity+@quantity where ProductId=@productId;
   end
  commit transaction;
 end try
 begin catch
  rollback transaction;
  DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
    DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
    DECLARE @ErrorState INT = ERROR_STATE();
    RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
 end catch

end
GO
/****** Object:  StoredProcedure [dbo].[usp_GetAllProductsWithStock]    Script Date: 06-04-2024 12:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_GetAllProductsWithStock]
as 
begin
 select p.Id,p.ProductName, c.CategoryName,p.Price,IsNull(s.Quantity,0) as Quantity from Product p
          join Category c
         on p.CategoryId=c.Id
		 left join stock s on p.Id = s.ProductId
		 where
		  p.IsDeleted=0 and c.IsDeleted=0 
end
GO
/****** Object:  StoredProcedure [dbo].[usp_getCategories]    Script Date: 06-04-2024 12:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_getCategories]  @searchTerm nvarchar(50)=''
as 
begin
select c.*,parent.CategoryName as ParentCategoryName
from category c left join category parent
on c.CategoryId=parent.Id where (@searchTerm ='' or c.CategoryName like '' + @searchTerm + '%')  and  c.IsDeleted=0 
end
GO
/****** Object:  StoredProcedure [dbo].[usp_getProducts]    Script Date: 06-04-2024 12:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_getProducts] 
  @page int=1,
  @limit int=4,
  @searchTerm nvarchar(50) = null,
  @sortColumn nvarchar(20)='Id',
 @sortDirection nvarchar(5)='asc' 
as 
begin
select p.*, c.CategoryName from Product p join Category c
         on p.CategoryId=c.Id where (@searchTerm is null or p.ProductName like '%'+@searchTerm+'%' or c.CategoryName like '%'+@searchTerm+'%') 
		 and p.IsDeleted=0 and c.IsDeleted=0 
order by
case when @sortColumn='Id' and @sortDirection='asc' then p.Id end,
case when @sortColumn='Id' and @sortDirection='desc' then p.Id end desc,
case when @sortColumn='ProductName' and @sortDirection='asc' then p.ProductName end,
case when @sortColumn='ProductName' and @sortDirection='desc' then p.ProductName end desc,
case when @sortColumn='Price' and @sortDirection='asc' then p.Price end,
case when @sortColumn='Price' and @sortDirection='desc' then p.Price end desc,
case when @sortColumn='CreateDate' and @sortDirection='asc' then p.CreateDate end,
case when @sortColumn='CreateDate' and @sortDirection='desc' then p.CreateDate end desc,
case when @sortColumn='UpdateDate' and @sortDirection='asc' then p.UpdateDate end,
case when @sortColumn='UpdateDate' and @sortDirection='desc' then p.UpdateDate end desc,
case when @sortColumn='CategoryName' and @sortDirection='asc' then c.CategoryName end,
case when @sortColumn='CategoryName' and @sortDirection='desc' then c.CategoryName end desc

OFFSET(@page-1)*@limit ROWS
FETCH NEXT @limit ROWS ONLY;

select Count(p.Id) as TotalRecords,CAST(CEILING((count(p.Id)*1.0)/@limit)as int) as TotalPages
 from Product p join Category c
         on p.CategoryId=c.Id where (@searchTerm is null or p.ProductName like '%'+@searchTerm+'%' or c.CategoryName like '%'+@searchTerm+'%') 
		 and p.IsDeleted=0 and c.IsDeleted=0 
end
GO
/****** Object:  StoredProcedure [dbo].[usp_GetPurchaseById]    Script Date: 06-04-2024 12:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_GetPurchaseById] @Id int
as
begin
 select purchase.*,product.ProductName from
   Purchase purchase join Product product
   on purchase.ProductId = product.Id
   where purchase.IsDeleted=0 and product.IsDeleted=0 and purchase.Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[usp_getPurchases]    Script Date: 06-04-2024 12:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_getPurchases]
@dateFrom datetime = null,
@dateTo datetime = null,
@productName nvarchar(100) = null,
@page int =1,@limit int=4,@sortDirection nvarchar(4)='asc',@sortColumn nvarchar(50)='Id'
as
begin

select purchase.*,product.ProductName from
   Purchase purchase join Product product
   on purchase.ProductId = product.Id
   where purchase.IsDeleted=0 and product.IsDeleted=0
   AND
(
    -- Condition 1: No filter columns passed
    (
        @dateFrom IS NULL AND @dateTo IS NULL AND @productName IS NULL
    )
    OR
    -- Condition 2: User passes productName only
    (
        @dateFrom IS NULL AND @dateTo IS NULL AND @productName IS NOT NULL
        AND product.ProductName like '%'+@productName+'%'
    )
    OR
    -- Condition 3: User passes dateFrom, dateTo only
    (
        @dateFrom IS NOT NULL AND @dateTo IS NOT NULL AND @productName IS NULL
        AND purchase.PurchaseDate >= @dateFrom AND purchase.PurchaseDate <=@dateTo
    )
    OR
    -- Condition 4: User passes dateFrom, dateTo and productName together
    (
        @dateFrom IS NOT NULL AND @dateTo IS NOT NULL AND @productName IS NOT NULL
        AND purchase.PurchaseDate >= @dateFrom AND purchase.PurchaseDate <=@dateTo
        AND product.ProductName like '%'+@productName+'%'
    )
)
order by 
case when @sortColumn='Id' and @sortDirection='asc' then purchase.Id end,
case when @sortColumn='Id' and @sortDirection='desc' then purchase.Id end desc,
case when @sortColumn='ProductName' and @sortDirection='asc' then product.ProductName end,
case when @sortColumn='ProductName' and @sortDirection='desc' then product.ProductName end desc,
case when @sortColumn='Price' and @sortDirection='asc' then purchase.Price end,
case when @sortColumn='Price' and @sortDirection='desc' then purchase.Price end desc,
case when @sortColumn='PurchaseDate' and @sortDirection='asc' then purchase.PurchaseDate end,
case when @sortColumn='PurchaseDate' and @sortDirection='desc' then purchase.PurchaseDate end desc

OFFSET(@page-1)*@limit ROWS
fetch next @limit rows only;

-- second result set returns totalRecords with filter in table

select Count(purchase.Id) as TotalRecords,CAST(CEILING((count(purchase.Id)*1.0)/@limit)as int) as TotalPages from
   Purchase purchase join Product product
   on purchase.ProductId = product.Id
   where purchase.IsDeleted=0 and product.IsDeleted=0
   AND
(
    -- Condition 1: No filter columns passed
    (
        @dateFrom IS NULL AND @dateTo IS NULL AND @productName IS NULL
    )
    OR
    -- Condition 2: User passes productName only
    (
        @dateFrom IS NULL AND @dateTo IS NULL AND @productName IS NOT NULL
        AND product.ProductName like '%'+@productName+'%'
    )
    OR
    -- Condition 3: User passes dateFrom, dateTo only
    (
        @dateFrom IS NOT NULL AND @dateTo IS NOT NULL AND @productName IS NULL
        AND purchase.PurchaseDate >= @dateFrom AND purchase.PurchaseDate <=@dateTo
    )
    OR
    -- Condition 4: User passes dateFrom, dateTo and productName together
    (
        @dateFrom IS NOT NULL AND @dateTo IS NOT NULL AND @productName IS NOT NULL
        AND purchase.PurchaseDate >= @dateFrom AND purchase.PurchaseDate <=@dateTo
        AND product.ProductName like '%'+@productName+'%'
    )
)

end
GO
/****** Object:  StoredProcedure [dbo].[usp_GetSaleById]    Script Date: 06-04-2024 12:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_GetSaleById]
@id int 
as begin
select s.*,p.ProductName from dbo.Sale s join Product p 
on s.ProductId=p.Id where s.IsDeleted=0 and p.IsDeleted=0 and s.Id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[usp_GetSales]    Script Date: 06-04-2024 12:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_GetSales]
@dateFrom datetime = null,
@dateTo datetime = null,
@productName nvarchar(100) = null,
@page int =1,@limit int=4,@sortDirection nvarchar(4)='asc',@sortColumn nvarchar(50)='Id'
as
begin
 select s.*,p.ProductName from dbo.Sale s join Product p 
 on s.ProductId=p.Id where s.IsDeleted=0 and p.IsDeleted=0
 and
 (
    -- Condition 1: No filter columns passed
    (
        @dateFrom IS NULL AND @dateTo IS NULL AND @productName IS NULL
    )
    OR
    -- Condition 2: User passes productName only
    (
        @dateFrom IS NULL AND @dateTo IS NULL AND @productName IS NOT NULL
        AND p.ProductName like '%'+@productName+'%'
    )
    OR
    -- Condition 3: User passes dateFrom, dateTo only
    (
        @dateFrom IS NOT NULL AND @dateTo IS NOT NULL AND @productName IS NULL
        AND s.SellingDate >= @dateFrom AND s.SellingDate <=@dateTo
    )
    OR
    -- Condition 4: User passes dateFrom, dateTo and productName together
    (
        @dateFrom IS NOT NULL AND @dateTo IS NOT NULL AND @productName IS NOT NULL
        AND s.SellingDate >= @dateFrom AND s.SellingDate <=@dateTo
        AND p.ProductName like '%'+@productName+'%'
    )
)
 order by 
 case when @sortColumn='Id' and @sortDirection = 'asc' then s.Id end,
 case when @sortColumn='Id' and @sortDirection = 'desc' then s.Id end desc,
 case when @sortColumn='ProductName' and @sortDirection='asc' then p.ProductName end,
 case when @sortColumn='ProductName' and @sortDirection='desc' then p.ProductName end desc,
 case when @sortColumn='Price' and @sortDirection='asc' then s.Price end,
 case when @sortColumn='Price' and @sortDirection='desc' then s.Price end desc,
 case when @sortColumn='SellingDate' and @sortDirection='asc' then s.SellingDate end,
 case when @sortColumn='SellingDate' and @sortDirection='desc' then s.SellingDate end desc

 offset(@page-1)*@limit rows
 fetch next @limit rows only;

 -- second result set returns totalRecords with filter in table

 select COUNT(s.Id) as TotalRecords, CEILING((count(s.Id)*1.0)/@limit) as TotalPages 
 from dbo.Sale s join Product p 
 on s.ProductId=p.Id where s.IsDeleted=0 and p.IsDeleted=0
 and
 (
    -- Condition 1: No filter columns passed
    (
        @dateFrom IS NULL AND @dateTo IS NULL AND @productName IS NULL
    )
    OR
    -- Condition 2: User passes productName only
    (
        @dateFrom IS NULL AND @dateTo IS NULL AND @productName IS NOT NULL
        AND p.ProductName like '%'+@productName+'%'
    )
    OR
    -- Condition 3: User passes dateFrom, dateTo only
    (
        @dateFrom IS NOT NULL AND @dateTo IS NOT NULL AND @productName IS NULL
        AND s.SellingDate >= @dateFrom AND s.SellingDate <=@dateTo
    )
    OR
    -- Condition 4: User passes dateFrom, dateTo and productName together
    (
        @dateFrom IS NOT NULL AND @dateTo IS NOT NULL AND @productName IS NOT NULL
        AND s.SellingDate >= @dateFrom AND s.SellingDate <=@dateTo
        AND p.ProductName like '%'+@productName+'%'
    )
)

end
GO
/****** Object:  StoredProcedure [dbo].[usp_GetStock]    Script Date: 06-04-2024 12:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_GetStock]
@page int=1,
@limit int=4,
@sortColumn nvarchar(50)='Id',
@sortDirection nvarchar(4)='asc',
@searchTerm nvarchar(50)=null
as
begin
select s.*,p.ProductName,c.CategoryName
from Stock s join Product p on s.ProductId = p.Id
join Category c on p.CategoryId = c.Id
where (@searchTerm is null or p.ProductName like '%'+@searchTerm+'%' or c.CategoryName like '%'+@searchTerm+'%') 
and (s.IsDeleted=0 and c.IsDeleted=0 and p.IsDeleted=0)
order by 
case when @sortColumn='Id' and @sortDirection='asc' then s.Id end,
case when @sortColumn='Id' and @sortDirection='desc' then s.Id end desc,
case when @sortColumn='ProductName' and @sortDirection='asc' then p.ProductName end,
case when @sortColumn='ProductName' and @sortDirection='desc' then p.ProductName end desc,
case when @sortColumn='CategoryName' and @sortDirection='asc' then c.CategoryName end,
case when @sortColumn='CategoryName' and @sortDirection='desc' then c.CategoryName end desc
offset (@page-1)*@limit rows
fetch next @limit rows only;

select COUNT(s.Id) as TotalRecords, CEILING((count(s.Id)*1.0)/@limit) as TotalPages 
from Stock s join Product p on s.ProductId = p.Id
join Category c on p.CategoryId = c.Id
where (@searchTerm is null or p.ProductName like '%'+@searchTerm+'%' or c.CategoryName like '%'+@searchTerm+'%') 
and (s.IsDeleted=0 and c.IsDeleted=0 and p.IsDeleted=0)

end

GO
/****** Object:  StoredProcedure [dbo].[usp_GetStockByProductId]    Script Date: 06-04-2024 12:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_GetStockByProductId]
@ProductId int
as 
begin
select stock.*,product.ProductName,category.CategoryName
from Stock stock join Product product on stock.ProductId = product.Id 
join Category category on product.CategoryId = category.Id
where stock.IsDeleted=0  and stock.ProductId=@ProductId
end
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateCategory]    Script Date: 06-04-2024 12:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_UpdateCategory](@Id int,@CategoryName nvarchar(50),@CategoryId int null)
as
begin
Update Category
          set
          UpdateDate=getdate(),
          CategoryName=@CategoryName,
          CategoryId=@CategoryId where Id=@Id

select c.*,parent.CategoryName as ParentCategoryName
from category c left join category parent
on c.CategoryId=parent.Id where c.Id=@Id
end

GO
/****** Object:  StoredProcedure [dbo].[usp_updateProduct]    Script Date: 06-04-2024 12:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_updateProduct] 
@Id int,
@ProductName nvarchar(50),
@CategoryId int,
@Price decimal(18,2)
as
begin
update Product set
         UpdateDate=getdate(), 
         ProductName=@ProductName,
         CategoryId=@CategoryId,
         Price=@Price
         where Id=@Id

select p.*,c.CategoryName from Product p join Category c on p.CategoryId = c.Id
where p.IsDeleted=0 and c.IsDeleted=0 and p.Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdatePurchase]    Script Date: 06-04-2024 12:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_UpdatePurchase]
 @Id int,
 @ProductId int, @PurchaseDate datetime,
 @Quantity float,@Price decimal(18,2),@Description nvarchar(100)
as begin
begin Transaction;
 begin try
  declare @previousProductId int,@previousQuantity int
  select @previousProductId=ProductId, @previousQuantity=Quantity from Purchase where Id=@Id

  update  Purchase set UpdateDate=getdate(),
    ProductId=@ProductId,PurchaseDate=@PurchaseDate,Quantity=@Quantity,Price=@Price,[Description]=@Description
	where Id=@Id
  -- managing stock
 
  -- if we are having the same product
  if(@previousProductId=@ProductId)
   begin
    update Stock set Quantity=(Quantity-@previousQuantity)+@Quantity where ProductId=@ProductId;
   end

   -- if we are having the different product
   else
   begin
    --decrease the quantity of previous product
    update Stock set Quantity=Quantity-@previousQuantity where ProductId=@previousProductId;

	-- increasing quantity of new product
	if exists(select 1 from Stock where productId=@ProductId)
	 begin
	  update Stock set Quantity=Quantity+@Quantity where ProductId=@ProductId;
	 end
	else
	 begin
      insert into Stock(ProductId,Quantity) values (@ProductId,@Quantity)
     end
   end

  COMMIT TRANSACTION;

  --  returning updated purchase entry
   select purchase.*,product.ProductName from
   Purchase purchase join Product product
   on purchase.ProductId = product.Id
   where purchase.IsDeleted=0 and product.IsDeleted=0 and purchase.Id=@Id
 end try

 begin catch
   ROLLBACK TRANSACTION;
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
    DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
    DECLARE @ErrorState INT = ERROR_STATE();
    RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
 end catch
end
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateSale]    Script Date: 06-04-2024 12:53:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_UpdateSale]
 @Id int,
 @ProductId int, @SellingDate datetime,
 @Quantity float,@Price decimal(18,2),@Description nvarchar(100)
as begin
begin Transaction;
 begin try
  declare @previousProductId int,@previousQuantity int

  select @previousProductId=ProductId, @previousQuantity=Quantity from Sale where Id=@Id

  update  Sale set UpdateDate=getdate(),
    ProductId=@ProductId,SellingDate=@SellingDate,Quantity=@Quantity,Price=@Price,[Description]=@Description
	where Id=@Id
  -- managing stock
 
  -- if we are having the same product
  if(@previousProductId=@ProductId)
   begin
    update Stock set Quantity=(Quantity+@previousQuantity)-@Quantity where ProductId=@ProductId;
   end

   -- if we are having the different product
   else
   begin
    --increase the quantity of previous product
    update Stock set Quantity=Quantity+@previousQuantity where ProductId=@previousProductId;

	-- decrease quantity of new product
	if exists(select 1 from Stock where productId=@ProductId)
	begin
	 update Stock set Quantity=Quantity-@Quantity where ProductId=@ProductId;
	end
	
   end

  COMMIT TRANSACTION;

  --  returning updated purchase entry
  select s.*,p.ProductName from dbo.Sale s join Product p 
       on s.ProductId=p.Id where s.IsDeleted=0 and p.IsDeleted=0 and s.Id=@Id
 end try

 begin catch
   ROLLBACK TRANSACTION;
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
    DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
    DECLARE @ErrorState INT = ERROR_STATE();
    RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
 end catch
end
GO
USE [master]
GO
ALTER DATABASE [InventoryMgt] SET  READ_WRITE 
GO
