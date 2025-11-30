# ecosystem

![test](https://github.com/ymgchi/robosys2025/actions/workflows/test.yml/badge.svg)

ロトカ=ヴォルテラ方程式を用いた生態系シミュレータ。捕食者(クマ)と被食者(サケ)の個体数変動をシミュレーションし, 生態系が安定するか絶滅するかを判定する。

## 使い方

```bash
$ echo "初期クマ数 初期サケ数" | ./ecosystem [ステップ数]
```

### 例

```bash
$ echo "1000 10" | ./ecosystem 30000
STABLE: bear=1000.0 salmon=10.0
```

```bash
$ echo "1 10" | ./ecosystem 30000
EXTINCT: salmon died at time=0.600
```

- `STABLE`: 生態系が安定した状態で維持
- `EXTINCT`: いずれかの種が絶滅

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
