-- CISC 332 Project Part 1
-- Chris Cooper (8cic) 06016705
-- Rachel Hisey (9rlh) 06226892


-- Drop existing tables

drop table Member CASCADE;
drop table Account CASCADE;
drop table Charge CASCADE;
drop table Payment CASCADE;
drop table Fee CASCADE;
drop table Location CASCADE;
drop table Reservation CASCADE;
drop table Car CASCADE;
drop table Maintenance CASCADE;


-- Create new tables

CREATE TABLE Member (
    --Simple attributes
    MemNum              INTEGER     NOT NULL,
    Name                VARCHAR(50) NOT NULL,
    Address             VARCHAR(100) NOT NULL,
    PhoneNum            VARCHAR(14)     NOT NULL,
    Email               VARCHAR(100),
    LicenseNum          VARCHAR(30) NOT NULL,
    RegistrationDate    DATE NOT NULL,

    --Account attributes
    CCNum               VARCHAR(19) NOT NULL,
    CCExpDate           DATE NOT NULL,

    PRIMARY KEY(MemNum)
);

-- How do we create this and member simultaneously?
-- CREATE TABLE Account (
--     --Simple attributes
--     AccountNum          INTEGER     NOT NULL,
--     CCNum               VARCHAR(19) NOT NULL,
--     CCExpDate           DATE NOT NULL,
--     --Balance is calculated

--     --Foreign keys
--     MemNum    INTEGER NOT NULL,
--     FOREIGN KEY(MemNum) REFERENCES Member,

--     PRIMARY KEY(AccountNum)
-- );

-- ALTER TABLE member
-- ADD CONSTRAINT Account_fk FOREIGN KEY(AccountNum) REFERENCES Account;


CREATE TABLE Payment (
    --Simple attributes
    PaymentNum  INTEGER     NOT NULL,
    Amount      MONEY NOT NULL,
    Paydate     DATE NOT NULL,

    --Foreign keys
    MemNum      INTEGER NOT NULL,
    FOREIGN KEY(MemNum) REFERENCES Member,

    PRIMARY KEY(PaymentNum)
);

CREATE TABLE Fee (
    --Simple attributes
    FeeNum          INTEGER     NOT NULL,
    FeeRate         MONEY NOT NULL,
    FeeDescription  VARCHAR(50),

    PRIMARY KEY(FeeNum)
);

CREATE TABLE Location (
    --Simple attributes
    LocNum      INTEGER     NOT NULL,
    Address     VARCHAR(100) NOT NULL,
    NumSpaces   INTEGER     NOT NULL,
    --Number of cars is calculated

    PRIMARY KEY(LocNum)
);

CREATE TABLE Car (
    --Simple attributes
    CarNum          INTEGER NOT NULL,
    VIN             VARCHAR(30)     NOT NULL,
    Make            VARCHAR(20) NOT NULL,
    Model           VARCHAR(20) NOT NULL,
    Year            INTEGER     NOT NULL,
    LastOdometer    DOUBLE PRECISION NOT NULL,
    LastGas         DOUBLE PRECISION NOT NULL,

    --Foreign keys
    LocNum          INTEGER NOT NULL,
    FOREIGN KEY(LocNum) REFERENCES Location,

    PRIMARY KEY(CarNum)
);

CREATE TABLE Maintenance (
    --Simple attributes
    MaintNum    INTEGER     NOT NULL,
    CheckupDate VARCHAR(20) NOT NULL,
    Odometer    DOUBLE PRECISION NOT NULL,

    --Foreign keys
    CarNum      VARCHAR(20) NOT NULL,
    FOREIGN KEY(CarNum) REFERENCES Car,

    PRIMARY KEY(MaintNum)
);

CREATE TABLE Reservation (
    --Simple attributes
    ResNum      INTEGER     NOT NULL,
    PickupDate  Date NOT NULL,
    PickupTime  Time NOT NULL,
    Duration    INTEGER NOT NULL,

    --Foreign keys
    CarNum      VARCHAR(20) NOT NULL,
    MemNum      INTEGER NOT NULL,
    LocNum      INTEGER NOT NULL,
    FOREIGN KEY(CarNum) REFERENCES Car,
    FOREIGN KEY(MemNum) REFERENCES Member,
    FOREIGN KEY(LocNum) REFERENCES Location,

    PRIMARY KEY(ResNum)
);

CREATE TABLE Charge (
    --Simple attributes
    ChargeNum   INTEGER     NOT NULL,
    Paydate     DATE NOT NULL,

    --Foreign keys
    FeeNum      INTEGER NOT NULL,
    ResNum      INTEGER NOT NULL,
    MemNum      INTEGER NOT NULL,

    FOREIGN KEY(FeeNum) REFERENCES Fee,
    FOREIGN KEY(ResNum) REFERENCES Reservation,
    FOREIGN KEY(MemNum) REFERENCES Member,

    PRIMARY KEY(ChargeNum)
);

-- create view departments_total_salary(dept_name, total_salary) as
-- select dept_name, sum (salary)
-- from instructor
-- group by dept_name;

