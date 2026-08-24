WITH source_data AS (
    SELECT * FROM {{ source('ham_kaynak', 'stg_musteri') }}
),

temizlenmis_veri AS (
    SELECT
        id AS musteri_id,
        UPPER("Name") AS musteri_ad,
        UPPER("Surname") AS musteri_soyad,
        "City" AS sehir,
        "Bakiye" AS hesap_bakiyesi,
        "Meslek" AS meslek_kodu
    FROM source_data
    WHERE id IS NOT NULL -- NULL olan hatalı satırı (4. satır) süzüyoruz
)

SELECT * FROM temizlenmis_veri