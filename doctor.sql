CREATE TABLE [Insurance] (
  [insuranceid] INT identity(70,1),
  [insurance_name]  varchar (40),
  [benefit]  varchar (40),
  [contact]  varchar (40),
  [phone_number]  varchar (40),
  [claims_address]  varchar (40),
  PRIMARY KEY ([insuranceid])
);

CREATE TABLE [doctor] (
  [physician_number] INT identity(70,1),
  [First_name]  varchar (40),
  [Last_name]  varchar (40),
  PRIMARY KEY ([physician_number])
);
drop table bill

CREATE TABLE [bill ] (
  [Bill_id] INT identity(20,1),
  [Bill_number]  varchar (40),
  [amount] float,
  [Insured]  varchar (40),
  [billdate] date,
  [anount not insured]  varchar (40),
  PRIMARY KEY ([Bill_id])
);


CREATE INDEX [pk] ON  [bill ] ([Billid]);

CREATE TABLE [Payment] (
  [payment_id ] INT identity(30,1),
  [overtime] date,
  [payment record]  varchar (40),
  [receipt number]  varchar (40),
  [amount] float,
  [pay_date] date,
  [method] char (20),
  [Id_number] int,
  [insuranceid] int,
  [billid] int,
  PRIMARY KEY ([payment_id ]),
  CONSTRAINT [FK_Payment.insuranceid]
    FOREIGN KEY ([insuranceid])
      REFERENCES [Insurance]([insuranceid]),
  CONSTRAINT [FK_Payment.billid]
    FOREIGN KEY ([billid])
      REFERENCES [bill]([Bill_id])
);

CREATE TABLE [patient] (
  [Id_number] INT identity(100,1),
  [First_name]  varchar (40),
  [Last_name]  varchar (40),
  [adress]  varchar (40),
  [city]  varchar (40),
  [state]  varchar (40),
  [payment_id ] int,
  [insuranceid] int,
  PRIMARY KEY ([Id_number]),
  CONSTRAINT [FK_patient.insuranceid]
    FOREIGN KEY ([insuranceid])
      REFERENCES [Insurance]([insuranceid]),
  CONSTRAINT [FK_patient.payment_id ]
    FOREIGN KEY ([payment_id ])
      REFERENCES [Payment]([payment_id ])
);

CREATE TABLE [schedule] (
  [scheduleID] INT identity(80,1),
  [appointment]  varchar (40),
  [time] date,
  [physician_number] int,
  [Id_number] int,
  PRIMARY KEY ([scheduleID]),
  CONSTRAINT [FK_schedule.physician_number]
    FOREIGN KEY ([physician_number])
      REFERENCES [doctor]([physician_number]),
  CONSTRAINT [FK_schedule.Id_number]
    FOREIGN KEY ([Id_number])
      REFERENCES [patient]([Id_number])
);

CREATE INDEX [fk] ON  [schedule] ([physician_number]);

