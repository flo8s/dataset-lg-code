{# 総務省 全国地方公共団体コード（市町村別コード・現行）
   https://www.soumu.go.jp/denshijiti/code.html
   xlsx 5列。1行目はヘッダー（改行入りの日本語名）のため range で読み飛ばし、
   1枚目シート（現在の団体）を位置（A〜E）で取得する。
   シート名には基準日（例: R6.1.1現在の団体）が含まれ更新ごとに変わるため sheet は指定しない。 #}
{% macro read_lg_code_xlsx(url) %}
select
    "A" as lg_code,
    "B" as prefecture,
    "C" as city,
    "D" as prefecture_kana,
    "E" as city_kana
from read_xlsx(
    '{{ url }}',
    header = false,
    range = 'A2:E1048576',
    all_varchar = true,
    stop_at_empty = true
)
{% endmacro %}
