"
" VIM Customizations.
"

"
" Adjust the colorscheme.
"
syntax on
if $TERM == 'xterm-256color'
  colorscheme darcula
else
  colorscheme darcula
endif

" Remove right hand side scroll bar.
set guioptions-=r

" Remove the left hand scrollbar.
set go-=L

" Case insensitive searches.
set smartcase

" Leave insert mode after focus changes.
au FocusLost,TabLeave * call feedkeys("\<C-\>\<C-n>")

" Save files on focus change.
autocmd FocusLost * silent! wa

" CtrlP Ignore Files.
set wildignore+=*/public/**/*
set wildignore+=*/.idea/**/*
set wildignore+=*/node_modules/**/*
set wildignore+=*/.mimosa/**/*
set wildignore+=*/vagrant/puppet/**/*

" Setup Syntastic checkers.
let g:syntastic_coffee_checkers = ["coffee"]
let g:syntastic_ejs_checkers = ["html"]

" CtrlP default to vertical split.
"let g:ctrlp_prompt_mappings = {
    "\ 'AcceptSelection("e")': ['<c-v>', '<2-LeftMouse>'],
    "\ 'AcceptSelection("v")': ['<cr>', '<RightMouse>'],
    "\ }

"
" Map the command-p key to CtrlP.
"
map <D-O> :CtrlP<CR>

"
" Add underscore template syntax highlighting for .ejs files.
"
au BufRead,BufNewFile *.ejs set filetype=html
au BufRead,BufNewFile *.ejs set syntax=underscore_template

"
" Set the ack search defaults to ignore certain directories.
"
let g:ackprg = "ack -s -H --nocolor --nogroup --column --smart-case --follow --ignore-dir=public/ --ignore-dir=node_modules --ignore-dir=.idea"

"
" Camel case support.
"
nmap c,w c,e
runtime plugin/camelcasemotion.vim
omap i,w i,e
xmap i,w i,e

nnoremap ,, ,
xnoremap ,, ,
onoremap ,, ,

map w <Plug>CamelCaseMotion_w
map b <Plug>CamelCaseMotion_b
map e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

nmap cw ce

imap <C-w> <C-o>d<Plug>CamelCaseMotion_ie

omap iw <Plug>CamelCaseMotion_iw
xmap iw <Plug>CamelCaseMotion_iw
omap ib <Plug>CamelCaseMotion_ib
xmap ib <Plug>CamelCaseMotion_ib
omap ie <Plug>CamelCaseMotion_ie
xmap ie <Plug>CamelCaseMotion_ie

omap iw ie
xmap iw ie


"
" Reload the vimrc after changes.
"
au! BufWritePost .vimrc.after source %

"
" Start in the projects directory.
"
cd ~/WebStormProjects
