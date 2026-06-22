with source as (
    select *
    from {{ source('raw', 'product_translations') }}
)

select 
    product_category_name,
    product_category_name_english
from source