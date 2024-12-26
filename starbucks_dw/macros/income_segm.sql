{% macro income_segm(income = 'income') %}
    case
                when {{income}} < 30000
                then 'Very Low Income (< 30k $)'
                when {{income}} between 30000 and 49000
                then 'Low Income (30k - 49k $)'
                when {{income}} between 50000 and 79000
                then 'Middle Income (50k - 79k $)'
                when {{income}} between 80000 and 99000
                then 'Upper-Middle Income (80k - 99k $)'
                else 'High Income (> 99k $)'
            end
{% endmacro %}