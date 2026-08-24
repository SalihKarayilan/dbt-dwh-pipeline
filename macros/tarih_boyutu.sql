{% macro tarih_boyutu_olustur(tarih_kolonu) %}
    EXTRACT(YEAR FROM {{ tarih_kolonu }}) AS islem_yili,
    EXTRACT(MONTH FROM {{ tarih_kolonu }}) AS islem_ayi,
    EXTRACT(QUARTER FROM {{ tarih_kolonu }}) AS islem_ceyreki,
    TO_CHAR({{ tarih_kolonu }}, 'Month') AS islem_ay_adi
{% endmacro %}