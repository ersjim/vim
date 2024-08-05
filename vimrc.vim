set nocompatible " be iMproved, required
filetype off     " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Vim GIT integration, see :Git for menu
" This plugin does a lot of cool stuff.
Plugin 'tpope/vim-fugitive'

" Press F2 to see the menu pop up on the left, and 'C' will set the reference
" directory for nerdtree:
Plugin 'preservim/nerdtree'

Plugin 'wuelnerdotexe/vim-astro'

Plugin 'fatih/vim-go'

Plugin 'tpope/vim-sensible.git'

" Multi Cursors support
Plugin 'mg979/vim-visual-multi'

" Begin debugging with F5:
Plugin 'puremourning/vimspector'

" Grep stuff with \\v and :Grep
Plugin 'dkprice/vim-easygrep'

" install LSP stuff:
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
" :LspInstallServer in a file that is supported

call vundle#end()         " required
filetype plugin indent on " required

" CUSTOM CONFIGURATIONS
set et ts=4 sts=4 sw=4 hlsearch ai nu rnu mouse=
set foldmethod=marker
autocmd BufWritePost * !php -l <afile>
au BufReadPost *.tpl set syntax=html
au BufReadPost *.json set syntax=javascript
augroup filetype javascript syntax=javascript
syntax on
autocmd FileType go nnoremap <F5> :GoRun<CR>

" NERDTREE CONFIGURATIONS
let NERDTreeQuitOnOpen=0
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
inoremap <f2> <C-r>=system("date +%Y-%m-%d <bar> tr -d '\n'")<cr>

" EASYGREP CONFIGURATIONS
let g:EasyGrepFileAssociations=expand('$HOME/.vim/bundle/vim-easygrep/plugin/EasyGrepFileAssociations')
let g:EasyGrepMode=0
let g:EasyGrepCommand=1
let g:EasyGrepRecursive=1
let g:EasyGrepSearchCurrentBufferDir=1
let g:EasyGrepIgnoreCase=0
let g:EasyGrepHidden=0
let g:EasyGrepBinary=0
let g:EasyGrepFilesToInclude=''
let g:EasyGrepFilesToExclude='*.swp,*~'
let g:EasyGrepAllOptionsInExplorer=1
let g:EasyGrepWindow=0
let g:EasyGrepReplaceWindowMode=0
let g:EasyGrepOpenWindowOnMatch=1
let g:EasyGrepEveryMatch=0
let g:EasyGrepJumpToMatch=0
let g:EasyGrepInvertWholeWord=0
let g:EasyGrepPatternType='regex'
let g:EasyGrepFileAssociationsInExplorer=0
let g:EasyGrepExtraWarnings=0
let g:EasyGrepOptionPrefix='<leader>vy'
let g:EasyGrepReplaceAllPerFile=0
let g:EasyGrepRoot='/home/eventrentalsystems/public_html'

" DEBUGGING CONFIGURATIONS
" let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB', 'vscode-php-debug' ]
" Run :VimspectorInstall to install these
nmap <F5> <Plug>VimspectorContinue
nmap <F3> <Plug>VimspectorStop
nmap <F4> <Plug>VimspectorRestart
nmap <F6> <Plug>VimspectorPause
nmap <F9> <Plug>VimspectorToggleBreakpoint
nmap <leader><F9> <Plug>VimspectorToggleConditionalBreakpoint
nmap <F8> <Plug>VimspectorAddFunctionBreakpoint
nmap <leader><F8> <Plug>VimspectorRunToCursor
nmap <F10> <Plug>VimspectorStepOver
nmap <F11> <Plug>VimspectorStepInto
nmap <F12> <Plug>VimspectorStepOut
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

" LSP CONFIUGRATIONS
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
