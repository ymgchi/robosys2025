#!/bin/bash
# SPDX-FileCopyrightText: 2025 Takumi Yamaguchi
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo ${1}行目が違うよ
    res=1
}

res=0

out=$(seq 5 | ./plus)

# 結果が 15 じゃなかったらNG
[ "${out}" = 15 ] || ng "$LINENO"

# ここまでエラーがなければ OK と表示
[ "$res" = 0 ] && echo OK

exit $res
