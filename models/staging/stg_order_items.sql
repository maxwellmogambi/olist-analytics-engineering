with source as (
    select *
    from {{ source('raw', 'order_items') }}
)

select 
    order_id,
    order_item_id,
    product_id,
    seller_id,
    shipping_limit_date as shipping_deadline_at,
    price,
    freight_value

from source