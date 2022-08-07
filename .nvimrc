" minmal noe vim configuration
source ~/.vimrc 

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'
"
" Make sure you use single quotes
"
"
" https://github.com/kyazdani42/nvim-web-devicons
Plug 'kyazdani42/nvim-web-devicons'
" https://github.com/junegunn/fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" https://github.com/nvim-telescope/telescope.nvim
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
" https://github.com/nvim-treesitter/nvim-treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" https://github.com/dense-analysis/ale
Plug 'dense-analysis/ale'
" https://github.com/kyazdani42/nvim-tree.lua
Plug 'kyazdani42/nvim-tree.lua'
" https://github.com/preservim/nerdcommenter
Plug 'preservim/nerdcommenter'
" https://github.com/editorconfig/editorconfig-vim
Plug 'editorconfig/editorconfig-vim'
" https://github.com/nvim-lualine/lualine.nvim
"
"
" Initialize plugin system
call plug#end()


"""""""""""""""""""""""""""""""""""""""
" plugin settings
"""""""""""""""""""""""""""""""""""""""

" https://github.com/kyazdani42/nvim-web-devicons
"""""""""""""""""""""""""""""""""""""""""""""""""
:lua require'nvim-web-devicons'.setup()


" https://github.com/junegunn/fzf
"""""""""""""""""""""""""""""""""
nnoremap <leader>t :NvimTreeToggle<cr>
nnoremap <leader>fz :FZF<cr>


" https://github.com/nvim-telescope/telescope.nvim
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>t :NvimTreeToggle<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>


" https://github.com/kyazdani42/nvim-tree.lua
"""""""""""""""""""""""""""""""""""""""""""""

:lua require("nvim-tree").setup()
:lua vim.opt.splitright = true

" https://github.com/preservim/nerdcommenter
""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>t :NvimTreeToggle<cr>
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

