set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all 
" the plugins.
let mapleader=","

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

set wrap       "Wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Plugins Config ====================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'https://github.com/junegunn/vim-github-dashboard.git'

"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"let g:UltiSnipsEditSplit="vertical"

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
autocmd StdinReadPre * let s:std_in=1

"Syntastic"
Plug 'vim-syntastic/syntastic'

" Make it look amazing 
Plug 'altercation/vim-colors-solarized'

" Pimped out bar at the bottom of current buffer
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Enable Markdown Preview + GitHub flavored markdown
Plug 'nelstrom/vim-markdown-preview'

" Vim Node
Plug 'moll/vim-node'

" JS Syntax
Plug 'jelera/vim-javascript-syntax'

call plug#end()

" NERDTree Mappins
map <Leader>n <esc>:NERDTreeToggle<cr>
map <Leader>r <esc>:NERDTreeFind<cr>
let NERDTreeShowHidden=1

" Color theme (drawing from altercation/vim-colors-solarized Bundle)
"set background=dark
"colorscheme solarized
"color solarized

"set term=xterm-256color
set background=dark
colorscheme solarized
color solarized

"Syntastic"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

:let $PATH .= ':./node_modules/.bin'

"let s:portablepy = kkj'C:\portable\PortablePython_1.1_py2.5.4'
" Add PortablePython's path to $PATH if running on Windows and PortablePython exists
"if (has('win32') || has('win64')) && isdirectory(s:portablepy)
"    let $PATH .= ';' . s:portablepy
"endif


" ====== Make tabs be addressable via Apple+1 or 2 or 3, etc
" Use numbers to pick the tab you want (like iTerm)
map <silent> <D-1> :tabn 1<cr>
map <silent> <D-2> :tabn 2<cr>
map <silent> <D-3> :tabn 3<cr>
map <silent> <D-4> :tabn 4<cr>
map <silent> <D-5> :tabn 5<cr>
map <silent> <D-6> :tabn 6<cr>
map <silent> <D-7> :tabn 7<cr>
map <silent> <D-8> :tabn 8<cr>
map <silent> <D-9> :tabn 9<cr>
