CREATE TABLE [Employee] (
  [Employeeid] INT,
  [Fist_Name] Varchar(40),
  [Last_Nme] varchar (40),
  [postcode] Varchar(40),
  [Address] Varchar(40),
  [Phone_Number] char(20),
  [DOB] Varchar(40),
  [PPSNo] Varchar(40),
  PRIMARY KEY ([Employeeid])
);

insert into Employee
values(20,'Ulric', 'Snelling', 'DX013',  '639 Banding Circle','142-446-0230', '12/12/1990','HG3748484'),
		(21,'Sauncho', 'Underwood', 'DLO93',  '48 Marquette Terrace','755-968-5908', '23/01/1992','IK284749H'),
		(22,'Dione', 'Doull', 'DJK01',  '92673 Schlimgen Alley','389-672-9805', '12/08/1998','RT4658594'),
		(23,'Alix', 'Mowsdale', 'ZE44',  '6386 Kensington Drive', '186-886-7403', '06/12/1986','EFT873947'),
		(24,'Alessandra', 'Buff', 'RTG32',  '80 Elka Road','535-800-1747', '30/04/1988','384URHO89');

	DROP TABLE [Car] 


CREATE TABLE [Car] (
  [LicensePlateN0ID] INT,
  [Make] varchar(40),
  [Color] varchar(40),
  [Model] varchar(40),
  [years] Date ,
  PRIMARY KEY ([LicensePlateN0ID])
);

insert into Car
values ( 01,'Nissan','grey',' NISSAN NAVARA NP300', '2016'), 
		(02,'Honda', 'gold', 'HONDA ACCORD EX SEDAN ','2018'),
		(03,'Bentley', 'Yeloow', 'BENTLEY CONTINENTAL GT V8 COUPE','2014'),
		(04,'Lamborghini','Beige', 'LAMBORGHINI HURACAN COUPE','2019'),
		(05,'Ferrari', 'Red', 'Purosangue','2022');




CREATE TABLE [Customer] (
  [Customerid] INT,
  [Fist_Name] Varchar(40),
  [Last_Name] Varchar(40),
  [Address] Varchar(40),
  [Phone_Number] char(20),
  [DOB] Varchar(40),
  [PPSNo] Varchar(40),
  PRIMARY KEY ([Customerid])
);

insert into Customer
values (31,'Ellan', 'Kedosky', '45 Morial street','564-777-333','12/1/1990','FA1345I5567'),
		(32,'Martin', 'Friozen', '34 Square avenue D','8564-234-546','22/6/1981','LG38374Y9T'),
		(33,'Gian', 'Ruban', '333 rainbow magic','456-756-564','23/2/1986','FG12398UOH6'),
		(34,'Ronaldo', 'Bravo', '35 mountain Kerry avenue','234-745-456','30/09/2000','AD75934UH48'),
		(35,'Quenty', 'Tarantino', '888 Jurassic Park','984-678-123','19/06/1998','8675UH3489LI');

CREATE TABLE [CustomerDeatails] (
  [CustomerDetailsID] INT,
  [CustomerNo] Varchar (40),
  [CustomerID] INT,
  [Active] char(20),
  [inactive] char(20),
  [Carsold] Varchar (40),
  [date_acquired] Date,
  [Customer_date] Varchar (40),
  [VATregister ] char(20),
  PRIMARY KEY ([CustomerDetailsID]),
  CONSTRAINT [FK_CustomerDeatails.CustomerID]
    FOREIGN KEY ([CustomerID])
      REFERENCES [Customer]([Customerid])
);

	

insert into CustomerDeatails
Values (1,'5',31,'YES','-','1','12/03/2020','23','LK12378'),
		(2,'6',32,'YES','-','1','12/04/2021','24','LK12378'),
		(3,'7',33,'-','NO','1','12/08/2022','56','LK12378'),
		(4,'8',34,'YES','-','1','12/11/2022','12','LK12378'),
		(5,'9',35,'-','NO','1','12/12/2022','09','LK12378');



CREATE TABLE [Invoicedetails] (
  [Invoicedetailsid] INT,
  [invoice_Date] Date,
  [CustomerDetailsID] INT,
  [EmployeeId] INT,
  [Owing] Varchar (40),
  [Totals_amount] float,
  PRIMARY KEY ([Invoicedetailsid]),
  CONSTRAINT [FK_Invoicedetails.EmployeeId]
    FOREIGN KEY ([EmployeeId])
      REFERENCES [Employee]([Employeeid]),
  CONSTRAINT [FK_Invoicedetails.CustomerDetailsID]
    FOREIGN KEY ([CustomerDetailsID])
      REFERENCES [CustomerDeatails]([CustomerDetailsID])
);

DROP TABLE Invoicedetails
insert into Invoicedetails
values (0, '2020/12/12', 1,20,2000.56,411.345),
		(1, '2022/01/31', 2,21,24000.90,611.780),
		(2, '2021/03/27', 3,22,123000.90,511.234),
		(3, '2019/08/05', 4,23,8900.56,911.999),
		(4, '2021/11/08', 5,24,45700.23,911.111);



CREATE TABLE [CarSolddetails] (
  [CarSolddetailsID] INT,
  [LicensePlateN0ID] INT,
  [Payment_Mode] Varchar(100),
  [emplyeeid] INT,
  [Sale_Date] Date,
  [Fuel_Type] Varchar(40),
  [InvoiceN0] int,
  PRIMARY KEY ([CarSolddetailsID]),
  CONSTRAINT [FK_CarSolddetails.emplyeeid]
    FOREIGN KEY ([emplyeeid])
      REFERENCES [Employee]([Employeeid]),
  CONSTRAINT [FK_CarSolddetails.LicensePlateN0ID]
    FOREIGN KEY ([LicensePlateN0ID])
      REFERENCES [Car]([LicensePlateN0ID]),
  CONSTRAINT [FK_CarSolddetails.InvoiceN0]
    FOREIGN KEY ([InvoiceN0])
      REFERENCES [Invoicedetails]([Invoicedetailsid])
);


insert into CarSolddetails
values (1,01,'Debit cards',20,'2013/02/11', 'Petrol',0), 
		(3,02,'Credit cards',21,'2018/09/13','Petrol',1),
		(5,03,'Debit cards',22,'2017/09/29','Diesel',2),
		(7,04,'Debit cards',23,'2011/04/28','Ethanol ',3),
		(9,05,'Electronic bank transfers',24,'2015/07/06','Ethanol',4);



-- Data extraction for Car table
select * from Car
-- Data extraction for Buyer table
select * from [CarSolddetails]
-- Data extraction for SalesPerson table
select * from [Employee]
-- Data extraction for Invoice table
select * from [Customer]
-- Data extraction for LineItem table
select * from [CustomerDeatails]
-- Data extraction for LineItem table
select * from [Invoicedetails]

--SQL DROP TABLE Statement 

