-- Grain:
-- 1 row = 1 product

with products as (

    select *
    from {{ ref('stg_products') }}

),

categories as (

    select *
    from {{ ref('int_product_categories') }}

)

select
    p.product_id,

    coalesce(p.product_category_name, 'Unknown') as product_category_name,

    coalesce(
        c.product_category_name_english,
        'Unknown'
    ) as product_category_name_english,

    p.product_name_lenght,
    p.product_description_lenght,
    p.product_photos_qty,
    p.product_weight_g,
    p.product_length_cm,
    p.product_height_cm,
    p.product_width_cm

from products p

left join categories c
    on p.product_category_name = c.product_category_name