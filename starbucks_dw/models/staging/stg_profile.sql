/* TO BE IMPLEMENTED BY THE STUDENT */
{{
  config(
    materialized = 'view',
    )
}}

with
    transformed_profile as (
        select
            a
            , COALESCE(gender, "N/A") AS gender
            , age
            , id AS customer_id
            , CAST(became_member_on AS DATE) AS became_member_on
            , COALESCE(income, 0) AS income
            current_timestamp as ingested_at
        from {{ ref('profile') }}
    )

select *
from transformed_profile where age < 118
