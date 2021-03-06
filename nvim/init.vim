set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim/
set rtp+=~/.fzf
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'fatih/vim-go'
Plugin 'junegunn/fzf.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'fatih/molokai'
Plugin 'katnegermis/vim-tmux-navigator'
" Plugin 'SirVer/ultisnips'
" Plugin 'xolox/vim-misc'
" Plugin 'xolox/vim-easytags'
Plugin 'tomtom/tcomment_vim'
Plugin 'ervandew/supertab'
Plugin 'honza/vim-snippets'
Plugin 'vim-airline/vim-airline'
Plugin 'w0rp/ale'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-dispatch'
" Plugin 'Shougo/deoplete.nvim'
" Plugin 'zchee/deoplete-go'

call vundle#end()

set t_Co=256
set encoding=utf-8
set columns=80
"remove EOL white spaces.
autocmd BufWritePre * :%s/\s\+$//e
"set color of indent lines
let g:indentLine_color_term = 5
"ignore files in plugin ctrlp and nerdtree
let g:ctrlp_custom_ignore = {
  \ 'file': '\v\.(pyc)$',
  \ }
let NERDTreeIgnore = ['\.pyc$']
"
"hotkeys for nerdtree and tlist

nmap <c-t> :Files<CR>

let g:rehash256 = 1
set number
syntax on
set smartindent
set ignorecase " ignore case when searching
set smartcase " don't ignore case if search includes a capital letter

set autoindent
set nobackup
set noswapfile
set tabstop=4
colorscheme molokai
set shiftwidth=4
set expandtab
set smarttab
set backspace=indent,eol,start
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set splitright
set number

" markdown config
au BufRead,BufNewFile *.md set filetype=markdown
au BufNewFile,BufRead *.md let b:dispatch = 'sh make.sh'
nnoremap <Leader>b :Dispatch!<CR>

" python indentation config
au BufNewFile,BufRead *.py set tabstop=4 | set softtabstop=4 | set shiftwidth=4 | set expandtab | set autoindent | set fileformat=unix

set hlsearch
set ttyfast " u got a fast terminal
set synmaxcol=200
set lazyredraw " to avoid scrolling problems

setlocal nowrap
set ruler

:nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>


"Activate spell checking in .md documents.
autocmd BufRead,BufNewFile *.md setlocal spell

" easytags config
let g:easytags_async = 1

"vim-go bindings
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 0
let g:go_fmt_autosave = 1
let g:go_dispatch_enabled = 1
let g:go_doc_command = "godoc"

au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

nmap <Leader>s :setlocal spell!<CR>

"ultisnips bindings
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let python_highlight_all=1

" vim-airline status line stuff
" let g:airline_powerline_fonts = 1
set laststatus=2
set conceallevel=0

"vim-tmux window panning
if $TMUX != ''
    " integrate movement between tmux/vim panes/windows

    fun! TmuxMove(direction)
    " Check if we are currently focusing on a edge window.
    " To achieve that,  move to/from the requested window and
    " see if the window number changed
    let oldw = winnr()
    silent! exe 'wincmd ' . a:direction
    let neww = winnr()
    silent! exe oldw . 'wincmd'
    if oldw == neww
      " The focused window is at an edge, so ask tmux to switch panes
      if a:direction == 'j'
        call system("tmux select-pane -D")
      elseif a:direction == 'k'
        call system("tmux select-pane -U")
      elseif a:direction == 'h'
        call system("tmux select-pane -L")
      elseif a:direction == 'l'
        call system("tmux select-pane -R")
      endif
    else
      exe 'wincmd ' . a:direction
    end
    endfun
    nnoremap <silent> <c-w>j :silent call TmuxMove('j')<cr>
    nnoremap <silent> <c-w>k :silent call TmuxMove('k')<cr>
    nnoremap <silent> <c-w>h :silent call TmuxMove('h')<cr>
    nnoremap <silent> <c-w>l :silent call TmuxMove('l')<cr>
    nnoremap <silent> <c-w><down> :silent call TmuxMove('j')<cr>
    nnoremap <silent> <c-w><up> :silent call TmuxMove('k')<cr>
    nnoremap <silent> <c-w><left> :silent call TmuxMove('h')<cr>
    nnoremap <silent> <c-w><right> :silent call TmuxMove('l')<cr>
endif

"Add wrapping bindings, sublime-like movements.
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
    noremap  <buffer> <silent> k k
    noremap  <buffer> <silent> j j

  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
    noremap  <buffer> <silent> k gk
    noremap  <buffer> <silent> j gj
  endif
endfunction

