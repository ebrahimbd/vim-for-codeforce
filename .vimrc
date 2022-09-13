" Slate Maintainer: EBRAHIM MOHAMMAD SALEH <saleh.sust.bd@gmail.com>


" DO NOT EDIT THIS FILE  PlugInstall" 
"==================================================================================="
"after install plugin then"
"=========================this worke only when  you install========================="
"Plug 'ycm-core/youcompleteme'"
"==================================================================================="
"==========================for c++=================================================="
"sudo apt install build-essential cmake vim-nox python3-dev"

"================this only if you want javascript and ts  and python================"
"sudo apt install mono-complete golang nodejs default-jdk npm"
"for python error detecteted"
"must have lake8 pep257 pep8 pycodestyle pydocstyle pyflakes pylint python"
"msut enable jabascript sudo npm install -g jshint "
"cd ~/.vim/bundle/YouCompleteMe python3 install.py --all "


"=======================  at last install clang   =================================="
"cd ~/.vim/bundle/YouCompleteMe python3 install.py  --clang-completer "




" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif





call plug#begin()
     
    Plug 'preservim/NERDTree'
    
    Plug 'Xuyuanp/nerdtree-git-plugin'
    
    Plug 'kien/ctrlp.vim'
    
    Plug 'flazz/vim-colorschemes'
    
    Plug 'ryanoasis/vim-devicons'
    
    Plug 'tpope/vim-sensible'
 
    "Snippet engines"
    Plug 'honza/vim-snippets'

    "for comment"
    Plug 'scrooloose/nerdcommenter'

    "Auto close parentheses and"
    Plug 'cohama/lexima.vim'

    "displaying thin vertical lines at each indentation level"
    Plug 'yggdroot/indentline'

    "statusline/tabline plugin for Vim"
    Plug 'itchyny/lightline.vim'

    "It shows which lines have been added, modified, or removed."
    Plug 'airblade/vim-gitgutter'

   "Insert or delete brackets, parens, quotes in pair"
    Plug 'jiangmiao/auto-pairs'

   "syntax checking and semantic errors"
    Plug 'dense-analysis/ale'

    "provides an easy way to browse the tags of the current file and get an overview of its structure."
    Plug 'majutsushi/tagbar'

    "indent support"  
    Plug 'lepture/vim-jinja'


     "sujest code"
    Plug 'Valloric/YouCompleteMe'
    function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer
    endif
    endfunction

    Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

call plug#end()

 
 
let g:ycm_filetype_blacklist  = {'python':1}




" color scheme
syntax on
filetype on
filetype plugin indent on


"colorscheme znake " 
"colorscheme zenburn"
"colorscheme molokai"
"colorscheme gruvbox"


try 
    set background=dark
    colorscheme molokai"
catch 
endtry

 
let g:indentLine_char = '▏'

" ale
map <C-e> <Plug>(ale_next_wrap)
map <C-r> <Plug>(ale_previous_wrap)


set noeb vb t_vb=


"SyntasticInfo"
filetype plugin indent on
syntax on

" always show the status bar
set laststatus=2


" code folding
set foldmethod=indent
set foldlevel=99


" sane text files
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8


" tags
map <leader>t :TagbarToggle<CR>


" turn on line numbering
set number
highlight LineNr  ctermfg=LightBlue ctermbg=NONE gui=NONE guifg=#ff80ff guibg=NONE


let g:ale_sign_error = '⛔️'
let g:ale_set_highlights = 0
highlight clear ALEErrorSign
highlight clear ALEWarningSign


let g:gitgutter_sign_added = '++'
let g:gitgutter_sign_modified = '--'


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


" sane editing
set tabstop=4
set shiftwidth=4
set softtabstop=4
set colorcolumn=80
set expandtab
set viminfo='25,\"50,n~/.viminfo
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2



" auto-pairs
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'


"Disable VIM matching parenthesis highlighting"
"let g:loaded_matchparen=1




"-------------------Keybinding------------------------------------------

" Move 1 more lines up or down in normal and visual selection modes.
nnoremap K :m .-2<CR>==
nnoremap J :m .+1<CR>==
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv


" word movement
imap <S-Left> <Esc>bi
nmap <S-Left> b
imap <S-Right> <Esc><Right>wi
nmap <S-Right> w


" indent/unindent with tab/shift-tab
nmap <Tab> >>
nmap <S-tab> <<
imap <S-Tab> <Esc><<i
vmap <Tab> >gv
vmap <S-Tab> <gv



map <F5> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
"quit"
map <F12> :q!<CR>


" copy, cut and paste
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa


" -----------------------move through buffers--------------------
nmap <leader>[ :bp!<CR>
nmap <leader>] :bn!<CR>


" ---------------vertical and horijental split-------------------
nnoremap <C-k> :vsp<CR>
nnoremap <C-j> :sp<CR>

" ---------------New tab-----------------------------------------
nnoremap <C-n> :tabnew<CR>
" ---------------Move tab----------------------------------------
nnoremap <C-m> :tabn<CR>


" ---------------------------------------------------------------
" YouCompleteMe
" ---------------------------------------------------------------

set completeopt-=preview

nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
inoremap <leader>; <C-x><C-o>



" -----------------------------------------------------------------
"compile for c++
" -----------------------------------------------------------------
map <F1> : !g++ % && ./a.out <CR>
" save the current file before compiling it, after  executable file name"
map <F2> :w! <CR>:! clear && g++ % && time ./a.out <CR>
map <F3> :w! <CR>:! clear && g++ % &&  ./a.out<input.txt>output.txt  && cat output.txt && time <CR>


" ------------------------------------------------------------------
"template for c++
" ------------------------------------------------------------------

nnoremap cpp i#include<bits/stdc++.h><Esc>o#define ll   long long<Esc>o<Esc>o#define fastread()  (ios_base:: sync_with_stdio(false),cin.tie(NULL));<Esc>ousing namespace std;<Esc>o<CR>int main(){<Esc>ofastread();<Esc><Esc>oint t;<Esc>o cin>>t; <CR>while(t--){<Esc>o<Esc>o}<Esc>oreturn 0;<Esc>o}<Esc>kki

nnoremap cpt i#include<bits/stdc++.h><Esc>o#define ll   long long<Esc>o<Esc>o#define fastread()  (ios_base:: sync_with_stdio(false),cin.tie(NULL));<Esc>ousing namespace std;<Esc>o<CR>int main(){<Esc>ofastread();<Esc>o<Esc>oreturn 0;<Esc>o}<Esc>kki



" disable autoindent when pasting text
" source: https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction



inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

     
" ----------------------------------------------------------------------------
" ctrlp.vim
" ----------------------------------------------------------------------------

" Disable output, vcs, archive, rails, temp and backup files
set wildignore+=*.o,*.out,*.obj,.git,*.pyc,*.class
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.swp,*~,._*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_map = '<s-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|vendor/bundle/*\|vendor/cache/*\|public\|spec)$',
  \ 'file': '\v\.(exe|so|dll|swp|log|jpg|png|json)$',
  \ }




" mouse
set mouse=a
let g:is_mouse_enabled = 1
noremap <silent> <Leader>m :call ToggleMouse()<CR>
function ToggleMouse()
    if g:is_mouse_enabled == 1
        echo "Mouse OFF"
        set mouse=
        let g:is_mouse_enabled = 0
    else
        echo "Mouse ON"
        set mouse=a
        let g:is_mouse_enabled = 1
    endif
endfunction




" wrap toggle
setlocal nowrap
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
    endif
endfunction



let g:ycm_complete_in_comments=1
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=0
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1 
     
     
     
set directory=$HOME/.vim/temp/
set backupdir=$HOME/.vim/temp/
set undodir=$HOME/.vim/temp/


 
     
     
     
     
     
     
     
  
     
     
