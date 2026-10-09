# homebrew-memnotch

社内向けアプリ [MemNotch](https://github.com/mem-shibata/MemNotch-releases) の Homebrew tap です。

```sh
# インストール
brew tap mem-shibata/memnotch
brew trust --tap mem-shibata/memnotch   # Homebrew にこの tap を信頼させる設定
brew install --cask memnotch

# 更新
brew upgrade --cask memnotch

# 削除（データは残る）
brew uninstall --cask memnotch

# 削除（データも消す）
brew uninstall --zap --cask memnotch
```

Cask は `Casks/memnotch.rb` にあります。MemNotch のリリースのたびに、リリース用のスクリプトがバージョンと SHA-256 を更新します。

MemNotch は Apple の公証を受けていないため、この Cask はインストールのあとにダウンロード時の隔離属性を外し、Gatekeeper の警告を出さないようにしています。ダウンロードしたファイルが改ざんされていないことは、Cask に記録した SHA-256 で確認します。
