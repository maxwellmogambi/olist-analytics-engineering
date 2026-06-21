with orders as (

    select *
    from {{ ref('stg_orders') }}

),

payments as (

    select *
    from {{ ref('int_order_payments') }}

)

select
    o.order_id,
    o.customer_id,
    o.order_status,

    o.order_purchased_at,
    o.order_approved_at,
    o.order_delivered_customer_date,

    p.payment_count,
    p.total_payment_value,
    p.max_installments

from orders o

left join payments p
    on o.order_id = p.order_id