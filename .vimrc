set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'mattn/emmet-vim'
Plugin 'simeji/winresizer'
Plugin 'arcticicestudio/nord-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'skanehira/vsession'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'cohama/lexima.vim'
Plugin 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
  \ 'javascript',
  \ 'typescript',
  \ 'css',
  \ 'scss',
  \ 'json',
  \ 'graphql',
  \ 'markdown',
  \ 'vue',
  \ 'html' ] }
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'
Plugin 'mattn/vim-lsp-icons'
Plugin 'hrsh7th/vim-vsnip'
Plugin 'hrsh7th/vim-vsnip-integ'
Plugin 'ryanolsonx/vim-lsp-typescript'
Plugin 'leafgarland/typescript-vim'

if executable('ocaml-language-server')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'ocaml-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'ocaml-language-server --stdio']},
        \ 'whitelist': ['reason', 'ocaml'],
        \ })
endif
if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript', 'typescript.tsx'],
        \ })
endif

call vundle#end()
filetype plugin indent on
autocmd BufRead,BufNewFile *.ts set filetype=typescript

let g:ctrlp_custom_ignore = '\v[\/](node_modules|build)$'
let g:EasyMotion_do_mapping = 0

" Visualモードでの連続インデント変更
vnoremap < <gv
vnoremap > >gv

" Tab Completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

set mouse=a
colorscheme nord
" カスタムキーバインディング
let mapleader = "\<Space>"
" Shift + h ブロック上
noremap <S-h> ^
" Shift + l ブロック下
noremap <S-l> $
" Shift + j 行先頭
noremap <S-j> }
" Shift + k 行末
noremap <S-k> {
" m コードブロック内移動
" noremap m %
" Space -> w ファイルを保存
noremap <Leader>w :w<CR>
" Space -> a -> y 全てヤンク
noremap <Leader>ay :%y<CR>
" Tuskuyomi Omni Definition
inoremap <D-i> <C-x><C-o>
inoremap <C-h> <C-x><C-o>
" s EasyMotion
nmap s <Plug>(easymotion-overwin-f2)
" Space -> j カーソル下の行へEasyMotion
map <Leader>j <Plug>(easymotion-j)
" Space -> k カーソル上の行へEasyMotion
map <Leader>k <Plug>(easymotion-k)

"　その他のカスタム設定を以下に書く
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" クリップボードを有効化
set clipboard+=unnamedplus
" Backspace の挙動
set backspace=indent,eol,start


" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" Syntax Highlight
:syntax on

" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2


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
