{{ config(materialized='view') }}

SELECT * FROM {{ ref('stg_lg_code') }}
