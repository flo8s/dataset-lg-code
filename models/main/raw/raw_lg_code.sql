{{
    config(
        materialized='table'
    )
}}

{{ read_lg_code_xlsx(
    'https://www.soumu.go.jp/main_content/000925835.xlsx'
) }}
