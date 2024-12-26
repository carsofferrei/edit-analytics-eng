{% macro age_segm(age = 'age') %}
    case
                when {{age}} < 18
                then 'Tennagers'
                when {{age}} between 18 and 24
                then 'Young Adults'
                when {{age}} between 25 and 34
                then 'Early Adulthood'
                when {{age}} between 35 and 44
                then 'Mid Adulthood'
                when {{age}} between 45 and 54
                then 'Late Adulthood'
                when {{age}} between 55 and 64
                then 'Pre-Seniors'
                when {{age}} between 65 and 74
                then 'Early Seniors'
                when {{age}} >= 75
                then 'Seniors'
            end
{% endmacro %}
