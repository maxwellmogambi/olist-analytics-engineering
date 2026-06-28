select distinct
    p.product_category_name
from {{ ref('stg_products') }} p

left join {{ ref('stg_product_category_translation') }} t
    on p.product_category_name = t.product_category_name

where t.product_category_name is null
order by 1