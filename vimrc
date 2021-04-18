" custom keybindings
noremap j gj
noremap k gk
nnoremap ; :

let mapleader="\<SPACE>"

" easier buffer navigation
noremap <M-h> <C-w>h
noremap <M-j> <C-w>j
noremap <M-k> <C-w>k
noremap <M-l> <C-w>l

" fix alt-keybindings
if !has('nvim')
    map h <M-h>
    map j <M-j>
    map k <M-k>
    map l <M-l>
endif

" block bindings
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

noremap <Leader>s :wa<CR>
noremap <Leader>n :nohls<CR>:HierClear<CR>
noremap <Leader>b :make<CR>
noremap <Leader>r :checktime<CR>
noremap <Leader>u :UndotreeToggle<CR>
noremap <Leader>t :NeotagsToggle<CR>

autocmd VimResized * wincmd =

set is
set hlsearch
set list
set listchars=tab:⇒\ ,precedes:←,extends:→
set showbreak=…\ 

syntax sync minlines=100 ccomment
syntax on

set background=dark
set showcmd
set ignorecase
set smartcase
set nojoinspaces
set scrolloff=3
set timeoutlen=500
set modeline
set autochdir
set autowrite
set clipboard=unnamed

set expandtab
set shiftwidth=4
set softtabstop=4

" code folding
set foldmethod=syntax
set foldnestmax=1
set foldlevel=0
set foldcolumn=1
set foldopen=block,hor,mark,percent,quickfix,search,tag,undo
set foldminlines=30
set sessionoptions-=folds
au BufRead * setlocal foldmethod=syntax

let g:fastfold_fold_command_suffixes = ['x','X','a','A','o','O','c','C','r','R','m','M','i','n','N']

" ctags
map <C-d> <C-]>
set tags=tags;

map <F1> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

let g:neotags_enabled=1
let g:neotags#c#order = 'defgstuv'
" let g:neotags_ctags_args = ['--exclude=build','--exclude=build.*']
set regexpengine=1

" undotree
set undodir=$HOME/.vim/undo
set undofile
au BufNewFile,BufRead /tmp/*,/dev/shm/* setl noundofile
let g:undotree_WindowLayout=2
let g:undotree_SetFocusWhenToggle=1

" ctrlp
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_switch_buffer = 0

set cc=81
set number
set numberwidth=1
set mouse=

" completion stuff
let g:SuperTabDefaultCompletionType = "<c-n>"
set completeopt=menu,menuone,longest,preview

let g:deoplete#enable_at_startup = 1
let g:deoplete#tag#cache_limit_size = 50000000
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
    return deoplete#close_popup() . "\<CR>"
endfunction

" the default was just horrid
colorscheme peachpuff
highlight Identifier ctermfg=174
highlight Pmenu ctermbg=16 ctermfg=231
highlight PmenuSel ctermbg=162 ctermfg=231
highlight ErrorMsg ctermbg=88 ctermfg=231
highlight Search ctermbg=none ctermfg=48
highlight MatchParen ctermbg=none ctermfg=51
highlight ColorColumn ctermbg=236
highlight SpellBad ctermfg=1 ctermbg=none
highlight SpellCap ctermfg=none ctermbg=none
highlight SpellRare ctermfg=none ctermbg=none
highlight SpellLocal ctermfg=3 ctermbg=none
highlight mailURL ctermfg=2
highlight mailEmail ctermfg=5
highlight Folded ctermfg=7  ctermbg=236
highlight FoldColumn ctermfg=243 ctermbg=16
highlight LineNr ctermfg=240 ctermbg=16
highlight EnumerationValue ctermfg=114
highlight DefinedName ctermfg=212
highlight StatusLineNC cterm=none ctermfg=240 ctermbg=16
highlight StatusLine cterm=bold ctermfg=247 ctermbg=16
highlight VertSplit cterm=none ctermbg=16 ctermfg=16
highlight NonText ctermfg=240

highlight link Variable Normal
highlight link Member Normal

highlight link CTagsConstant Identifier
highlight link CTagsLocalVariable Variable
highlight link EnumeratorName EnumerationName
highlight link EnumerationName Type

highlight link neotags_EnumTag EnumerationValue

highlight link cTypeTag Type
highlight link cFunctionTag Function
highlight link cPreProcTag DefinedName
highlight link cPreCondit DefinedName
highlight link cGlobalVar Identifier

highlight link cppTypeTag cTypeTag
highlight link cppFunctionTag cFunctionTag
highlight link cppPreProcTag cPreProcTag

highlight link HighlighterCMember Member
highlight link HighlighterCPreProc DefinedName

" error highlighting
highlight SyntaxError cterm=bold ctermfg=15 ctermbg=13
highlight SyntaxWarn cterm=bold ctermfg=11 ctermbg=8
highlight link SyntaxInfo Normal
let g:hier_highlight_group_qf = 'SyntaxError'
let g:hier_highlight_group_qfw = 'SyntaxWarn'
let g:hier_highlight_group_qfi = 'SyntaxInfo'

" diff highlighting
highlight DiffAdd ctermbg=22
highlight DiffDelete ctermbg=52 " foo
highlight DiffChange ctermbg=17

" tabs highlighting
highlight TabLine cterm=none ctermbg=239 ctermfg=white
highlight TabLineSel cterm=bold ctermbg=black ctermfg=white
highlight TabLineFill cterm=none ctermbg=234
highlight Title ctermfg=yellow

" debugger highlighting
highlight LLBreakpointSign cterm=bold ctermfg=green ctermbg=235
highlight LLSelectedPCSign cterm=bold ctermfg=207 ctermbg=239
highlight LLBreakpointLine ctermbg=235
highlight LLSelectedPCLine ctermbg=239
highlight clear SignColumn
highlight link SignColumn LineNr

" misc stuff
let g:localvimrc_persistent = 1
let g:localvimrc_persistence_file = expand('$HOME') . '/.vim/lvimrc'

" match extra whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

" custom aliases
command -bang -bar Quit q<bang>
command -bang -bar -nargs=? -complete=file -range=% Write <line1>,<line2>w<bang> <args>

set autoindent
set copyindent
set preserveindent
set backspace=indent

execute pathogen#infect()
filetype plugin indent on

call deoplete#custom#option('sources', {
\  '_': ['buffer', 'member', 'tag', 'file', 'dictionary', 'around'],
\})

" extra filetypes
au BufNewFile,BufRead *.weechatlog setf weechatlog
au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl,*.hook setf glsl
au BufNewFile,BufRead *.vpy setf python
au BufNewFile,BufRead /tmp/zsh* setf zsh

" automatically use tabs
function TabsOrSpaces()
    " Determines whether to use spaces or tabs on the current buffer.
    if getfsize(bufname("%")) > 256000
        " File is very large, just use the default.
        return
    endif

    let numTabs=len(filter(getbufline(bufname("%"), 1, 250), 'v:val =~ "^\\t"'))
    let numSpaces=len(filter(getbufline(bufname("%"), 1, 250), 'v:val =~ "^ "'))

    if numTabs > numSpaces
        setlocal noexpandtab
    endif
endfunction

" Call the function after opening a buffer
autocmd BufReadPost * call TabsOrSpaces()
