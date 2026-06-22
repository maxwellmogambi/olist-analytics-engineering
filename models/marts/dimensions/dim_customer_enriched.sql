with customers as (

    select *
    from {{ ref('dim_customers') }}

),

customer_metrics as (

    select *
    from {{ ref('int_customer_orders') }}

)

select
    c.*,

    m.total_orders,
    m.lifetime_revenue,
    m.first_order_at,
    m.latest_order_at

from customers c

left join customer_metrics m
    on c.customer_id = m.customer_id