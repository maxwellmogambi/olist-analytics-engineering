-- Grain:
-- 1 row = 1 product

with order_items as (

    select *
    from {{ ref('stg_order_items') }}

)

select
    product_id,

    count(*) as units_sold,

    count(distinct order_id) as order_count,

    sum(price) as total_revenue,

    avg(price) as avg_selling_price

from order_items

group by product_id