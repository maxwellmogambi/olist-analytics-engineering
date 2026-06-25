-- Grain:
--1 row = 1 seller

with sellers as (

    select *
    from {{ ref('dim_sellers') }}
),

performance as (

    select *
    from {{ ref('int_seller_performance') }}

)

select
    s.seller_id,
    s.seller_zip_code_prefix,
    s.seller_city,
    s.seller_state,

    p.units_sold,
    p.order_count,
    p.product_count,
    p.total_revenue,
    p.avg_order_value

from sellers s

left join performance p
    on s.seller_id = p.seller_id


    