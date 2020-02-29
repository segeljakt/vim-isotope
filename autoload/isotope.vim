" vim: et sw=2 sts=2

" Plugin:      https://github.com/segeljakt/vim-isotope
" Description: Insert special characters with ease.
" Maintainer:  Klas Segeljakt <klasseg@kth.se>

if exists("s:autoloaded") | finish | el | let s:autoloaded = 1 | en

fun! isotope#preview()
  echohl Normal

  echom repeat('=', winwidth(0))

  call isotope#charset#preview()

  echom repeat('=', winwidth(0))

  call isotope#diacritic#preview()

  echom repeat('=', winwidth(0))

  echohl None
endfun
