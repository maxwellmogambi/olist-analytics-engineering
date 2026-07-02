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

## Architecture

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