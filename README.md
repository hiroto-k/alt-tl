# alt-tl

[![License](https://img.shields.io/github/license/hiroxto/alt-tl.svg)](https://github.com/hiroxto/alt-tl/blob/master/LICENSE)

``statuses/home_timeline``の代替リストを作成する。

## これはなに

``statuses/home_timeline``が規制に掛かった時用に、TL代わりのリストを作成する。

User Stream API廃止により、強制的に``15/15min``の``statuses/home_timeline``を使う事になってすぐ規制にかかるのでそれの対策用。
``lists/statuses``は``900/15min``なので実質的に毎秒更新出来ます。

## 注意点

- **リストを作成したアカウント** からのツイートは **流れてきません**。
  - 自分からツイートなので、**TLを見るだけなら** 最悪流れて来なくても問題は無いはず。
- リストに登録出来るユーザー数は **5000が上限** です。
  - フォロー数が5000を超えている場合は完全な再現は出来ません。

## 設定

``config/config.yml``を``config/config.yml``へコピー。
``config/config.yml``にアカウントの設定とリストのIDを書き込む。

## 実行

全アカウントをアップデート。

``./bin/alt-tl update``

アカウントを指定してアップデート。

``./bin/alt-tl update --accounts account_name``

複数アカウントの指定。

``./bin/alt-tl update --accounts account_name1 account_name2``

## License

[MIT License](https://github.com/hiroxto/alt-tl/blob/master/LICENSE "MIT License")
