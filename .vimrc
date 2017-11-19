" Change VIM theme
set background=dark
colorscheme Tomorrow-Night-Eighties
set guifont=Source_Code_Pro_for_Powerline

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
" set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=/tmp
set directory=/tmp
set undodir=/tmp

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on

" Highlight current line
set cursorline
" Make tabs as wide as four spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
"" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
" if exists("&relativenumber")
"	set relativenumber
"	au BufReadPost * set relativenumber
"endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Allow unsaved buffers
set hidden
" Map Apple + [ and ] to next/prev buffer
nnoremap <D-]> :bnext<CR>
nnoremap <D-[> :bprev<CR>
" Map Apple + d to close current buffer
command! BW :bn|:bd#
nnoremap <D-d> :BW<CR>
nnoremap <D-w> :BW<CR>
" Mapp Apple + t to open new buffer
nnoremap <D-t> :enew<CR>
" Map Apple + # to specific buffer
nnoremap <D-1> :b 1<CR>
nnoremap <D-2> :b 2<CR>
nnoremap <D-3> :b 3<CR>
nnoremap <D-4> :b 4<CR>
nnoremap <D-5> :b 5<CR>
nnoremap <D-6> :b 6<CR>
nnoremap <D-7> :b 7<CR>
nnoremap <D-8> :b 8<CR>
nnoremap <D-9> :b 9<CR>
nnoremap <D-0> :b 10<CR>


" Bind F5 to timestamp
nnoremap <F5> "=strftime("%D %r")<CR>P
inoremap <F5> <C-R>=strftime("%D %r")<CR>

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Enable file type detection
filetype on
" Enable filetype plugin
filetype plugin on
" Treat .json files as .js
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
" Treat .md files as Markdown
autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
" Remove trailing whitespace at the end of lines on save
autocmd BufWritePre * normal m`:%s/\s\+$//e ``

if has("gui_running")
    " Map Escape to turn off highlight
    nnoremap <silent> <esc> :noh<return><esc>

    " Remove bindings for MacVim
    macmenu &File.New\ Tab key=<nop>
    macmenu &File.Close key=<nop>

    " Remove toolbar
    set guioptions -=T

    " Remove scrollbars
    set guioptions -=r
    set guioptions -=L
else
    augroup no_highlight
        autocmd TermResponse * nnoremap <silent> <esc> :noh<return><esc>
    augroup END
end

" Set window size (80x120) + 31 for NERDTree
set columns=191
set lines=120

" Highlight matching brace/parenthesis/bracket
set showmatch

" Copy on highlight
" set guioptions +=a

" Unbind arrow keys in normal, and visual modes
for prefix in ['n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

" Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" NERDTree
let g:NERDTreeShowHidden=1
nnoremap <C-t> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Dash
nmap <silent> <leader>d <Plug>DashSearch

" Commands on Startup
"autocmd VimEnter * NERDTree " Autoopen NERDTree
"autocmd VimEnter * wincmd p " Set focus to file window
