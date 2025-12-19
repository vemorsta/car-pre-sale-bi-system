# DAX Measures Documentation

This document describes the core DAX measures used in the **Car Pre-Sales BI System**.
The project is built on a SQL Server star schema data model and analyzed using Power BI.

All measures listed below are actively used in dashboards and KPIs. No sample or
placeholder logic is included.

---

## Sum of DownPayment

```DAX
Sum of DownPayment =
SUMX (
    'Fact_PurchaseRequests',
    VALUE ( TRIM ( 'Fact_PurchaseRequests'[DownPayment] ) )
)
Description
Calculates the total amount of down payments collected from customers.

Business Usage

Primary financial KPI

Revenue-oriented performance evaluation

Base measure for derived metrics

Used In

Overview Page (KPI Card)

Dealer Performance Analysis

Monthly Trend Analysis

Total Requests

DAX

Total Requests =
COUNT ( 'Fact_PurchaseRequests'[RecordID] )
Description
Counts the total number of purchase requests recorded in the system.

Business Usage

Demand volume analysis

Operational workload monitoring

Dealer activity comparison

Used In

Overview Page

Dealer Analysis Page

Total Customers

DAX

Total Customers =
DISTINCTCOUNT ( 'Fact_PurchaseRequests'[CustomerRef] )
Description
Calculates the number of unique customers while avoiding duplicate counts.

Business Usage

Customer base analysis

Accurate buyer identification

Prevention of inflated metrics

Used In

Overview Page

Customer Analysis Page

Sum of Quantity

DAX

Sum of Quantity =
SUMX (
    'Fact_PurchaseRequests',
    VALUE ( TRIM ( 'Fact_PurchaseRequests'[Quantity] ) )
)
Description
Calculates the total number of vehicles requested.

Business Usage

Product demand evaluation

Vehicle volume tracking

Input for average-based KPIs

Used In

Overview Page

Product Analysis Visuals

Average DownPayment per Car

DAX

Avg DownPayment per Car =
DIVIDE (
    [Sum of DownPayment],
    [Sum of Quantity],
    0
)
Description
Calculates the average down payment per vehicle.

Business Usage

Pricing behavior analysis

Identification of high-value car models

Market segmentation insights

Used In

Overview Page

Car Model Comparison

Average DownPayment per Request

DAX

Avg DownPayment per Request =
DIVIDE (
    [Sum of DownPayment],
    [Total Requests],
    0
)
Description
Calculates the average down payment per purchase request.

Business Usage

Customer payment behavior analysis

Financial profiling of buyers

Trend monitoring

Used In

Overview Page

Dealer Detail Page

Car DownPayment Share %

DAX
Car DownPayment Share % =
DIVIDE (
    [Sum of DownPayment],
    CALCULATE (
        [Sum of DownPayment],
        ALL ( 'DimCar' )
    ),
    0
)
Description
Calculates each car model’s contribution to the total down payment amount.

Business Usage

Market share analysis

Identification of top-performing products

Strategic product planning

Used In

Overview Page (Donut Chart)

Product Share Analysis

Notes
All measures are built on the Fact_PurchaseRequests table.

Data cleansing is performed in both SQL Server and Power Query.

Measures support multi-dimensional analysis across:

Time

Dealer

Customer

Car Model

Geography
