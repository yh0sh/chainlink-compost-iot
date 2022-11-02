# Tokyo Web3 Hack-a-thon DAO部門 「Compost Project in India」

このレポジトリーでは、compostに設置しているIoTデータを取得するためのAPI、APIを使用するためのchainlinkのexternal adapter、およびchainlinkのnodeをそれぞれ作成する

3つのプロダクトはdockerコンテナによって作成される

## Infomations

- 使用したtech stacks

 python, docker, postgres, chainlink, infura

- 使用したblockchain

goerli

- deployしたcontract

chainlink node (localで建てたもの)

0x326C977E6efc84E512bB9C30f76E30c160eD06FB

- テスト手順を含むリポジトリへのリンク

infura (setupにてnode構築後)

https://infura.io/dashboard

chainlink (setupにてnode構築後)

http://localhost:6688/

- 審査やテストのためにプロジェクトにアクセスする方法など

下記setupを参照


# Setup

## dockerのビルドとコンテナ起動

```bash
docker-compose build --no-cache
```

```bash
docker compose up -d
```

## infuraの設定

下記記事を参考にinfuraのAPI keyを取得する

https://zenn.dev/allegorywrite/articles/a8be18daa57980#4.-chainlinknode%E3%82%92%E6%A7%8B%E7%AF%89%E3%81%99%E3%82%8B-~node(job)%E7%B7%A8~

取得したAPI keyをpostgres/chainlink/.envに書き足す

```
ETH_URL=wss://goerli.infura.io/ws/v3/<YOUR INFURA ID>
```


## chainlinkの設定

chainlink/data/.apiを作成し、chainlinkアカウントのログインメールアドレスとパスワードを記入する

```
<YOUR LOGIN EMAIL>
<YOUR LOGIN PASSWORD>
```

chainlink/data/.passwordを作成し、chainlinkアカウントに作成されるwalletのパスワードを記入する

```
<YOUR WALLET PASSWORD>
```

※どちらもroot所有にする必要があるかもしれない

# 使用方法

下記コマンドを打つとexternal adaptor(API)が呼び出される

```bash
curl 0.0.0.0:8080 -X POST -H "content-type:application/json" -d '{"id": 2, "data": {"key": ""}}' 
```

# 参考サイト

- https://github.com/thodges-gh/CL-EA-Python-Template
- https://qiita.com/biga816/items/ff5b9ac8c7233acc4deb
- https://zenn.dev/allegorywrite/articles/a8be18daa57980
- https://yuyasugano.medium.com/chainlink%E3%81%A7%E3%83%87%E3%83%BC%E3%82%BF%E3%82%92%E5%85%AC%E9%96%8B%E3%81%99%E3%82%8B%E3%81%BE%E3%81%A7%E3%81%AE%E9%81%93%E3%81%AE%E3%82%8A-part2-external-adapters%E7%B7%A8-633d7c0ef5c5
