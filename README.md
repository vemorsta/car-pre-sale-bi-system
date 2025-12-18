# Car Pre-Sale Business Intelligence System

## Project Overview
This repository demonstrates the design and implementation of an end-to-end Business Intelligence (BI) system for analyzing car pre-sale operations. The project focuses on transforming raw transactional data into a structured analytical model and delivering actionable insights through interactive dashboards.

## Business Context
Car pre-sale processes generate large volumes of transactional data across customers, dealers, vehicles, and payment activities. In many organizations, this data remains fragmented across operational systems, making reliable reporting and analytical decision-making difficult and time-consuming.

## Solution Architecture
The system is designed using a layered BI architecture, starting from raw operational data and progressing through data cleaning, transformation, and analytical modeling stages. A star schema data model is implemented to support efficient querying and consistent KPI definitions, with Power BI serving as the analytical and visualization layer.

## Key Components
- Layered data architecture (Raw → Staging → Data Mart → Power BI)
- Star schema data model with fact and dimension tables
- SQL- and Power Query–based data cleaning and transformation
- DAX measures for core business KPIs
- Interactive dashboards for multi-dimensional analysis

## Tools & Technologies
- SQL Server
- Power BI Desktop
- Power Query (M)
- DAX

## Repository Structure
- `project_outline.md` — High-level system design and analytical logic  
- `docs/` — Technical documentation and data model descriptions  
- `sql/` — Data preparation and transformation scripts  
- `powerbi/` — DAX measures and dashboard logic  
- `images/` — Data model and dashboard visuals

## Key Outcomes
- Unified analytical view of car pre-sale data
- Reduced manual reporting effort
- Faster and more reliable decision-making through structured analytics
