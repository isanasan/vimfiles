set nocompatible
set enc=utf-8
set fencs=ucs-bom,utf-8,iso-2022-jp,euc-jp,cp932,utf-16le,utf-16,default
"文字コードをUFT-8に設定
"scriptencoding utf-8
"" バックアップファイルを作らない
set nobackup
"" スワップファイルを作らない
set noswapfile
"" 編集中のファイルが変更されたら自動で読み直す
set autoread
"" バッファが編集中でもその他のファイルを開けるように
set hidden
"" 入力中のコマンドをステータスに表示する
set showcmd
" クリップボードを使う
set clipboard+=unnamed

" 挿入モードでバックスペースで削除できるようにする
set backspace=indent,eol,start

"" コマンドラインの補完
set wildmode=list:longest
" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

call plug#begin('~/.vim/plugged')

	Plug 'vim-jp/vimdoc-ja'

	" 見た目関係
	Plug 'cocopon/iceberg.vim'
	Plug 'ulwlu/elly.vim'
	Plug 'vim-airline/vim-airline'

	" markdown
	Plug 'plasticboy/vim-markdown'

	" filetree
	Plug 'lambdalisue/nerdfont.vim'
	Plug 'lambdalisue/fern.vim'
	Plug 'lambdalisue/fern-renderer-nerdfont.vim'

	"ctrlP
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'mattn/ctrlp-matchfuzzy'
	Plug 'mattn/ctrlp-launcher'
	Plug 'mattn/ctrlp-lsp'
	Plug 'mattn/ctrlp-yo'
	Plug 'mattn/ctrlp-git'

	"vimlsp
	Plug 'prabirshrestha/async.vim'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/asyncomplete-lsp.vim'
	Plug 'prabirshrestha/vim-lsp'
	Plug 'mattn/vim-lsp-settings'
	Plug 'mattn/vim-lsp-icons'
	Plug 'hrsh7th/vim-vsnip'
	Plug 'hrsh7th/vim-vsnip-integ'

	Plug 'mattn/vim-lexiv'

	Plug 'tyru/caw.vim'

call plug#end()

set helplang=ja,en

" =============
"" 見た目系
" =============
"" 行番号を表示
set number
"" 現在の行を強調表示
set cursorline
"" インデントはスマートインデント
set smartindent
"" 括弧入力時の対応する括弧を表示
set showmatch
"" ステータスラインを常に表示
set laststatus=2
syntax enable
set termguicolors
colorscheme iceberg
" colorscheme elly
set bg=dark
" let g:airline_theme='elly'
let g:airline_theme='iceberg'
let g:airline#extensions#tabline#enabled = 1

" 各種設定の読み込み
call map(sort(split(globpath(&runtimepath, '_config/*.vim'))), {->[execute('exec "so" v:val')]})
