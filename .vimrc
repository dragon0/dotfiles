set directory=~/.swp
set modeline
set ruler
set showcmd
set expandtab
set autoindent
set shiftwidth=4
set softtabstop=4
set nrformats-=octal
set hidden
set background=dark
com W w|make

map <F1> <nop>
imap <F1> <nop>

inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap () ()
inoremap [] []
inoremap {} {}
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap (<CR> ()<Left><CR><Up><End><CR>
inoremap [<CR> []<Left><CR><Up><End><CR>
inoremap {<CR> {}<Left><CR><Up><End><CR>
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"

" show line numbers and 80th column
"set number
set colorcolumn=80

" set background and text colors
" highlight Normal ctermbg=White ctermfg=Black

syntax on
filetype plugin indent on
"filetype indent on

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  autocmd BufRead,BufNewFile ~/SaddlebackCSS/SaddlebackCSS.github.io/*.md let b:liquid_subtype = 'markdown' | set filetype=liquid
  autocmd BufRead,BufNewFile ~/SaddlebackCSS/SaddlebackCSS.github.io/*.html let b:liquid_subtype = 'html' | set filetype=liquid
  autocmd BufRead,BufNewFile build.gradle set filetype=groovy
  autocmd Filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  autocmd Filetype java setlocal omnifunc=javacomplete#Complete
  autocmd Filetype java setlocal makeprg=./gradlew\ -q
  autocmd Filetype python setlocal makeprg=%:p
  autocmd Filetype lilypond setlocal makeprg=lilypond\ %
  autocmd Filetype html setlocal shiftwidth=2
  autocmd Filetype xml setlocal shiftwidth=2
  autocmd Filetype typescript setlocal shiftwidth=4
  autocmd Filetype markdown setlocal spell spelllang=en_us
  autocmd Filetype html setlocal spell spelllang=en_us
  autocmd Filetype liquid setlocal spell spelllang=en_us
endif

"filetype off
"set runtimepath+=/usr/share/lilypond/2.18.2/vim/
"set runtimepath+=/usr/share/vim-conque/
"filetype on

