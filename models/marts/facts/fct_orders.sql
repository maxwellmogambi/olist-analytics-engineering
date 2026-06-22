select
    order_id,
    customer_id,
    order_status,

    order_purchased_at,
    order_approved_at,
    order_delivered_customer_date,

    payment_count,
    total_payment_value,
    max_installments

from {{ ref('int_orders_enriched') }}