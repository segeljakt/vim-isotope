" vim: et sw=2 sts=2

" Plugin:      https://github.com/segeljakt/vim-isotope
" Description: Insert superscripts and subscripts with ease.
" Maintainer:  Klas Segeljakt <klasseg@kth.se>

if exists("s:autoloaded")
  finish
el
  let s:autoloaded = 1
en

let s:sups = {
  \  '0':'⁰',
  \  '1':'¹',
  \  '2':'²',
  \  '3':'³',
  \  '4':'⁴',
  \  '5':'⁵',
  \  '6':'⁶',
  \  '7':'⁷',
  \  '8':'⁸',
  \  '9':'⁹',
  \
  \  '+':'⁺',
  \  '-':'⁻',
  \  '=':'⁼',
  \  '(':'⁽',
  \  ')':'⁾',
  \
  \  'a':'ᵃ',
  \  'b':'ᵇ',
  \  'c':'ᶜ',
  \  'd':'ᵈ',
  \  'e':'ᵉ',
  \  'f':'ᶠ',
  \  'g':'ᵍ',
  \  'h':'ʰ',
  \  'i':'ⁱ',
  \  'j':'ʲ',
  \  'k':'ᵏ',
  \  'l':'ˡ',
  \  'm':'ᵐ',
  \  'n':'ⁿ',
  \  'o':'ᵒ',
  \  'p':'ᵖ',
  \  'r':'ʳ',
  \  's':'ˢ',
  \  't':'ᵗ',
  \  'u':'ᵘ',
  \  'v':'ᵛ',
  \  'w':'ʷ',
  \  'x':'ˣ',
  \  'y':'ʸ',
  \  'z':'ᶻ',
  \
  \  'A':'ᴬ',
  \  'B':'ᴮ',
  \  'D':'ᴰ',
  \  'E':'ᴱ',
  \  'G':'ᴳ',
  \  'H':'ᴴ',
  \  'I':'ᴵ',
  \  'J':'ᴶ',
  \  'K':'ᴷ',
  \  'L':'ᴸ',
  \  'M':'ᴹ',
  \  'N':'ᴺ',
  \  'O':'ᴼ',
  \  'P':'ᴾ',
  \  'R':'ᴿ',
  \  'T':'ᵀ',
  \  'U':'ᵁ',
  \  'V':'ⱽ',
  \  'W':'ᵂ',
  \ }

let s:subs = {
  \  '0':'₀',
  \  '1':'₁',
  \  '2':'₂',
  \  '3':'₃',
  \  '4':'₄',
  \  '5':'₅',
  \  '6':'₆',
  \  '7':'₇',
  \  '8':'₈',
  \  '9':'₉',
  \
  \  '+':'₊',
  \  '-':'₋',
  \  '=':'₌',
  \  '(':'₍',
  \  ')':'₎',
  \
  \  'a':'ₐ',
  \  'c':'꜀',
  \  'd':'ₔ',
  \  'e':'ₑ',
  \  'h':'ₕ',
  \  'i':'ᵢ',
  \  'j':'ⱼ',
  \  'k':'ₖ',
  \  'l':'ₗ',
  \  'm':'ₘ',
  \  'n':'ₙ',
  \  'o':'ₒ',
  \  'p':'ₚ',
  \  'r':'ᵣ',
  \  's':'ₛ',
  \  't':'ₜ',
  \  'u':'ᵤ',
  \  'v':'ᵥ',
  \  'x':'ₓ',
  \ }

let s:sub_active = v:false
let s:sup_active = v:false

fun! isotope#toggle_sup()
  if s:sup_active
    au! Isotope
    aug! Isotope
    let s:sup_active = v:false
  el
    aug Isotope | au!
      au InsertCharPre * let v:char = get(s:sups, v:char, v:char)
    aug END
    let s:sup_active = v:true
    let s:sub_active = v:false
  en
  return ""
endfun

fun! isotope#toggle_sub()
  if s:sub_active
    au! Isotope
    aug! Isotope
    let s:sub_active = v:false
  el
    aug Isotope | au!
      au InsertCharPre * let v:char = get(s:subs, v:char, v:char)
    aug END
    let s:sub_active = v:true
    let s:sup_active = v:false
  en
  return ""
endfun

fun! isotope#insert_sup()
  aug IsotopeSingle | au!
    au InsertCharPre * let v:char = get(s:sups, v:char, v:char)
          \ | exe "au! IsotopeSingle"
          \ | aug! IsotopeSingle
  aug END
  return ""
endfun

fun! isotope#insert_sub()
  aug IsotopeSingle | au!
    au InsertCharPre * let v:char = get(s:subs, v:char, v:char)
          \ | exe "au! IsotopeSingle"
          \ | aug! IsotopeSingle
  aug END
  return ""
endfun
