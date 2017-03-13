"Vundle package manager
set nocompatible
"filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"Add vundle plugins here
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'mileszs/ack.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'

"End vundle plugins
call vundle#end()


" set tab types for different filetypes
filetype plugin indent on
filetype indent on
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2

"Open NERDTree when opening vim with no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"""Close vim if NERDTree is the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ignore files in nerd tree (add to the array for more)
let NERDTreeIgnore = ['\.pyc$']


"""REMAPS"""
" nerd tree toggle
map <C-\> :NERDTreeToggle<CR>
" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nmap <C-B> :TagbarToggle<CR>



set t_Co=256  "enable 256 colors

set mouse=nicr  "allow mouse scroll
set cursorline
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set nu
"set rnu
set incsearch
set hlsearch
set splitbelow
set splitright
set runtimepath^=~/.vim/bundle/ctrlp.vim
" toggle pastemode "
set pastetoggle=<F3>
" use '+' register as clipboard "
set clipboard=unnamedplus

inoremap jj <Esc>
inoremap jk <Esc>
inoremap <S-CR> <C-o>A<CR>

let g:netrw_liststyle=3

command Ex Explore

execute pathogen#infect()

" colors "
syntax on
colo wellsokai
"colorscheme Tomorrow-Night-Bright
"colorscheme znake
"colorscheme Tomorrow-Night-Eighties
"colorscheme monokai 
"colorscheme icansee 

" the_silver_searcher "
let g:ackprg = 'ag --vimgrep'

" RSC: replace skip comments: replace a pattern with a new pattern,
" while skipping comments
function RSC(pattern, patternSub)
    " Move to top of the file
    normal 1G
    " Search Pattern, no wrap
    while search(a:pattern, "W", "", "") > 0
        " If found pattern is a comment, skip
        if eval(synIDattr(synID(line("."), col("."), 0), "name") =~? "Comment")
            continue
        endif
        " Replace pattern by it's substitute
        exec '.s/'.a:pattern.'/'.a:patternSub.'/'
        " Restore cursor position
        normal ``
    endwhile
endfunction
command! -nargs=+ -complete=command RSC call RSC(<args>)

" RSS: replace skip strings: repalce a pattern with a new pattern,
" while skipping strings
function RSS(pattern, patternSub)
    " Move to top of the file
    normal 1G
    " Search Pattern, no wrap
    while search(a:pattern, "W", "", "") > 0
        " If found pattern is a string, skip
        if eval(synIDattr(synID(line("."), col("."), 0), "name") =~? "String")
            continue
        endif
        " Replace pattern by it's substitute
        exec '.s/'.a:pattern.'/'.a:patternSub.'/'
        " Restore cursor position
        normal ``
    endwhile
endfunction
command! -nargs=+ -complete=command RSS call RSS(<args>)

" RSSC: replace skip strings & comments: repalce a pattern with a new pattern,
" while skipping strings & comments
function RSSC(pattern, patternSub)
    " Move to top of the file
    normal 1G
    " Search Pattern, no wrap
    while search(a:pattern, "W", "", "") > 0
        " If found pattern is a string, skip
        if eval(synIDattr(synID(line("."), col("."), 0), "name") =~? "String")
            continue
        endif
        " If found pattern is a comment, skip
        if eval(synIDattr(synID(line("."), col("."), 0), "name") =~? "Comment")
            continue
        endif
        " Replace pattern by it's substitute
        exec '.s/'.a:pattern.'/'.a:patternSub.'/'
        " Restore cursor position
        normal ``
    endwhile
endfunction
command! -nargs=+ -complete=command RSSC call RSSC(<args>)
command! -nargs=+ -complete=command RSCS call RSSC(<args>)




