{% macro years_since_client_segm(subscribed_date = 'subscribed_date') %}
    case
                when EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM subscribed_date) < 1
                then 'New Clients (< 1 year)'
                when EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM subscribed_date) between 2 and 4
                then 'Emerging Clients (from 2 to 4 years)'
                when EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM subscribed_date) between 5 and 9
                then 'Core Customers (from 5 to 9 years)'
                when EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM subscribed_date) >= 10
                then 'Star Members (more than a decade)'
                else 'Unknown'
            end
{% endmacro %}