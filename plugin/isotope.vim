" vim: et sw=2 sts=2

" Plugin:      https://github.com/segeljakt/vim-isotope
" Description: Insert superscripts and subscripts with ease.
" Maintainer:  Klas Segeljakt <klasseg@kth.se>

ino <expr> <Plug>(IsotopeToggleSuperscript) isotope#toggle_sup()
ino <expr> <Plug>(IsotopeToggleSubscript)   isotope#toggle_sub()
ino <expr> <Plug>(IsotopeInsertSuperscript) isotope#insert_sup()
ino <expr> <Plug>(IsotopeInsertSubscript)   isotope#insert_sub()

if get(g:, "isotope_use_default_mappings", v:true)
  if empty(maparg('<C-g><C-g><C-k>', 'i'))
    imap <C-g><C-g><C-k> <Plug>(IsotopeToggleSuperscript)
  en

  if empty(maparg('<C-g><C-g><C-j>', 'i'))
    imap <C-g><C-g><C-j> <Plug>(IsotopeToggleSubscript)
  en

  if empty(maparg('<C-g><C-k>', 'i'))
    imap <C-g><C-k> <Plug>(IsotopeInsertSuperscript)
  en

  if empty(maparg('<C-g><C-j>', 'i'))
    imap <C-g><C-j> <Plug>(IsotopeInsertSubscript)
  en
en
