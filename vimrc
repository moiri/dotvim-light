filetype plugin indent on

syntax on


""""""""""""""""""""
" GENERIC SETTINGS "
""""""""""""""""""""

"Keys
"===============================================================================
let mapleader=','               "use ',' instead of '\'
let maplocalleader = "\\"
set backspace=indent,eol,start  "config backspace key


"View, Layout
"===============================================================================
" set splitbelow                  "when split put new window below
set splitright                  "when split put new window right
set cursorline                  "show a horizontal line at the cursor position
set fileformats=unix,dos,mac
set formatoptions+=1            "wrapping, newline and ident options
set lazyredraw                  "don't redraw window while macros are executed
" set previewheight=10            "height of the preview window
"set relativenumber              "show the linenumber relative to the cursor
"                                "position
set number                      "use static line numbering
set scrolloff=4                 "minimal number of lines to keep above/below
                                "when scrolling
set virtualedit=block,onemore   "config of cursor behaviour
" set winheight=999               "set winheight
"show special chars for tabs, spaces etc. see listchars
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
" show a vertical line at the 81st character
let &colorcolumn=join(range(81,999),",")
"set color scheme
colorscheme sorcerer
"colorscheme apprentice
"error bells
set noerrorbells
set t_vb=
set visualbell
"change split window size with +/- keys
nnoremap <silent>+ <c-w>+
nnoremap <silent>- <c-w>-

"Folding
"===============================================================================
set foldmethod=syntax
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
"folding toggle with space
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
nnoremap <silent> <Space><Space> @=(foldlevel('.')?'zA':"\<Space><Space>")<CR>
vnoremap <Space> zf

"save view when closing file and loading view when opening file
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 


"Indentation
"===============================================================================
set autoindent                  "copy the ident from previous line
set expandtab                   "use spaces insetad of tabs
set shiftround                  "round ident to a multiple of shiftwith
set shiftwidth=4
set smarttab                    "BS deletes a shiftwith worth of space
set tabstop=4
"enhance identation feeling (more intuitive)
xnoremap > >gv
xnoremap < <gv
nnoremap > >>
nnoremap < <<


"Search
"===============================================================================
set incsearch                   "highligt search matches while typing
set gdefault                    "by default g flag is on (all matches of a line
                                "are substituted instead of one)
set ignorecase                  "ignore case in search patterns
set smartcase                   "overwrite ignorecase if search pattern contains
                                "uppercase letters
set hlsearch                    "highlight all search matches
"nnoremap / /\v                  "set search to very magic by adding \v to every
"                                "search
"Press Esc to turn off highlighting and clear any message already displayed:
nnoremap <silent> <Esc> :noh<CR>
"Select all words identic to the one below the cursor
nnoremap <leader>s *N

"Navigation
"===============================================================================
""usage of mouse in different modes
"set mouse=a
"map arrow key to use for navigation
nnoremap <Esc>A <up>
nnoremap <Esc>B <down>
nnoremap <Esc>C <right>
nnoremap <Esc>D <left>
inoremap <Esc>A <up>
inoremap <Esc>B <down>
inoremap <Esc>C <right>
inoremap <Esc>D <left>
"move down/up always a visible line (not a phpysical line, e.g. in a fold)
nnoremap j      gj
nnoremap k      gk
nnoremap <Down> gj
nnoremap <up>   gk
"use end and home buttons in command mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
"easily switch between windows
nnoremap <silent> <C-Up> :wincmd k<CR>
nnoremap <silent> <C-Down> :wincmd j<CR>
nnoremap <silent> <C-Left> :wincmd h<CR>
nnoremap <silent> <C-Right> :wincmd l<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-l> :wincmd l<CR>


"Content Manipulation
"===============================================================================
set nrformats-=octal            "config inc/dec function (C-a, C-x):
                                "dont inc/dec octal numbers
set clipboard^=unnamedplus      "use the X Window clipboard
"',d' can be used instead of 'd' to move whatever is deleted into the black
"hole register (instead of the "0 register)
nnoremap <leader>d "_d
xnoremap <leader>d "_d
"allows to overwrite a word with the same word multiple times when using yiw,
"viw,p
xnoremap <leader>p "_dP
"replace word below cursor and all identic words in one text block
nnoremap <leader>r :'{,'}s/<C-r>=expand('<cword>')<CR>/
"replace selection and all identic strings in one text block
xnoremap <leader>r :<C-u>'{,'}s/<C-r>=functions#GetVisualSelection()<CR>/
"replace word below cursor and all identic words in the whole file
nnoremap <leader>R :%s/<C-r>=expand('<cword>')<CR>/
"replace selection and all identic strings in the whole file
xnoremap <leader>R :<C-u>%s/<C-r>=functions#GetVisualSelection()<CR>/

" prepend \ to a word
nnoremap <localleader>\ bi\<C-[>
" append ; to a line
nnoremap <localleader>; A;<C-[>

"Spell checker
"===============================================================================
"use ,, to open a dropdwn menu with spelling suggestions
inoremap <leader>, <C-X>s
nnoremap <leader>, ea<C-X><C-S>

"File Manipulation
"===============================================================================
"encoding
set encoding=utf-8
set termencoding=utf-8
"set noswapfile                  "do not use swapfile as buffer (everything in
"                                "memory)
set hidden                      "hide buffers
set switchbuf=useopen,usetab    "buffer switching behaviour
"list buffers and prepare to open a new one in a split window (horizontal split)
nnoremap <leader>bd :bd<CR>



"Status/Command Line
"===============================================================================
set laststatus=2                "always show a status line"
set wildmenu                    "command line completion
set wildignore=*.swp,*.bak,*.pyc,*.class,*/.git/**/*,*/.hg/**/*,*/.svn/**/*
" set wildignorecase              "ignore case when completing file names
set wildmode=list:longest       "list all matches and complete till longest
                                "common string
set statusline=%<\ %t\ %m%r%y%w%=Lin:\ \%l\/\%L\ Col:\ \%c\ 

nnoremap <leader>p :pclose<CR>

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
