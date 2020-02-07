" Enable copy paste outside vim 
set clipboard=unnamed
autocmd InsertLeave * write

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'airblade/vim-gitgutter'
Plug 'frazrepo/vim-rainbow'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/seoul256.vim'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'justinmk/vim-dirvish'
Plug 'lervag/vimtex'
Plug 'neomake/neomake'
Plug 'preservim/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'urbainvaes/fzf-marks'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/ctrlp.vim'
Plug 'wokalski/autocomplete-flow'

if has("nvim")
    Plug 'Shougo/deoplete.nvim', { 'do' : ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi'
else
    Plug 'Shougo/neocomplete.vim'
endif

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Ultisnips

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="horizontal"

" Trigger to move from one field to the other
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'mySnippets']
let g:UltiSnipsSnippetsDir="~/.vim/mySnippets"

" NERDTREE settings.

" Stick this in your vimrc to open NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Rainbow: enables the coloration of the parantheses
let g:rainbow_active = 1

" Other
set foldmethod=indent
