" vim: et sw=2 sts=2

" Plugin:      https://github.com/segeljakt/vim-isotope
" Description: Insert special characters with ease.
" Maintainer:  Klas Segeljakt <klasseg@kth.se>

com!
  \ -range
  \ -nargs=+
  \ -bang
  \ -complete=customlist,isotope#diacritic#complete
  \ IsotopeAttach
  \ call isotope#diacritic#attach(<bang>0, <line1>, <line2>, <f-args>)

com!
  \ -nargs=?
  \ -complete=customlist,isotope#charset#complete
  \ IsotopeToggle call isotope#charset#toggle(<f-args>)

com!
  \ -nargs=?
  \ -complete=customlist,isotope#charset#complete
  \ IsotopeInsert
  \ call isotope#charset#insert(<f-args>)

com!
  \ -nargs=*
  \ -complete=customlist,isotope#charset#complete
  \ IsotopeSearch
  \ silent! call isotope#charset#search(<f-args>)

com!
  \ -nargs=0
  \ IsotopePreview
  \ call isotope#preview()

" Default settings

if get(g:, 'isotope_use_default_mappings', v:true)
  silent! ino <unique> <C-g><C-g><C-j> <C-o>:IsotopeToggle SUPERSCRIPT<CR>
  silent! ino <unique> <C-g><C-g><C-k> <C-o>:IsotopeToggle SUBSCRIPT<CR>
  silent! ino <unique> <C-g><C-j>      <C-o>:IsotopeInsert SUPERSCRIPT<CR>
  silent! ino <unique> <C-g><C-k>      <C-o>:IsotopeInsert SUBSCRIPT<CR>
en
