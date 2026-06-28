-- Grain:
-- 1 row = 1 order item

with order_items as (

    select *
    from {{ ref('stg_order_items') }}

),

orders as (

    select *
    from {{ ref('stg_orders') }}

)

select
    -- Natural Key
    oi.order_id,
    oi.order_item_id,

    -- Foreign Keys
    o.customer_id,
    oi.product_id,
    oi.seller_id,

    -- Order Attributes
    o.order_status,
    o.order_purchased_at,
    o.order_approved_at,
    o.order_delivered_carrier_date,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,

    -- Item Attributes
    oi.shipping_deadline_at,

    -- Measures
    oi.price,
    oi.freight_value

from order_items oi

left join orders o
    on oi.order_id = o.order_id