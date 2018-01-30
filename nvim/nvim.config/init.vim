set nocompatible              " be iMproved, required
filetype off                  " required
set hidden
set mouse=a
set shiftwidth=2

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#rc('~/.config/nvim/bundle')
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'
Plugin 'scrooloose/syntastic'
Plugin 'neomake/neomake'
Plugin 'freitass/todo.txt-vim'
"Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

imap jj <Esc>

" Racer
let g:racer_cmd = "~/.cargo/bin/racer"
let $RUST_SRC_PATH="~/src/rustc-1.6.0/src/"
" let g:rustfmt_autosave = 1

" neomake
autocmd! BufWritePost *.rs Neomake cargo

