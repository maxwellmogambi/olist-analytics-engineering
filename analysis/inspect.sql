-- select
-- *
--     --count(*) as rows,
--     --count(distinct review_id || '-' || order_id) as distinct_review_records
-- from {{ ref('stg_reviews') }}

-- select
--     count(*) as rows,
--     count(distinct review_id || '-' || order_id) as distinct_review_records
-- from {{ ref('fct_reviews') }}


-- select
--     review_score,
--     count(*) as reviews
-- from {{ ref('fct_reviews') }}
-- group by review_score
-- order by review_score

select
    count(*) as reviews,
    count(customer_id) as populated_customer_ids
from {{ ref('fct_reviews') }}