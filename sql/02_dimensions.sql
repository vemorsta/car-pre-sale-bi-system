-- =========================================
-- Dimension Layer
-- Purpose: Create analytical dimensions for reporting
-- Modeling approach: Star Schema using natural keys
-- =========================================
-- -----------------------------------------
-- Dimension: Customer
-- -----------------------------------------
CREATE TABLE DimCustomer (
    CustomerID INT PRIMARY KEY,
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    NationalCode NVARCHAR(20),
    City NVARCHAR(50),
    Province NVARCHAR(50),
    PostalCode NVARCHAR(20),
    MobileNumber NVARCHAR(20)
);

INSERT INTO DimCustomer
SELECT
    CustomerID,
    FirstName,
    LastName,
    NationalCode,
    City,
    Province,
    PostalCode,
    MobileNumber
FROM Stg_Customers;


-- -----------------------------------------
-- Dimension: Car
-- -----------------------------------------
CREATE TABLE DimCar (
    CarID INT PRIMARY KEY,
    CarCode NVARCHAR(50),
    CarName NVARCHAR(100),
    FuelType NVARCHAR(50),
    Category NVARCHAR(50),
    ProductionYear INT
);

INSERT INTO DimCar
SELECT
    CarID,
    CarCode,
    CarName,
    FuelType,
    Category,
    YEAR(ProductionDate)
FROM Stg_Products;


-- -----------------------------------------
-- Dimension: Dealer
-- -----------------------------------------
CREATE TABLE DimDealer (
    DealerID INT PRIMARY KEY,
    DealerName NVARCHAR(100),
    Province NVARCHAR(50),
    City NVARCHAR(50),
    AgencyStatus NVARCHAR(50)
);

-- Loaded from dealer reference data


-- -----------------------------------------
-- Dimension: Date
-- -----------------------------------------
CREATE TABLE DimDate (
    DateID INT PRIMARY KEY,
    FullDate DATE,
    [Year] INT,
    [Month] INT,
    [Day] INT
);

INSERT INTO DimDate
SELECT
    DateID,
    FullDate,
    YEAR(FullDate),
    MONTH(FullDate),
    DAY(FullDate)
FROM Stg_Dates;


