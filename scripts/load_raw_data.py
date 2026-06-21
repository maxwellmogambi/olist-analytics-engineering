import duckdb

conn = duckdb.connect("olist_dbt_project.db")

conn.execute("CREATE SCHEMA IF NOT EXISTS raw")

conn.execute("""
CREATE OR REPLACE TABLE raw.customers AS
SELECT *
FROM read_csv_auto('data/olist_customers_dataset.csv')
""")

conn.execute("""
CREATE OR REPLACE TABLE raw.orders AS
SELECT *
FROM read_csv_auto('data/olist_orders_dataset.csv')
""")

conn.execute("""
CREATE OR REPLACE TABLE raw.order_items AS
SELECT *
FROM read_csv_auto('data/olist_order_items_dataset.csv')
""")

conn.execute("""
CREATE OR REPLACE TABLE raw.payments AS
SELECT *
FROM read_csv_auto('data/olist_order_payments_dataset.csv')
""")

conn.execute("""
CREATE OR REPLACE TABLE raw.geolocation AS
SELECT *
FROM read_csv_auto('data/olist_geolocation_dataset.csv')
""")

conn.execute("""
             CREATE OR REPLACE TABLE raw.reviews AS
             SELECT *
             from read_csv_auto('data/olist_order_reviews_dataset.csv')
             """)

conn.execute("""
             CREATE OR REPLACE TABLE raw.product_translations AS
             SELECT *
             FROM read_csv_auto('data/product_category_name_translation.csv')
             """)

conn.execute("""
                CREATE OR REPLACE TABLE raw.products AS
                SELECT *
                FROM read_csv_auto('data/olist_products_dataset.csv')
                """)

conn.execute("""
                CREATE OR REPLACE TABLE raw.sellers AS
                SELECT *
                FROM read_csv_auto('data/olist_sellers_dataset.csv')
                """)

print("Loaded successfully")