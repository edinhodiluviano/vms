" """""""""""""""""""""""
" """ from debian.vim """
" """""""""""""""""""""""
"
" " Debian system-wide default configuration Vim
" "
" set runtimepath=~/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim80,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after,/usr/local/share/vim/vim82/
"
" " Normally we use vim-extensions. If you want true vi-compatibility
" " remove change the following statements
" set nocompatible	" Use Vim defaults instead of 100% vi compatibility
" set backspace=indent,eol,start	" more powerful backspacing
"
" " Now we set some defaults for the editor
" set history=50		" keep 50 lines of command line history
" set ruler		" show the cursor position all the time
"
" " modelines have historically been a source of security/resource
" " vulnerabilities -- disable by default, even when 'nocompatible' is set
" set nomodeline
"
" " Suffixes that get lower priority when doing tab completion for filenames.
" " These are files we are not likely to want to edit or read.
" set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
"
" " We know xterm-debian is a color terminal
" if &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
"   set t_Co=16
"   set t_Sf=[3%dm
"   set t_Sb=[4%dm
" endif
"
" " Some Debian-specific things
" if has("autocmd")
"   if has('gui')
"     " Must define this within the :if so it does not cause problems with
"     " vim-tiny (which does not have +eval)
"     function! <SID>MapExists(name, modes)
"       for mode in split(a:modes, '\zs')
"         if !empty(maparg(a:name, mode))
"           return 1
"         endif
"       endfor
"       return 0
"     endfunction
"
"     " Make shift-insert work like in Xterm
"     autocmd GUIEnter * if !<SID>MapExists("<S-Insert>", "nvso") | execute "map <S-Insert> <MiddleMouse>" | endif
"     autocmd GUIEnter * if !<SID>MapExists("<S-Insert>", "ic") | execute "map! <S-Insert> <MiddleMouse>" | endif
"   endif
" endif
"
" """ from debian.vim end """
" """""""""""""""""""""""""""


""""""""""""""""""""""""""
""" file type and tabs """
""""""""""""""""""""""""""
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

au BufNewFile,BufRead *.js,*.html,*.css,*.sql,*.sml
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

au BufNewFile,BufRead Makefile
    \ set expandtab!

au BufNewFile,BufRead *.py,*.c,*.cpp,*.h,*.hpp
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab

set autoindent
set fileformat=unix

" adding subfolders to path
set path+=**
set wildignore+=**/__pycache__/**
set wildignore+=**/.venv/**

""" file type and tabs ends """
"""""""""""""""""""""""""""""""



"""""""""""""""
""" display """
"""""""""""""""
" display line numbers
set nu
set rnu
augroup my_colorschemes
    autocmd!

    " customizing colorscheme
    autocmd Colorscheme wildcharm
        \ highlight CursorLine cterm=None ctermbg=17
        \ | highlight ColorColumn ctermbg=52
        \ | highlight BadWhitespace ctermbg=124

    " Flagging Unnecessary Whitespace
    " highlight BadWhitespace ctermbg=124
    autocmd InsertEnter,InsertLeave,WinEnter,BufRead
        \ *.py,*.pyw,*.c,*.cpp,*.h,*.hpp,*.sql,*.yml,*.yaml,*.toml
        \ match BadWhitespace /\s\+$/

augroup END
colorscheme wildcharm

" how cursor line
set cursorline
" highlight CursorLine cterm=None ctermbg=17

" show mark on column 79 (pep-8)
set colorcolumn=79
" highlight ColorColumn ctermbg=52

" set folding
set foldmethod=indent
set foldlevelstart=99
set foldignore=

" changing cursor with mode
let &t_SI = "\<esc>[5 q"  " blinking I-beam in insert mode
let &t_EI = "\<esc>[ q"  " default cursor (usually blinking block) otherwise

" syntax highlight
syntax on

" file explorer shows tree
let g:netrw_liststyle = 3
let g:netrw_winsize=25

" highlight searches
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Display search result count and match position
set shortmess-=S

""" display ends """
""""""""""""""""""""


""""""""""""""""""
""" navigation """
""""""""""""""""""
" disable arrow keys
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>

vno <down> <Nop>
vno <left> <Nop>
vno <right> <Nop>
vno <up> <Nop>

" scroll multiple lines
:nnoremap <C-E> 10<C-E>
:nnoremap <C-Y> 10<C-Y>
:xnoremap <C-E> 10<C-E>
:xnoremap <C-Y> 10<C-Y>

" keep 5 lines before and after cursor
set scrolloff=5

" file tree
nnoremap <leader>/ :NERDTree<cr>

""" navigation ends """
"""""""""""""""""""""""


"""""""""""""""""
""" splitting """
"""""""""""""""""
" open terminal on the bottom (:term)
set splitbelow
set splitright
" open terminal on the right (:vterm)
command Vterm :vertical terminal


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""" splitting """
"""""""""""""""""


""""""""""""""""
""" vim-plug """
""""""""""""""""
call plug#begin()
    " The default plugin directory will be as follows:
    "   - Vim (Linux/macOS): '~/.vim/plugged'
    "   - Vim (Windows): '~/vimfiles/plugged'
    "   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
    " You can specify a custom plugin directory by passing it as the argument
    "   - e.g. `call plug#begin('~/.vim/plugged')`
    "   - Avoid using standard Vim directory names like 'plugin'

    " Make sure you use single quotes

    " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
    " Plug 'junegunn/vim-easy-align'

    " Any valid git URL is allowed
    " Plug 'https://github.com/junegunn/vim-github-dashboard.git'

    " Multiple Plug commands can be written in a single line using | separators
    " Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

    " On-demand loading
    " Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
    " Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

    " Using a non-default branch
    " Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

    " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
    " Plug 'fatih/vim-go', { 'tag': '*' }

    " Plugin options
    " Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

    " Plugin outside ~/.vim/plugged with post-update hook
    " Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

    " Unmanaged plugin (manually installed and updated)
    " Plug '~/my-prototype-plugin'

    " vim language server client plugin
    " https://github.com/prabirshrestha/vim-lsp
    Plug 'prabirshrestha/vim-lsp'

    " vim language server install
    " copied from https://github.com/prabirshrestha/vim-lsp
    " https://github.com/mattn/vim-lsp-settings
    Plug 'mattn/vim-lsp-settings'

    " autocomplete
    " https://github.com/prabirshrestha/asyncomplete.vim
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

    " Initialize plugin system
    " - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

""" vim-plug ends """
"""""""""""""""""""""


""""""""""""""""""""""""
""" common shortcuts """
""""""""""""""""""""""""
" increase and decrease tabulation in visual mode
vmap <Tab> >gv
vmap <S-Tab> <gv

" delete, don't cut
vnoremap <BS> "_d
nnoremap <BS> "_d
nnoremap x "_x
vnoremap x "_x

""" common shortcuts """
""""""""""""""""""""""""


" copy to system clipboard
set clipboard=unnamedplus
augroup my_clipboard
    autocmd!
    autocmd VimLeave * call system('echo -n ' . shellescape(getreg('+')) . ' | xclip -selection clipboard')
augroup END


function! RunLinter()
    if (executable('flake8') == 1)
        :echon ' - running flake8'

        " close previous window
        let l:results_window_number = bufwinnr('linterresults')
        if l:results_window_number > 0
            let l:current_win_number = winnr()
            let l:current_win_id = win_getid(l:current_win_number)
            execute l:results_window_number 'wincmd w'
            :quit!
            :call win_gotoid(l:current_win_id)
        endif

        let l:flake8_results = system('flake8 ' .. expand("%:p ") .. ' --format="\%(row)s:\%(col)s: \%(code)s \%(text)s"')
        if !empty(l:flake8_results)
            " execute "belowright copen 6"
            " setlocal wrap
            " nnoremap <buffer> <silent> q :cclose<CR>

            :term flake8 %:p --format="\%(row)s:\%(col)s: \%(code)s \%(text)s"
            :resize 6
            :set nonu nornu
            :set colorcolumn=
            :file 'linterresults'
        else
            :echon ' - flake8 ok'
        endif
        :redraw!
    endif
endfunction
augroup runlinteronwrite
    autocmd!
    autocmd BufWritePost *.py call RunLinter()
augroup END


" execute the current file and keep the python interpreter running
nnoremap <F9> :term ++close python3 -i %<cr>
" run pytest on the current project
nnoremap <F8> :term pytest<cr>
" run pytest only in the current file
nnoremap <F7> :term pytest %<cr>


" remove extra spaces and return to current line
nnoremap <C-A> :%s/\s\+$/<cr> ``


" delete buffer for file tree
autocmd FileType netrw setl bufhidden=delete


function! Tab2to4()
    :set ts=2 sts=2 noet
    :retab!
    :set ts=4 sts=4 et
    :retab
endfunction
