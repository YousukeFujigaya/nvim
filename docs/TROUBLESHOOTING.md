# トラブルシューティングガイド

このドキュメントでは、Modern Neovim Configurationで発生する可能性のある問題と解決方法を詳しく説明します。

## 📋 目次

- [一般的な問題](#一般的な問題)
- [インストール・起動の問題](#インストール・起動の問題)
- [プラグインの問題](#プラグインの問題)
- [LSP・言語サーバーの問題](#lsp・言語サーバーの問題)
- [UI・表示の問題](#ui・表示の問題)
- [パフォーマンスの問題](#パフォーマンスの問題)
- [Git関連の問題](#git関連の問題)
- [デバッグツール](#デバッグツール)
- [よくある質問](#よくある質問)

## 一般的な問題

### 🚨 Neovimが起動しない

**症状**: nvimコマンドを実行してもエラーが発生する

**確認事項**:
```bash
# Neovimのバージョン確認
nvim --version

# Neovimのパスを確認
which nvim

# 必要バージョン: 0.9.0以上
```

**解決方法**:
```bash
# macOS (Homebrew)
brew update && brew upgrade neovim

# Ubuntu/Debian
sudo apt update && sudo apt install neovim

# Arch Linux
sudo pacman -Syu neovim

# 最新版が必要な場合はAppImage使用
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
```

### 🔧 設定ファイルが読み込まれない

**症状**: カスタマイズが反映されない

**確認事項**:
```vim
:echo stdpath('config')
" 表示されるパスに設定ファイルがあるか確認
```

**解決方法**:
```bash
# 設定ディレクトリの確認
ls -la ~/.config/nvim

# 権限の修正
chmod -R 755 ~/.config/nvim

# シンボリックリンクの場合は実体を確認
ls -la ~/.config/nvim/init.lua
```

## インストール・起動の問題

### 🚀 初回起動でエラーが発生

**症状**: "lazy.nvim not found"などのエラー

**解決方法**:
```bash
# キャッシュをクリア
rm -rf ~/.cache/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim/lazy

# Neovimを再起動
nvim
```

### 📦 プラグインマネージャーが動作しない

**症状**: `:Lazy`コマンドが認識されない

**デバッグ方法**:
```vim
:echo has('nvim-0.9')
" 1が表示されることを確認

:lua print(vim.fn.stdpath('data'))
" データディレクトリパスを確認
```

**解決方法**:
```bash
# Git の確認
git --version

# ネットワーク接続の確認
curl -I https://github.com

# 手動でlazy.nvimをクローン
git clone --filter=blob:none --branch=stable https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/lazy/lazy.nvim
```

### 🐍 Python/Node.js関連エラー

**症状**: "python3 not found"や"node not found"エラー

**確認事項**:
```bash
# Python確認
python3 --version
which python3

# Node.js確認  
node --version
npm --version
```

**解決方法**:
```bash
# macOS
brew install python3 node

# Ubuntu/Debian
sudo apt install python3 python3-pip nodejs npm

# Neovim用プロバイダーのインストール
pip3 install pynvim
npm install -g neovim
```

## プラグインの問題

### 📋 プラグインが正しく読み込まれない

**症状**: 期待される機能が動作しない

**確認方法**:
```vim
:Lazy
" インストール状況を確認

:checkhealth lazy
" プラグインマネージャーの状態確認
```

**解決方法**:
```vim
" プラグインを再インストール
:Lazy clean
:Lazy sync

" 特定プラグインのみ再インストール
:Lazy reload plugin-name
:Lazy install plugin-name
```

### 🔄 プラグイン更新でエラー

**症状**: 更新中にエラーが発生する

**解決方法**:
```bash
# Git設定の確認
git config --global user.name
git config --global user.email

# プロキシ設定（必要な場合）
git config --global http.proxy http://proxy.example.com:8080
```

```vim
" Lazy.nvimのログを確認
:Lazy log

" 問題のあるプラグインを個別に処理
:Lazy clean plugin-name
:Lazy install plugin-name
```

### 🛠 プラグインの依存関係エラー

**症状**: "dependency not found"エラー

**解決方法**:
```vim
" 依存関係を含めて再インストール
:Lazy restore

" 依存関係の手動インストール
:Lazy install missing-dependency
```

## LSP・言語サーバーの問題

### 🧠 LSPが動作しない

**症状**: 補完やエラー表示が機能しない

**確認方法**:
```vim
:LspInfo
" 接続されているLSPサーバーを確認

:checkhealth lsp
" LSP設定の健全性確認
```

**解決方法**:
```vim
" Masonを開いてLSPサーバーの状態確認
:Mason

" LSPサーバーの再インストール
:MasonUninstall lua-language-server
:MasonInstall lua-language-server

" LSPの再起動
:LspRestart
```

### 📝 特定言語の補完が動作しない

**症状**: 一部の言語でのみLSPが動作しない

**デバッグ方法**:
```bash
# 言語サーバーが実行可能か確認
which typescript-language-server
which pyright
which rust-analyzer

# パスの確認
echo $PATH
```

**解決方法**:
```vim
" 言語サーバーのログを確認
:lua vim.lsp.set_log_level("debug")
:LspLog

" 言語サーバーを手動起動してテスト
:lua vim.lsp.start({
  name = "test-server",  
  cmd = {"typescript-language-server", "--stdio"},
  root_dir = vim.fn.getcwd(),
})
```

### 🔧 LSPサーバーのインストールに失敗

**症状**: Masonでのインストールが失敗する

**解決方法**:
```bash
# システムの依存関係を確認
# TypeScript Server
npm install -g typescript-language-server typescript

# Python
pip install pyright

# Rust
rustup component add rust-analyzer

# Go
go install golang.org/x/tools/gopls@latest
```

```vim
" Masonのログを確認
:MasonLog

" 手動でPATHに追加
:lua vim.env.PATH = vim.env.PATH .. ":" .. vim.fn.stdpath("data") .. "/mason/bin"
```

## UI・表示の問題

### 🎨 アイコンが表示されない

**症状**: ファイルアイコンが□や?で表示される

**確認事項**:
```bash
# Nerd Fontがインストールされているか
fc-list | grep -i "nerd\|hack\|fira"

# ターミナルのフォント設定を確認
```

**解決方法**:
```bash
# macOS
brew install font-hack-nerd-font

# Linux
mkdir -p ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip
unzip Hack.zip -d ~/.local/share/fonts/
fc-cache -fv
```

ターミナルエミュレーターでNerd Fontを設定してください。

### 🌈 カラースキームが正しく表示されない

**症状**: 色が正しく表示されない、または単色で表示される

**確認方法**:
```vim
:set termguicolors?
" termguicolorsが有効になっているか確認

:lua print(vim.o.background)
" バックグラウンド設定を確認
```

**解決方法**:
```vim
" true colorを強制的に有効化
:set termguicolors

" バックグラウンドを明示的に設定
:set background=dark
```

```bash
# ターミナルの確認
echo $TERM
# xterm-256color または similar であることを確認

# TMUXを使用している場合
echo 'set -g default-terminal "screen-256color"' >> ~/.tmux.conf
```

### 📏 ステータスラインが表示されない

**症状**: Lualineが表示されない

**解決方法**:
```vim
:set laststatus=3
" グローバルステータスラインを有効化

:lua require('lualine').setup()
" Lualineを手動で再初期化
```

### 🚪 ウィンドウ・バッファの表示問題

**症状**: Neo-treeやTelescopeが正しく表示されない

**解決方法**:
```vim
" ウィンドウサイズを確認
:lua print(vim.o.columns, vim.o.lines)

" Neo-treeの再起動
:Neotree close
:Neotree show

" Telescopeのキャッシュクリア
:lua require('telescope.builtin').resume()
```

## パフォーマンスの問題

### 🐌 起動が遅い

**症状**: Neovimの起動に数秒かかる

**診断方法**:
```bash
# 起動時間の詳細分析
nvim --startuptime startup.log
head -20 startup.log
```

**解決方法**:
```vim
" プラグインの読み込み状況確認
:Lazy profile

" 重いプラグインを遅延読み込み
" lua/plugins/heavy-plugin.lua で event = "VeryLazy" に変更

" 不要なプラグインを無効化
" { "plugin-name", enabled = false }
```

### 💾 メモリ使用量が多い

**症状**: Neovimのメモリ使用量が大きい

**確認方法**:
```bash
# メモリ使用量確認
ps aux | grep nvim
top -p $(pgrep nvim)
```

**解決方法**:
```vim
" 履歴サイズを削減
:set history=100
:set undolevels=500

" バックアップを無効化
:set nobackup
:set nowritebackup
:set noswapfile
```

### 🔄 操作が重い・フリーズする

**症状**: キー入力に遅延がある

**解決方法**:
```vim
" 更新頻度を調整
:set updatetime=300

" Tree-sitterを一時的に無効化
:TSDisable highlight

" プラグインを段階的に無効化してテスト
:Lazy disable plugin-name
```

## Git関連の問題

### 📊 Gitsignsが動作しない

**症状**: Git変更が表示されない

**確認方法**:
```bash
# Gitリポジトリか確認
git status

# Gitの設定確認
git config user.name
git config user.email
```

**解決方法**:
```vim
" Gitsignsの再起動
:Gitsigns refresh

" Gitsignsのデバッグ
:Gitsigns debug_messages

" 手動でGitサインを有効化
:lua require('gitsigns').setup()
```

### 🔀 LazyGitが起動しない

**症状**: `<leader>gg`でLazyGitが起動しない

**確認方法**:
```bash
# LazyGitがインストールされているか
which lazygit
lazygit --version
```

**解決方法**:
```bash
# macOS
brew install lazygit

# Ubuntu/Debian
# 公式リリースからダウンロード
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
```

## デバッグツール

### 🔍 健全性チェック

```vim
" 全般的な健全性チェック
:checkhealth

" 特定項目のチェック
:checkhealth lsp
:checkhealth treesitter
:checkhealth telescope
:checkhealth mason
```

### 📋 ログの確認

```vim
" LSPログ
:LspLog

" Masonログ
:MasonLog

" Lazyログ
:Lazy log

" Neovimのログ
:messages
```

### 🛠 デバッグモード

```vim
" LSPデバッグ
:lua vim.lsp.set_log_level("debug")

" より詳細なログ
:lua vim.lsp.set_log_level("trace")

" ログ場所の確認
:lua print(vim.lsp.get_log_path())
```

### 📊 設定の確認

```vim
" 現在の設定確認
:lua print(vim.inspect(vim.g))
:lua print(vim.inspect(vim.o))

" プラグイン設定確認
:lua print(vim.inspect(require('lazy').plugins()))

" LSP設定確認
:lua print(vim.inspect(vim.lsp.get_active_clients()))
```

## よくある質問

### ❓ VS Codeから移行時の注意点

**Q**: VS Codeの拡張機能と同等の機能はありますか？

**A**: 主要な機能は以下で代替できます：
- **Auto Rename Tag** → nvim-ts-autotag
- **Bracket Pair Colorizer** → nvim-treesitter（内蔵）
- **GitLens** → gitsigns + fugitive + lazygit
- **Live Share** → instant.nvim（別途追加）
- **Prettier** → null-ls + Mason

### ❓ 日本語入力での問題

**Q**: 日本語入力時にキーマップが効かない

**A**: インサートモード専用のキーマップを追加：
```lua
-- 日本語入力対応
vim.keymap.set('i', 'jj', '<Esc>', { desc = 'Exit insert mode with jj' })

-- IME自動オフ（macOS）
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "call system('osascript -e \"tell application \\\"System Events\\\" to key code 102\"')"
})
```

### ❓ ファイルの自動保存

**Q**: VS Codeのような自動保存機能はありますか？

**A**: 以下の設定で実現可能：
```lua
-- 自動保存設定
vim.opt.autowrite = true        -- バッファ切り替え時に保存
vim.opt.autowriteall = true     -- より積極的な自動保存

-- または auto-save.nvim プラグインを使用
```

### ❓ 複数ファイル編集

**Q**: VS Codeのようにタブで複数ファイルを編集したい

**A**: Bufferlineが提供するタブ風インターフェースを使用：
```vim
<S-h>/<S-l>     " バッファ切り替え
<leader>bd      " バッファを閉じる
<leader>bo      " 他のバッファを閉じる
```

### ❓ エラーが解決しない場合

**最終手段**:
```bash
# 完全にクリーンな状態から再インストール
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim  
rm -rf ~/.cache/nvim
rm -rf ~/.local/state/nvim

# 設定を再インストール
git clone https://github.com/your-username/modern-nvim-config.git ~/.config/nvim
nvim
```

---

## 📞 サポート

解決しない問題がある場合：

1. **GitHub Issues**: [リポジトリのIssues](https://github.com/your-username/modern-nvim-config/issues)で報告
2. **詳細情報を含める**:
   - OS・バージョン
   - Neovimバージョン（`nvim --version`）
   - エラーメッセージ
   - `:checkhealth`の結果
3. **再現手順**を明確に記載

このトラブルシューティングガイドで、ほとんどの問題を解決できるはずです。