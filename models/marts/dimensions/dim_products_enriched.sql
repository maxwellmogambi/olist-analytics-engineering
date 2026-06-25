-- Grain:
-- 1 row = 1 product

with products as (

    select *
    from {{ ref('dim_products') }}

),

sales as (

    select *
    from {{ ref('int_product_sales') }}

)

select
    p.product_id,
    p.product_category_name,
    p.product_name_lenght,
    p.product_description_lenght,
    p.product_photos_qty,
    p.product_weight_g,
    p.product_length_cm,
    p.product_height_cm,
    p.product_width_cm,

    s.units_sold,
    s.order_count,
    s.total_revenue,
    s.avg_selling_price

from products p

left join sales s
    on p.product_id = s.product_id