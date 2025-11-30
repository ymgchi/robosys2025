# imperial

![test](https://github.com/ymgchi/robosys2025/actions/workflows/test.yml/badge.svg)

ヤードポンド法からメートル法への単位変換コマンド。

## 使い方

```bash
$ echo "単位 数値" | ./imperial
```

### 例

```bash
$ echo "yard 1" | ./imperial
0.9144 m (= 91.44 cm)

$ echo "inch 12" | ./imperial
30.48 cm (= 304.8 mm)

$ echo "lb 10" | ./imperial
4.536 kg (= 4536 g)

$ echo "feet 6" | ./imperial
1.829 m (= 182.9 cm)
```

## 対応単位

| 入力 | 出力 |
|------|------|
| yard, yd | m |
| feet, foot, ft | m |
| inch, in | cm |
| mile, mi | km |
| lb, pound | kg |
| oz, ounce | g |

## 必要なソフトウェア

- Python
  - テスト済みバージョン: 3.8, 3.9, 3.10, 3.11, 3.12

## テスト環境

- Ubuntu 22.04 LTS

## ライセンス

- このソフトウェアパッケージは, 3条項BSDライセンスの下, 再頒布および使用が許可されます。
- (C) 2025 Takumi Yamaguchi
- このパッケージのコードは, 下記のスライド (CC-BY-SA 4.0 by Ryuichi Ueda) のものを, 本人の許可を得て自身の著作としたものです。
  - [ryuichiueda/slides_marp/robosys2025](https://github.com/ryuichiueda/slides_marp/tree/master/robosys2025)
