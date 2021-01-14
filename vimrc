set number
set hidden
set mouse=a
set nocompatible
set noshowmode
set splitbelow

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'




" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Initialize plugin system

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sheerun/vim-polyglot'


Plug 'luochen1990/rainbow'

Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdcommenter'
Plug 'dense-analysis/ale'
Plug 'mg979/vim-visual-multi'
call plug#end()

 colorscheme dracula
 let g:rainbow_active = 1
" Open a NERDTree automatically when vim starts up
autocmd vimenter * NERDTree
" When open change the focus to the file (and not the NERDTree)
autocmd! VimEnter * NERDTree | wincmd w
" close vim if the only window left open is a NERDTree
"
autocmd VimEnter * term ++rows=10
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
