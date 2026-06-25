-- Grain:
-- 1 row = 1 customer

with customers as (

    select *
    from {{ ref('dim_customers') }}

),

customer_metrics as (

    select *
    from {{ ref('int_customer_orders') }}

)

select
    c.customer_id,
    c.customer_unique_id,
    c.customer_city,
    c.customer_state,
    c.customer_zip_code_prefix,

    m.total_orders,
    m.lifetime_revenue,
    m.first_order_at,
    m.latest_order_at

from customers c

left join customer_metrics m
    on c.customer_id = m.customer_id