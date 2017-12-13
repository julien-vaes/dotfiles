"" Download vim-plug if necessary
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
let mapleader = " "
let maplocalleader = "\\"

"" Plugins
call plug#begin('~/.vim/plugged')
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'
Plug 'lervag/vimtex'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

if has("nvim")
    Plug 'Shougo/deoplete.nvim'
    Plug 'zchee/deoplete-jedi'
else
    Plug 'Shougo/neocomplete.vim'
endif

" Colors
Plug 'junegunn/seoul256.vim'
call plug#end()


" Fuzzy finder
nnoremap <c-p> :GitFiles<cr>

" Neomake
" if &runtimepath =~ 'neomake'
"     call neomake#configure#automake('w')
" endif

"" Plugin configurations

" Deoplete / neocomplete
let g:deoplete#enable_at_startup = 1
let g:neocomplete#enable_at_startup = 1
if !exists('g:deoplete#omni_patterns')
    let g:deoplete#omni_patterns = {}
endif
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.tex =
    \ '\v\\%('
    \ . '\a*cite\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
    \ . '|\a*ref%(\s*\{[^}]*|range\s*\{[^,}]*%(}\{)?)'
    \ . '|hyperref\s*\[[^]]*'
    \ . '|includegraphics\*?%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
    \ . '|%(include%(only)?|input)\s*\{[^}]*'
    \ . '|\a*(gls|Gls|GLS)(pl)?\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
    \ . '|includepdf%(\s*\[[^]]*\])?\s*\{[^}]*'
    \ . '|includestandalone%(\s*\[[^]]*\])?\s*\{[^}]*'
    \ . ')'
let g:deoplete#omni_patterns.tex = g:neocomplete#sources#omni#input_patterns.tex.'\m'
let g:deoplete#sources#jedi#show_docstring = 1

" NerdTree
let g:NERDTreeHijackNetrw = 0

" Ultisnips
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'mySnippets']
let g:UltiSnipsSnippetsDir="~/.vim/mySnippets"

" Plugins interactions
function! Multiple_cursors_before()
    if has("nvim")
        let b:deoplete_disable_auto_complete = 1
    else
        exe 'NeoCompleteLock'
    endif
endfunction

function! Multiple_cursors_after()
    if has("nvim")
        let b:deoplete_disable_auto_complete = 0
    else
        exe 'NeoCompleteUnlock'
    endif
endfunction

"" Colorscheme
set t_Co=256

colorscheme seoul256

"" Autocommands
augroup vimrc
    autocmd!
    autocmd FileType dirvish setlocal relativenumber
    autocmd FileType tex set spell
    autocmd FileType python setlocal foldmethod=indent smartindent shiftwidth=4 ts=4 et cinwords=if,elif,else,for,while,try,except,finally,def,class
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd BufRead,BufNewFile *.jl :set filetype=julia
    autocmd BufReadPost *.ezt set syntax=html
augroup END


