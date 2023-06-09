USE [BookStoreDB]
GO
/****** Object:  StoredProcedure [dbo].[spGetCartByUserId]    Script Date: 05-Apr-23 1:21:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spGetCartByUserId](
		
		@UserId INT
)

AS 
BEGIN
BEGIN TRY
		IF EXISTS(SELECT * FROM dbo.CART WHERE UserId = @UserId )
		BEGIN
			SELECT CartId,UserId,b.BookId,b.BookName,b.AuthorName,b.OriginalPrice, b.DiscountPrice, b.BookImage from CART 
c join BOOKS b on c.BookId=b.BookId 
WHERE UserId=@UserId;
		END
		ELSE
			THROW 51002, 'Not a Valid User Id', 1
	END TRY
	BEGIN CATCH
		SELECT ERROR_MESSAGE() AS ERROR
	END CATCH
END;

EXEC spGetCartByUserId 1