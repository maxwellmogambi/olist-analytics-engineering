# Olist Analytics Engineering Project with dbt

## Project Overview

This repository contains an end-to-end analytics engineering project built using **dbt (Data Build Tool)** and **DuckDB**, using the publicly available Olist Brazilian e-commerce dataset.

The objective of this project was not simply to transform raw data into analytical tables, but to demonstrate the complete analytics engineering workflow involved in designing a modern data warehouse. The implementation emphasizes dimensional modeling, modular SQL transformations, data quality testing, documentation, and maintainable data lineage.

Rather than treating dbt as a SQL execution tool, this project adopts the principles commonly used in production analytics engineering teams:

* Layered data transformations
* Explicit model grain definitions
* Reusable intermediate models
* Conformed dimensions
* Transactional fact tables
* Automated data quality testing
* Comprehensive model documentation
* Clear and maintainable data lineage

Throughout the project, each transformation was designed around a single guiding principle:

> **Profile the data first, define the grain second, and only then write the SQL.**

This approach ensures that every model is built on validated assumptions instead of inferred relationships.

The resulting warehouse provides a clean analytical representation of the Olist marketplace, covering the complete customer purchasing lifecycle—from customer registration and order placement to payments, products, sellers, and customer reviews.

Although the Olist dataset is static, the project follows engineering practices that are directly transferable to production analytics environments and demonstrates how dbt can be used to build reliable, well-documented, and testable analytical data models.

---

## Business Context

Olist is a Brazilian e-commerce marketplace that connects customers with thousands of independent sellers across Brazil.

The dataset captures several core business domains, including:

* Customers
* Orders
* Order Items
* Products
* Sellers
* Payments
* Customer Reviews

These domains originate from independent source tables and contain varying levels of data quality, duplication, and normalization. Before they can support business intelligence and reporting, they require careful modeling into a coherent analytical warehouse.

The primary business objective of this project is to transform these operational datasets into a dimensional model that enables reliable analysis of:

* Customer purchasing behavior
* Product performance
* Seller performance
* Revenue generation
* Payment patterns
* Customer satisfaction
* Order lifecycle performance

Instead of creating direct SQL reports from raw data, this project builds reusable analytical assets that can serve as a trusted foundation for dashboards, ad hoc analysis, and downstream business intelligence tools.

---

## Project Objectives

The project was designed around the following engineering objectives:

* Build a layered dbt project using staging, intermediate, and mart models.
* Apply dimensional modeling principles to create conformed dimensions and transactional fact tables.
* Preserve explicit model grain throughout every transformation.
* Validate assumptions through data profiling before implementing transformations.
* Implement automated data quality tests using dbt.
* Document models and columns to produce self-explanatory project documentation.
* Maintain clean and traceable data lineage through appropriate model dependencies.
* Produce a repository that demonstrates analytics engineering best practices rather than simply SQL proficiency.

Ultimately, the goal of this project is to demonstrate a practical understanding of modern analytics engineering using dbt—from raw source ingestion to a fully documented analytical warehouse.


---

# Warehouse Architecture

## Architectural Approach

The warehouse follows a layered transformation architecture based on dbt best practices. Each layer has a single responsibility, allowing transformations to remain modular, reusable, and easy to maintain.

Rather than transforming raw data directly into reporting tables, data progresses through successive refinement stages:

```text
Raw Data
    │
    ▼
Sources
    │
    ▼
Staging Models
    │
    ▼
Intermediate Models
    │
    ▼
Mart Layer
    ├── Dimension Tables
    └── Fact Tables
```

Each layer builds upon the previous one without bypassing the architecture, resulting in predictable data lineage and clear separation of responsibilities.

---

## Transformation Layers

### Source Layer

The Source layer represents the raw Olist datasets loaded into DuckDB.

No business logic is applied at this stage. Source definitions establish the connection between dbt and the underlying tables while enabling lineage tracking and source-level testing.

Responsibilities:

* Register raw datasets
* Preserve original source structure
* Serve as the authoritative entry point into the transformation pipeline

---

### Staging Layer

The staging layer standardizes each raw dataset into a clean, consistent representation.

Transformations in this layer intentionally remain lightweight and avoid business logic.

Typical staging transformations include:

* Renaming columns
* Casting data types
* Removing unnecessary columns
* Standardizing naming conventions
* Preserving the original grain

Each staging model corresponds to a single source table, making this layer easy to understand and maintain.

---

### Intermediate Layer

Intermediate models encapsulate reusable business logic.

Rather than embedding calculations directly into fact or dimension models, common transformations are centralized here so they can be reused across multiple downstream models.

Examples include:

* Order payment aggregation
* Product sales metrics
* Seller performance metrics
* Customer purchasing metrics
* Product category translation

This separation minimizes duplicated SQL while improving maintainability and consistency.

---

### Mart Layer

The mart layer contains the analytical warehouse presented to downstream consumers.

It is organized into two categories:

#### Dimension Tables

Dimensions describe business entities.

Current dimensions include:

* Customers
* Products
* Sellers

Dimension models provide descriptive attributes that support filtering, grouping, and slicing analytical queries.

---

#### Fact Tables

Facts capture measurable business events.

Current fact tables include:

* Orders
* Order Items
* Payments
* Reviews

Each fact table has a clearly documented grain and references conformed dimensions to provide analytical context while preserving transactional detail.

---

## Data Lineage

A key design objective throughout the project was maintaining clean and predictable lineage.

Every transformation references the most authoritative upstream model available.

Examples include:

* Fact tables depend on staging models and reusable intermediate models.
* Intermediate models never depend on mart models.
* Dimensions are built independently of facts whenever possible.
* Shared business logic is implemented once and reused downstream.

This approach keeps the Directed Acyclic Graph (DAG) easy to understand while avoiding circular dependencies and duplicated transformation logic.

---

## Modeling Principles

Several engineering principles guided every model developed throughout the project.

### Define the grain before writing SQL

Each model explicitly documents its grain before implementation.

This ensures joins preserve row-level integrity and prevents accidental duplication of business events.

---

### Profile data before modeling

Source data was profiled before designing transformations.

Examples include validating:

* Primary keys
* Composite keys
* Duplicate records
* Cardinality
* Relationship integrity

Modeling decisions were driven by observed data characteristics rather than assumptions.

---

### Reuse transformations

Business logic is implemented once within intermediate models and reused throughout the warehouse.

This reduces maintenance effort while ensuring analytical consistency across downstream models.

---

### Preserve authoritative lineage

Each model references the most appropriate upstream source.

The warehouse intentionally avoids reverse dependencies, such as intermediate models depending on marts, ensuring every transformation layer remains reusable and logically independent.
