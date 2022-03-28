" Enable copy paste outside vim 
set clipboard=unnamed

" Automatically save when exiting insert mode 
" autocmd InsertLeave * write

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
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'mySnippets']
let g:UltiSnipsSnippetsDir="~/.vim/mySnippets"

" NERDTREE settings.

" Stick this in your vimrc to open NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" " Rainbow: enables the coloration of the parentheses
" let g:rainbow_active = 1

" Other
set foldmethod=indent

" Enable spell check
set spell
set spelllang=en_gb

" set the wide to 2
autocmd Filetype tex,latex set shiftwidth=2

" change highlighting colour if: word not recognized
hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=red
" Set style for gVim
hi SpellBad gui=undercurl

" change highlighting colour if: word not capitalised
hi clear SpellCap
hi SpellCap cterm=underline ctermfg=blue
" Set style for gVim
hi SpellCap gui=undercurl

" change highlighting colour if: wrong spelling for selected region
hi clear SpellLocal
hi SpellLocal ctermfg=green
" Set style for gVim
hi SpellLocal gui=undercurl

