""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Vimrc-Init                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"					    						_       ___  _     _  ___   ___
"		      /\             | |     / _ \(_)   | |/ _ \ / _ \
"        /  \   _ __   __| |_ __| | | |_  __| | (_) | (_) |
"       / /\ \ | '_ \ / _  | '__| | | | |/ _  |> _ < > _ <
"      / ____ \| | | | (_| | |  | |_| | | (_| | (_) | (_) |
"     /_/    \_\_| |_|\__,_|_|   \___/|_|\__,_|\___/ \___/


" File: init
" Created: A long long time ago, in a galaxy far far away...
" Last Modified: 2020-03-28

" Description: Vim settings, i use them for Nvim but they work for
" normal vim aswell.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Plugged					                            "
"			                   -Minimalistic plugin manager                    				"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'		            " Easy way to surround text with tags
Plug 'scrooloose/nerdtree'		          " File explorer within vim
Plug 'junegunn/goyo.vim'		            " Centers text on the screen
Plug 'PotatoesMaster/i3-vim-syntax'	    " Enables vim syntax in i3
Plug 'jreybert/vimagit'			            " Git manager for vim
Plug 'vimwiki/vimwiki'			            " Todo list and much more
Plug 'bling/vim-airline'		            " Adds a infobar at the bottom
Plug 'tpope/vim-commentary'		          " Easy way to comment inn\out text
Plug 'sirver/ultisnips'			            " Snippets for vim
Plug 'honza/vim-snippets'		            " More snippets for vim
Plug 'kien/ctrlp.vim'			              " Fuzzy finder
Plug 'mhinz/vim-startify'		            " Startscreen for vim
Plug 'scrooloose/syntastic'		          " Syntax checker
Plug 'mattn/emmet-vim'			            " HTML creator on steroids
Plug 'jiangmiao/auto-pairs'		          " Automatically matches brackets
Plug 'Shougo/deoplete.nvim'		          " Autocompleter for vim
Plug 'tpope/vim-repeat'			            " Enables . to be used with vim-surround
Plug 'easymotion/vim-easymotion' 	      " Easier navigation just type s to activate
Plug 'morhetz/gruvbox'			            " Theme for vim\nvim
Plug 'ryanoasis/vim-devicons'           " Iconpack for nvim
Plug 'dbeniamine/cheat.sh-vim'          " Cheatcheat in vim, hoover over word and press leader + KB to activate
Plug 'kovetskiy/sxhkd'			            " Syntax and indent for sxhkd cfg
Plug 'godlygeek/tabular'                " Easily allign text with regular expressions
Plug 'machakann/vim-highlightedyank'    " Visualize what text has been yanked after a yank cmd
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Basics                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader ="," 		"Leaderkey used for special commands
set nocompatible		"Use Vim settings rather than Vi
filetype plugin on
syntax on			"Turns on syntax highlighting
colorscheme gruvbox		"Set colorscheme to gruvbox(must be dl'ed)
set bg=dark			"Set the background to dark
set encoding=utf-8		"Use Utf-8 encoding
set number relativenumber	"Use relativenumbers instead of normal
set history=1000		"Stores 1000 lines of :cmdline history
set clipboard=unnamedplus
set mouse=a
set splitbelow splitright	"Splits open at the bottom right
set showmatch			"Show matching brackets when hovvered over
set tabstop=2 shiftwidth=2 expandtab "Use spaces instead of tab must have for yml files!

""""""""""""
"  Search  "
""""""""""""
set incsearch			" Find the next match as we type the search
set nohlsearch			" No highlighting of search by default
set ignorecase			" Ignore case when searching...
set smartcase			" ...unless we type a captial
" Pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Essentials                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""
"  Split Navigation  "
""""""""""""""""""""""
" Save a keypress when changing windows.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"""""""""""""""""""""""""
"  Compile and Preview  "
"""""""""""""""""""""""""
" Compile document, be it groff/LaTeX/markdown/etc:
map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview:
map <leader>p :!opout <c-r>%<CR><CR>

" Executes python script.
map <leader>x :!python %<CR>
""""""""""""""""""
"  Update Files  "
""""""""""""""""""
" When shortcut files are updated, renew bash and ranger configs with new material:
autocmd BufWritePost ~/.bmdirs,~/.bmfiles !shortcuts

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %

" Update binds when sxhkdrc is updated.
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

""""""""""
"  Misc  "
""""""""""
" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
vnoremap <C-c> "+y
map <C-p> "+P

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>o :setlocal spell! spelllang=en_us<CR>

" Opens up snippets folder and lets you tab trough the files:i
nnoremap <leader>s :r ~/.snippy/

" Live preview of search and replace command
set inccommand=nosplit

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Plugins                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""
"  Ultisnips  "
"""""""""""""""
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsSnippetsDir = '~/.vim/ultisnips'
let g:UltiSnipsSnippetDirectories = ['UltiSnips']
" Personal Info
let g:snips_author="Andre Hansen"
let g:snips_email = "1988.hansen@gmail.com"
let g:snips_github = "www.github.com/Andr0id88"

""""""""""""""
"  Deoplete  "
""""""""""""""
let g:AutoPairsMapCR=0
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('enable_smart_case', 1)
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

""""""""""""""
"  NerdTree  "
""""""""""""""
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"""""""""""""
"  VimWiki  "
"""""""""""""
let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
" Make sure vimwiki dont hijack all markdown files and messes up Ultisnips.
let g:vimwiki_global_ext = 0

""""""""""
"  Goyo  "
""""""""""
" Enable goyo with leader + f
map <leader>f :Goyo \| set bg=dark \| set linebreak<CR>

" Enable Goyo by default for mutt writting
" Goyo's width will be the line limit in mutt.
autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo \| set bg=dark

""""""""""""""""
"  Easymotion  "
""""""""""""""""
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Go to a certain word
map <Leader><Leader>w <Plug>(easymotion-w)
map <Leader><Leader>e <Plug>(easymotion-e)
map <Leader><Leader>t <Plug>(easymotion-t)
map <Leader><Leader>T <Plug>(easymotion-T)

""""""""""""""""""""""
"  Markdown-Preview  "
""""""""""""""""""""""
" Set this to 1 to auto preview markdown files
let g:mkdp_auto_start = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Bibliography                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Open my bibliography file in split
map <leader>b :vsp<space>$BIB<CR>
map <leader>r :vsp<space>$REFER<CR>

" Ensure files are read as what I want:
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          Parenthesis And Brackets                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Parenthesis/bracket:
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                TempDisabled                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Check file in shellcheck, (disabled in favor of snippy)
" map <leader>s :!clear && shellcheck %<CR>

" Map auto complete of (, ", ', [
" inoremap $1 ()<esc>i
" inoremap $2 []<esc>i
" inoremap $3 {}<esc>i
" inoremap $4 {<esc>o}<esc>O
" inoremap $q ''<esc>i
" inoremap $e ""<esc>i
