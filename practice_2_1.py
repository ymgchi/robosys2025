#!/usr/bin/python3

pages = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

target_pages = pages[::2]

for p in target_pages:
    print(str(p) + "ページ")

