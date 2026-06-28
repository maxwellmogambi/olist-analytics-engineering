select
    count(*) as rows,
    count(distinct product_id) as distinct_products
from {{ ref('dim_products') }}