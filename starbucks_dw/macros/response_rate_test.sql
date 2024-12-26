{% test response_rate_test(model, column_name=None) %}
SELECT
    *
FROM {{ model }}
WHERE response_rate > 1
{% endtest %}
