-- Grain:
-- 1 row = 1 product category

with category_translation as (

    select *
    from {{ ref('stg_product_category_translation') }}

)

select
    product_category_name,
    product_category_name_english
from category_translation