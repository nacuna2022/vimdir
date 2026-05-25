set encoding=utf-8

" nacuna??? note to self. vim-plug is your package manager. not vundle
"

set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'Raimondi/delimitMate'
Plug 'ryanoasis/vim-devicons'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'chrisbra/unicode.vim'
Plug 'mg979/vim-visual-multi'
Plug 'dense-analysis/ale'

call plug#end()

" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

"filetype plugin indent on    " required

autocmd FileType make setlocal noexpandtab

"syntax on

colorscheme inkpot



let g:airline_theme='simple'
let g:airline_powerline_fonts=1

set nowrap
set ruler
set backspace=2
set backspace=indent,eol,start

set tabstop=8
set shiftwidth=8
"set expandtab "for converting tabs to spaces
set noexpandtab "for not converting tabs to spaces

set cc=80
set smartindent
set autoindent

"select fonts by typing set guifont=*

"set guifont=Consolas:h10:cANSI
"set guifont=Inconsolata:h10:cANSI
"set guifont=FiraMono\Nerd\ Font\ 10

set hlsearch

"remove arrows keys bindings - they are annoying
noremap <Up> <nop>
noremap <Down> <nop>
noremap  <Left> <nop>
noremap <Right> <nop>

" map F5 to today's date in insert mode
inoremap <F5> <C-R>=strftime("[%b-%d-%Y %a]")<CR>

set guioptions-=m "remove menu bar
set guioptions-=T "remove tool bar
set guioptions-=r " remove right hand scrollbar

nnoremap <silent> <F8> :TlistToggle<CR>
"nnoremap <F12> :Explore<CR>
nnoremap <F12> :NERDTreeToggle<CR>
nnoremap <F11> :TagbarToggle<CR>
"nnoremap <F10> :YcmCompleter GoToInclude<CR>
nnoremap <F10> :FZF<CR>

set number

" window resizing stuff
nnoremap <silent> <C-h> :vertical resize -3<CR>
nnoremap <silent> <C-l> :vertical resize +3<CR>

nnoremap <silent> <C-j> :res -3<CR>
nnoremap <silent> <C-k> :res +3<CR>

"status line 
"set laststatus=2
"set statusline=
"set statusline+=%f%m
"set statusline+=%=%y\ %l,%c\ %p%%\  

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


let g:netrw_liststyle = 3

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0

" orgmode settings
let g:org_prefer_insert_mode = 0
let g:org_aggressive_conceal = 0
let g:org_indent = 1
let g:org_todo_keywords = [['TODO(t)', 'INPROGRESS(i)', '|', 'DONE(d)'],
      \ ['REPORT(r)', 'BUG(b)', 'KNOWNCAUSE(k)', '|', 'FIXED(f)'],
      \ ['CANCELED(c)']]



" vimwiki settings

" define my own wiki on the usual "custom" git repo
let main_wiki = {}
let main_wiki.path = '~/git/vimwiki/'
let g:vimwiki_list = [main_wiki]

" ALE Asynchronous Lint Engine 
let g:ale_linters = {
	\ 'c': ['cppcheck'],
	\ 'cpp': ['cppcheck'],
\ }

let g:ale_cppcheck_options = '--enable=warning,style,performance,portability,unusedFunction --inconclusive --force --check-level=exhaustive --std=c11'
"let g:ale_cppcheck_options = '--enable=all --check-level=exhaustive --std=c11'
