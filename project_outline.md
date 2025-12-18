# Project Outline

## Business Problem
- **Context** 
Car pre-sale operations involve handling high volumes of transactional data generated across multiple domains, including customers, dealers, vehicles, and payment records. These data are produced continuously through registration, down payment processing, allocation, and delivery stages, creating a complex and data-intensive operational environment.

- **Pain** 
In practice, this data is stored across separate operational systems without a unified analytical structure. Reporting is often performed manually using Excel files and ad-hoc queries, resulting in fragmented views, inconsistent metrics, and heavy dependency on human intervention. This approach leads to slow reporting cycles, increased risk of errors, and the absence of a reliable single source of truth.

- **Impact** 
As a result, management teams are unable to perform effective multi-dimensional analysis across time, geography, customer behavior, and product performance. Key business questions related to demand trends, dealer efficiency, and customer purchasing patterns remain difficult to answer, leading to delayed decisions and missed sales and optimization opportunities.

## Data Architecture
- **Data Sources**   
Pre-sale transactional data originating from operational systems, including customer registrations, vehicle information, dealer records, and down payment transactions. The raw data is provided as a SQL Server backup and represents unprocessed, production-level data with inconsistencies and duplicates.

- **Data Pipeline**  
The architecture follows a layered approach. Raw data is first restored into a dedicated raw database. A staging layer is then used to perform data cleaning, normalization, deduplication, and key generation using SQL and Power Query. Cleaned data is transformed into an analytical data mart designed using a star schema, consisting of fact and dimension tables optimized for analytical queries.

- **Consumption Layer**  
The analytical data mart is loaded into Power BI as a semantic model. DAX measures are defined to support key business metrics, and interactive dashboards are built to enable multi-dimensional analysis across time, customers, dealers, and vehicle models.

## Data Model (Star Schema)

The analytical data model is designed using a star schema to support efficient querying, clear business logic, and scalable analytics. The model separates measurable business events from descriptive attributes, enabling fast aggregation, consistent metrics, and intuitive analysis across multiple business dimensions.

- **Fact Table**  
  The central fact table represents car pre-sale purchase requests at the transaction level. Each record corresponds to a single pre-sale request and stores measurable metrics such as down payment amount and quantity. The fact table is linked to all dimension tables using surrogate keys and defines the analytical grain of the model.

- **Dimension Tables**  
  - **Customer Dimension**: Stores customer attributes such as geographic location and identification data, enabling customer behavior and regional analysis.  
  - **Dealer Dimension**: Represents sales dealers and agencies, supporting performance comparison across regions and sales networks.  
  - **Car Dimension**: Contains vehicle-related attributes including model, category, and specifications, enabling product-level demand analysis.  
  - **Date Dimension**: Provides a complete time hierarchy to support trend analysis across day, month, and year levels.

## ETL & Data Cleaning

- **Extraction**  
  Raw pre-sale data is restored from a SQL Server backup and loaded into a dedicated raw database. This layer preserves the original operational structure and serves as a stable source for downstream transformations without modifying source records.

- **Transformation**  
  A staging layer is used to clean and standardize the data using SQL and Power Query. This includes removing duplicate records, normalizing inconsistent textual values, correcting data types, handling missing fields, and generating surrogate keys for dimension tables. Business rules are applied to ensure consistent customer, dealer, and vehicle identifiers across datasets.

- **Load**  
  Cleaned and conformed data is loaded into an analytical data mart structured as a star schema. Fact and dimension tables are populated incrementally and prepared for direct consumption by Power BI, ensuring reliable metrics and consistent analytical behavior.

## Analytics & KPIs

- **Core Metrics**  
  The analytical layer focuses on a concise set of business-critical metrics derived from the fact table. These include total down payment amount, number of pre-sale requests, total unique customers, average down payment per request, and quantity sold. Each metric is defined using DAX to ensure consistency across all reports and filters.

- **Analytical Capabilities**  
  The KPIs are designed to support multi-dimensional analysis across time, geography, product, and dealer dimensions. This enables management to evaluate demand trends, compare dealer performance, analyze customer purchasing behavior, and assess product-level contribution to overall revenue.

## Dashboards & Insights

- **Executive Overview**  
  Provides a high-level view of overall pre-sale performance, including total down payment, request volume, and customer count. This dashboard enables quick assessment of business health and trend monitoring over time.

- **Dealer & Regional Analysis**  
  Focuses on dealer performance and geographic distribution of sales. It enables comparison across dealers and regions, identification of high-performing agencies, and detection of regional demand patterns.

- **Customer & Product Analysis**  
  Analyzes customer behavior and vehicle demand by segment, model, and time. This view supports understanding repeat purchases, product contribution to revenue, and shifts in customer preferences.

## Key Outcomes

- Established a unified analytical view of car pre-sale data across customers, dealers, vehicles, and time.
- Reduced manual reporting dependency by enabling automated, consistent KPI calculation.
- Enabled faster and more reliable decision-making through interactive, multi-dimensional dashboards.

