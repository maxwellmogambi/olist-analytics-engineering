import duckdb
import numpy
import pandas as pd
pd.set_option('display.max_columns', None)

conn = duckdb.connect("olist_dbt_project.db")

#print(conn.execute("SHOW TABLES").fetchall())
print(conn.execute("""
    SELECT *
    FROM raw.sellers
    LIMIT 5
""").fetchdf())


# print(
#     conn.execute(
#         """
#         DESCRIBE raw.orders
#         """
#     ).fetchdf()
# )

# print(
#     conn.execute(
#         """
#         SELECT *
#         FROM raw.orders
#         LIMIT 5
#         """
#     ).fetchdf()
# )


# print(
#     conn.execute(
#         """
#         SELECT order_id, COUNT(payment_sequential) as payment_count
#         FROM raw.payments
#         GROUP BY order_id
#         having payment_count > 1
#         """
#     ).fetchdf()
# )