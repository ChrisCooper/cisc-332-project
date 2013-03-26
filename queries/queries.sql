
-- Car usage history
select *
    from reservation natural join car
        where carNum = C
            and PickupDate < Today()
            or (PickupDate = Today()
                and PickupTime < startCutoff
                );

-- C = carnum
-- startCutoff = now - duration


-- Charge annual Fee
insert into Charge values
(DEFAULT, Today(), 2, null, M);

-- M = member number


-- Show transaction history
select *
    from charge natural join member where memNum = M;

select *
    from payment natural join member where memNum = M;

-- M = member number

-- New member
insert into Member values
(DEFAULT, name, address, phonenum, email, license, regitrationdate, ccnum, ccxpr);

-- Member reserves car
insert into Reservation values
(DEFAULT, PickupDate, PickupTime, duration, carnum, memnum, locnum);

-- pays account balance
insert into Payment values
(DEFAULT, amount, Today(), memNum);

-- show cars not in use
select *
    from car natural join reservation
    except
        (select * from car natural join reservation
            where pickupdate = Today()
                and PickupTime < startCutoff
        );

-- startCutoff = now - duration

insert into Car values
(DEFAULT, VIN, Make, Model, year, mileage, lastgas, locnum);


-- show reservations for given day
select * from reservation where PickupDate = Today();



-- show all cars and their reservations for a given location
select * from car where locnum = L;

--for each car:
select * from reservation where carnum = C;
