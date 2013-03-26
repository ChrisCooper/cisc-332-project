-- CISC 332 Project Part 1
-- Chris Cooper (8cic) 06016705
-- Rachel Hisey (9rlh) 06226892


-- Drop existing tables

drop table Member CASCADE;
drop table Charge CASCADE;
drop table Payment CASCADE;
drop table Fee CASCADE;
drop table Location CASCADE;
drop table Reservation CASCADE;
drop table Car CASCADE;
drop table Maintenance CASCADE;
drop table Transaction CASCADE;


-- Create new tables

CREATE TABLE Member (
    --Simple attributes
    MemNum              SERIAL     NOT NULL,
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

CREATE TABLE Payment (
    --Simple attributes
    PaymentNum  SERIAL     NOT NULL,
    Amount      MONEY NOT NULL,
    Paydate     DATE NOT NULL,

    --Foreign keys
    MemNum      INTEGER NOT NULL,
    FOREIGN KEY(MemNum) REFERENCES Member,

    PRIMARY KEY(PaymentNum)
);

CREATE TABLE Fee (
    --Simple attributes
    FeeNum          SERIAL     NOT NULL,
    FeeRate         MONEY NOT NULL,
    FeeDescription  VARCHAR(50),

    PRIMARY KEY(FeeNum)
);

CREATE TABLE Location (
    --Simple attributes
    LocNum      SERIAL     NOT NULL,
    Address     VARCHAR(100) NOT NULL,
    NumSpaces   INTEGER     NOT NULL,
    --Number of cars is calculated

    PRIMARY KEY(LocNum)
);

CREATE TABLE Car (
    --Simple attributes
    CarNum          SERIAL NOT NULL,
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
    MaintNum    SERIAL     NOT NULL,
    CheckupDate DATE NOT NULL,
    Odometer    DOUBLE PRECISION NOT NULL,

    --Foreign keys
    CarNum      INTEGER NOT NULL,
    FOREIGN KEY(CarNum) REFERENCES Car,

    PRIMARY KEY(MaintNum)
);

CREATE TABLE Reservation (
    --Simple attributes
    ResNum      SERIAL     NOT NULL,
    PickupDate  Date NOT NULL,
    PickupTime  Time NOT NULL,
    Duration    INTEGER NOT NULL,

    --Foreign keys
    CarNum      INTEGER NOT NULL,
    MemNum      INTEGER NOT NULL,
    LocNum      INTEGER NOT NULL,
    FOREIGN KEY(CarNum) REFERENCES Car,
    FOREIGN KEY(MemNum) REFERENCES Member,
    FOREIGN KEY(LocNum) REFERENCES Location,

    PRIMARY KEY(ResNum)
);

CREATE TABLE Charge (
    --Simple attributes
    ChargeNum   SERIAL     NOT NULL,
    ChargeDate     DATE NOT NULL,

    --Foreign keys
    FeeNum      INTEGER NOT NULL,
    ResNum      INTEGER,
    MemNum      INTEGER NOT NULL,

    FOREIGN KEY(FeeNum) REFERENCES Fee,
    FOREIGN KEY(ResNum) REFERENCES Reservation,
    FOREIGN KEY(MemNum) REFERENCES Member,

    PRIMARY KEY(ChargeNum)
);

CREATE TABLE Transaction (
    --Simple attributes
    TransNum        SERIAL     NOT NULL,
    TransDate       DATE NOT NULL,
    Description     VARCHAR(100) NOT NULL,
    Amount          MONEY NOT NULL,

    --Foreign keys
    MemNum          INTEGER NOT NULL,

    FOREIGN KEY(MemNum) REFERENCES Member,

    PRIMARY KEY(TransNum)
);
