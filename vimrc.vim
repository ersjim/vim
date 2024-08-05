set nocompatible " be iMproved, required
filetype off     " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'preservim/nerdtree'
Plugin 'wuelnerdotexe/vim-astro'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-sensible.git'
Plugin 'mg979/vim-visual-multi'
Plugin 'puremourning/vimspector'
call vundle#end()         " required
filetype plugin indent on " required

set et ts=4 sts=4 sw=4 hlsearch ai nu rnu mouse=
syntax on
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB', 'vscode-php-debug' ]
" Run :VimspectorInstall to install these

autocmd FileType go nnoremap <F5> :GoRun<CR>
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" nmap <Leader>db <Plug>VimspectorBreakpoints
" nmap <F4> <Plug>VimspectorStop
" nmap <F5> <Plug>VimpectorRestart
" nmap <F5> <Plug>VimspectorBreakpoints
" nmap <F5> <Plug>VimspectorToggleConditionalBreakpoint
" nmap <F5> <Plug>VimspectorAddFunctionBreakpoint
" nmap <F5> <Plug>VimspectorGoToCurrentLine
" nmap <F5> <Plug>VimspectorRunToCursor
" nmap <F5> <Plug>VimspectorStepOut
" nmap <F5> <Plug>VimspectorUpFrame
" nmap <F5> <Plug>VimspectorDownFrame
" nmap <F5> <Plug>VimspectorJumpToPreviousBreakpoint
" nmap <F5> <Plug>VimspectorJumpToProgramCounter
" nmap <F5> <Plug>VimspectorBalloonEval
" nmap <M-8> <Plug>VimspectorDisassemble
" nmap <F11> <Plug>VimspectorStepInto
" nmap <F5> <Plug>VimspectorContinue
" nmap <F6> <Plug>VimspectorPause
" nmap <F9> <Plug>VimspectorToggleBreakpoint
" nmap <F10> <Plug>VimspectorStepOver
" nmap <F8> <Plug>VimspectorJumpToNextBreakpoint

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
