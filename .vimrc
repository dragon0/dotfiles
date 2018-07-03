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
set backspace=indent,eol,start
set diffopt+=iwhite
set errorformat=[error]\ %f:%l:%c:\ %m,%f:%l:%c:\ %m,%f:%l:\ %m,In\ file\ included\ from\ %f:%l:,\^I\^Ifrom\ %f:%l%m

com W w|make
let g:netrw_liststyle=3


" detect make program
if !empty(glob("gradlew"))
    set makeprg=./gradlew\ --console\ plain
elseif !empty(glob("build.gradle"))
    set makeprg=gradle\ -q
elseif !empty(glob("pom.xml"))
    set makeprg=mvn
elseif !empty(glob("build.sbt"))
    set makeprg=sbt
elseif !empty(glob("build.xml"))
    set makeprg=ant
elseif !empty(glob("package.json"))
    set makeprg=npm
elseif has("win32")
    set makeprg=mingw32-make
endif

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
  "autocmd Filetype java setlocal makeprg=./gradlew\ -q
  autocmd Filetype python setlocal makeprg=%:p
  autocmd Filetype python map <buffer> <F2> :set makeprg=python\ \"%\"<Return>:make<Return>
  autocmd Filetype python map <buffer> <F3> :set makeprg=python3\ \"%\"<Return>:make<Return>
  autocmd Filetype lilypond setlocal makeprg=lilypond\ %
  autocmd Filetype html setlocal shiftwidth=2
  autocmd Filetype xml setlocal shiftwidth=2
  autocmd Filetype typescript setlocal shiftwidth=4
  autocmd Filetype markdown setlocal spell spelllang=en_us
  autocmd Filetype html setlocal spell spelllang=en_us
  autocmd Filetype liquid setlocal spell spelllang=en_us
  "https://stackoverflow.com/a/26254386
  "autocmd FileType json autocmd BufWritePre <buffer> %!python -m json.tool 2>/dev/null || echo <buffer>
endif

"filetype off
"set runtimepath+=/usr/share/lilypond/2.18.2/vim/
"set runtimepath+=/usr/share/vim-conque/
"filetype on

" Based on https://github.com/benmills/vimux
command -nargs=1 Tmux :call Tmux(<q-args>)
command -nargs=* Tmake :execute ':Tmux ' . &g:makeprg . ' ' . <q-args>
command -nargs=? TmuxSession :call TmuxSetSession(<args>)
map <F5> :wall\|Tmake<Return>

function Tmux(args)
    if !exists("g:TmuxSession")
        let g:TmuxSession="dev:0.0"
    endif
    let l:args = '"'.escape(a:args, '\"$`').'"'
    call system("tmux send-keys -t " . g:TmuxSession . " " . l:args . " Enter")
endfunction

function TmuxSetSession(...)
    let sess = a:0 == 1 ? a:1 : ""
    let g:TmuxSession = input("Session? ", sess)
endfunction

