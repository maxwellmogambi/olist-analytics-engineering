# Olist Analytics Engineering Project with dbt

An end-to-end analytics engineering project built with **dbt Core** and **DuckDB** using the public **Olist Brazilian E-commerce** dataset.

This project demonstrates how to design and build a modern analytical warehouse using analytics engineering best practices. Rather than focusing solely on SQL transformations, it emphasizes dimensional modeling, layered architecture, reusable transformations, automated testing, documentation, and maintainable data lineage.

The resulting warehouse transforms operational e-commerce data into a clean, well-documented analytical model suitable for reporting, ad hoc analysis, and downstream business intelligence.

---

## Why This Project?

Operational datasets are rarely analysis-ready. They often contain inconsistent naming, duplication, and relationships that require careful validation before meaningful analysis is possible.

This project demonstrates a practical analytics engineering workflow that:

- Profiles source data before modeling
- Applies dimensional modeling principles
- Builds layered transformations using dbt
- Preserves explicit model grain throughout the warehouse
- Validates assumptions using automated tests
- Generates documentation and lineage directly from the project

Although the dataset is static, the engineering practices used here are directly applicable to production analytics environments.

---

## Features

- Layered dbt architecture (Sources → Staging → Intermediate → Marts)
- Dimensional warehouse with fact and dimension models
- Modular, reusable SQL transformations
- Automated data quality testing using dbt and `dbt_utils`
- Generated documentation and lineage
- Local analytical warehouse powered by DuckDB
- Repository structured using analytics engineering best practices

---

# Architecture

The warehouse follows a layered transformation architecture where each layer has a single responsibility.

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


This design ensures:

Clear separation of responsibilities
Reusable transformations
Predictable lineage
Maintainable DAG structure

📖 Detailed explanation: docs/architecture.md


---

# 5. Data Model (ERD + Summary)

```markdown
# Data Model

The warehouse follows a star schema design centered on the customer purchasing lifecycle.

```mermaid
erDiagram

CUSTOMERS ||--o{ ORDERS : places

ORDERS ||--o{ ORDER_ITEMS : contains

PRODUCTS ||--o{ ORDER_ITEMS : purchased

SELLERS ||--o{ ORDER_ITEMS : fulfills

ORDERS ||--o{ PAYMENTS : paid_by

ORDERS ||--o{ REVIEWS : reviewed_after


| Type             | Models                                                         |
| ---------------- | -------------------------------------------------------------- |
| Fact Tables      | `fct_orders`, `fct_order_items`, `fct_payments`, `fct_reviews` |
| Dimension Tables | `dim_customers`, `dim_products`, `dim_sellers`                 |


This model supports analysis of:

Customer purchasing behavior
Product and seller performance
Revenue and payment patterns
Customer satisfaction trends

📖 Detailed model definitions: docs/data-model.md

---


---

# 6. Repository Structure

```markdown
# Repository Structure

```text
.
├── analyses/              # Exploratory SQL and validation queries
├── docs/                  # Project documentation
├── macros/                # Reusable dbt macros
├── models/
│   ├── staging/
│   ├── intermediate/
│   └── marts/
│       ├── dimensions/
│       └── facts/
├── seeds/
├── snapshots/
├── tests/
├── dbt_project.yml
├── packages.yml
└── profiles.yml



---

# 7. Technology Stack

```markdown
# Technology Stack

| Technology | Purpose |
|------------|---------|
| dbt Core | Data transformation, testing, and documentation |
| DuckDB | Local analytical data warehouse |
| SQL | Data modeling and transformation |
| dbt-utils | Utility macros and composite key testing |
| Git & GitHub | Version control and collaboration |


---

# Getting Started

## Prerequisites

- Python 3.11+
- dbt Core
- DuckDB
- Git

## Setup

Clone the repository:

```bash
git clone https://github.com/maxwellmogambi/olist-analytics-engineering.git
cd olist-analytics-engineering

Install dependencies:

dbt deps

Verify setup:

dbt debug

Build the project:

dbt build

Generate and serve documentation:

dbt docs generate
dbt docs serve
Output

After running the project:

Local DuckDB analytical warehouse
Fully tested dbt models
Generated documentation and lineage graph


---

# 9. Documentation Index

```markdown
# Documentation

Detailed implementation documentation is available in the `docs/` directory.

| Document | Description |
|----------|-------------|
| `docs/architecture.md` | Layered architecture and lineage |
| `docs/data-model.md` | Star schema and model definitions |
| `docs/transformations.md` | Staging, intermediate, and marts |
| `docs/testing.md` | Data quality and dbt testing strategy |
| `docs/profiling.md` | Source data profiling and assumptions |
| `docs/engineering-decisions.md` | Design decisions and trade-offs |
| `docs/development.md` | Local development workflow |


---

# Engineering Highlights

This project emphasizes analytics engineering best practices:

- Grain-first modeling to preserve data integrity
- Data profiling before transformation design
- Layered architecture for maintainability
- Reusable intermediate models to reduce duplication
- Automated testing using dbt
- Documentation-driven development

These practices ensure reliable, maintainable, and transparent analytical outputs.

---

# Roadmap

Future improvements:

- Model contracts for schema enforcement
- Incremental materializations for large fact tables
- Source freshness monitoring
- CI/CD pipelines for automated testing
- dbt Semantic Layer metrics
- Example dashboards and BI exposures
- Addition of a conformed date dimension

---

# Dataset

This project uses the publicly available **Olist Brazilian E-commerce Dataset**, containing real-world marketplace data including customers, orders, products, sellers, payments, and reviews.

---

# Acknowledgements

This project was created as a portfolio demonstration of modern analytics engineering practices using dbt and DuckDB.

The focus is not only on producing analytical tables, but on demonstrating how production-grade analytical systems are designed, tested, and documented.