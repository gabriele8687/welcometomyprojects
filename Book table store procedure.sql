Create table book
(bookNumber int identity (100,1),
bookName varchar(100),
Category varchar(40),
DatePub date,
Authorid varchar(10));

select * from book 

-- create a procedure as insert book and insert the row value  with the option if not exists
drop proc insertbook

create proc insertbook
@bookName varchar(100),
@Category varchar(40),
@DatePub date,
@Authorid varchar(10)
as
-- main insert statement 
If not exists ( select 1 from book where Authorid = @Authorid and bookName = @bookname and category = @category and datepub = @datepub)
begin 
insert into Book values (@bookName, @Category,@DatePub,@Authorid)
-- checking for error
if @@error <>0
return -1
else
return 0
end
else
select  'book already exists'

 exec insertbook ' database', 'vategory',  '2002/08/08', 'au123'

 exec insertbook 'Database', 'study',  '01/01/2003', 'brano tomadd'