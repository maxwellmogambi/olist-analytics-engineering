# olist-analytics-engineering
Recommended Implementation Sequence

Phase 1 — Stabilization

1. Refactor marts into facts/ and dimensions/
2. Add model descriptions
3. Add column descriptions
4. Complete test coverage

Phase 2 — Customer Domain
5. int_customer_orders
6. dim_customers_enriched

Phase 3 — Product Domain
7. int_product_sales
8. dim_products
9. dim_products_enriched

Phase 4 — Seller Domain
10. int_seller_performance
11. dim_sellers
12. dim_sellers_enriched

Phase 5 — Fact Expansion
13. fct_order_items
14. fct_payments

Phase 6 — Reviews & Dates
15. int_customer_reviews
16. dim_dates

Phase 7 — Project Finalization
17. dbt docs generate
18. dbt docs serve
19. README
20. Architecture diagram
21. GitHub polish