# Star Schema Data Model

This document describes the analytical data model designed for the car pre-sale Business Intelligence system. The model follows a star schema approach to ensure clear business logic, efficient querying, and scalable analytical performance.

---

## Fact Table: Fact_PurchaseRequests

The central fact table represents car pre-sale purchase requests. Each record corresponds to a single purchase request submitted by a customer through a dealer for a specific vehicle on a given date.

**Grain**  
One row per car pre-sale purchase request.

**Measures**
- TotalAmount (Down Payment)
- Quantity

**Foreign Keys**
- CustomerID
- DealerID
- CarID
- DateID

---

## Dimension Tables

### DimCustomer
Stores descriptive customer attributes used for segmentation and behavioral analysis.

**Key Attributes**
- CustomerID
- FullName
- NationalCode
- PhoneNumber
- PostalCode
- City
- Province


---

### DimDealer
Represents authorized sales dealers and agencies involved in the pre-sale process.

**Key Attributes**
- DealerID
- DealerName
- City
- Province
- AgencyStatusName

---

### DimCar
Contains vehicle-related descriptive attributes for product-level analysis.

**Key Attributes**
- CarID
- CarCode
- CarName
- CarType
- FuelType
- Category
- ProductionYear

---

### DimDate
Provides a complete date dimension to support time-based analysis.

**Key Attributes**
- DateID
- FullDate
- Year
- Month
- Day

---

## Analytical Usage

The star schema enables multi-dimensional analysis of pre-sale performance across customers, dealers, vehicles, and time. The model is optimized for aggregation-heavy queries and supports consistent KPI calculation within Power BI.
