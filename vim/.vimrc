"Use pathogen to modify runtime path and include all plugins under 
"~/.vim/bundle directory
call pathogen#infect()

"File specific settings
set nocp
filetype plugin on
filetype indent on

if has('autocmd')
   au BufNewFile,BufRead *.less set filetype=less
   au BufWritePost *.py silent! !ctags -R &
   au BufWritePost *.js silent! !ctags -R 2> /dev/null &
   au BufWritePost *.java silent! !ctags -R &
   au BufWritePost *.rb silent! !ctags -R &
   autocmd FileType php setlocal shiftwidth=2 tabstop=2
   autocmd FileType cpp setlocal shiftwidth=2 tabstop=2
   autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
   autocmd FileType c setlocal shiftwidth=2 tabstop=2
   autocmd FileType java setlocal shiftwidth=2 tabstop=2
   autocmd FileType python set omnifunc=pythoncomplete#Complete shiftwidth=4 tabstop=4
   autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS shiftwidth=4 tabstop=4 softtabstop=4 expandtab
   autocmd FileType html,xml set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
   autocmd FileType css set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
   autocmd FileType less set shiftwidth=4 tabstop=4 softtabstop=4 expandtab
   autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
   autocmd FileType c set omnifunc=ccomplete#Complete
   "Want cursor highlighting applied in current window
   autocmd WinEnter * setlocal cursorline cursorcolumn
   autocmd WinLeave * setlocal nocursorline nocursorcolumn

   autocmd CursorMovedI * if pumvisible() == 0|pclose|endif 
   autocmd InsertLeave * if pumvisible() == 0|pclose|endif
endif

"Default cinkeys without colon
setlocal cinkeys=0{,0},0),0#,!^F,o,O,e

"Make visible tab characters, trailing whitespace and invisible spaces
"visuall, also add # at tend of lines that extend off-screen
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

"Ignore File Types During Tabcomplete
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o
set wildmenu
set wildmode=list:longest

"Easier window navigation without pressing <C-w>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Map Command-k to no-op
map <D-k> <Nop>

"Remove the need to hit shift to do :w, map : to ;
nnoremap ; :

"Show the current mode and command being typed
set showmode
set showcmd

"Set Leader Key to ,
let mapleader = ","

"No annoying backup files
set nobackup
set noswapfile

" Tabs
set ts=4
set shiftwidth=4
set expandtab
set smarttab                    "insert tabs on the start of a line according to shiftwidth and not tabstop
set smartindent
set autoindent
set copyindent                  "copy previous indentation on autoindenting
set backspace=indent,eol,start

" Syntax highlighting
syntax on
set t_Co=256

"Show line and column number
set ruler

"Line numbers
if (version >= 703)
    set relativenumber
else
    set number
endif

function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc

if (version >= 703)
    nnoremap <C-n> :call NumberToggle()<cr>
endif

"Incremental search, highlight when searching and ignore case when searching
"Also turns ON smartcase which turns on case sensitive searching when
"search term has a capital letter.
set incsearch
set hlsearch
set ignorecase
set smartcase
set gdefault
nnoremap <leader>h :noh<cr>

"Make mouse usable for normal, insert, command-line and help modes
"Turned off for visual mode to allow copy from the terminal window
"in visual mode, instead of visually selecting in visual mode. 
set mouse=a

"When wrapping lines, make sure lines are 78 characters long
set tw=78
set formatoptions=cq
set nowrap

"Color theme
if has('gui_running')
    set background=dark
    colorscheme solarized
else
    colorscheme wombat256
    "Right colors in tmux
    set term=screen-256color
endif

"TagBar
nmap <F8> :TagbarToggle <CR>

"NerdTree
map <F2> :NERDTreeToggle<CR>
nnoremap <leader>d :NERDTreeFind<CR>

"Tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/bin/ctags'

"Toggle TagList
map <F4> :TlistToggle<CR>

"Toggle Paste Mode
set pastetoggle=<F3>

"Highlight current line and column
:hi CursorLine cterm=NONE
:hi CursorColumn cterm=NONE
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Higlight 80 char line
nmap <Leader>l :call ColorColumn()<CR>
function! ColorColumn()
    if empty(&colorcolumn)
        :highlight ColorColumn ctermbg=fg guibg=fg
        echo "colorcolumn=80"
        setlocal colorcolumn=80
    else
        echo "colorcolumn off"
        setlocal colorcolumn=
    endif
endfunction

"Map movement keys to move by visual line instead of by actual line
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

"Disable arrow keys
inoremap  <Up>   <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

"Copied from Fuzzy Finder sample VIMRC mappings with some slight modifications
let g:fuf_modesDisable = []
let g:fuf_mrufile_maxItem = 400
let g:fuf_mrucmd_maxItem = 400
nnoremap <silent> sj     :FufBuffer<CR>
nnoremap <silent> sk     :FufFileWithCurrentBufferDir<CR>
nnoremap <silent> sK     :FufFileWithFullCwd<CR>
nnoremap <silent> s<C-k> :FufFile<CR>


"command 'sc' recursively searches the current directory by default can be
"changed to other coverages
nnoremap <silent> sc     :FufCoverageFile<CR>

"Given the path '~/**' is registered to file coverage h, 
"command 'slh' recursively searches the home directory
nnoremap <silent> slh     :FufCoverageFileChange h<CR>
nnoremap <silent> sl     :FufCoverageFileChange<CR>
nnoremap <silent> s<C-l> :FufCoverageFileRegister<CR>
nnoremap <silent> sd     :FufDirWithCurrentBufferDir<CR>
nnoremap <silent> sD     :FufDirWithFullCwd<CR>
nnoremap <silent> s<C-d> :FufDir<CR>
nnoremap <silent> sn     :FufMruFile<CR>
nnoremap <silent> sN     :FufMruFileInCwd<CR>
nnoremap <silent> sm     :FufMruCmd<CR>
nnoremap <silent> su     :FufBookmarkFile<CR>
nnoremap <silent> s<C-u> :FufBookmarkFileAdd<CR>
vnoremap <silent> s<C-u> :FufBookmarkFileAddAsSelectedText<CR>
nnoremap <silent> si     :FufBookmarkDir<CR>
nnoremap <silent> s<C-i> :FufBookmarkDirAdd<CR>
nnoremap <silent> st     :FufTag<CR>
nnoremap <silent> sT     :FufTag!<CR>
nnoremap <silent> s<C-]> :FufTagWithCursorWord!<CR>
nnoremap <silent> s,     :FufBufferTag<CR>
nnoremap <silent> s<     :FufBufferTag!<CR>
vnoremap <silent> s,     :FufBufferTagWithSelectedText!<CR>
vnoremap <silent> s<     :FufBufferTagWithSelectedText<CR>
nnoremap <silent> s}     :FufBufferTagWithCursorWord!<CR>
nnoremap <silent> s.     :FufBufferTagAll<CR>
nnoremap <silent> s>     :FufBufferTagAll!<CR>
vnoremap <silent> s.     :FufBufferTagAllWithSelectedText!<CR>
vnoremap <silent> s>     :FufBufferTagAllWithSelectedText<CR>
nnoremap <silent> s]     :FufBufferTagAllWithCursorWord!<CR>
nnoremap <silent> sg     :FufTaggedFile<CR>
nnoremap <silent> sG     :FufTaggedFile!<CR>
nnoremap <silent> so     :FufJumpList<CR>
nnoremap <silent> sp     :FufChangeList<CR>
nnoremap <silent> sq     :FufQuickfix<CR>
nnoremap <silent> sy     :FufLine<CR>
nnoremap <silent> sh     :FufHelp<CR>
nnoremap <silent> se     :FufEditDataFile<CR>
nnoremap <silent> sr     :FufRenewCache<CR>
