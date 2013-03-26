insert into Member values
(DEFAULT, 'Bob Gumbo','123 Not Fake Street, Ottawa', '6135553987', 'bob@iloveshrimp.net', 'R4365-58723-59482','1955-12-08', '5837 3882 7362 4771', '2014-08-01'),
(DEFAULT, 'Morey Poopins','382 Candy Lane, Kingston', '4169274029', 'morry@notmychild.com', 'S3948-47266-53901','1927-08-21', '4827 3856 2162 4873','2016-01-01'),
(DEFAULT, 'Fanny Flanagan','109 End of the Rainbow Drive, Toronto', '3432263095', null, 'P4827-58274-10395','1999-01-02', '4987 2673 5652 7621','2013-12-01')
;

insert into Location values
(DEFAULT,'111 Bank Street, Ottawa', 35),
(DEFAULT,'231 King Street West, Kingston', 12),
(DEFAULT,'4550 Queen Street East, Toronto', 50)
;

insert into Car values
(DEFAULT, 'U92N3ID9IJ2EKJD9IJ', 'Mazda', '6', 2012, 38317.4, 11.2, 1),
(DEFAULT, 'JD982JOIS98J239873', 'Subaru', 'Forester', 20513, 872.9, 10.0, 1),
(DEFAULT, '1M8GDM9AXKP0427982', 'Honda', 'Civic', 2012, 38317.4, 11.2, 2),
(DEFAULT, '8DJN2O28XJ9W8J3KND', 'Ford', 'Focus', 2011, 96873.2, 21.0, 2),
(DEFAULT, 'ASIX3OI2MDKMO98392', 'Lamborghini', 'Murcielago', 2013, 92774.0, 19.5, 3),
(DEFAULT, 'OIWJD893429849J245', 'Ferrari', 'Enzo', 2012, 46352.1, 4.6, 3)
;

insert into Fee values
(DEFAULT, 7.50, 'Hourly rate'),
(DEFAULT, 50.0, 'Annual Fee')
;

insert into Reservation values
(DEFAULT, '2013-03-03', '17:30', 3, 3, 1, 2),
(DEFAULT, '2013-03-07', '10:30', 5, 1, 1, 1),
(DEFAULT, '2013-03-25', '15:00', 4, 4, 1, 2),
(DEFAULT, '2013-02-23', '14:00', 5, 5, 1, 2),
(DEFAULT, '2013-02-27', '09:00', 5, 5, 2, 2),
(DEFAULT, '2013-03-25', '09:30', 2, 2, 1, 1),
(DEFAULT, '2013-03-07', '09:00', 4, 4, 2, 2),
(DEFAULT, '2013-02-25', '11:00', 6, 2, 2, 1),
(DEFAULT, '2013-03-02', '10:00', 3, 1, 1, 2),
(DEFAULT, '2013-03-13', '12:30', 4, 1, 2, 2),
(DEFAULT, '2013-03-10', '11:30', 6, 4, 2, 1),
(DEFAULT, '2013-03-09', '10:00', 1, 3, 1, 1)
;


insert into Payment values
(DEFAULT, 12.50, '2013-03-03', 1),
(DEFAULT, 15.25, '2013-02-25', 2),
(DEFAULT, 84.50, '2013-02-26', 3)
;

insert into Maintenance values
(DEFAULT, '2013-01-03', 8572, 1),
(DEFAULT, '2013-01-25', 9805.6, 2),
(DEFAULT, '2012-12-13', 10641, 3),
(DEFAULT, '2013-01-26', 10982, 3)
;

insert into Charge values
(DEFAULT, '2013-03-03', 1, 1, 1),
(DEFAULT, '2013-03-07', 1, 1, 1),
(DEFAULT, '2013-02-27', 1, 2, 1),
(DEFAULT, '2013-02-23', 1, 3, 1),
(DEFAULT, '2013-02-27', 1, 4, 2),
(DEFAULT, '2013-03-13', 1, 5, 1),
(DEFAULT, '2013-03-07', 1, 6, 2),
(DEFAULT, '2013-02-25', 1, 7, 2),
(DEFAULT, '2013-03-02', 1, 8, 1),
(DEFAULT, '2013-03-13', 1, 9, 2),
(DEFAULT, '2013-03-10', 1, 10, 2),
(DEFAULT, '2013-03-09', 1, 11, 1),
(DEFAULT, '2013-03-13', 1, null, 1),
(DEFAULT, '2013-03-10', 1, null, 1),
(DEFAULT, '2013-03-09', 1, null, 2)
;

