

## このリポジトリのコードについて
以下の記事で紹介されているRust製の日本語形態素解析器linderaを試しに使ってみたものです。
https://qiita.com/mosuka/items/0fdaaf91f5530d427dc7

HTTP POSTで文章を入力すると名詞をカンマ区切りで返却します。

## 前提
辞書としてipadic-neologdを利用する。
以下のリポジトリの説明にしたがって辞書をビルドし、出来上がった辞書ファイル「lindera-ipadic〜」を
/usr/local/lib/lindera/に配置しておくこと。

https://github.com/lindera-morphology/lindera-ipadic-neologd-builder

