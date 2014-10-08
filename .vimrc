"set lines=45 columns=110
set number
syntax on
set smartindent
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
colorscheme monokai
set t_Co=256
"remove EOL white spaces.
autocmd BufWritePre * :%s/\s\+$//e
"automatically load plugins with pathogen
call pathogen#infect()
"set color of indent lines
let g:indentLine_color_term = 5
"ignore files in plugin ctrlp and nerdtree
let g:ctrlp_custom_ignore = {
  \ 'file': '\v\.(pyc)$',
  \ }
let NERDTreeIgnore = ['\.pyc$']
"hotkeys for nerdtree and tlist
map <C-k><C-b> :NERDTreeToggle<CR>
map <C-k><C-n> :TlistToggle<CR>
"start powerline
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup
:filetype plugin on
set backspace=indent,eol,start
