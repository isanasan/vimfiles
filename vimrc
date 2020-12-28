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
"
"" 見た目系
"" 行番号を表示
set number
"" 現在の行を強調表示
set cursorline
"" 行末の1文字先までカーソルを移動できるように
" set virtualedit=onemore
"" インデントはスマートインデント
set smartindent
"" ビープ音を可視化
" set visualbell
"" 括弧入力時の対応する括弧を表示
set showmatch
"" ステータスラインを常に表示
set laststatus=2
"" コマンドラインの補完
set wildmode=list:longest
"" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

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

Plug 'cocopon/iceberg.vim'
Plug 'ulwlu/elly.vim'

" markdown
Plug 'plasticboy/vim-markdown'

" filetree
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'

call plug#end()

" fern settings
let g:fern#renderer = "nerdfont"



" fern toggle command
nnoremap ,t :<c-u>Fern . -drawer -stay -keep -toggle -reveal=%<cr>

" fern open window config
function! s:fern_setup() abort
	nnoremap <buffer> <nowait> q :<c-u>quit<cr>
	nmap <buffer>
		\ <Plug>(fern-action-open)
		\ Plug>(fern-action-open:select)
endfunction

augroup __fern__
	au!
	autocmd VimEnter * ++nested Fern . -drawer -stay -keep -toggle -reveal=%
	autocmd FileType fern call s:fern_setup()
augroup END

"syntax enable
set termguicolors
" colorscheme iceberg
colorscheme elly

" 各種設定の読み込み
call map(sort(split(globpath(&runtimepath, '_config/*.vim'))), {->[execute('exec "so" v:val')]})
