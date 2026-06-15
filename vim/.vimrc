" Enable Mac clipboard compatibility
if has('mac') || has('macunix')
  set clipboard=unnamed
endif

call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'airblade/vim-gitgutter'
Plug 'cj/vim-webdevicons'
Plug 'dkarter/bullets.vim' 
Plug 'easymotion/vim-easymotion'
Plug 'farmergreg/vim-lastplace'
Plug 'frazrepo/vim-rainbow'
Plug 'ggreer/the_silver_searcher'
Plug 'honza/vim-snippets'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/seoul256.vim'
Plug 'justinmk/vim-dirvish'
Plug 'kien/ctrlp.vim'
Plug 'lervag/vimtex'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neomake/neomake'
" Plug 'nvimdev/dashboard-nvim'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'Ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'  " Optional: community-contributed snippets
Plug 'tc50cal/vim-terminal'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'universal-ctags/ctags' 
Plug 'urbainvaes/fzf-marks'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/ctrlp.vim'
Plug 'vim-syntastic/syntastic'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
Plug 'urbainvaes/vim-ripple'
Plug 'machakann/vim-highlightedyank'
Plug 'urbainvaes/vim-tmux-pilot'


" Neovim plugins
Plug 'EdenEast/nightfox.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'

call plug#end()

" Telescope configuration
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

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
" let g:UltiSnipsSnippetsDir="~/.vim/mySnippets"

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

" Unified color scheme (default: dark)
" colo wildcharm
colo nightfox

" Trigger for tagbar
nmap <F8> :TagbarToggle<CR>

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

" delete tex log files
augroup MyVimtex
  autocmd!
  autocmd User VimtexEventQuit call vimtex#latexmk#clean(0)
augroup END


" Remove all unnecessary tex files after pdf generation
" Define a function to remove unnecessary LaTeX files
function! RemoveLaTeXFiles()
    " List of file extensions to be removed
    let l:extensions = ['aux', 'log', 'synctex.gz', 'blg', 'toc', 'out', 'lof', 'lot', 'fdb_latexmk', 'fls', 'gz', 'xdv', 'snm', 'nav', 'vrb', 'run.xml', 'bcf', 'acn', 'glo', 'ist', 'dvi', 'xdy', 'loa', 'lo', 'lb', 'tikz', 'gnuplot', 'table', 'gnuplot-table']

    " Iterate over the extensions and delete the corresponding files
    for ext in l:extensions
        silent! execute '!rm -f *.' . ext
    endfor
endfunction

" Configure the custom post-compile command
let g:tex_clean_ext = ['.aux', '.bbl', '.blg', '.brf', '.fot', '.glo', '.gls', '.idx', '.ilg', '.ind', '.lof', '.log', '.lot', '.nav', '.nlo', '.out', '.snm', '.toc', '.url', '.vrb']

let g:ripple_repls = {}
let g:ripple_repls["python"] = {
    \ "command": "ipython",
    \ "pre": "\<esc>[200~",
    \ "post": "\<esc>[201~",
    \ "addcr": 0,
    \ "filter": 0,
    \ }
