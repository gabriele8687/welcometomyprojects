CREATE TABLE Customer (
  CustomerId int IDENTITY(100,10), -- NO VALUE NEEDED WHEN INSERTING
  FirstName varchar(40) Not Null,
  SurName varchar(50) Not Null,
  AddressLine1 varchar(55) Not Null,
  AddressLine2 varchar(55) Null,
  City varchar(40) Not Null,
  PostCode char(8) Null,
  Country varchar(40) Not Null,
  PhoneNumber varchar(20) Not Null,
  EmailAddress varchar(100) Not Null,
  PRIMARY KEY (CustomerId)
);

select * from Customer -- NOT USED IN PRODUCTION SYSTEMS

INSERT INTO CUSTOMER 
values('Jennie','Byrne','Addr1','Addr2','Dublin','DCO112','Ireland','+35346464','jennifer.byrne@dbs.ie'),
('Brian','Byrne','Addr1','Addr2','Dublin','DCO112','Ireland','+35346464','brian.byrne@dbs.ie'),
('Tom','Byrne','Addr1','Addr2','Dublin','DCO112','Ireland','+35346464','tom.byrne@dbs.ie')

select CustomerId,SurName, PostCode,EmailAddress
from Customer
where FirstName = 'Jennie' OR FirstName = 'Tom' -- Filtering Data with a WHERE CLAUSE

-- FUNCTIONS
select getdate() -- US FORMATS for Inserts MM/DD/YYYY

select getdate() as Today,CustomerId as Customer,SurName as LastName, PostCode,EmailAddress
from Customer

select count(CustomerId) as NumCustomers
from Customer
where CustomerId in(100,120) -- Range or List of values

--Building Functions
select datediff(dd,'1/1/2022',getdate()) -- Num of days since start of year
select datediff(wk,'1/1/2022',getdate()) -- Num of weeks since start of year
select datediff(qq,'1/1/2022',getdate()) -- Num of qq since start of year

select CustomerId,SurName, PostCode,EmailAddress
from Customer
order by CustomerId -- Naturally ASCENDING but can be DESCENDING

select CustomerId,SurName, PostCode,EmailAddress
from Customer
order by CustomerId DESC -- Naturally ASCENDING but can be DESCENDING