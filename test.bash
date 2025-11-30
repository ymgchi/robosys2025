#!/bin/bash -xv
# SPDX-FileCopyrightText: 2025 Takumi Yamaguchi
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo ${1}行目が違うよ
    res=1
}

res=0

### 正常入力: 平衡点付近（安定） ###
out=$(echo "1000 10" | ./ecosystem 30000)
echo "$out" | grep -q "^STABLE:" || ng "$LINENO"

### 正常入力: 絶滅ケース ###
out=$(echo "1 10" | ./ecosystem 30000)
echo "$out" | grep -q "^EXTINCT:" || ng "$LINENO"

### 異常入力: 数値以外 ###
out=$(echo "abc" | ./ecosystem 2>/dev/null)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

### 異常入力: 空入力 ###
out=$(echo "" | ./ecosystem 2>/dev/null)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

### 異常入力: 負の数 ###
out=$(echo "-1 10" | ./ecosystem 2>/dev/null)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

### 異常入力: 引数が1つだけ ###
out=$(echo "100" | ./ecosystem 2>/dev/null)
[ "$?" = 1 ]      || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res
