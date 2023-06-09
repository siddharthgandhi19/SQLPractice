USE [BookStoreDB]
GO
/****** Object:  StoredProcedure [dbo].[spGetAllOrders]    Script Date: 04-Apr-23 11:52:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spGetAllOrders]
@UserId int
AS
BEGIN

SELECT OrderId,UserId, OrderDate,b.BookId,b.BookName,b.AuthorName,b.OriginalPrice, b.DiscountPrice, b.BookImage from ORDERTABLE 
c join BOOKS b on c.BookId=b.BookId 
END 

Exec spGetAllOrders
