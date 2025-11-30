#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Takumi Yamaguchi
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo ${1}行目が違うよ
    res=1
}

res=0

### 正常入力: 長さ変換 ###
out=$(echo "yard 1" | ./imperial)
[ "${out}" = "0.9144 m (= 91.44 cm)" ] || ng "$LINENO"

out=$(echo "inch 12" | ./imperial)
[ "${out}" = "30.48 cm (= 304.8 mm)" ] || ng "$LINENO"

out=$(echo "feet 6" | ./imperial)
[ "${out}" = "1.829 m (= 182.9 cm)" ] || ng "$LINENO"

out=$(echo "mile 1" | ./imperial)
[ "${out}" = "1.609 km (= 1609 m)" ] || ng "$LINENO"

### 正常入力: 重さ変換 ###
out=$(echo "lb 10" | ./imperial)
[ "${out}" = "4.536 kg (= 4536 g)" ] || ng "$LINENO"

out=$(echo "oz 1" | ./imperial)
[ "${out}" = "28.35 g (= 0.02835 kg)" ] || ng "$LINENO"

### 正常入力: 省略形 ###
out=$(echo "yd 1" | ./imperial)
[ "${out}" = "0.9144 m (= 91.44 cm)" ] || ng "$LINENO"

out=$(echo "ft 6" | ./imperial)
[ "${out}" = "1.829 m (= 182.9 cm)" ] || ng "$LINENO"

### 異常入力: 未対応の単位 ###
out=$(echo "xyz 10" | ./imperial 2>/dev/null)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

### 異常入力: 数値でない ###
out=$(echo "yard abc" | ./imperial 2>/dev/null)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

### 異常入力: 形式が違う ###
out=$(echo "yard" | ./imperial 2>/dev/null)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res
