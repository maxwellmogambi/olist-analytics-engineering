-- Grain:
-- 1 row = 1 seller

with order_items as (

    select *
    from {{ ref('stg_order_items') }}

)

select
    seller_id,

    count(*) as units_sold,

    count(distinct order_id) as order_count,

    count(distinct product_id) as product_count,

    sum(price) as total_revenue,

    sum(price) / count(distinct order_id) as avg_order_value

from order_items

group by seller_id