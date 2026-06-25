-- Grain:
-- 1 row = 1 customer

with orders as (

    select *
    from {{ ref('int_orders_enriched') }}

)

select
    customer_id,

    count(distinct order_id) as total_orders,

    sum(total_payment_value) as lifetime_revenue,

    min(order_purchased_at) as first_order_at,

    max(order_purchased_at) as latest_order_at

from orders

group by customer_id