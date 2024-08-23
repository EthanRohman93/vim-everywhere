" Pathogen setup
execute pathogen#infect()
syntax on
filetype plugin indent on
syntax enable
set encoding=utf-8
set fileencodings=utf-8
colorscheme rosepine
set background=dark
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight StatusLine ctermbg=NONE guibg=NONE
highlight StatusLineNC ctermbg=NONE guibg=NONE


" Leader key
let mapleader = " "

" General editing settings
set autoindent
set smartindent
set smarttab
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set nowrap
set number
set relativenumber
set scrolloff=6
set cursorline
set noerrorbells
set visualbell
set t_vb=
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set ignorecase
set smartcase
set incsearch
set hlsearch
set textwidth=80
set colorcolumn=80
if (has("termguicolors"))
 set termguicolors
endif


" Autocmd settings for various file types custom indents
augroup FiletypeSettings
  autocmd!
  autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd BufNewFile,BufRead *.html,*.json,*.yml,*.yaml,*.sql,*.css,*.jsx setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.rs,*.java setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd BufNewFile,BufRead *.js,*.ts,*.tsx setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

nnoremap <CR> :noh<CR><CR>:<backspace>
noremap S :%s//g<Left><Left>
nmap <Leader>, :w<CR>:so %<CR>
nmap <Leader><Leader> :Ex<CR>

vmap J :m '>+1<CR>gv=gv
vmap K :m '<-2<CR>gv=gv

set mouse=a

nnoremap J mzJ`z
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap N Nzzzv

let g:lightline = { 'colorscheme': 'rosepine' }

" FZF configuration (no specific config needed by default)
let g:fzf_command_prefix = 'Fzf'

" Vim-LSP and Vim-LSP-Settings configuration
let g:lsp_diagnostics_enabled = 1
let g:lsp_signs_enabled = 1
let g:lsp_highlights_enabled = 1
let g:lsp_virtual_text_enabled = 1

" Syntastic configuration
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Vim-commentary (no specific config needed)
" Vim-unimpaired (no specific config needed)
" Fugitive (no specific config needed)

" Customize asyncomplete colors to match Rose Pine
highlight Pmenu ctermbg=236 guibg=#302D41 guifg=#FAE3B0
highlight PmenuSel ctermbg=132 guibg=#9ccfd8 guifg=#191724
highlight PmenuSbar ctermbg=235 guibg=#191724
highlight PmenuThumb ctermbg=245 guibg=#403D52
highlight PmenuBorder guibg=#302D41 guifg=#302D41

inoremap <C-y> <C-n><C-y>
" Register LSP servers with vim-lsp based on the installed languages

if executable('tsserver')
    au User lsp_setup call lsp#register_server({
    \ 'name': 'tsserver',
    \ 'cmd': {server_info->['typescript-language-server', '--stdio']},
    \ 'whitelist': ['javascript', 'typescript', 'javascript.jsx', 'typescript.tsx'],
    \ })
endif

if executable('pyright-langserver')
    au User lsp_setup call lsp#register_server({
    \ 'name': 'pyright',
    \ 'cmd': {server_info->['pyright-langserver', '--stdio']},
    \ 'whitelist': ['python'],
    \ })
endif

if executable('gopls')
    au User lsp_setup call lsp#register_server({
    \ 'name': 'gopls',
    \ 'cmd': {server_info->['gopls']},
    \ 'whitelist': ['go'],
    \ })
endif

if executable('rust-analyzer')
    au User lsp_setup call lsp#register_server({
    \ 'name': 'rust-analyzer',
    \ 'cmd': {server_info->['rust-analyzer']},
    \ 'whitelist': ['rust'],
    \ })
endif

if executable('clangd')
    au User lsp_setup call lsp#register_server({
    \ 'name': 'clangd',
    \ 'cmd': {server_info->['clangd']},
    \ 'whitelist': ['c', 'cpp'],
    \ })
endif

" let g:vim_lsp_java = {
"   \ 'eclipse_jdtls' : {
"     \ 'repository': expand('~/opt/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository'),
"     \ 'config': 'config_linux',
"     \ 'workspace': expand('$HOME/workspace'),
"   \ },
" \ }

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

set laststatus=2

nmap <leader>c <Plug>CommentaryLine
vmap <leader>c <Plug>Commentary

