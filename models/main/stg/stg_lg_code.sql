{{ config(materialized='view') }}

SELECT
    lg_code,
    SUBSTR(lg_code, 1, 2) AS pref_code,
    SUBSTR(lg_code, 1, 5) AS lg_code_5,
    prefecture,
    city,
    prefecture_kana,
    city_kana,
    CASE WHEN city IS NULL THEN 'prefecture' ELSE 'municipality' END AS code_type
FROM {{ ref('raw_lg_code') }}
