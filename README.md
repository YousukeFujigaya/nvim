# Modern Neovim Configuration

> VS Codeに匹敵するモダンなNeovim設定

[![Neovim](https://img.shields.io/badge/Neovim-0.9+-green.svg)](https://neovim.io)
[![Lua](https://img.shields.io/badge/Made%20with-Lua-blue.svg)](https://lua.org)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## 🌟 特徴

このNeovim設定は、最新のプラグインとベストプラクティスを使用してゼロから構築された、VS Codeのような体験を提供する包括的な開発環境です。

### ⚡ 主要機能

- 🚀 **高速起動**: Lazy.nvimによる遅延読み込み
- 🧠 **インテリセンス**: LSP統合による本格的なIDE機能
- 🎨 **美しいUI**: モダンなテーマと直感的なインターフェース
- 🔍 **強力な検索**: ファジーファインダーによる高速ファイル・テキスト検索
- 🌳 **ファイル探索**: アイコン付きサイドバーファイルエクスプローラー
- 📝 **Git統合**: 包括的なGitワークフロー支援
- 🐛 **デバッグ**: 統合デバッガーサポート
- 💾 **セッション管理**: プロジェクトの状態自動保存・復元

## 📸 スクリーンショット

![Dashboard](https://via.placeholder.com/800x400?text=Beautiful+Alpha+Dashboard)
*美しいダッシュボード画面*

![IDE Features](https://via.placeholder.com/800x400?text=IDE+Features+with+LSP)
*LSPによる本格的なIDE機能*

## 🎯 対象ユーザー

- VS Codeからの移行を検討している開発者
- 軽量かつ高性能なエディターを求める人
- カスタマイズ性を重視する開発者
- キーボード中心のワークフローを好む人

## 📋 必要な環境

### 必須要件
- **Neovim** >= 0.9.0
- **Git** >= 2.19.0
- **Node.js** >= 16.0 (LSPサーバー用)

### 推奨要件
- **ripgrep** (高速テキスト検索)
- **fd** (高速ファイル検索)
- **lazygit** (Git GUI)
- **Nerd Font** (アイコン表示)

### フォントのインストール

```bash
# Homebrew (macOS)
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font

# 手動インストール
# https://www.nerdfonts.com/ からダウンロード
```

## 🚀 インストール

### 1. 既存設定のバックアップ

```bash
# 既存のNeovim設定をバックアップ
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
mv ~/.local/state/nvim ~/.local/state/nvim.backup
mv ~/.cache/nvim ~/.cache/nvim.backup
```

### 2. 設定のクローン

```bash
# GitHubからクローン
git clone https://github.com/your-username/modern-nvim-config.git ~/.config/nvim

# または、ダウンロードしてコピー
cp -r modern-nvim-config ~/.config/nvim
```

### 3. 初回起動

```bash
nvim
```

初回起動時に自動的に以下が実行されます：
- プラグインのダウンロード・インストール
- LSPサーバーのインストール
- Treesitterパーサーのインストール

## 📚 プラグイン一覧

<details>
<summary>🔧 コア機能</summary>

| プラグイン | 説明 | 主な機能 |
|----------|------|---------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | モダンプラグインマネージャー | 遅延読み込み、自動更新 |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP設定 | 補完、診断、定義ジャンプ |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | シンタックスハイライト | 高度な構文解析、コードフォールディング |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | 自動補完 | インテリジェントな補完候補 |

</details>

<details>
<summary>🎨 UI/UX</summary>

| プラグイン | 説明 | 主な機能 |
|----------|------|---------|
| [catppuccin](https://github.com/catppuccin/nvim) | カラースキーム | 美しいパステルカラー |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | ステータスライン | 情報表示、Git状態 |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | バッファライン | タブ風バッファ管理 |
| [alpha-nvim](https://github.com/goolord/alpha-nvim) | スタートスクリーン | 美しいダッシュボード |
| [noice.nvim](https://github.com/folke/noice.nvim) | UI強化 | 改善された通知・メッセージ |
| [nvim-notify](https://github.com/rcarriga/nvim-notify) | 通知システム | アニメーション付き通知 |

</details>

<details>
<summary>📁 ファイル管理</summary>

| プラグイン | 説明 | 主な機能 |
|----------|------|---------|
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | ファイルエクスプローラー | サイドバー、Git統合 |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | ファジーファインダー | ファイル検索、テキスト検索 |
| [project.nvim](https://github.com/ahmedkhalf/project.nvim) | プロジェクト管理 | 自動プロジェクト検出 |

</details>

<details>
<summary>🔀 Git統合</summary>

| プラグイン | 説明 | 主な機能 |
|----------|------|---------|
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git表示 | 変更表示、ハンク操作 |
| [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) | Git GUI | 統合Git管理 |
| [vim-fugitive](https://github.com/tpope/vim-fugitive) | Git操作 | コマンドライン Git |
| [git-conflict.nvim](https://github.com/akinsho/git-conflict.nvim) | コンフリクト解決 | マージコンフリクト支援 |

</details>

<details>
<summary>🛠 開発ツール</summary>

| プラグイン | 説明 | 主な機能 |
|----------|------|---------|
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP管理 | LSPサーバー自動インストール |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) | デバッガー | ブレークポイント、ステップ実行 |
| [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) | デバッガーUI | 視覚的デバッグ環境 |
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | ターミナル | 統合ターミナル |

</details>

<details>
<summary>✏️ 編集機能</summary>

| プラグイン | 説明 | 主な機能 |
|----------|------|---------|
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | 自動ペア | 括弧・引用符自動補完 |
| [nvim-surround](https://github.com/kylechui/nvim-surround) | 囲み文字操作 | 括弧・引用符の編集 |
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | コメント | 賢いコメントアウト |
| [vim-visual-multi](https://github.com/mg979/vim-visual-multi) | マルチカーソル | 複数箇所同時編集 |
| [flash.nvim](https://github.com/folke/flash.nvim) | ナビゲーション | 高速移動・ジャンプ |

</details>

## ⌨️ キーマッピング

### 基本操作

| キー | 動作 | 説明 |
|------|------|------|
| `<Space>` | リーダーキー | 全てのカスタムコマンドのプレフィックス |
| `<Esc>` | ハイライト解除 | 検索ハイライトをクリア |
| `<C-s>` | ファイル保存 | 全モードで保存 |

### ファイル・バッファ操作

| キー | 動作 | 説明 |
|------|------|------|
| `<leader>ff` | ファイル検索 | Telescopeでファイルを検索 |
| `<leader>fg` | テキスト検索 | プロジェクト内テキスト検索 |
| `<leader>fb` | バッファ一覧 | 開いているバッファを表示 |
| `<leader>fr` | 最近のファイル | 最近開いたファイル一覧 |
| `<leader>e` | ファイラー | Neo-treeの開閉 |
| `<leader>E` | ファイル表示 | 現在のファイルをファイラーで表示 |
| `<C-p>` | クイックファイル検索 | VS Code風ファイル検索 |
| `<leader>/` | プロジェクト検索 | テキスト検索のエイリアス |

### バッファ・ウィンドウ管理

| キー | 動作 | 説明 |
|------|------|------|
| `<S-h>` / `<S-l>` | バッファ切り替え | 前/次のバッファ |
| `<leader>bd` | バッファ削除 | 現在のバッファを閉じる |
| `<leader>bo` | 他バッファ削除 | 他の全バッファを閉じる |
| `<C-h/j/k/l>` | ウィンドウ移動 | ウィンドウ間の移動 |
| `<leader>w-` | 水平分割 | ウィンドウを水平に分割 |
| `<leader>w\|` | 垂直分割 | ウィンドウを垂直に分割 |

### LSP機能

| キー | 動作 | 説明 |
|------|------|------|
| `gd` | 定義へ移動 | シンボルの定義場所に移動 |
| `gr` | 参照一覧 | シンボルの参照箇所を表示 |
| `gI` | 実装へ移動 | インターフェースの実装に移動 |
| `K` | ドキュメント表示 | ホバー情報を表示 |
| `<leader>ca` | コードアクション | 利用可能なアクションを表示 |
| `<leader>rn` | シンボル名変更 | 変数・関数名をリネーム |
| `[d` / `]d` | 診断移動 | エラー・警告間を移動 |
| `<leader>D` | 型定義 | 型定義を表示 |

### Git操作

| キー | 動作 | 説明 |
|------|------|------|
| `<leader>gg` | LazyGit | Git GUIを開く |
| `<leader>gs` | Git状態 | Fugitive status |
| `<leader>hs` | ハンクステージ | 変更をステージ |
| `<leader>hr` | ハンクリセット | 変更を取り消し |
| `<leader>hp` | ハンクプレビュー | 変更をプレビュー |
| `<leader>hb` | Git blame | 行の変更履歴を表示 |
| `]c` / `[c` | ハンク移動 | Git変更箇所間を移動 |

### ターミナル

| キー | 動作 | 説明 |
|------|------|------|
| `<C-\>` | ターミナル | フローティングターミナル |
| `<leader>tf` | フロート | フローティングターミナル |
| `<leader>th` | 水平ターミナル | 下部にターミナル |
| `<leader>tv` | 垂直ターミナル | 右側にターミナル |
| `<Esc><Esc>` | ノーマルモード | ターミナルからノーマルモードへ |

### デバッグ

| キー | 動作 | 説明 |
|------|------|------|
| `<F5>` | デバッグ開始/続行 | デバッガーの開始または続行 |
| `<F1>` | ステップイン | 関数内に入る |
| `<F2>` | ステップオーバー | 次の行に進む |
| `<F3>` | ステップアウト | 関数から出る |
| `<leader>b` | ブレークポイント | ブレークポイントの切り替え |
| `<F7>` | デバッガーUI | デバッグUIの表示/非表示 |

### 編集機能

| キー | 動作 | 説明 |
|------|------|------|
| `gcc` | 行コメント | 現在行をコメントアウト |
| `gc` | 選択コメント | 選択範囲をコメントアウト |
| `<C-d>` | マルチカーソル | 次の同一単語を選択 |
| `s` | Flash | 高速ジャンプ |
| `S` | Flash Treesitter | AST要素へジャンプ |
| `<A-j/k>` | 行移動 | 行を上下に移動 |

## 🎨 カラースキーム

設定には以下のカラースキームが含まれています：

- **Catppuccin** (デフォルト) - パステル調の美しいテーマ
- **Tokyo Night** - 人気の暗色テーマ
- **OneDark** - Atom風テーマ  
- **Rose Pine** - 落ち着いたトーン

### テーマの変更

```vim
:colorscheme tokyonight
:colorscheme onedark
:colorscheme rose-pine
```

## 🔧 カスタマイズ

### 新しいプラグインの追加

`lua/plugins/`ディレクトリに新しいファイルを作成：

```lua
-- lua/plugins/my-plugin.lua
return {
  "author/plugin-name",
  config = function()
    require("plugin-name").setup({
      -- 設定オプション
    })
  end
}
```

### キーマッピングの追加

`lua/config/keymaps.lua`にカスタムキーマップを追加：

```lua
local map = vim.keymap.set

map("n", "<leader>my", function()
  -- カスタム機能
end, { desc = "My custom function" })
```

### 設定の変更

- **エディタ設定**: `lua/config/options.lua`
- **キーマップ**: `lua/config/keymaps.lua`  
- **プラグイン設定**: `lua/plugins/`以下の各ファイル

## 📋 サポート言語

この設定では以下の言語のLSPサーバーが自動インストールされます：

### フロントエンド
- JavaScript / TypeScript
- HTML / CSS
- JSON

### バックエンド
- Python
- Rust  
- Go
- C / C++
- Lua

### その他
- Bash / Shell
- YAML
- Docker
- Markdown

### 言語サポートの追加

新しい言語のサポートを追加するには：

1. `lua/plugins/lsp.lua`の`servers`セクションに追加
2. `:Mason`を開いてLSPサーバーをインストール

```lua
servers = {
  -- 新しい言語サーバーを追加
  new_language_server = {},
}
```

## 🚨 トラブルシューティング

### プラグインが読み込まれない

```bash
# プラグインを再インストール
:Lazy sync
```

### LSPが動作しない

```bash
# LSPの状態を確認
:LspInfo

# Mason でLSPサーバーを確認
:Mason

# ヘルスチェック
:checkhealth
```

### パフォーマンスの問題

```bash
# 起動時間を分析
:Lazy profile

# プラグインを一時的に無効化
:Lazy disable plugin-name
```

### フォントアイコンが表示されない

1. Nerd Fontがインストールされているか確認
2. ターミナルでNerd Fontが設定されているか確認
3. `nvim-web-devicons`が正しく読み込まれているか確認

### Git機能が動作しない

```bash
# gitがインストールされているか確認
git --version

# lazygitがインストールされているか確認
lazygit --version
```

## 🤝 コントリビュート

バグ報告や機能提案は[Issues](https://github.com/your-username/modern-nvim-config/issues)でお願いします。

プルリクエストも歓迎します：

1. フォークする
2. 機能ブランチを作成 (`git checkout -b feature/amazing-feature`)
3. 変更をコミット (`git commit -m 'Add amazing feature'`)
4. ブランチをプッシュ (`git push origin feature/amazing-feature`)  
5. プルリクエストを作成

## 📚 参考資料

- [Neovim公式ドキュメント](https://neovim.io/doc/)
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [LSP設定ガイド](https://github.com/neovim/nvim-lspconfig)
- [Lua学習リソース](https://learnxinyminutes.com/docs/lua/)

## 📄 ライセンス

MIT License - 詳細は[LICENSE](LICENSE)ファイルを参照してください。

## 🙏 謝辞

このプロジェクトは以下にインスパイアされています：

- [LazyVim](https://github.com/LazyVim/LazyVim)
- [NvChad](https://github.com/NvChad/NvChad)  
- [AstroNvim](https://github.com/AstroNvim/AstroNvim)
- Neovimコミュニティの皆様

---

⭐ このプロジェクトが役に立った場合は、スターをお願いします！