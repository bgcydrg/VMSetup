" Set appearance
set nu
set ic
set wrap
set linebreak  "break line at whole words
set cursorline
set ruler
set guifont=Menlo\ Regular:h12

" Set indentation
set autoindent
set smartindent
set cindent
set smarttab

" Set preference on search
set hlsearch
set nowrapscan
set smartcase    "use case if any caps used
set incsearch    "show match as search proceeds

" Set tab and shift size
set expandtab
set ts=4
" Indention of 4 spaces using '>'
set shiftwidth=4
set laststatus=2

" syntax on
syntax on

" Use solarized color scheme
set background=dark
"let g:solarized_termtrans=1
"let g:solarized_termcolors=16
"let g:solarized_visibility="high"
"let g:solarized_contrast="high"
colors solarized

" Use buffer
set hidden

" Better command auto-completion
set wildmenu
set wildignore=*.o,*.obj,*~
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*

" Enable mouse use
set mouse=a
set mousemodel=extend
" Set this to the name of the terminal. Use xTerm2 for iTerm2
set ttymouse=xterm2

inoremap ( ()<Left>
inoremap () ()
inoremap (<Esc> (
inoremap " ""<Left>
inoremap "" ""
inoremap "<Esc> "
inoremap [ []<Left>
inoremap [] []
inoremap [<Esc> [
inoremap { {}<Left>
inoremap {} {}
inoremap {<Esc> {
inoremap {<CR> {<CR>}<Esc>O<Tab>

" Change cursor shape in different modes
" 0 or 1 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
" 5 -> blinking vertical bar
" 6 -> solid vertical bar
" For GNU screen, enclose the difinition between \eP and \e\\
let &t_EI .= "\eP\<Esc>[2 q\e\\"  "command mode
let &t_SI .= "\eP\<Esc>[5 q\e\\"  "insert mode
" Reset cursor when vim exits
autocmd VimLeave * silent !echo -ne "\033]112\007"

" Highligh syntax for json
autocmd BufNewFile,BufRead *.json set ft=javascript

" For ctags
set nocp
filetype on
filetype plugin on
filetype indent on
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Use_Right_Window = 1
map <F2> :TlistToggle <CR>

" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/cppTags
" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
" let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
