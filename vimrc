execute pathogen#infect()
execute pathogen#helptags()

if &compatible
  set nocompatible
end

filetype plugin indent on

let mapleader = "\<Space>"

syntax enable
set background=light
colorscheme solarized

" allow unsaved background buffers and remember marks/undo for them
set hidden

" remember more commands and search history
set history=10000

set background=dark
set encoding=utf-8
set showcmd

" Keep backup and .swp files out of the working directory
" http://stackoverflow.com/a/15317146/86820
set backupdir=~/.tmp//
set directory=~/.tmp//

" always show powerline
set laststatus=2

" Whitespace
set nowrap
set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" turn on line numbers
set number

" split the right way
set splitbelow
set splitright

" highlight current line
set cursorline

" Insert only one space when joining lines that contain sentence-terminating
" punctuation like `.`.
set nojoinspaces

" If a file is changed outside of vim, automatically reload it without asking
set autoread

" I don't always fold code, but when I do, I do it manually
set foldmethod=manual

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

" remap jk to exit insert mode
imap jk <Esc>

" Navigate in a sane way
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" disable cursor keys in normal mode
map <Left>  :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up>    :echo "no!"<cr>
map <Down>  :echo "no!"<cr>

" Yank from cursor to end of line, like C D
nnoremap Y y$

" Indent the current file
noremap <silent> <Leader>i mmgg=G`m

" Better code paste support
noremap <silent> <Leader>p :set paste<CR>i<esc>"*]p:set nopaste<CR>

" clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<cr>

" insert blank lines without going into insert mode
nmap go o<esc>
nmap gO O<esc>

" This enables relativenumbers in normal mode and normal numbering in insert mode
augroup numbers_grp
  autocmd!
  autocmd InsertEnter * :set norelativenumber
  autocmd InsertLeave * :set relativenumber
  autocmd BufEnter * :set relativenumber
  autocmd BufLeave * :set norelativenumber
  autocmd WinEnter * :set relativenumber
  autocmd WinLeave * :set norelativenumber
  autocmd FocusGained * :set relativenumber
  autocmd FocusLost * :set norelativenumber
augroup END

autocmd VimResized * :wincmd =

" NERDTree
let NERDTreeHijackNetrw = 1
nmap <Leader>w :NERDTreeToggle<CR>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers=['']

" Don't require .jsx extension to load JSX syntax
let g:jsx_ext_required = 0

" DelimitMate
let g:delimitMate_expand_cr = 1     
let g:delimitMate_expand_space = 1      
let g:delimitMate_expand_inside_quotes = 0

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Ag
let g:ag_working_path_mode="r"
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" Allow project local vimrc
set exrc
set secure

" Rainbow parens
" TODO: This causes me trouble and doesn't always load like I expect
augroup rainbow_cmd
  autocmd!
  autocmd VimEnter * RainbowParenthesesActivate
  autocmd Syntax * RainbowParenthesesLoadRound
  autocmd Syntax * RainbowParenthesesLoadSquare
  autocmd Syntax * RainbowParenthesesLoadBraces
augroup END

let g:rbpt_colorpairs = [
      \ ['red',         'RoyalBlue3'],
      \ ['brown',       'SeaGreen3'],
      \ ['blue',        'DarkOrchid3'],
      \ ['gray',        'firebrick3'],
      \ ['green',       'RoyalBlue3'],
      \ ['magenta',     'SeaGreen3'],
      \ ['cyan',        'DarkOrchid3'],
      \ ['darkred',     'firebrick3'],
      \ ['brown',       'RoyalBlue3'],
      \ ['darkblue',    'DarkOrchid3'],
      \ ['gray',        'firebrick3'],
      \ ['darkgreen',   'RoyalBlue3'],
      \ ['darkmagenta', 'SeaGreen3'],
      \ ['darkcyan',    'DarkOrchid3'],
      \ ['red',         'firebrick3'],
      \ ]

nnoremap <F9> :Dispatch<CR>
nnoremap <F10> :Dispatch npm test -s<CR>
nnoremap <Leader>d :Dispatch flow<CR>

let g:airline_powerline_fonts = 1

" Get totally tabular
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,\zs<CR>
vmap <Leader>a, :Tabularize /,\zs<CR>
nmap <Leader>af :Tabularize /from<CR>
vmap <Leader>af :Tabularize /from<CR>

let g:UltiSnipsExpandTrigger="<C-k>"

nmap <Leader><Leader> :TagbarToggle<CR>

" Try to auto generate ctags
let g:vim_tags_auto_generate = 1

" try to tagbar for typescript
let g:tagbar_type_typescript = {
\ 'ctagstype': 'typescript',
\ 'kinds': [
	\ 'c:classes',
	\ 'n:modules',
	\ 'f:functions',
	\ 'v:variables',
	\ 'v:varlambdas',
	\ 'm:members',
	\ 'i:interfaces',
	\ 'e:enums',
\ ]
\ }

" cast should indent the same as switch
let g:js_indent_flat_switch = 1

" Disable tsuquyomi err checking in favor of syntastic
let g:tsuquyomi_disable_quickfix = 1
