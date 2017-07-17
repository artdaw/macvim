" ================ Plugins ========================

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugins')

Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" NERDTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Syntastic
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

Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'
" (Optional) Multi-entry selection UI.
Plug 'Shougo/denite.nvim'

" (Optional) Completion integration with deoplete.
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" (Optional) Completion integration with nvim-completion-manager.
" Plug 'roxma/nvim-completion-manager'

" (Optional) Showing function signature and inline doc.
Plug 'Shougo/echodoc.vim'

call plug#end()

" ================ Plugins Config ========================

" NERDTree Mappins
map <Leader>n <esc>:NERDTreeToggle<cr>
map <Leader>r <esc>:NERDTreeFind<cr>
let NERDTreeShowHidden=1

" Color theme (drawing from altercation/vim-colors-solarized Bundle)
set background=dark
colorscheme solarized
color solarized

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

" Completion
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['/opt/javascript-typescript-langserver/lib/language-server-stdio.js'],
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR> 