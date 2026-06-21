select
    count(*) as rows,
    count(distinct order_id) as distinct_orders
from {{ ref('int_orders_enriched') }}