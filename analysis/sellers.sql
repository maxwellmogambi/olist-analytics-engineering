select
    sum(total_revenue) as enriched_revenue
from {{ ref('dim_sellers_enriched') }}