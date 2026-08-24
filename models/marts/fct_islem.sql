{{ config(
    materialized='table'
) }}

WITH islemler AS (
    SELECT * FROM {{ ref('stg_islem_temiz') }}
),

musteriler AS (
    SELECT * FROM {{ ref('dim_musteri') }}
),

final_fct AS (
    SELECT
        i.islem_id,
        i.musteri_id,
        i.islem_tarihi,
        -- Makromuzu çağırıyoruz ve ona i.islem_tarihi kolonunu gönderiyoruz
        {{ tarih_boyutu_olustur('i.islem_tarihi') }},
        i.islem_tipi,
        i.islem_tutari
    FROM islemler i
    INNER JOIN musteriler m ON i.musteri_id = m.musteri_id
)

SELECT * FROM final_fct