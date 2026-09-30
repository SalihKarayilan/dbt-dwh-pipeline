# DWH Project

Bu proje, bir veri ambarı (Data Warehouse) dbt (data build tool) projesidir. Veritabanındaki ham verileri (staging) alır, dönüştürür ve raporlama ile analitik amaçlar için iş modellerine (marts) dönüştürür.

## Proje Yapısı

Proje aşağıdaki klasör yapısına sahiptir:

*   **`models/staging/`**: Bu katman, kaynak sistemlerden alınan ham verilerin ilk temizleme ve standartlaştırma işlemlerinin yapıldığı yerdir.
    *   `stg_musteri_temiz.sql`: Müşteri verilerini temizler.
    *   `stg_islem_temiz.sql`: İşlem verilerini temizler.
*   **`models/marts/`**: Bu katman, iş kurallarının uygulandığı ve raporlamaya hazır nihai tabloların (boyut - dimension ve gerçek - fact tabloları) oluşturulduğu yerdir.
    *   `dim_musteri.sql`: Raporlama için kullanılan nihai müşteri boyut tablosu.
    *   `fct_islem.sql`: Müşterilerin temizlenmiş hesap hareketleri tablosu.

## Kurulum ve Çalıştırma

Projeyi çalıştırmak için sisteminizde `dbt-core` ve ilgili adaptörün (örneğin `dbt-postgres`) kurulu olması gerekmektedir. Profil ayarlarınız (`profiles.yml`) `my_dwh_project` hedefine göre yapılandırılmalıdır.

Aşağıdaki komutları kullanarak projeyi çalıştırabilirsiniz:

```bash
# Projedeki tüm modelleri çalıştırmak için
dbt run

# Projede tanımlı olan veri testlerini çalıştırmak için
dbt test

# Modellerin dökümantasyonunu oluşturmak ve görüntülemek için
dbt docs generate
dbt docs serve
```
