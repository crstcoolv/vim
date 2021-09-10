" Autocmd {{{1 "
autocmd WinEnter * set cursorline
autocmd WinLeave * set nocursorline

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0  nonumber norelativenumber
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler  number

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufWinEnter *.tex set ft=tex
autocmd BufWinEnter *.py set makeprg=python\ %
autocmd BufWritePost init.vim source %
autocmd BufWinEnter *.tex set ft=tex
autocmd BufWinEnter *.full set ft=cfull
" 1}}} "

" Plug {{{1 "
filetype off
call plug#begin('~/.config/nvim/plugged')
Plug 'honza/vim-snippets'
Plug 'preservim/nerdtree', {'on':'NERDTreeToggle'}
Plug 'vifm/vifm.vim'
Plug 'mpickering/hlint-refactor-vim'
Plug '907th/vim-auto-save'
Plug 'dhruvasagar/vim-zoom'
Plug 'pbogut/fzf-mru.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'calebsmith/vim-lambdify'
Plug 'lervag/vimtex'
Plug 'easymotion/vim-easymotion'
Plug 'kh3phr3n/python-syntax'
Plug  'lilydjwg/colorizer', {'on':'ColorToggle'}
" Plug 'sheerun/vim-polyglot'
Plug 'sjl/gundo.vim' , {'on' : 'GundoToggle'}
Plug 'blindFS/vim-colorpicker', {'on' : 'ColorPicker'}
Plug 'junegunn/fzf.vim'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'raichoo/haskell-vim'
Plug 'sjl/badwolf'
Plug 'morhetz/gruvbox'
call plug#end()
filetype plugin indent on
" 1}}} "

" Set/Let {{{1 "
colorscheme badwolf
set expandtab ts=2 sw=2  
set modeline
set foldmethod=marker
set noswapfile cursorline
set rnu nowrap nu 
set spelllang=pt
set splitright
set signcolumn=number
set foldlevel=0
set clipboard=unnamedplus
set hidden 
set smartcase ignorecase nohlsearch
set undofile undodir="~/.config/nvim/stuff/undo"
" set cc=80 
set nobackup
set nowritebackup
set cmdheight=2

let separator=" "
let mapleader = " "
let g:fzf_layout = { 'down': '~30%' }
let g:fzf_preview_window = []
let g:fzf_colors = { 'bg+': ['bg', 'Normal'] }
let g:plug_threads=32
let g:netrw_banner = 0
let g:netrw_hide = 1
let g:table_mode_corner_corner='+'
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+,\(^\|\s\s\)ntuser\.\S\+' 
let g:netrw_liststyle = 3
let g:netrw_preview = 1
let g:netrw_altv = 1
let g:gundo_right = 1
let g:fzf_action = {
  \ 'ctrl-space': 'tab split',
  \ '½': 'split',
  \ 'tab': 'vsplit' }
" let g:ale_fixers = {
"       \ 'haskell':['hlint'],
"       \}
let g:netrw_list_hide = '^\..*'
let g:netrw_hide = 1
let g:ghcid_quickfix = #{
      \ showing: 'quickfix_on_error'
      \ }
" 1}}} "

" Maps {{{1 "
nnoremap ½<space> :NERDTreeToggle<CR>
inoremap ½<space> <esc>:NERDTreeToggle<CR>
nmap - :Vifm<Cr>
nnoremap <leader>g :GundoToggle<CR>
nmap þ vip
tnoremap <Esc> <C-\><C-n>:q!<CR>
nmap <F6> :setlocal spell!<CR>
nmap s <Plug>(easymotion-overwin-f2)
nmap ½½ <c-w>m
imap kj <esc>
nmap<F10> :!pdflatex % && zathura "'%:r'.pdf"
imap <C-left> <esc>mm[s1z=`ma
nmap <C-left> <esc>mm[s1z=`ma
imap ħ <C-o>h
imap º <C-o>j
imap ĸ <C-o>k
imap ł <C-o>l
imap ² <C-o>w
imap ° <C-o>$
imap ß <C-o>diw
imap ¡ <C-o>I
imap ø <C-o>o
imap → <C-o>O
imap ⅞ <C-o>A
imap ” <C-o>b
imap þ <C-o>f)%hciw
imap € <C-o>e
imap ¬ <C-o>ci'
imap ↓ <C-o>ci(
imap đ <esc>ciw  
imap <F5> <esc>:w<CR>:make
nmap <F5> :w<CR>:make  
tnoremap <Esc> <C-\><C-n>
nnoremap j gj
nnoremap k gk
nmap <F4> :ColorPicker<CR>
imap <F4> <esc>:ColorPicker<CR>
nnoremap <Enter> :FZFMru<CR>
nnoremap <leader>b :BLines<CR>
nnoremap <leader>q :wq!<CR>
nnoremap <leader>d :vnew <c-r>=expand("%:p:h")<CR>/
nnoremap <leader>f :Files<CR>
nnoremap <leader>l :Lines<CR>
nnoremap <silent> <leader>a :Ag<CR>
nnoremap <C-k> :m .+1<CR>==
nnoremap <C-j> :m .-2<CR>==
inoremap <C-h> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+1<CR>gv=gv
nnoremap <leader><Tab> :Buffers<CR>
nmap <leader><leader> za
nnoremap <Tab>  <C-w><C-w>
nnoremap ½h <C-w>H
nnoremap ½j <C-w>J
nnoremap ½k <C-w>K
nnoremap ½l <C-w>L
nnoremap ħ <C-w>h
nnoremap º <C-w>j
nnoremap ĸ <C-w>k
nnoremap ł <C-w>l
nnoremap <bs> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
" nmap <leader>w <esc>:below 9sp term://ghci<cr>i

let g:cmds={
      \ 'python':'python',
      \  'haskell':'ghci'
      \ }


nnoremap <leader>w @=((get(g:cmds, &ft, 'No') !=# 'No') ?
      \ ':below 8sp term://' . get(g:cmds, &ft) : ''  )<CR><cr>i

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>j :e #<cr>
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap cl 0f>ld$a 
hi Quote ctermbg=109 guifg=#83a598
nmap <F3> :call CocActionAsync('codeLensAction')<cr>
imap <F3> <esc>:call CocActionAsync('codeLensAction')<cr>a
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

" }}} "

" Functions {{{1 "
" function! s:fzf_neighbouring_files()
"   let current_file =expand("%")
"   let cwd = fnamemodify(current_file, ':p:h')
"   let command = 'ag -g "" -f ' . cwd . ' --depth 0'

"   call fzf#run(fzf#wrap({
"         \ 'source': command,
"         \ 'options': '-m -x +s',
"         \ 'window':  'enew' }))
" endfunction

" command! FZFNeigh call s:fzf_neighbouring_files()


function! s:fzf_neighbouring_files()
  let cwd = expand("%:~:.:h")
  let command = 'Ag --files --hidden -g "'.cwd.'/*"'
  echo command

  call fzf#run(fzf#wrap({ 'source': command, 'sink': 'e' }))
        "\ 'source': command,
"\ 'options': '-m -x +s'
endfunction

command! FZFNeigh call s:fzf_neighbouring_files()



function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction
" 1}}} "

" Coc {{{1 "
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() :
" 			      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"                               \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

if exists('*complete_info')
  inoremap <silent><expr> <cr> complete_info(['selected'])['selected'] != -1 ? "\<C-y>" : "\<C-g>u\<CR>"
endif


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<cr>'


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>t  <Plug>(coc-format-selected)
nmap <leader>t  <Plug>(coc-format-selected) 

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
nmap <F2>a  <Plug>(coc-codeaction-selected)
imap <F2>a  <esc><Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>cc  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Show all diagnostics.
nnoremap <silent><nowait> <space>da  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>co  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>cs  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" 1}}} "

" StatusLine {{{1 "
hi StatusLineNC cterm=none ctermbg=none ctermfg=234
hi StatusLine cterm=none ctermbg=none ctermfg=7 
hi  CocStatus ctermfg=184

set statusline=
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=%#CocStatus#
set statusline+=%{coc#status()}%{get(b:,'coc_current_function','')}
set statusline+=%#StatusLine#
set statusline+=%*
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=%{separator}
" 1}}} "

" Hi {{{1 "
hi Normal ctermbg=none
hi NonText cterm=none ctermfg=190 ctermbg=none

hi CursorLine ctermbg=233 cterm=none
hi CursorLineNr ctermfg=190 ctermbg=233


hi LineNr ctermbg=none
hi ErrorMsg ctermfg=214 ctermfg=none
hi WarningMsg ctermfg=214 ctermfg=none
hi WildMenu ctermbg=244 ctermfg=232
hi fzf2 ctermbg=232
hi fzf1 ctermbg=232
hi fzf3 ctermbg=232
hi VertSplit ctermfg=245 ctermbg=233
hi Folded ctermbg=233 ctermfg=245
hi SignColumn ctermbg=none
hi ColorColumn ctermbg=none ctermfg=1 cterm=bold
hi SpellBad cterm=underline ctermbg=none ctermfg=none
hi SpellCap ctermbg=none
hi CursorLineNr ctermbg=233
hi Comment ctermfg=247
hi Number ctermfg=7

hi CocCodeLens ctermfg=6
" 1}}} "
