-- Grain:
-- 1 row = 1 payment transaction within an order

with payments as (

    select *
    from {{ ref('stg_payments') }}

),

orders as (

    select *
    from {{ ref('stg_orders') }}

)

select

    -- Natural Key
    p.order_id,
    p.payment_sequential,

    -- Foreign Key
    o.customer_id,

    -- Payment Attributes
    p.payment_type,
    p.payment_installments,

    -- Order Attributes
    o.order_status,
    o.order_purchased_at,
    o.order_approved_at,
    o.order_delivered_carrier_date,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,

    -- Measure
    p.payment_value

from payments p

left join orders o
    on p.order_id = o.order_id