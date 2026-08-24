WITH source_data AS (
    SELECT * FROM {{ source('ham_kaynak', 'stg_islem') }}
),

temizlenmis_veri AS (
    SELECT
        islem_id,
        musteri_id,
        islem_tarihi,
        UPPER(islem_tipi) AS islem_tipi,
        islem_tutari
    FROM source_data
    WHERE islem_tutari > 0 -- Negatif tutarlı hatalı işlemleri süzüyoruz
)

SELECT * FROM temizlenmis_veri