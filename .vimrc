""""""""""""""""""""""""""""""""""""""""""
" Minimal vim configration
""""""""""""""""""""""""""""""""""""""""""

let mapleader = ";"
set shiftwidth=2
set tabstop=2
set autoindent
set expandtab
set smartindent
" system clipboard support
set clipboard+=unnamed
set shiftround    "round > and < to mutipuls of shift width*****
" disable search highlight
" set nohlsearch
"
" neovim, block and blink cursor
" set guicursor=i:block,a:blinkon100
" Use a line cursor within insert mode and a block cursor everywhere else.
" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI.="\e[1 q" "SI = INSERT mode
let &t_SR.="\e[1 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
" turn on line number
set number
set eol
set encoding=utf8
" turnoff bell sound
set belloff=all
syntax on
filetype plugin on

" Custom Key Map
""""""""""""""""""""""""""""""""""""""""""
" jk to exit insert mode
inoremap jk <esc><right>
" space to exit visual mode
vnoremap <space> <esc>
" force quick vim
nnoremap Q :q!<cr>
" force wirte vim
nnoremap W :w!<cr>
" U to redo
nnoremap U :redo<cr>
" insert a new empy line when press enter
nnoremap <cr> o<esc>
" Shortcut to edit THIS configuration file: (e)dit (c)onfiguration
nnoremap <leader>ve :e $MYVIMRC<CR>
" Shortcut to source (reload) THIS configuration file after editing it: (s)ource (c)onfiguraiton
nnoremap <leader>vs :source $MYVIMRC<CR>
" toggle line numbers
nnoremap <silent> <leader>n :set number! number?<CR>
" toggle line wrap
nnoremap <silent> <leader>lw :set wrap! wrap?<CR>

"""""""""""""""""""""""""""""""""""""""""""""""
" Buffer
"
" go to next buffer
nnoremap <C-l> :bn<CR>
" go to previous buffer
nnoremap <C-h> :bp<CR>
" close buffer
nnoremap <silent> <leader>bd :bd<CR>
" kill buffer
nnoremap <silent> <leader>bk :bd!<CR>
" list buffers
" nnoremap <silent> <leader>bl :ls<CR>
" list and select buffer
nnoremap <silent> <leader>bs :ls<CR>:buffer<Space>
" horizontal split with new buffer
nnoremap <silent> <leader>bh :new<CR>;
" vertical split with new buffer
nnoremap <silent> <leader>bv :vnew<CR>

" reselect visual block after indent
xnoremap < <gv
xnoremap > >gv
nmap <d-[> <<
nmap <d-]> >>

"automatically jump to end of text you pasted:
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
nnoremap <leader>p A<space><esc>p
nnoremap <leader>P ^Pa<space><esc>

" Poor man's surround.vim
nmap <space>` gewi`<ESC>ea`<ESC>
nmap <space>' gewi'<ESC>ea'<ESC>
nmap <space>" gewi"<ESC>ea"<ESC>
nmap <space>[ gewi[<ESC>ea]<ESC>
nmap <space>( gewi(<ESC>ea)<ESC>
nmap <space>{ gewi{<ESC>ea}<ESC>

" Remember cursor position
"
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid, when inside an event handler
" (happens when dropping a file on gvim) and for a commit message (it's
" likely a different one than last time).
" https://github.com/vim/vim/blob/3c01c4a02897163996639f6f2604c68eab2bd18b/runtime/defaults.vim#L118
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

" https://github.com/vim/vim/blob/3c01c4a02897163996639f6f2604c68eab2bd18b/runtime/defaults.vim#L1
" import vim default config
"
" if has('vim')
"   source $VIMRUNTIME/defaults.vim
" endif

