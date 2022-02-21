let mapleader=";"
set nocompatible
set ignorecase
filetype on
syntax on
set mouse=a
set encoding=utf-8
set nu
set rnu
set shiftwidth=2 "indent each level
set tabstop=2 "tab indent
set t_Co=256

imap jk <ESC>
map! jk <ESC>
nmap <space> :
map <silent> <F3> :NERDTreeToggle<CR>
nmap qq :noh<CR>
nmap , ^
nmap . $
map wd :set splitright<CR>:vsplit<CR>
map wa :set nosplitright<CR>:vsplit<CR>
map ws :set splitbelow<CR>:split<CR>
map ww :set nosplitbelow<CR>:split<CR>

call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'neoclide/coc.nvim'
Plug 'vim-airline/vim-airline'
Plug 'yggdroot/leaderf'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'rhysd/vim-clang-format'
Plug 'Yggdroot/indentLine'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'connorholyday/vim-snazzy'
call plug#end()

"=============snazzy===============
colorscheme snazzy

"=============doxygen==============
let g:DoxygenToolkit_authorName = "Fenghuang Yang"
let g:DoxygenToolkit_licenseTag="\<enter>All rights reserved by Fenghuang Yang"
let g:DoxygenToolkit_briefTag_pre = "@brief "
let g:DoxygenToolkit_paramTag_pre = "@param "
let g:DoxygenToolkit_returnTag = "@return "
let g:DoxygenToolkit_briefTag_funcName = "yes"

"============coc.nvim===============
let g:coc_global_extensions = ['coc-json' , 'coc-clangd' , 'coc-cmake' , 'coc-vimlsp' , 'coc-translator', 'coc-actions']
set hidden
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-q> coc#refresh()
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <leader>, <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>. <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> <leader>h :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
map cc :CocCommand<CR>
"------------coc-actions------------------
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
"------------coc-translator---------------
" NOTE: do NOT use `nore` mappings
" popup
nmap <Leader>t <Plug>(coc-translator-p)
vmap <Leader>t <Plug>(coc-translator-pv)

inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
