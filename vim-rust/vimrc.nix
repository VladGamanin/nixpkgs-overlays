{}:
{
  config = ''
    set nocompatible

    set backspace=indent,eol,start

    set nomodeline
    set autoread
    set clipboard=unnamedplus
    set splitright

    set encoding=utf-8

    set number
    set relativenumber
    set ruler
    set noshowmode

    if !has('packages')
        execute pathogen#infect('pack/plugins/start/{}', 'pack/themes/opt/{}')
    endif

    set laststatus=2
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#formatter = 'unique_tail'

    set noswapfile
    set undofile
    set undodir=~/.vim/undo

    set cindent
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set expandtab

    filetype plugin indent on
    syntax enable
    set background=light
    colorscheme solarized

    function! Run()
        if expand("%:e")=="cpp" || expand("%:e")=="cxx"
            !g++ -std=c++17 -I. -Wall -Wextra % -o %< && ./%<
        elseif expand("%:e")=="c"
            !gcc -std=gnu99 -Wall -Wformat-security -Winit-self -Wno-pointer-sign -Wignored-qualifiers -Wfloat-equal -Wnested-externs -Wmissing-field-initializers -Wmissing-parameter-type -Wold-style-definition -Wold-style-declaration -Wstrict-prototypes -Wtype-limits -Wswitch-default -lm -O2 % -o ./%< && ./%<
        elseif expand("%:e")=="hs"
            !ghc % && ./%<
        elseif expand("%:e")=="rs"
            !cargo run
        endif
    endfunction

    map <F4> gg=G
    map <F5> :call Run()<CR>

    augroup Binary
        au!
        au BufReadPre  *.bin let &bin=1
        au BufReadPost * if &bin | %!xxd
        au BufReadPost * set ft=xxd | endif
        au BufWritePre * if &bin | %!xxd -r
        au BufWritePre * endif
        au BufWritePost * if &bin | %!xxd
        au BufWritePost * set nomod | endif
    augroup END

    set foldmethod=syntax
  '';
}
