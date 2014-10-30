" Vundle setup comes first.


" Start Vundle configuration.
set nocompatible " Be improved. Required by e.g. Vundle.
filetype off " Required by Vundle.
" Set the runtime path to include Vundle and initialize.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" Let Vundle manage Vundle, required.
Plugin 'gmarik/Vundle.vim'

" Plugins added with Vundle.
source ~/.vimrc.bundles


" Finish Vundle configuration.
call vundle#end()
filetype plugin indent on


" Personal configuration added separately.
source ~/.vimrc.local
