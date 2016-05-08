#!/bin/bash

# python powerline status is required
IS_POWERLINE_INSTALLED=`pip list | grep powerline-statusa | wc -l` 

if [ ${IS_POWERLINE_INSTALLED} -eq 0 ]
then
  pip install powerline-status
fi

# running this batch assumes you don't want existing bundles
dir_name=~/.vim/bundle

if [ -d "${dir_name}" ]
then
  rm -rf ${dir_name} 
fi

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

mkdir -p ${dir_name} && cd ${dir_name}

git clone https://github.com/rking/ag.vim
git clone https://github.com/vim-scripts/bufexplorer.zip
git clone https://github.com/raimondi/delimitmate
git clone https://github.com/othree/html5.vim
git clone https://github.com/gregsexton/matchtag
git clone https://github.com/tomasr/molokai
git clone https://github.com/scrooloose/nerdtree
git clone https://github.com/kien/rainbow_parentheses.vim
git clone https://github.com/scrooloose/syntastic
git clone https://github.com/godlygeek/tabular
git clone https://github.com/majutsushi/tagbar
git clone https://github.com/marijnh/tern_for_vim
git clone https://github.com/quramy/tsuquyomi
git clone https://github.com/leafgarland/typescript-vim
git clone https://github.com/sirver/ultisnips
git clone https://github.com/bling/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes
git clone https://github.com/altercation/vim-colors-solarized
git clone https://github.com/tpope/vim-commentary.git
git clone https://github.com/ap/vim-css-color
git clone https://github.com/tpope/vim-dispatch.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/airblade/vim-gitgutter
git clone https://github.com/pangloss/vim-javascript
git clone https://github.com/jelera/vim-javascript-syntax.git
git clone https://github.com/jason0x43/vim-js-indent
git clone https://github.com/leshill/vim-json
git clone https://github.com/mxw/vim-jsx
git clone https://github.com/tpope/vim-markdown
git clone https://github.com/moll/vim-node.git
git clone https://github.com/tpope/vim-repeat.git
git clone https://github.com/honza/vim-snippets
git clone https://github.com/tpope/vim-surround.git
git clone https://github.com/szw/vim-tags
git clone https://github.com/christoomey/vim-tmux-navigator
git clone git://github.com/tpope/vim-unimpaired.git
git clone https://github.com/shougo/vimproc.vim
git clone https://github.com/valloric/youcompleteme
