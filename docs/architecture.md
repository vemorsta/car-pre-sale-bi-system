# System Architecture

This project implements an end-to-end Business Intelligence architecture
for analyzing car pre-sale transactions using SQL Server and Power BI.

The architecture is designed to support analytical reporting, drill-through
analysis, and decision-making at multiple business levels.

---

## Architecture Layers

### 1. Source Systems
Operational source data extracted from transactional systems containing:
- Customers
- Dealers
- Products (Cars)
- Purchase Requests
- Calendar data

---

### 2. Staging Layer (SQL Server)
A staging layer was implemented to:
- Extract raw data from source systems
- Align schemas and data types
- Perform initial data cleansing
- Preserve raw data for traceability

---

### 3. Data Mart Layer (SQL Server)
A dimensional data mart was designed using a **Star Schema** approach:
- One central fact table
- Multiple descriptive dimension tables
- Optimized for analytical queries and aggregations

---

### 4. Semantic Layer (Power BI)
Power BI was used to:
- Define relationships between fact and dimensions
- Implement DAX measures
- Apply advanced data cleansing via Power Query
- Enable drill-through and interactive analytics

---

### 5. Presentation Layer (Dashboards)
Interactive dashboards provide:
- Executive-level KPIs
- Dealer and customer performance analysis
- Product and time-based insights
- Drill-through navigation for detailed analysis

---

## Design Principles
- Separation of concerns across layers
- Star schema modeling for performance and simplicity
- Measure-driven analytics
- Scalability and maintainability
