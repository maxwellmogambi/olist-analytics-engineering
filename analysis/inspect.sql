select
    sum(price) as product_revenue
from {{ ref('stg_order_items') }}