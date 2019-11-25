syntax on

set nu rnu

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

autocmd BufWinEnter *.py set makeprg=python\ %

imap <F5> <esc>:w<CR>:make 
nmap <F5> :w<CR>:make 
