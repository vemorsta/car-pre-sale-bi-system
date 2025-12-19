-- =========================================
-- Fact Table: Purchase Requests
-- Grain: One row per purchase request per car per date
-- =========================================

-- -----------------------------------------
-- Fact: Purchase Requests
-- -----------------------------------------
CREATE TABLE Fact_PurchaseRequests (
    RecordID INT PRIMARY KEY,          -- Purchase Request ID
    CustomerID INT,                     -- FK to DimCustomer
    DealerID INT,                       -- FK to DimDealer
    CarID INT,                          -- FK to DimCar
    DateID INT,                         -- FK to DimDate
    DownPayment BIGINT,                 -- Prepayment amount
    Quantity INT                        -- Number of cars requested
);

-- -----------------------------------------
-- Load Fact
-- -----------------------------------------
INSERT INTO Fact_PurchaseRequests
SELECT
    RecordID,
    CustomerRef     AS CustomerID,
    DealerRef       AS DealerID,
    ProductRef      AS CarID,
    DateRef         AS DateID,
    DownPayment,
    Quantity
FROM Stg_PurchaseRequests;



ALTER TABLE Fact_PurchaseRequests
ADD CONSTRAINT FK_Fact_Customer FOREIGN KEY (CustomerID)
REFERENCES DimCustomer(CustomerID);
