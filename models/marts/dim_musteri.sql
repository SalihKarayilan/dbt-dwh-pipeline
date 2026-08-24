{{ config(
    materialized='table'
) }}

WITH stg_musteri AS (
    -- source() yerine ref() kullanıyoruz. 
    -- Çünkü artık ham veriyi değil, temizlediğimiz dbt modelini referans alıyoruz.
    SELECT * FROM {{ ref('stg_musteri_temiz') }}
),

final_dim AS (
    SELECT
        musteri_id,
        musteri_ad || ' ' || musteri_soyad AS musteri_tam_ad, -- Raporlama kolaylığı için isim birleştirme
        sehir,
        meslek_kodu
    FROM stg_musteri
)

SELECT * FROM final_dim