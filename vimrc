set nocompatible " be iMproved
filetype off " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc() " "

Bundle 'https://github.com/Twinside/vim-cuteErrorMarker.git'
Bundle 'https://github.com/vim-scripts/OmniCppComplete.git'
Bundle 'https://github.com/vim-scripts/VisIncr.git'
Bundle 'https://github.com/Townk/vim-autoclose.git'
Bundle 'https://github.com/wincent/Command-T.git'
Bundle 'git://github.com/Lokaltog/vim-easymotion.git'
"Bundle 'git://github.com/motemen/git-vim.git'
Bundle 'git://github.com/tpope/vim-fugitive.git'
Bundle 'https://github.com/vim-scripts/javacomplete'
Bundle 'https://github.com/vim-scripts/matchit.zip.git'
Bundle 'https://github.com/scrooloose/nerdcommenter.git'
Bundle 'https://github.com/Lokaltog/vim-powerline.git'
Bundle 'https://github.com/vim-scripts/pythoncomplete.git'
Bundle 'https://github.com/vgod/scala-vim-support.git'
Bundle 'https://github.com/msanders/snipmate.vim.git'
Bundle 'https://github.com/ervandew/supertab.git'
Bundle 'https://github.com/tpope/vim-surround.git'
Bundle 'git://github.com/majutsushi/tagbar'
Bundle 'https://github.com/pangloss/vim-javascript.git'
Bundle 'git://github.com/kaeze/vimplugin.git'
Bundle 'https://github.com/sukima/xmledit.git'
Bundle 'https://github.com/vim-scripts/YankRing.vim.git'
Bundle 'Valloric/YouCompleteMe'
Bundle 'taglist.vim'
Bundle 'a.vim'
Bundle 'airblade/vim-gitgutter'




filetype plugin indent on    

set nocompatible	" not compatible with the old-fashion vi mode
set bs=2		" allow backspacing over everything in insert mode
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set autoread		" auto read when file is changed from outside


syntax on
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins


" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc


syntax on		" syntax highlight
set hlsearch		" search highlighting

if has("gui_running")	" GUI color and font settings
  set guifont=Osaka-Mono:h20
  set background=dark 
  set t_Co=256          " 256 color mode
  set cursorline        " highlight current line
  colors icansee
else
" terminal color settings
  colors icansee 
endif

set clipboard=unnamed	" yank to the system register (*) by default
set showmatch		" Cursor shows matching ) and }
set showmode		" Show current mode
set wildchar=<TAB>	" start wild expansion in the command line using <TAB>
set wildmenu            " wild char completion menu

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc

set tabstop=4
set autoindent		" auto indentation
set incsearch		" incremental search
set nobackup		" no *~ backup files
set copyindent		" copy the previous indentation on autoindenting
"set ignorecase		" ignore case when searching
"set smartcase		" ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab		" insert tabs on the start of a line according to context

" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
"set t_ti= t_te=

" TAB setting{
   set expandtab        "replace <TAB> with spaces
   set softtabstop=4 
   set shiftwidth=4 

   au FileType Makefile set noexpandtab
"}      							

" status line {
set laststatus=2
set statusline=%{GitBranch()}
set statusline+=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \ 
set statusline+=\ \ \ [%{&ff}/%Y] 
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\ 
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction

"}


" C/C++ specific settings
autocmd FileType c,cpp,cc  set cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"--------------------------------------------------------------------------- 
" Tip #382: Search for <cword> and replace with input() in all open buffers 
"--------------------------------------------------------------------------- 
fun! Replace() 
    let s:word = input("Replace " . expand('<cword>') . " with:") 
    :exe 'bufdo! %s/\<' . expand('<cword>') . '\>/' . s:word . '/ge' 
    :unlet! s:word 
endfun 


"--------------------------------------------------------------------------- 
" USEFUL SHORTCUTS
"--------------------------------------------------------------------------- 
" set leader to ,
let mapleader=","
let g:mapleader=","

"replace the current word in all opened buffers
map <leader>r :call Replace()<CR>

" open the error console
map <leader>cc :botright cope<CR> 
" move to next error
map <leader>] :cn<CR>
" move to the prev error
map <leader>[ :cp<CR>

" --- move around splits {
" move to and maximize the below split 
map <C-J> <C-W>j<C-W>_
" move to and maximize the above split 
map <C-K> <C-W>k<C-W>_
" move to and maximize the left split 
nmap <c-h> <c-w>h<c-w><bar>
" move to and maximize the right split  
nmap <c-l> <c-w>l<c-w><bar>
set wmw=0                     " set the min width of a window to 0 so we can maximize others 
set wmh=0                     " set the min height of a window to 0 so we can maximize others
" }

" move around tabs. conflict with the original screen top/bottom
" comment them out if you want the original H/L
" go to prev tab 
"map <S-H> gT
"map <C-h> gT
" go to next tab
"map <S-L> gt
"map <C-l> gt

" new tab
map <C-t><C-t> :tabnew<CR>
" close tab
map <C-t><C-w> :tabclose<CR> 

" ,/ turn off search highlighting
nmap <leader>/ :nohl<CR>

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

" ,p toggles paste mode
nmap <leader>p :set paste!<BAR>set paste?<CR>

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv

" :cd. change working directory to that of the current file
cmap cd. lcd %:p:h

" Writing Restructured Text (Sphinx Documentation) {
   " Ctrl-u 1:    underline Parts w/ #'s
   noremap  <C-u>1 yyPVr#yyjp
   inoremap <C-u>1 <esc>yyPVr#yyjpA
   " Ctrl-u 2:    underline Chapters w/ *'s
   noremap  <C-u>2 yyPVr*yyjp
   inoremap <C-u>2 <esc>yyPVr*yyjpA
   " Ctrl-u 3:    underline Section Level 1 w/ ='s
   noremap  <C-u>3 yypVr=
   inoremap <C-u>3 <esc>yypVr=A
   " Ctrl-u 4:    underline Section Level 2 w/ -'s
   noremap  <C-u>4 yypVr-
   inoremap <C-u>4 <esc>yypVr-A
   " Ctrl-u 5:    underline Section Level 3 w/ ^'s
   noremap  <C-u>5 yypVr^
   inoremap <C-u>5 <esc>yypVr^A
"}

"--------------------------------------------------------------------------- 
" PROGRAMMING SHORTCUTS
"--------------------------------------------------------------------------- 

" Ctrl-[ jump out of the tag stack (undo Ctrl-])
"map <C-[> <ESC>:po<CR>

" ,g generates the header guard
map <leader>g :call IncludeGuard()<CR>
fun! IncludeGuard()
   let basename = substitute(bufname(""), '.*/', '', '')
   let guard = '_' . substitute(toupper(basename), '\.', '_', "H")
   call append(0, "#ifndef " . guard)
   call append(1, "#define " . guard)
   call append( line("$"), "#endif // for #ifndef " . guard)
endfun



" Enable omni completion. (Ctrl-X Ctrl-O)
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete

" use syntax complete if nothing else available
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
              \	if &omnifunc == "" |
              \		setlocal omnifunc=syntaxcomplete#Complete |
              \	endif
endif

set cot-=preview "disable doc preview in omnicomplete

" make CSS omnicompletion work for SASS and SCSS
autocmd BufNewFile,BufRead *.scss             set ft=scss.css
autocmd BufNewFile,BufRead *.sass             set ft=sass.css

"--------------------------------------------------------------------------- 
" ENCODING SETTINGS
"--------------------------------------------------------------------------- 
set encoding=utf-8                                  
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1

fun! ViewUTF8()
	set encoding=utf-8                                  
	set termencoding=big5
endfun

fun! UTF8()
	set encoding=utf-8                                  
	set termencoding=big5
	set fileencoding=utf-8
	set fileencodings=ucs-bom,big5,utf-8,latin1
endfun

fun! Big5()
	set encoding=big5
	set fileencoding=big5
endfun


"--------------------------------------------------------------------------- 
" PLUGIN SETTINGS
"--------------------------------------------------------------------------- 


" ------- vim-latex - many latex shortcuts and snippets {

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash
set grepprg=grep\ -nH\ $*
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

"}


" --- AutoClose - Inserts matching bracket, paren, brace or quote 
" fixed the arrow key problems caused by AutoClose
if !has("gui_running")	
   set term=xterm
   imap OA <ESC>ki
   imap OB <ESC>ji
   imap OC <ESC>li
   imap OD <ESC>hi

   nmap OA k
   nmap OB j
   nmap OC l
   nmap OD h
endif



" --- Command-T
let g:CommandTMaxHeight = 15

" --- SuperTab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]


" add By Kyle
let Tlist_Ctags_Cmd = 'ctags'
"nnoremap <leader>N :NERDTree<CR>
nnoremap <leader>T  :TlistToggle<CR>
nmap <leader>G   :ToggleGitMenu<CR>
"nnoremap <silent> <F5> :NERDTree<CR>
set cursorline

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gbk,ucs-bom,cp936
"set list
"set lcs=tab:>-,trail:=

let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_pdf = 'okular'
let g:Tex_ViewRule_dvi = 'okular'
"set clipboard=unnamedplus
set clipboard=autoselect,exclude:cons\|linux

fun! KerenlSetting()
    set number "display line number
    set nocompatible                        " vimrcm defaults, not vi!
    filetype on                             " automatic file type detection
    set noexpandtab                         " use tabs, not spaces
    set tabstop=8                           " tabstops of 8
    set shiftwidth=8                        " indents of 8
    set textwidth=78                        " screen in 80 columns wide, wrap at
    78
    set autoindent smartindent              " turn on auto/smart indenting
    set smarttab                            " make <tab> and <backspace> smarter
    set backspace=eol,start,indent          " allow backspacing over indent, eol, & start 
    filetype plugin indent on
    nmap <C-J> vip=                         " forces (re)indentation of a block of code
    syntax on" enable syntax highlighting
    " highlightingligh kernel types
    syn keyword cType uint ubyte ulong uint64_t uint32_t uint16_t uint8_t boolean_t int64_t 
    syn keyword cType int32_t int16_t int8_t u_int64_t u_int32_t u_int16_t u_int8_t
    syn keyword cOperator likely unlikely
    syn match ErrorLeadSpace /^ \+/         " highlight any leading spaces
    syn match ErrorTailSpace / \+$/         " highlight any trailing spaces
    syn match Error80        /\%>80v.\+/    " highlight anything past 80 in red
    set formatoptions=tcqlron " automatically add commentsnt leaders
    set cinoptions=:0,l1,t0,g0 " handle C indention
    set foldmethod=syntax " fold on braces
    let $kernel_version=system('uname -r | transition -d "\n"')""""""""""
endfunc
set nu
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
" --- PowerLine
" let g:Powerline_symbols = 'fancy' " require fontpatcher
"

" --- SnipMate
let g:snipMateAllowMatchingDot = 0

" --- coffee-script
au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw! " recompile coffee scripts on write
set t_Co=256
