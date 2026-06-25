select
    sum(total_revenue) as product_revenue
from {{ ref('int_product_sales') }}