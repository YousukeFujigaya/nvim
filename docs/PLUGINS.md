# プラグイン詳細ガイド

このドキュメントでは、Modern Neovim Configurationに含まれる各プラグインの詳細な使用方法と設定について説明します。

## 📦 プラグインマネージャー

### Lazy.nvim

**概要**: 最新のNeovim用プラグインマネージャー

**特徴**:
- 遅延読み込みによる高速起動
- 自動的な依存関係解決
- 美しいUI
- Git統合

**主なコマンド**:
```vim
:Lazy              " プラグイン管理画面を開く
:Lazy sync         " 全プラグインを更新・インストール
:Lazy update       " 更新可能なプラグインを更新
:Lazy clean        " 未使用プラグインを削除
:Lazy profile      " 起動時間プロファイル表示
:Lazy log         " 変更ログを表示
```

**キーマップ**:
- `<leader>l` - Lazy画面を開く

---

## 🧠 LSP（Language Server Protocol）

### nvim-lspconfig

**概要**: Neovim用LSPクライアント設定

**機能**:
- コード補完
- エラー・警告表示
- 定義・参照ジャンプ
- ホバー情報
- コードアクション
- リファクタリング

**対応言語**:
- JavaScript/TypeScript (tsserver)
- Python (pyright)
- Rust (rust-analyzer)  
- Go (gopls)
- C/C++ (clangd)
- Lua (lua_ls)
- HTML/CSS
- JSON/YAML

**キーマップ**:
```vim
gd              " 定義に移動
gr              " 参照一覧
gI              " 実装に移動
K               " ホバー情報
<leader>ca      " コードアクション
<leader>rn      " シンボル名変更
<leader>D       " 型定義
[d / ]d         " 診断間移動
```

### Mason.nvim

**概要**: LSPサーバー、DAP、リンター、フォーマッターの管理

**機能**:
- ワンクリックインストール
- 自動更新
- クロスプラットフォーム対応

**コマンド**:
```vim
:Mason                " Mason画面を開く
:MasonInstall <name>  " 指定ツールをインストール
:MasonUninstall <name>" 指定ツールをアンインストール
:MasonUpdate          " 全ツールを更新
```

**自動インストールされるツール**:
- Language Servers: lua-language-server, typescript-language-server, pyright等
- Formatters: prettier, stylua, shfmt等
- Linters: eslint等

### nvim-cmp (補完エンジン)

**概要**: 強力な自動補完システム

**補完ソース**:
- LSPサーバーからの補完
- ファイルパス補完
- バッファ内テキスト補完
- スニペット補完
- コマンドライン補完

**キーマップ**:
```vim
<C-n>           " 次の候補
<C-p>           " 前の候補
<C-Space>       " 補完メニュー表示
<CR>            " 候補を確定
<Tab>           " 次の候補/スニペット展開
<S-Tab>         " 前の候補/スニペット戻る
<C-e>           " 補完を閉じる
```

---

## 🔍 ファイル・検索機能

### Telescope.nvim

**概要**: 強力なファジーファインダー

**機能**:
- ファイル検索
- テキスト検索（ripgrep使用）
- バッファ検索
- Git操作
- LSP機能統合

**主なコマンド**:
```vim
:Telescope find_files     " ファイル検索
:Telescope live_grep      " テキスト検索
:Telescope buffers        " バッファ一覧
:Telescope help_tags      " ヘルプタグ検索
:Telescope oldfiles       " 最近のファイル
:Telescope git_files      " Gitファイル検索
:Telescope lsp_references " LSP参照検索
```

**キーマップ**:
```vim
<leader>ff      " ファイル検索
<leader>fg      " テキスト検索
<leader>fb      " バッファ検索
<leader>fr      " 最近のファイル
<leader>fh      " ヘルプ検索
<leader>fc      " カラースキーム選択
<C-p>           " クイックファイル検索
<leader>/       " プロジェクト検索
```

**Telescope内キーマップ**:
```vim
<C-j/k>         " カーソル移動
<C-q>           " クイックフィックスリストに送信
<Esc>           " 閉じる
<CR>            " 選択して開く
<C-x>           " 水平分割で開く
<C-v>           " 垂直分割で開く
<C-t>           " タブで開く
```

### Neo-tree.nvim

**概要**: モダンなファイルエクスプローラー

**機能**:
- ツリー表示でのファイル管理
- Git状態表示
- ファイル操作（作成、削除、リネーム等）
- プレビュー機能
- 複数のソース（ファイルシステム、バッファ、Git）

**キーマップ**:
```vim
<leader>e       " Neo-tree開閉
<leader>E       " 現在ファイルを表示
```

**Neo-tree内操作**:
```vim
<CR>            " ファイル/フォルダーを開く
<Space>         " ノードを展開/折りたたみ
a               " ファイル作成
A               " ディレクトリ作成
d               " 削除
r               " リネーム
c               " コピー
x               " カット
p               " ペースト
s               " 垂直分割で開く
S               " 水平分割で開く
t               " タブで開く
P               " プレビュー
?               " ヘルプ表示
```

---

## 🎨 UI・表示機能

### Catppuccin (カラースキーム)

**概要**: パステル調の美しいカラーテーマ

**バリエーション**:
- Latte (ライトテーマ)
- Frappé (中間トーン) 
- Macchiato (ダーク)
- Mocha (最もダーク、デフォルト)

**切り替え**:
```vim
:colorscheme catppuccin
:colorscheme catppuccin-latte
:colorscheme catppuccin-frappe  
:colorscheme catppuccin-macchiato
:colorscheme catppuccin-mocha
```

### Lualine.nvim

**概要**: 情報豊富なステータスライン

**表示情報**:
- 現在のモード
- Gitブランチ名
- ファイル名とパス
- 診断情報（エラー・警告数）
- ファイル形式・エンコーディング
- 現在位置・進行状況
- 時刻

### Bufferline.nvim

**概要**: タブ風バッファ管理

**機能**:
- 視覚的なバッファ表示
- Git状態統合
- 診断情報表示
- バッファピン機能

**キーマップ**:
```vim
<S-h>           " 前のバッファ
<S-l>           " 次のバッファ
<leader>bp      " バッファをピン
<leader>bo      " 他のバッファを閉じる
<leader>br      " 右のバッファを閉じる
<leader>bl      " 左のバッファを閉じる
```

### Alpha-nvim (ダッシュボード)

**概要**: 美しいスタートスクリーン

**機能**:
- カスタムロゴ表示
- クイックアクション
- 最近のファイル
- プラグイン読み込み情報

**クイックアクション**:
- `f` - ファイル検索
- `n` - 新規ファイル
- `r` - 最近のファイル
- `g` - テキスト検索
- `c` - 設定ファイル
- `s` - セッション復元
- `l` - Lazy
- `q` - 終了

### Noice.nvim & nvim-notify

**概要**: 改善されたUI通知システム

**機能**:
- アニメーション通知
- コマンドライン強化
- メッセージ履歴
- LSPドキュメント強化

**コマンド**:
```vim
:Noice                " Noice画面表示
:Noice history        " メッセージ履歴
:Noice dismiss        " 通知を閉じる
```

**キーマップ**:
```vim
<leader>un          " 全通知を閉じる
```

---

## 📝 Git統合

### Gitsigns.nvim

**概要**: Git変更の視覚化とハンク操作

**機能**:
- 行番号横にGit状態表示
- ハンクのプレビュー・操作
- Blame情報表示
- Git差分表示

**キーマップ**:
```vim
]c / [c         " ハンク間移動
<leader>hs      " ハンクをステージ
<leader>hr      " ハンクをリセット  
<leader>hS      " バッファ全体をステージ
<leader>hu      " ハンクステージを取り消し
<leader>hp      " ハンクプレビュー
<leader>hb      " Blame表示
<leader>hd      " 差分表示
<leader>tb      " Blame表示切り替え
```

### LazyGit.nvim

**概要**: LazyGit統合

**機能**:
- 統合Git GUI
- コミット・プッシュ・プル
- ブランチ管理
- マージ・リベース

**キーマップ**:
```vim
<leader>gg      " LazyGitを開く
```

### vim-fugitive

**概要**: Git操作の完全統合

**主なコマンド**:
```vim
:G              " Git status
:Git commit     " コミット
:Git push       " プッシュ
:Git pull       " プル
:Gdiffsplit     " 差分表示
:Gblame         " Blame表示
:Glog           " ログ表示
```

**キーマップ**:
```vim
<leader>gs      " Git status
<leader>gc      " Git commit
<leader>gd      " Git diff
<leader>gb      " Git blame
<leader>gl      " Git log
```

---

## 🛠 開発ツール

### nvim-dap (デバッガー)

**概要**: Debug Adapter Protocol統合

**対応言語**:
- JavaScript/Node.js
- Python
- C/C++
- Rust
- Go

**キーマップ**:
```vim
<F5>            " デバッグ開始/続行
<F1>            " ステップイン
<F2>            " ステップオーバー
<F3>            " ステップアウト
<leader>b       " ブレークポイント切り替え
<leader>B       " 条件付きブレークポイント
<F7>            " デバッガーUI表示切り替え
```

### ToggleTerm.nvim

**概要**: 統合ターミナル

**機能**:
- フローティング・分割ターミナル
- 複数ターミナル管理
- カスタムターミナル（lazygit, python等）

**キーマップ**:
```vim
<C-\>           " フローティングターミナル
<leader>tf      " フローティングターミナル
<leader>th      " 水平分割ターミナル
<leader>tv      " 垂直分割ターミナル
```

**ターミナル内キーマップ**:
```vim
<Esc><Esc>      " ノーマルモードに戻る
<C-h/j/k/l>     " ウィンドウ間移動
```

---

## ✏️ 編集機能

### nvim-autopairs

**概要**: 括弧・引用符の自動ペア

**機能**:
- 開き括弧入力時に自動で閉じ括弧を追加
- 引用符の自動ペア
- タグの自動閉じ（HTML/XML）

### nvim-surround

**概要**: テキストの囲み文字操作

**キーマップ**:
```vim
ys{motion}{char}    " テキストを囲む
ds{char}            " 囲み文字を削除  
cs{old}{new}        " 囲み文字を変更
```

**例**:
```vim
ysiw"               " 単語を"で囲む
ds"                 " "を削除
cs"'                " "を'に変更
```

### Comment.nvim

**概要**: 賢いコメント機能

**キーマップ**:
```vim
gcc             " 現在行をコメント切り替え
gc{motion}      " モーションでコメント切り替え  
gc              " 選択範囲をコメント切り替え（ビジュアル）
gbc             " ブロックコメント切り替え
gco             " 下にコメント行追加
gcO             " 上にコメント行追加
```

### vim-visual-multi

**概要**: マルチカーソル編集

**キーマップ**:
```vim
<C-d>           " 次の同一単語を選択
<C-Up/Down>     " カーソルを上下に追加
```

**使用方法**:
1. `<C-d>`で単語を選択
2. 再度`<C-d>`で次の同一単語も選択
3. 通常の編集操作で一括編集

### Flash.nvim

**概要**: 高速ナビゲーション

**キーマップ**:
```vim
s               " Flash（文字ジャンプ）
S               " Flash Treesitter（AST要素ジャンプ）
r               " Remote Flash（オペレーターモード）  
R               " Treesitter検索（ビジュアル・オペレーター）
<C-s>           " Flash検索切り替え（コマンドライン）
```

---

## 🔧 ユーティリティ

### Which-key.nvim

**概要**: キーバインドヘルプ表示

**機能**:
- キー入力後に利用可能なキーバインド表示
- 階層的なキーマップ管理
- 説明付きヘルプ

### Trouble.nvim

**概要**: 診断情報の整理表示

**キーマップ**:
```vim
<leader>xx      " Trouble切り替え
<leader>xw      " ワークスペース診断
<leader>xd      " ドキュメント診断
<leader>xl      " ロケーションリスト
<leader>xq      " クイックフィックス
gR              " LSP参照（Trouble）
```

### todo-comments.nvim

**概要**: TODOコメント強調表示

**対応キーワード**:
- TODO
- HACK
- WARN
- PERF
- NOTE
- FIX
- FIXME

**キーマップ**:
```vim
]t / [t         " TODOコメント間移動
<leader>xt      " TODO一覧（Trouble）
<leader>st      " TODO検索（Telescope）
```

### persistence.nvim

**概要**: セッション管理

**キーマップ**:
```vim
<leader>qs      " セッション復元
<leader>ql      " 最後のセッション復元
<leader>qd      " セッション保存停止
```

---

## 📊 パフォーマンス最適化

### 遅延読み込み

多くのプラグインは以下のイベントで遅延読み込みされます:

- `BufReadPost` - ファイル読み込み後
- `BufNewFile` - 新規ファイル作成時
- `VeryLazy` - Neovim完全起動後
- `InsertEnter` - 挿入モード開始時
- `CmdlineEnter` - コマンドライン開始時

### キャッシュ最適化

- プラグインキャッシュによる高速起動
- LSPサーバーの適切な設定
- Tree-sitterパーサーのオンデマンド読み込み

この設定により、VS Codeに匹敵する機能性を保ちながら、軽量で高速な編集環境を実現しています。