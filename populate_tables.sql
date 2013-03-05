insert into Member values
(0,'Bob Gumbo','123 Not Fake Street, Ottawa', '6135553987', 'bob@iloveshrimp.net', 'R4365-58723-59482','1955-12-08', '5837 3882 7362 4771', '2014-08-01'),
(1,'Morey Poopins','382 Candy Lane, Kingston', '4169274029', 'morry@notmychild.com', 'S3948-47266-53901','1927-08-21', '4827 3856 2162 4873','2016-01-01'),
(2,'Fanny Flanagan','109 End of the Rainbow Drive, Toronto', '3432263095', null, 'P4827-58274-10395','1999-01-02', '4987 2673 5652 7621','2013-12-01')
;

insert into Location values
(0,'111 Bank Street, Ottawa', 35),
(1,'231 King Street West, Kingston', 12),
(2,'4550 Queen Street East, Toronto', 50)
;

insert into Car values
(0, 'U92N3ID9IJ2EKJD9IJ', 'Mazda', '6', 2012, 3817.4, 11.2, 0),
(1, 'JD982JOIS98J239873', 'Subaru', 'Forester', 2013, 872.9, 10.0, 0),
(2, '1M8GDM9AXKP0427982', 'Honda', 'Civic', 2012, 3817.4, 11.2, 1),
(3, '8DJN2O28XJ9W8J3KND', 'Ford', 'Focus', 2011, 9873.2, 21.0, 1),
(4, 'ASIX3OI2MDKMO98392', 'Lamborghini', 'Murcielago', 2013, 9274.0, 19.5, 2),
(5, 'OIWJD893429849J245', 'Ferrari', 'Enzo', 2012, 4652.1, 4.6, 2)
;

insert into Fee values
(0, 7.50, 'Hourly rate'),
(1, 50.0, 'Annual Fee')
;

insert into Reservation values
(0, '2013-Mar-04', '13:00', 5, 0, 0),
;

-- CREATE TABLE Reservation (
--     --Simple attributes
--     ResNum          INTEGER     NOT NULL,
--     PickupDate             Date NOT NULL,
--     PickupTime             Time NOT NULL,
--     Duration        INTEGER NOT NULL,

--     --Foreign keys
--     MemNum    INTEGER NOT NULL,
--     FOREIGN KEY(MemNum) REFERENCES Member,
--     VIN    INTEGER NOT NULL,
--     FOREIGN KEY(VIN) REFERENCES Car,
--     LocNum    INTEGER NOT NULL,
--     FOREIGN KEY(LocNum) REFERENCES Location,

--     PRIMARY KEY(ResNum)
-- );


-- CREATE TABLE Payment (
--     --Simple attributes
--     PaymentNum          INTEGER     NOT NULL,
--     Amount              money NOT NULL,
--     Paydate           DATE NOT NULL,

--     --Foreign keys
--     MemNum    INTEGER NOT NULL,
--     FOREIGN KEY(MemNum) REFERENCES Member,

--     PRIMARY KEY(PaymentNum)
-- );



-- CREATE TABLE Maintenance (
--     --Simple attributes
--     MaintNum          INTEGER     NOT NULL,
--     CheckupDate             VARCHAR(20) NOT NULL,
--     Odometer    DOUBLE PRECISION NOT NULL,

--     --Foreign keys
--     VIN    INTEGER NOT NULL,
--     FOREIGN KEY(VIN) REFERENCES Car,

--     PRIMARY KEY(MaintNum)
-- );



-- CREATE TABLE Charge (
--     --Simple attributes
--     ChargeNum          INTEGER     NOT NULL,
--     Paydate           DATE NOT NULL,

--     --Foreign keys
--     FeeNum    INTEGER NOT NULL,
--     ResNum    INTEGER NOT NULL,
--     MemNum    INTEGER NOT NULL,

--     FOREIGN KEY(FeeNum) REFERENCES Fee,
--     FOREIGN KEY(ResNum) REFERENCES Reservation,
--     FOREIGN KEY(MemNum) REFERENCES Member,

--     PRIMARY KEY(ChargeNum)
-- );