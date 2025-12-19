-- =========================================
-- Staging Layer
-- Purpose: Extract and standardize raw pre-sale data
-- Some advanced transformations were completed in Power Query
-- =========================================
-- Customer staging
SELECT
    ID AS CustomerID,
    FirstName,
    LastName,
    NationalCode,
    ResidenceCityName     AS City,
    ResidenceProvinceName AS Province,
    PostalCode,
    MobileNumber
INTO Stg_Customers
FROM Source_Customers;


-- Product (Car) staging
SELECT
    ID AS CarID,
    BKProductId AS CarCode,
    ProductFamily AS CarName,
    FuelType,
    ProductType AS Category,
    ProductionDate
INTO Stg_Products
FROM Source_Products;


-- Dealer staging
SELECT
    DealerID,
    DealerName,
    Province,
    City,
    AgencyStatusName
INTO Stg_Dealers
FROM Source_Dealers;


-- Purchase request staging
SELECT
    RecordID        AS PurchaseRequestID,
    DealerRef       AS DealerID,
    CustomerRef     AS CustomerID,
    ProductRef      AS CarID,
    DateRef         AS DateID,
    Downpayment     AS DownPayment,
    Quantity
INTO Stg_PurchaseRequests
FROM Source_PurchaseRequests;


-- Date reference
SELECT
    GregorianDateKey AS DateID,
    GregorianDate
INTO Stg_Dates
FROM Source_Dates;


-- Note:
-- Table and column names are simplified for documentation purposes.
-- This script represents the logical staging layer of the project.
