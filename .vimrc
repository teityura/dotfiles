syntax on
autocmd ColorScheme * highlight Comment ctermfg=100
colorscheme molokai

set enc=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac

" 起動, 挿入, 通常, 終了 でカーソルを切り替える
let &t_ti .= "\e[1 q"
let &t_SI .= "\e[5 q"
let &t_EI .= "\e[1 q"
let &t_te .= "\e[0 q"

" タブ, 行末スペースなどを可視化する
set listchars=eol:↲,tab:>\-,trail:-,extends:>,precedes:<,nbsp:%
set list

" 全角スペースの背景を白に変更
" autocmd Colorscheme * highlight FullWidthSpace ctermbg=white
" autocmd VimEnter * match FullWidthSpace /　/

" 拡張子ごとにタブ数を指定
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set t_Co=256
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.sql setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.css setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.htm setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" スクロール関連
" set cursorline # 重くなるのでコメントアウト
set scrolloff=5
set scrollopt=ver,hor,jump
set scrollbind

set number
set guioptions+=b

highlight LineNr ctermfg=cyan
set title

set incsearch
set smartcase
set hlsearch
set showmatch

set noswapfile
set autoread

set wildmenu
set showcmd

set backspace=indent,eol,start

" マウス
" set mouse=a
" set ttymouse=xterm2

" バインド
 noremap <C-a> <Esc>^i
inoremap <C-a> <Esc>^i
 noremap <C-e> <Esc>$a
inoremap <C-e> <Esc>$a
 noremap <C-z> <Esc>u
inoremap <C-z> <Esc>u
 noremap <C-ScrollWheelUp> <Esc>zh
inoremap <C-ScrollWheelUp> <Esc>zh
 noremap <C-ScrollWheelDown> <Esc>zl
inoremap <C-ScrollWheelDown> <Esc>zl

 noremap <C-S-Left> <Esc><C-w>100<<CR>
inoremap <C-S-Left> <Esc><C-w>100<<CR>
 noremap <C-S-Right> <Esc><C-w>100><CR>
inoremap <C-S-Right> <Esc><C-w>100><CR>
 noremap <C-S-Up> <Esc><C-w>==<CR>
inoremap <C-S-Up> <Esc><C-w>==<CR>

nnoremap sp :set paste<CR>
nnoremap <Tab>w :set nonumber<CR>: set nolist<CR>
nnoremap <Tab>e :set number<CR>: set list<CR>
nnoremap <Tab>q :q! <CR>
nnoremap ap :set paste<CR>ggdGi
cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>
cnoremap q! qa!<CR>
