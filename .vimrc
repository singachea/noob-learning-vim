" vim: set et fenc=utf-8 ft=vim sts=4 sw=4 ts=8 tw=80 :
"
" Author: microfracture / https://linuxious.com/
" Updated: 2015-05-31


" =============================================================================
" Initial setup
" =============================================================================

if &compatible                          " Disable Vi compatibility.
    set nocompatible
endif

set encoding=utf-8                      " Set encoding to UTF-8.
set fileencoding=utf-8                  " Set file encoding to UTF-8.

filetype plugin indent on               " Automatically detect file types.
syntax on                               " Enable syntax highlighting.

runtime! macros/matchit.vim             " Load Vim's built-in matchit.vim.

if $TERM =~ '-256color'                 " Set to 256 color if available.
    set t_Co=256
endif

" Start vim-plug (a minimalistic plugin manager) and load the plugins listed
" below. It is available at: https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')


" =============================================================================
" Plugin -- Code Display & Color Schemes
" =============================================================================

Plug 'ntpeters/vim-better-whitespace'   " Better whitespace highlighting.

" Displays indentation levels for code indented with spaces.
Plug 'Yggdroot/indentLine'
    let g:indentLine_char = '│'

Plug 'gosukiwi/vim-atom-dark'           " Inspired by Atom's dark theme.
Plug 'nanotech/jellybeans.vim'          " A colorful and dark theme.
Plug 'romainl/Apprentice'               " A dark and low-contrast theme
Plug 'w0ng/vim-hybrid'                  " An amalgamation of a few themes.


" =============================================================================
" Plugin -- Commands
" =============================================================================

Plug 'antoyo/vim-licenses'              " Insert licenses at top of buffer.
Plug 'godlygeek/tabular'                " Easily filter and align text.
Plug 'haya14busa/incsearch.vim'         " Highlights all matching patterns.
    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
    map g/ <Plug>(incsearch-stay)

Plug 'vim-scripts/Modeliner'            " Generates a modeline according to
                                        " your current settings.
    let g:Modeliner_format = 'ft=  fenc=  tw=  et  ts=  sts=  sw='


" =============================================================================
" Plugin -- Completion
" =============================================================================

"Plug 'ajh17/VimCompletesMe'            " A light-weight tab-completion plugin.
Plug 'ervandew/supertab'                " Fancier tab-completion.

" Improved PHP omnicompletion.
Plug 'shawncplus/phpcomplete.vim', { 'for': 'php' }


" =============================================================================
" Plugin -- Interface
" =============================================================================
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'                " Lean status/tabline.
    let g:airline_theme           = 'bubblegum'
    let g:airline_powerline_fonts = 1
    let g:airline_exclude_preview = 1

"Plug 'ctrlpvim/ctrlp.vim'              " Fuzzy finder for files, buffers, etc.
"    let g:ctrlp_cach_dir = '~/.cache/ctrlp'

"    if executable("ag")
"        let g:ctrlp_user_command = 'ag %s -l --nocolor --nogroup --depth=6
"            \ --ignore .git
"            \ --ignore .svn
"            \ --ignore .hg
"            \ --ignore .directory
"            \ -g ""'
"    else
"        let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|.directory)$'
"    endif

Plug 'junegunn/goyo.vim'                " Distraction-free writing.
Plug 'junegunn/limelight.vim'           " Dims all paragraphs except the one
                                        " you are in.

Plug 'mbbill/undotree'                  " Visualizes your undo tree.
    nnoremap <F5> :UndotreeToggle<cr>
    let g:undotree_WindowLayout = 2

Plug 'mhinz/vim-startify'               " Fancy start screen.
    let g:startify_files_number  = 8

    let g:startify_custom_header =
        \ map(split(system('fortune -s'), '\n'), '" ". v:val') + ['']

    let g:startify_bookmarks  = [ '~/.vimrc', '~/Storage/Website' ]
    let g:startify_list_order = [
        \ ['   Bookmarks:'],
        \ 'bookmarks',
        \ ['   Recent files:'],
        \ 'files',
        \ ]

Plug 'szw/vim-ctrlspace'                " Manages buffers, files, tabs, etc.
Plug 'tpope/vim-vinegar'                " Enhanced netrw

" =============================================================================
" Plugin -- Languages & Syntax
" =============================================================================

Plug 'ap/vim-css-color'                 " Preview colors within CSS files.

" Inserts 'use' statements automatically.
Plug 'arnaud-lb/vim-php-namespace', { 'for': 'php' }

Plug 'dbakker/vim-lint'                 " Linter for your ~/.vimrc file.
Plug 'elzr/vim-json', { 'for': 'json' } " JSON syntax
Plug 'gabrielelana/vim-markdown'        " A nice Markdown syntax highlighter.
    let g:markdown_enable_insert_mode_mappings = 0

Plug 'hail2u/vim-css3-syntax'           " CSS3 syntax support.

" Tons of features for developing in Python.
Plug 'klen/python-mode', { 'for': 'python' }
Plug 'othree/html5.vim'                 " HTML5 omnicomplete and syntax.

" Improved javascript syntax and indentation.
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'reedes/vim-litecorrect'           " Auto-correction of common typos.
Plug 'scrooloose/syntastic'             " Syntax checking plugin.
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list   = 1
    let g:syntastic_auto_loc_list              = 1
    let g:syntastic_check_on_open              = 1
    let g:syntastic_check_on_wq                = 0

    let g:syntastic_markdown_checkers          = ['mdl']
    let g:syntastic_text_checkers              = ['language_check', 'atdtool']
    let g:syntastic_text_language_check_args   = '--language=en-US'

"Plug 'spf13/PIV', { 'for': 'php' }     " PHP integration environment.
"    let g:DisableAutoPHPFolding               = 1

Plug 'tpope/vim-liquid'                 " Liquid with Jekyll enhancements.
"Plug 'tpope/vim-markdown'              " Dev build of Vim's Markdown syntax.
"    let g:markdown_fenced_languages = [
"        \ 'css',
"        \ 'html',
"        \ 'javascript',
"        \ 'js=javascript',
"        \ 'json=javascript',
"        \ 'python',
"        \ 'xml'
"        \ ]


" =============================================================================
" Plugin -- Other
" =============================================================================

Plug 'chrisbra/vim-diff-enhanced'       " Better Diff options.
Plug 'ciaranm/securemodelines'          " Heavily restricted modeline parser.

" Auto-completion for quotes, brackets, parenthesis, etc.
Plug 'jiangmiao/auto-pairs'
Plug 'ryanss/vim-hackernews'            " Browse Hacker News within Vim.


Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'rking/ag.vim'

call plug#end()


" =============================================================================
" Vim Settings
" =============================================================================

colorscheme apprentice                  " Set colorscheme to 'Apprentice'.

set autoindent                          " Enable automatic indentation.
set background=dark                     " Enable colors for dark backgrounds.
set backspace=indent,eol,start          " Backspace works on everything.
set clipboard=unnamed                   " Use the operating system's clipboard.
set completeopt=longest,menuone         " Insert longest common text of match
                                        " and show menu even with one result.
set cursorline                          " Highlight the line with the cursor.
set expandtab                           " Use the correct amount of spaces to
                                        " insert a <Tab>.
set formatoptions=c,q,r,t               " Set how automatic formatting is done.
                " | | | |
                " | | | +------- Auto-wrap text using textwidth.
                " | | +--------- Auto insert the current comment leader after
                " | |            hitting <Enter> in Insert mode.
                " | +----------- Allow formatting of comments with 'gq'.
                " +------------- Auto-wrap comments using textwidth, inserting
                "                the current comment leader automatically.

set hidden                              " Edit multiple unsaved buffers.
set history=200                         " Remember the last hundred commands.
set hlsearch                            " Highlight search terms.
set ignorecase                          " Ignore case while searching.
set incsearch                           " Highlight matches as you type.
set laststatus=2                        " Always show the status line.
set lazyredraw                          " Don't redraw screen when excuting
                                        " macros, registers, etc.
set list                                " Show invisible characters.
" Set default whitespace characters.
set listchars=tab:\│\ ,trail:-,extends:>,precedes:<
set modeline                            " Check files for modelines.
set mouse=a                             " Enable mouse support.
set mousehide                           " Hide the mouse cursor when typing.
set noshowmode                          " Don't show the current mode.
set number                              " Always show line numbers.
set ruler                               " Enable the ruler.
set scrolloff=4                         " Keep 4 lines above/below the cursor.
set shiftwidth=4                        " Use four spaces when auto-indenting.
set showcmd                             " Show partial command in status line.
set showmatch                           " Briefly jump to matching brackets.
set smartcase                           " Override the ignorecase option if
                                        " the search has upper case characters.
set smartindent                         " Smart autoindenting for new lines.
set smarttab                            " Use shiftwidth when using <Tab> in
                                        " front of a line.
set softtabstop=4                       " How many spaces should a tab be
                                        " when hitting <Tab> or backspace.
set spellfile=~/.vim/spell/en.utf-8.add " Custom word list for spell checking.
set synmaxcol=200                       " No syntax highlighting on long lines.
set tabstop=8                           " Set <Tab> to eight spaces.
set textwidth=80                        " Maximum text length before a new line.
set ttyfast                             " Indicates a fast terminal connection.
set undofile                            " Enable persistant undos.
set undodir=~/.vim/undo                 " Save undo history to this location.
set viminfo='20,\"50                    " Retain various info between sessions.
set virtualedit=all                     " Allow the cursor to go anywhere.
set whichwrap=b,s,<,>,[,]               " Allow keys to move the cursor to the
            " | | | | | |                 previous/next line.
            " | | | | | |
            " | | | | | +------- ] Insert and Replace
            " | | | | +--------- [ Insert and Replace
            " | | | +----------- <Right> Normal and Visual
            " | | +------------- <Left> Normal and Visual
            " | +--------------- <Space> Normal and Visual
            " +----------------- <BS> Normal and Visual
set wildmenu                            " Autocomplete commands.
set wildmode=longest:full,full          " Autocomplete til the longest common
                                        " string and the next full match.


" =============================================================================
" Auto Commands
" =============================================================================

if has('autocmd')                       " Set auto commands for various things.
    augroup vimrc
        autocmd!

        " Set up Markdown files.
        autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown setlocal spell
            \ ft=markdown colorcolumn=80

        " Enable spell-check on HTML files.
        autocmd filetype html setlocal spell

        " Jump to the last cursor position of a file when opening it.
        autocmd BufReadPost *
            \ if line("'\"") >= 1 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

        " Strip whitespace from various filetypes that I use.
        autocmd BufWritePre *.css,*.html,*.md,*.php,*.py,*.rb,*.scss,*.vim
            \ silent! :StripWhitespace

        " Reload ~/.vimrc whenever changes are made.
        autocmd BufWritePost $MYVIMRC source $MYVIMRC | AirlineRefresh
    augroup END

    augroup litecorrect
        autocmd!
        autocmd FileType markdown,mkd call litecorrect#init()
        autocmd FileType textile call litecorrect#init()
    augroup END
endif

let g:vim_json_syntax_conceal = 0
