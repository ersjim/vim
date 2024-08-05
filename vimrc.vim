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

" Install FZF for finding files quickly
" make sure you do this first:
" brew install fzf bat ripgrep the_silver_searcher perl universal-ctags
Plugin 'junegunn/fzf.vim'

" Install color theme
Plugin 'cocopon/iceberg.vim.git'
Plugin 'nordtheme/vim'

" Install airline for the bottom bar
Plugin 'vim-airline/vim-airline.git'

" Install which key (shows UI for leader mappings)
Plugin 'liuchengxu/vim-which-key'

call vundle#end()         " required
filetype plugin indent on " required
let g:mapleader = "\<Space>"
let g:maplocalleader = ','


" CUSTOM CONFIGURATIONS
set et ts=4 sts=4 sw=4 hlsearch ai nu rnu mouse=
set foldmethod=marker
autocmd BufWritePost * !php -l <afile>
au BufReadPost *.tpl set syntax=html
au BufReadPost *.json set syntax=javascript
augroup filetype javascript syntax=javascript
syntax on
autocmd FileType go nnoremap <F5> :GoRun<CR>
colorscheme iceberg
set background=dark

" FZF CONFIGURATIONS
set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
nnoremap <leader>ff :call fzf#vim#files('.')<CR>

" NERDTREE CONFIGURATIONS
" let NERDTreeQuitOnOpen=0
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
" let g:EasyGrepRoot='/home/eventrentalsystems/public_html'

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
    " nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    " nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction
augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" WHICH KEY CONFIGURATIONS
let g:which_key_map = {}

" Define the mappings in a dictionary
let g:which_key_map = {}
let g:which_key_map['w'] = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : [':resize +5' , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : [':resize -5' , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
      \ '?' : ['Windows'    , 'fzf-window']            ,
      \ }

" Vimspector mappings
let g:which_key_map['<F5>'] = ['<Plug>VimspectorContinue', 'Vimspector Continue']
let g:which_key_map['<F3>'] = ['<Plug>VimspectorStop', 'Vimspector Stop']
let g:which_key_map['<F4>'] = ['<Plug>VimspectorRestart', 'Vimspector Restart']
let g:which_key_map['<F6>'] = ['<Plug>VimspectorPause', 'Vimspector Pause']
let g:which_key_map['<F9>'] = ['<Plug>VimspectorToggleBreakpoint', 'Vimspector Toggle Breakpoint']
let g:which_key_map['<leader><F9>'] = ['<Plug>VimspectorToggleConditionalBreakpoint', 'Vimspector Toggle Conditional Breakpoint']
let g:which_key_map['<F8>'] = ['<Plug>VimspectorAddFunctionBreakpoint', 'Vimspector Add Function Breakpoint']
let g:which_key_map['<leader><F8>'] = ['<Plug>VimspectorRunToCursor', 'Vimspector Run To Cursor']
let g:which_key_map['<F10>'] = ['<Plug>VimspectorStepOver', 'Vimspector Step Over']
let g:which_key_map['<F11>'] = ['<Plug>VimspectorStepInto', 'Vimspector Step Into']
let g:which_key_map['<F12>'] = ['<Plug>VimspectorStepOut', 'Vimspector Step Out']
let g:which_key_map['<Leader>di'] = ['<Plug>VimspectorBalloonEval', 'Vimspector Balloon Eval']

" xmap is similar to nmap but in visual mode
let g:which_key_map['<Leader>di'] = ['<Plug>VimspectorBalloonEval', 'Vimspector Balloon Eval']

" LSP mappings
let g:which_key_map['<buffer>gd'] = ['<plug>(lsp-definition)', 'LSP Definition']
let g:which_key_map['<buffer>gs'] = ['<plug>(lsp-document-symbol-search)', 'LSP Document Symbol Search']
let g:which_key_map['<buffer>gS'] = ['<plug>(lsp-workspace-symbol-search)', 'LSP Workspace Symbol Search']
let g:which_key_map['<buffer>gr'] = ['<plug>(lsp-references)', 'LSP References']
let g:which_key_map['<buffer>gi'] = ['<plug>(lsp-implementation)', 'LSP Implementation']
let g:which_key_map['<buffer>gt'] = ['<plug>(lsp-type-definition)', 'LSP Type Definition']
let g:which_key_map['<buffer><leader>rn'] = ['<plug>(lsp-rename)', 'LSP Rename']
let g:which_key_map['<buffer>[g'] = ['<plug>(lsp-previous-diagnostic)', 'LSP Previous Diagnostic']
let g:which_key_map['<buffer>]g'] = ['<plug>(lsp-next-diagnostic)', 'LSP Next Diagnostic']
let g:which_key_map['<buffer>K'] = ['<plug>(lsp-hover)', 'LSP Hover']
let g:which_key_map['<buffer><expr><c-f>'] = ['lsp#scroll(+4)', 'LSP Scroll Down']
let g:which_key_map['<buffer><expr><c-d>'] = ['lsp#scroll(-4)', 'LSP Scroll Up']

" Register the mappings with vim-which-key
call which_key#register('<leader>', 'g:which_key_map')
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
vnoremap <silent> <localleader> :<c-u>WhichKeyVisual  ','<CR>
nnoremap <C-w> :<c-u>WhichKeyVisual 'C-w'<CR>
" nmap g :<c-u>WhichKey 'g'<CR>
" vmap g :<c-u>WhichKeyVisual 'g'<CR>

set timeoutlen=500
