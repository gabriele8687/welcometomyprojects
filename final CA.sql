
select * from client
CREATE TABLE [CLIENT] (
  [ClientID] INT identity(70,1),
  [FirstName] varchar (40),
  [LastName] varchar (40),
  [CustStreetAddress] varchar (40),
  [AddressLine2] varchar (40),
  [City] CHAR (35),
  [County] varchar (40),
  [PostCode] varchar (40),
  [CustPhoneNumber] varchar (40),
  [CustEmailAddress] varchar (40),
  PRIMARY KEY ([ClientID])
);

CREATE TABLE [DrivingTest] (
  [DrivingTestID] INT identity(11,1),
  [testNo] varchar (40),
  [Price] FLOAT,
  [ClientID] INT,
  [TestCenter] varchar (40),
  [result] varchar (40),
  PRIMARY KEY ([DrivingTestID]),
  CONSTRAINT [FK_DrivingTest.ClientID]
    FOREIGN KEY ([ClientID])
      REFERENCES [CLIENT]([ClientID])
);

CREATE TABLE [Vehicle] (
  [VehicleID] INT identity(86,1),
  [Make] CHAR (35),
  [Color] CHAR (35),
  [Model] CHAR (35),
  [years] CHAR (35),
  PRIMARY KEY ([VehicleID])
);

CREATE TABLE [instructor] (
  [InstructurID] INT identity(100,1),
  [firstName] varchar (40),
  [LastName] varchar (40),
  [adress] CHAR (35),
  [RegistrationNo] varchar (40),
  PRIMARY KEY ([InstructurID])
);

CREATE TABLE [inspection ] (
  [InspectionID] INT identity(1,1),
  [inspection_date] date,
  [instructureID] INT,
  [VEHICLEID] int,
  PRIMARY KEY ([InspectionID]),
  CONSTRAINT [FK_inspection .VEHICLEID]
    FOREIGN KEY ([VEHICLEID])
      REFERENCES [Vehicle]([VehicleID]),
  CONSTRAINT [FK_inspection .instructureID]
    FOREIGN KEY ([instructureID])
      REFERENCES [instructor]([InstructurID])
);



CREATE TABLE [Lesson] (
  [LessonID ] INT identity(1,1),
  [LessonNo] varchar (40),
  [LessonDate] date,
  [LessonTime] TIME(3),
  [Stage] varchar (40),
  [ClientID] INT,
  [InspectionID] INT,
  [InstructurID] INT,
  CONSTRAINT [FK_Lesson.ClientID]
    FOREIGN KEY ([ClientID])
      REFERENCES [CLIENT]([ClientID]),
  CONSTRAINT [FK_Lesson.InspectionID]
    FOREIGN KEY ([InspectionID])
      REFERENCES [inspection ]([InspectionID]),
  CONSTRAINT [FK_Lesson.InstructurID]
    FOREIGN KEY ([InstructurID])
      REFERENCES [instructor]([InstructurID])
);


-- Data extraction for Car table
select * from CLIENT
-- Data extraction for Buyer table
select * from [DrivingTest]
-- Data extraction for SalesPerson table
select * from [Vehicle]
-- Data extraction for Invoice table
select * from [instructor]
-- Data extraction for LineItem table
select * from [inspection ]
-- Data extraction for LineItem table
select * from Lesson
--SQL DROP TABLE Statement 
drop table

-- Insert values for CLIENT
insert into CLIENT
values ('Joe', 'Bloggs','1 Meain St', 'N/A','lUCAN', 'Dublin', '595xKFRO','039348475','joe.bloggs@gmail.com'),
('John', 'Lynskey','APT 1A', 'The Malting','Dublin', 'Dublin', 'LHGJ67','0975585555','Lynskeyj@gmail.com'),
('joan', 'Wild','29 The Old Coombe', 'N/A','Dublin', 'Dublin', 'P7686DF','048575869','Joanwild@gmail.com'),
('Mary', 'Jones','Apt 3C', 'The Tower','Ballymoon', 'Dublin', 'TY85967','7589505834383','joNES.mary.bloggs@gmail.com'),
('Lucy', 'Bloggs','1 Meain St', 'N/A','lUCAN', 'Dublin', '595xKFRO','039348475','joe.bloggs@gmail.com')
-- Insert values for DRIVNGTEST 
insert into [DrivingTest]
values('6825996I', 234.00, 70,'Dublin', 'passed'),
		('6125896R', 233.00,71, 'Dublin', 'passed'),
		('2407559R', 123.67,72, 'Dublin', 'faild'),
		('5012266P', 198.45,73, 'Dublin', 'faild'),
		('1015588S', 89.09,74, 'Dublin', 'passed')
-- Insert values for VEHICLE
insert into [Vehicle]
values ( 'Nissan','grey',' NISSAN NAVARA NP300', '2016'), 
		('Honda', 'gold', 'HONDA ACCORD EX SEDAN ','2018'),
		('Bentley', 'Yeloow', 'BENTLEY CONTINENTAL GT V8 COUPE','2014'),
		('Lamborghini','Beige', 'LAMBORGHINI HURACAN COUPE','2019'),
		('Ferrari', 'Red', 'Purosangue','2022');
-- Insert values for instructor
insert into [instructor]
values('Ulric', 'Snelling','639 Banding Circle','HG3748484'),
		('Sauncho', 'Underwood','48 Marquette Terrace','IK284749H'),
		('Dione', 'Doull','92673 Schlimgen Alley','RT4658594'),
		('Alix', 'Mowsdale','6386 Kensington Drive', 'EFT873947'),
		('Alessandra', 'Buff','80 Elka Road','384URHO89');

-- Insert values for inspection 
insert into [inspection ]
values ( '01/01/1999',100,86),
		('01/01/2009',101,87),
		('06/20/2010',102,88),
		('02/16/2005',103,89),
		('01/09/2002',104,90);

-- Insert values for [Lesson]
insert into [Lesson] values	('7','06/10/2022','12:30','final exame' , 70,1,100),
							('8','06/11/2022','17:00','first stage' , 71,2,101),
							('9','06/10/2022','13:00','second stage' , 72,3,102),
							('10','06/10/2022','11:45','final exame' , 73,4,103),
							('15','06/11/2022','16:15','first stage' , 74,5,104);


--Write the scripts to generate 20 Queries

select FirstName, lastname, city 
from CLIENT
where FirstName = 'Mary' and city = 'Ballymoon'
---------------------------------------------------
select count (distinct CustemailAddress) as distinctCustEmailAddress from CLIENT;
---------------------------------------------------------------------------------


