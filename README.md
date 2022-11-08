<img width="1440" alt="スクリーンショット 2022-10-20 18 06 09" src="https://user-images.githubusercontent.com/108819031/196928302-29a30f7c-df64-4148-b688-8fc6cf503dc8.png">


# アプリ名
Photolio


## サイト概要
**目的**

自分が撮影した写真を記録・共有し、
その写真や撮影地を通して他のユーザーと交流することを目的としている。

**機能**

*画像を投稿*
- 投稿時に撮影地を入力し、その情報をもとにマップにマーカーを立てて記録できる。
- 自分の投稿の一つをお気に入り登録できる
- 投稿時に自動でタグを生成
- 使用した機材を登録できる

*画像を閲覧*
- 投稿に対しいいね、コメントができる。
- 同じ撮影地の投稿を見ることができる。
- タグ、機材をもとに検索ができる


### サイトテーマ
カメラマン同士が写真を通して交流できるSNS


### テーマを選んだ理由
撮影地の共有や、写真を通した自分の紹介など、
より手軽に記録・共有できるコンテンツがあればいいなと思いこのテーマにしました。

前職でお客様と会話をしている時、カメラマン同士の交流の場が少なく、
各地の撮影スポットの情報を集めることが大変だという話をよくしていました。

写真を共有したいという思いがあるものの、どのようにすれば同じカメラマンと交流できるか分からないことが理由だったようです。

なので、より写真の情報に特化し、それをもとに交流できるSNSサービスを作れないかと思いこのテーマにしました。


### ターゲットユーザ
- 写真を撮影・記録したい人
- 新しい撮影地を見つけたい人


### 主な利用シーン
*投稿*
- 自分のお気に入りの写真の記録用として。
- どんな写真を撮影しているのか雰囲気を伝えたい時に。

*閲覧*
- 他のカメラマンの技術を参考にする時に。
- 同じ機材を使用していたり、被写体を撮影しているユーザーを探すときに。


## 設計書
- テーブル定義書
https://docs.google.com/spreadsheets/d/1OWI0RFyNmU5rGA1EXaXAROilWWXLzpqMBsijfqPidms/edit?usp=sharing.
- ER図
https://drive.google.com/file/d/1qd_pzIlT1oSly3L0N00OkITTstmLC74l/view?usp=sharing.


## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 使用素材
- Google Maps API
https://developers.google.com/maps?hl=ja
- Google Vision API
https://cloud.google.com/vision/?utm_source=google&utm_medium=cpc&utm_campaign=japac-JP-all-ja-dr-skws-all-super-trial-e-dr-1009882&utm_content=text-ad-none-none-DEV_c-CRE_540835491815-ADGP_Hybrid%20%7C%20SKWS%20-%20EXA%20%7C%20Txt%20~%20AI%20%26%20ML%20~%20Vision%20AI_Vision-vision%20api-KWID_43700018487811160-aud-1644542956068%3Akwd-203288733847&userloc_1009444-network_g&utm_term=KW_vision%20api&gclid=CjwKCAiA9qKbBhAzEiwAS4yeDRARy_eLhEKBFWFCdOLBap5IZqY_tS0PEKdO_XXYyW0gsmNNKd9VFhoCvFAQAvD_BwE&gclsrc=aw.ds
