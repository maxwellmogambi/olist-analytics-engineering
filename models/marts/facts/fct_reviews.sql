-- Grain:
-- 1 row = 1 review record associated with an order

with reviews as (

    select *
    from {{ ref('stg_reviews') }}

),

orders as (

    select *
    from {{ ref('stg_orders') }}

)

select

    -- Natural Key
    r.review_id,
    r.order_id,

    -- Foreign Key
    o.customer_id,

    -- Review Attributes
    r.review_score,
    r.review_comment_title,
    r.review_comment_message,
    r.review_creation_date,
    r.review_answer_timestamp,

    -- Order Context
    o.order_status,
    o.order_purchased_at,
    o.order_approved_at,
    o.order_delivered_carrier_date,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date

from reviews r

left join orders o
    on r.order_id = o.order_id