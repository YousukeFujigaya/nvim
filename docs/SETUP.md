# セットアップ完全ガイド

このガイドでは、Modern Neovim Configurationの詳細なインストールと初期設定について説明します。

## 📋 目次

- [事前準備](#事前準備)
- [インストール手順](#インストール手順)
- [初回起動と設定](#初回起動と設定)
- [言語別設定](#言語別設定)
- [カスタマイズ](#カスタマイズ)
- [パフォーマンス調整](#パフォーマンス調整)
- [アンインストール](#アンインストール)

## 事前準備

### システム要件

- **OS**: macOS, Linux, Windows (WSL推奨)
- **Neovim**: 0.9.0以上
- **Git**: 2.19.0以上
- **Node.js**: 16.0以上 (LSPサーバー用)
- **Python**: 3.8以上 (一部プラグイン用)

### 必須ソフトウェアのインストール

#### macOS (Homebrew)

```bash
# Homebrewがインストールされていない場合
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 必須パッケージのインストール
brew install neovim git node python3

# 推奨パッケージのインストール  
brew install ripgrep fd lazygit
```

#### Ubuntu/Debian

```bash
# システムパッケージの更新
sudo apt update && sudo apt upgrade -y

# 必須パッケージのインストール
sudo apt install -y neovim git nodejs npm python3 python3-pip

# 推奨パッケージのインストール
sudo apt install -y ripgrep fd-find

# LazyGitのインストール
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit.tar.gz lazygit
```

#### Arch Linux

```bash
# 必須パッケージのインストール
sudo pacman -S neovim git nodejs npm python python-pip

# 推奨パッケージのインストール
sudo pacman -S ripgrep fd lazygit
```

#### Windows (WSL2推奨)

WSL2のUbuntu環境で上記Ubuntu手順に従ってください。

### フォントのインストール

アイコン表示のためNerd Fontが必要です：

#### macOS

```bash
# Nerd Fonts の追加
brew tap homebrew/cask-fonts

# 推奨フォントのインストール（いずれか一つ）
brew install font-hack-nerd-font
brew install font-jetbrains-mono-nerd-font  
brew install font-fira-code-nerd-font
brew install font-meslo-lg-nerd-font
```

#### Linux

```bash
# フォントディレクトリを作成
mkdir -p ~/.local/share/fonts

# Hack Nerd Fontをダウンロードして展開
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip
unzip Hack.zip -d ~/.local/share/fonts/Hack/
rm Hack.zip

# フォントキャッシュを更新
fc-cache -fv
```

#### ターミナルでフォント設定

インストール後、使用しているターミナルエミュレーターでNerd Fontを設定してください：

- **iTerm2** (macOS): Preferences > Profiles > Text > Font
- **Terminal** (macOS): Preferences > Profiles > Font  
- **GNOME Terminal** (Linux): Preferences > Profiles > Text
- **Windows Terminal**: Settings > Profiles > Appearance > Font face

## インストール手順

### 1. 既存設定のバックアップ

```bash
# 既存のNeovim設定をバックアップ
if [ -d ~/.config/nvim ]; then
    mv ~/.config/nvim ~/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)
fi

if [ -d ~/.local/share/nvim ]; then
    mv ~/.local/share/nvim ~/.local/share/nvim.backup.$(date +%Y%m%d_%H%M%S)  
fi

if [ -d ~/.local/state/nvim ]; then
    mv ~/.local/state/nvim ~/.local/state/nvim.backup.$(date +%Y%m%d_%H%M%S)
fi

if [ -d ~/.cache/nvim ]; then
    mv ~/.cache/nvim ~/.cache/nvim.backup.$(date +%Y%m%d_%H%M%S)
fi
```

### 2. 設定ファイルのインストール

#### GitHubからクローン（推奨）

```bash
git clone https://github.com/your-username/modern-nvim-config.git ~/.config/nvim
```

#### 手動コピー

デスクトップにダウンロードした場合：

```bash
cp -r ~/Desktop/modern-nvim-config ~/.config/nvim
```

### 3. 権限設定

```bash
# 設定ファイルの権限を確認・修正
chmod -R 755 ~/.config/nvim
```

## 初回起動と設定

### 初回起動

```bash
# Neovimを起動
nvim
```

初回起動時に以下が自動実行されます：

1. **Lazy.nvimのインストール**
   - プラグインマネージャーが自動でインストール

2. **プラグインのダウンロード・インストール**
   - 全プラグインが自動でダウンロード・インストール
   - 進行状況がリアルタイム表示

3. **LSPサーバーのインストール**
   - Mason経由で各言語のLSPサーバーが自動インストール

4. **Tree-sitterパーサーのインストール**
   - シンタックスハイライト用パーサーがインストール

### インストール状況の確認

#### プラグインの確認

```vim
:Lazy
```

- 緑のチェックマーク: インストール完了
- 赤いX: インストール失敗
- 黄色の時計: インストール中

#### LSPサーバーの確認

```vim
:Mason
```

- インストール済みツール一覧
- 利用可能ツール一覧
- インストール状況

#### Tree-sitterの確認

```vim
:TSInstallInfo
```

インストール済みパーサー一覧を表示。

### 問題が発生した場合

#### プラグインの再インストール

```vim
:Lazy clean
:Lazy sync
```

#### LSPサーバーの再インストール

```vim
:MasonUninstallAll
:MasonInstall lua-language-server typescript-language-server pyright rust-analyzer
```

#### Tree-sitterパーサーの再インストール

```vim
:TSUninstall all
:TSInstall lua javascript typescript python rust go
```

## 言語別設定

### JavaScript/TypeScript

デフォルトでサポート済み。追加設定：

```bash
# プロジェクトでのeslint設定
npm install -D eslint prettier
```

### Python

デフォルトでサポート済み。追加設定：

```bash
# 仮想環境での作業推奨
python -m venv venv
source venv/bin/activate  # Linux/Mac
# venv\Scripts\activate   # Windows

# 開発ツールのインストール
pip install black flake8 mypy
```

### Rust

デフォルトでサポート済み。追加確認：

```bash
# Rustツールチェーンがインストール済みか確認
rustc --version
cargo --version

# インストールされていない場合
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### Go

デフォルトでサポート済み。追加確認：

```bash
# Goがインストール済みか確認
go version

# インストールされていない場合
# https://golang.org/dl/ からダウンロード
```

### C/C++

デフォルトでサポート済み。追加設定：

```bash
# macOS
xcode-select --install

# Ubuntu/Debian
sudo apt install build-essential clang

# Arch Linux  
sudo pacman -S base-devel clang
```

### 追加言語のサポート

新しい言語を追加するには：

1. `lua/plugins/lsp.lua`を編集
2. `servers`セクションに言語サーバー追加
3. `:Mason`で手動インストールまたは再起動で自動インストール

```lua
servers = {
  -- 既存の設定...
  
  -- Java例
  jdtls = {},
  
  -- PHP例  
  phpactor = {},
  
  -- Ruby例
  solargraph = {},
}
```

## カスタマイズ

### 個人設定の追加

#### オプション設定

`lua/config/options.lua`に個人設定を追加：

```lua
-- 個人設定例
local opt = vim.opt

-- 行番号の表示スタイル
opt.number = true           -- 行番号表示
opt.relativenumber = false  -- 相対行番号を無効化

-- タブ設定
opt.tabstop = 4            -- タブ幅を4に変更
opt.shiftwidth = 4         -- インデント幅を4に変更

-- 見た目の設定
opt.wrap = true            -- 行の折り返しを有効化
opt.colorcolumn = "120"    -- 120文字目にラインを表示
```

#### カスタムキーマップ

`lua/config/keymaps.lua`に追加：

```lua
local map = vim.keymap.set

-- カスタムキーマップ例
map("n", "<leader>w", ":w<cr>", { desc = "Quick save" })
map("n", "<leader>x", ":x<cr>", { desc = "Save and quit" })
map("n", "<C-a>", "ggVG", { desc = "Select all" })

-- 日本語入力時のESCマッピング  
map("i", "jj", "<Esc>", { desc = "Exit insert mode" })
```

#### 新しいプラグインの追加

`lua/plugins/`に新しいファイルを作成：

```lua
-- lua/plugins/my-plugins.lua
return {
  -- プラグイン例：自動保存
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup({
        enabled = true,
        execution_message = {
          message = function()
            return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
          end,
          dim = 0.18,
          cleaning_interval = 1250,
        },
      })
    end,
  },
  
  -- プラグイン例：スムーズスクロール
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup()
    end,
  },
}
```

### カラースキームの変更

#### デフォルトテーマの変更

`lua/plugins/colorscheme.lua`を編集：

```lua
-- Catppuccin設定
config = function(_, opts)
  require("catppuccin").setup(opts)
  -- デフォルトテーマを変更
  vim.cmd.colorscheme("tokyonight")  -- Tokyo Nightに変更
  -- vim.cmd.colorscheme("onedark")     -- OneDarkに変更
  -- vim.cmd.colorscheme("rose-pine")   -- Rose Pineに変更
end,
```

#### 新しいカラースキームの追加

```lua
-- 新しいカラースキーム追加例
{
  "EdenEast/nightfox.nvim",
  lazy = true,
  config = function()
    require("nightfox").setup({
      options = {
        transparent = false,
        terminal_colors = true,
      }
    })
  end,
},
```

### ステータスラインのカスタマイズ

`lua/plugins/ui.lua`内のLualine設定を編集：

```lua
opts = function()
  return {
    -- 既存設定...
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = {
        "filename",
        -- カスタム情報を追加
        {
          function()
            return "🚀 Neovim"
          end,
        },
      },
      -- カスタムセクション
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { 
        "location",
        -- 現在時刻を表示
        {
          function()
            return os.date("%H:%M")
          end,
        },
      },
    },
  }
end,
```

## パフォーマンス調整

### 起動時間の最適化

#### 起動時間の測定

```bash
# 起動時間を測定
nvim --startuptime startup.log
cat startup.log | tail -1
```

#### プラグインの遅延読み込み調整

不要なプラグインを無効化：

```lua
-- lua/plugins/disabled.lua
return {
  -- プラグインを無効化する例
  { "plugin-name", enabled = false },
}
```

#### Lazy loading の調整

```lua
-- より積極的な遅延読み込み
{
  "heavy-plugin",
  event = "VeryLazy",  -- より遅く読み込み
  cond = function()    -- 条件付き読み込み
    return vim.fn.executable("required-command") == 1
  end,
}
```

### メモリ使用量の最適化

#### 不要な機能の無効化

```lua
-- lua/config/options.lua
-- 重い機能を無効化
vim.opt.backup = false
vim.opt.writebackup = false  
vim.opt.swapfile = false

-- 履歴サイズを調整
vim.opt.history = 500
vim.opt.undolevels = 500
```

## アンインストール

### 完全削除

```bash
# 設定ディレクトリを削除
rm -rf ~/.config/nvim

# データディレクトリを削除  
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

# バックアップから復元（必要な場合）
mv ~/.config/nvim.backup ~/.config/nvim
```

### 一時的な無効化

```bash
# 設定を一時的に無効化
mv ~/.config/nvim ~/.config/nvim.disabled

# 標準のNeovimで起動
nvim

# 設定を復元
mv ~/.config/nvim.disabled ~/.config/nvim
```

## 追加リソース

### 学習リソース

- [Neovim公式ドキュメント](https://neovim.io/doc/)
- [Lua学習](https://learnxinyminutes.com/docs/lua/)
- [Vim操作の基礎](https://vim-adventures.com/)

### コミュニティ

- [r/neovim](https://www.reddit.com/r/neovim/)
- [Neovim Discord](https://discord.gg/neovim)
- [GitHub Discussions](https://github.com/neovim/neovim/discussions)

### 関連ツール

- [LazyGit](https://github.com/jesseduffield/lazygit) - Git GUI
- [Ripgrep](https://github.com/BurntSushi/ripgrep) - 高速検索
- [FD](https://github.com/sharkdp/fd) - 高速ファイル検索
- [Nerd Fonts](https://www.nerdfonts.com/) - アイコンフォント

この設定により、最新のIDE機能を備えた効率的なNeovim環境を構築できます。