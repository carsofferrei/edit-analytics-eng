{{
  config(
    materialized = 'table',
    )
}}

select offer_channel
    , {{ calculate_response_rate() }} as response_rate
    , count(distinct offer_id) as nr_total_offers_channel
    from {{ ref('fct_offer_transactions') }} t
    group by offer_channel
