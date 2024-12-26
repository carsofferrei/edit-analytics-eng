{{
  config(
    materialized = 'table',
    )
}}

    with customers AS (
        select customer_id
        , gender
        , {{ age_segm()}} as age
        , {{ income_segm()}} as income
        , {{ years_since_client_segm()}} as years_since_client
        from {{ ref('dim_customer') }}
    )

    , cust_trans AS (
        select t.customer_id
        , CASE WHEN o.offer_type is not null then o.offer_type else t.transaction_status end as offer_type
        , COUNT(DISTINCT t.offer_id) AS nr_total_offers
        , {{ calculate_response_rate() }} as response_rate
        from {{ ref('fct_customer_transactions') }} t
        left join {{ ref('dim_offer') }} o
        on o.offer_id = t.offer_id
        group by t.customer_id
        , CASE WHEN o.offer_type is not null then o.offer_type else t.transaction_status end
    )

   select customers.customer_id
    , customers.gender
    , customers.age
    , customers.income
    , customers.years_since_client
    , cust_trans.offer_type
    , sum(cust_trans.nr_total_offers) AS nr_total_offers
    , cust_trans.response_rate
    from customers
    left join cust_trans
    on customers.customer_id = cust_trans.customer_id
    where offer_type not like 'transaction'
    group by customers.customer_id
    , customers.gender
    , customers.age
    , customers.income
    , customers.years_since_client
    , cust_trans.offer_type
    , cust_trans.response_rate
