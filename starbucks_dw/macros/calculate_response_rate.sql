{% macro calculate_response_rate(transaction_status='t.transaction_status', status='completed', offer_id='t.offer_id') %}
   ROUND(
      CAST(
         CAST(COUNT(DISTINCT CASE WHEN {{ transaction_status }} = '{{ status }}' THEN {{ offer_id }} END) AS FLOAT)
         / NULLIF(COUNT(DISTINCT {{ offer_id }}), 0)
      AS NUMERIC),
   2)
{% endmacro %}
