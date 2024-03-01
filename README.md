![Wan-Life](/app/assets/images/header.jpg)

WanLifeはわんちゃんとお出かけの際に一緒に行けるドッグカフェやドッグランの場所を直感的に探す事が出来るアプリです。
目的地周辺のわんちゃんと一緒に行ける施設をGoogleMapApiを利用して表示します！
あなたとわんちゃんのお出かけを効率的にサポートします。

<br/>
## サイト概要

WanLife：https://wan-life.onrender.com/

WanLifeはわんちゃんとお出かけの際に一緒に行けるドッグカフェやドッグランの場所を直感的に探す事が出来るアプリです。
目的地周辺のわんちゃんと一緒に行ける施設をGoogleMapApiを利用して表示します！
あなたとわんちゃんのお出かけを効率的にサポートします。

![使用イメージ1](/app/assets/images/image3.gif)

ドッグランやドッグカフェを探しているけど、既存の検索サイトだと情報が古かったり、お店が閉店していた…
例えば飲食店を探している時でも経験があるかと思います。
私自身もですが、良いなと思ったお店は最新の情報を得る為に自分自身でもう一度お店の名前でインターネット検索をしてSNSやWEBページを確認して最新の情報を調べています。

こうした検索作業をしている時に、
・目的地周辺の施設を効率良く知りたい
・結局自分で改めてインターネットで検索するし、お店の場所と名前だけすぐに知りたい
こういうニーズを満たしているアプリがあれば便利だなと思ったのが作成のきっかけとなります。

本アプリでは従来の検索サイトと違い、お店の情報やお店別のページはあえて作成せず
マップとマーカーだけを表示する非常に直感的な構造になっています。
これにより、例えば◯◯駅の北側にはドッグカフェがある
△△公園にはドッグランがあるといった情報を直感的に把握する事が出来ます。

マーカーにオンマウスする事でお店の名前を表示
マーカーをクリックする事でお店の名前をコピーする事が出来ます。

ユーザー登録は行わずとも機能面には差はありませんが、
ユーザー登録の際に選んだお住まいの都道府県の県庁所在地がGooglemapの初期値となりますので、効率良く近隣の施設を探す事が出来ます。

画面上部のボタンはソート機能となっており、ドッグランだけ・ドッグカフェだけを表示する事も可能です。

<br/>
# 使用技術

| Category           | Technology Stack                               | 
| ------------------ | ---------------------------------------------- |
| Frontend           | JavaScript                                     | 
| Backend            | Ruby on Rails                                  |
| Infrastructure     | render                                         |
| Database           | PostgreSQL                                     |
| etc                | Nokogiri,GooglemapsAPI,Dotenv-Rails,GitHub     |

<br/>

## 今後の展望

・検索機能の追加
・スクレイピングによるデータベース更新の効率化・自動化
・表示施設の追加（ペット可宿泊施設、トリミング施設、ペットホテル）
・ユーザーの位置情報共有を許可した際、現在地からマーカーの施設までのルート検索を可能とする
