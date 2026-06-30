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
