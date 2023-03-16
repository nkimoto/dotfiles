set encoding=utf-8
set nowritebackup
" ファイルを上書きする前にバックアップを作ることを無効化
set nobackup
" vim の矩形選択で文字が無くても右へ進める
set virtualedit=block
" 全角文字専用の設定
set ambiwidth=double
" wildmenuオプションを有効(vimバーからファイルを選択できる)
set wildmenu

"----------------------------------------
" キーマップ
"----------------------------------------
" leader keyをカンマに変更
let mapleader = ','
noremap <leader>w :wq<cr>
" セミコロン(;) → コロン(:)
nnoremap ; :
vnoremap ; :


"----------------------------------------
" 検索
"----------------------------------------
" 検索するときに大文字小文字を区別しない
set ignorecase
" 小文字で検索すると大文字と小文字を無視して検索
set smartcase
" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
set wrapscan
" インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set incsearch
" 検索結果をハイライト表示
set hlsearch

"----------------------------------------
" 表示設定
"----------------------------------------
" 表示するMAXの文字数
" set textwidth=80
" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells
" Windowsでパスの区切り文字をスラッシュで扱う
set shellslash
" 対応する括弧やブレースを表示
set showmatch matchtime=1
" インデント方法の変更
set cinoptions+=:0
" メッセージ表示欄を2行確保
set cmdheight=2
" ステータス行を常に表示
set laststatus=2
" ウィンドウの右下にまだ実行していない入力中のコマンドを表示
set showcmd
" 省略されずに表示
set display=lastline
" タブ文字を CTRL-I で表示し、行末に $ で表示する
set list
" 行末のスペースを可視化
set listchars=tab:^\ ,trail:~
" コマンドラインの履歴を10000件保存する
set history=10000
" コメントの色を水色
hi Comment ctermfg=3
" タブキー押下時に挿入される文字幅を指定
set softtabstop=4
" ツールバーを非表示にする
set guioptions-=T
" yでコピーした時にクリップボードに入る
set guioptions+=a
" メニューバーを非表示にする
set guioptions-=m
" 右スクロールバーを非表示
set guioptions+=R
" 対応する括弧を強調表示
set showmatch
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" スワップファイルを作成しない
set noswapfile
" 検索にマッチした行以外を折りたたむ(フォールドする)機能
set nofoldenable
" タイトルを表示
set title
" 端末が広い場合、行番号の表示
if &co > 80
    set number
endif
" ヤンクでクリップボードにコピー
set clipboard=unnamedplus,autoselect
" Escの2回押しでハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
" シンタックスハイライト
syntax on
" すべての数を10進数として扱う
set nrformats=
" 行をまたいで移動
set whichwrap=b,s,h,l,<,>,[,],~
" バッファスクロール
set mouse=a

" auto reload .vimrc
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

" auto comment off
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

" HTML/XML閉じタグ自動補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

" 編集箇所のカーソルを記憶
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif

" Python linters
let g:syntastic_python_checkers = ['flake8', 'mypy'] " 'pyflakes','pep8']
let g:syntastic_python_flake8_args = '--ignore="E203, W503"'
autocmd BufWritePre *.py execute ':Black'
let g:black_linelength = 79

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

filetype off



" ファイルタイプごとのインデントを有効化
filetype plugin indent on
" ファイル内にあるタブ文字の表示幅
set tabstop=4
" 入力モードでTabキー押下時に半角スペースを挿入
set expandtab
" 自動インデント幅
set shiftwidth=4
" 挿入モードでバックスペースで削除できるようにする
set backspace=indent,eol,start
" カラースキーマを変更
" colscheme murphy

" Swapファイルを格納するディレクトリを設定
set directory=$HOME/.vim/swap//
" すべてのファイルについて永続的なUndoを作成
set undofile
if !isdirectory(expand("$HOME/.vim/undodir"))
    call mkdir(expand("$HOME/.vim/undodir"), "p")
endif
set undodir=$HOME/.vim/undodir

" プラグインをロードする
" packloadall
" プラグイン用にヘルプファイルをロードする
" silent! helptag ALL

" 起動時にブックマーク表示
" let NEDTreeShowBoolmarks = 1

au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead *.smk set syntax=snakemake
set t_RV=



"----------------------------------------
" vim-plugの設定
"----------------------------------------

" Install vim-plug if it's not already installed (Unix-only).
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()
Plug 'scrooloose/syntastic'
Plug 'Shougo/vimshell'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neocomplcache'
Plug 'Shougo/neosnippet'
Plug 'jpalardy/vim-slime'
Plug 'Shougo/vimfiler.vim'
Plug 'itchyny/lightline.vim'
Plug 't9md/vim-textmanip'
Plug 'Shougo/unite.vim'
Plug 'tomasr/molokai'
Plug 'Shougo/neocomplcache'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'tpope/vim-unimpaired'" bufferのマッピング
"editorconfig: 人間関係を崩さないためのEditorConfig
Plug 'editorconfig/editorconfig-vim'
let g:plug_timeout = 300
Plug 'ycm-core/YouCompleteMe', {'do': './install.py'}
" アンドゥーツリー
if has('python3')
    let g:gundo_prefer_python3 = 1
endif
Plug 'sjl/gundo.vim'

" gitと統合
Plug 'tpope/vim-fugitive'

" Color scheme
Plug 'NLKNguyen/papercolor-theme'

" Python black lint
Plug 'psf/black', { 'branch': 'main' }

" Python isort
Plug 'fisadev/vim-isort'

" julia-vim
Plug 'JuliaEditorSupport/julia-vim'
"let g:latex_to_unicode_auto = 1

" JuliaFormatter
Plug 'kdheepak/JuliaFormatter.vim'

" Markdown preview
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'previm/previm'
let g:vim_markdown_folding_disabled = 1
let g:previm_enable_realtime = 1
let g:previm_open_cmd = 'open -a Google\ Chrome'

call plug#end()

" カラースキーマを選択
set background=dark
colorscheme PaperColor
