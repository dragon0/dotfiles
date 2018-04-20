set wak=no
set mouse-=a
"set background=light

set lines=48

" disable bell
set visualbell t_vb=

" set background and text colors
highlight Normal guibg=Black guifg=White

if &diff
    set lines=999 columns=999
else
    set lines=48 columns=80
endif

