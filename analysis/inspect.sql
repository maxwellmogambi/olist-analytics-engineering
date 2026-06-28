select 
distinct order_status
from {{ref('fct_payments')}}