# Data Model

The analytical data model is built using a **Star Schema** design to ensure
simplicity, performance, and analytical flexibility.

---

## Fact Table

### Fact_PurchaseRequests

**Grain**  
One row per purchase request (RecordID).

**Measures**
- DownPayment
- Quantity

**Foreign Keys**
- CustomerID → DimCustomer
- DealerID → DimDealer
- CarID → DimCar
- DateID → DimDate

---

## Dimension Tables

### DimCustomer
Contains customer demographic and geographic information:
- CustomerID
- FirstName
- LastName
- NationalCode
- City
- Province
- PostalCode
- MobileNumber

---

### DimDealer
Contains dealer reference information:
- DealerID
- DealerName
- Province
- City
- AgencyStatusName

---

### DimCar
Contains car product attributes:
- CarID
- CarCode
- CarName
- FuelType
- Category
- ProductionYear

---

### DimDate
Standard calendar dimension:
- DateID
- FullDate
- Year
- Month
- Day

---

## Modeling Notes
- Single-direction relationships were used
- No calculated columns were introduced in the semantic model
- All analytical logic is implemented using DAX measures
