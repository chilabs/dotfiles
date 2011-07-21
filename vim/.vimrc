"File specific settings
set nocp
filetype plugin on

if has('autocmd')
   autocmd FileType cpp setlocal shiftwidth=2 tabstop=2
   autocmd FileType python set omnifunc=pythoncomplete#Complete shiftwidth=2 tabstop=2
   autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
   autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
   autocmd FileType css set omnifunc=csscomplete#CompleteCSS
   autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
   autocmd FileType c set omnifunc=ccomplete#Complete
   
   autocmd CursorMovedI * if pumvisible() == 0|pclose|endif 
   autocmd InsertLeave * if pumvisible() == 0|pclose|endif
endif

"Ignore File Types During Tabcomplete
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o
set wildmenu
set wildmode=list:longest

"Remove the need to hit shift to do :w
nnoremap ; :


set showmode
set showcmd

"Set Leader Key to ,
let mapleader = ","

"Tabs
"set ts=4
"set shiftwidth=4
set expandtab
set smarttab
set smartindent
set autoindent
set backspace=indent,eol,start

"Syntax highlighting
syntax on
set t_Co=256

"Line numbers
set number

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

"Color theme
colors wombat256

"Toggle NerdTree
map <F2> :NERDTreeToggle<CR>

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

"Given the path './**' is registered to file coverage c, 
"command 'slc' recursively searches the current directory
nnoremap <silent> slc     :FufCoverageFileChange c<CR>

"Given the path '~/**' is registered to file coverage h, 
"command 'slc' recursively searches the home directory
nnoremap <silent> slh     :FufCoverageFileChange h<CR>
nnoremap <silent> sl     :FufCoverageFileChange<CR>
nnoremap <silent> sL     :FufCoverageFileChange<CR>
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
