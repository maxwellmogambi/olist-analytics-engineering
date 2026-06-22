select
    count(*) as rows,
    count(distinct customer_id) as distinct_customers
from {{ ref('dim_customer_enriched') }}