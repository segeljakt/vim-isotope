" vim: et sw=2 sts=2

" Plugin:      https://github.com/segeljakt/vim-isotope
" Description: Insert special characters with ease.
" Maintainer:  Klas Segeljakt <klasseg@kth.se>
" Resources:
"   https://vim.fandom.com/wiki/Create_underlines,_overlines,_and_strikethroughs_using_combining_characters
"   https://en.wikipedia.org/wiki/Combining_character

if exists('s:autoloaded') | finish | el | let s:autoloaded = 1 | en

fun! isotope#diacritic#attach(bang, line1, line2, ...)
  if a:bang
    call s:attach(a:line1, a:line2, a:000,
          \ {_, v -> s:diacritic_raw[v]})
  el
    call s:attach(a:line1, a:line2, a:000,
          \ {_, v -> s:diacritic_raw[s:diacritic_alias[v]]})
  en
endfun

fun! s:unicode(code)
  exe 'return "\u'.a:code.'"'
endfun

fun! s:attach(line1, line2, args, extractor)
  let code = copy(a:args)
  let code = map(code, a:extractor)
  let code = reverse(code)
  let code = map(code, 's:unicode(v:val)')
  let code = join(code, '')
  silent! exe a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.code.'/ge'
endfun

fun! isotope#diacritic#complete(ArgLead, CmdLine, CursorPos)
  let bang = a:CmdLine =~ 'IsotopeAttach!'
  let keys = bang ? s:raw_keys : s:alias_keys
  return filter(copy(keys), 'v:val =~ "^'.a:ArgLead.'"')
endfun

fun! isotope#diacritic#preview()
  for [key, val] in items(s:diacritic_raw)
    let code = s:unicode(s:diacritic_raw[key])
    let text = substitute('123abcABC', '.', '&'.code, 'g')
    let alias = get(s:diacritic_reverse_alias, key, '')
    if empty(alias)
      echom text.' = '.key
    el
      echom text.' = '.key.' [ '.alias.' ]'
    en
    echom ' '
  endfor
endfun

" https://en.wikipedia.org/wiki/Combining_character
let s:diacritic_raw = {
  \ 'GRAVE_ACCENT'                                          : '0300',
  \ 'ACCUTE_ACCENT'                                         : '0301',
  \ 'CIRCUMFLEX'                                            : '0302',
  \ 'TILDE'                                                 : '0303',
  \ 'MACRON'                                                : '0304',
  \ 'OVERLINE'                                              : '0305',
  \ 'BREVE'                                                 : '0306',
  \ 'DOT_ABOVE'                                             : '0307',
  \ 'DIAERESIS'                                             : '0308',
  \ 'HOOK_ABOVE '                                           : '0309',
  \ 'RING_ABOVE'                                            : '030A',
  \ 'DOUBLE_ACCUTE_ACCENT'                                  : '030B',
  \ 'CARON'                                                 : '030C',
  \ 'VERTICAL_LINE_ABOVE'                                   : '030D',
  \ 'DOUBLE_VERTICAL_LINE_ABOVE'                            : '030E',
  \ 'DOUBLE_GRAVE_ACCENT'                                   : '030F',
  \ 'CANDRABINDU'                                           : '0310',
  \ 'INVERTED_BREVE'                                        : '0311',
  \ 'TURNED_COMMA_ABOVE'                                    : '0312',
  \ 'COMMA_ABOVE'                                           : '0313',
  \ 'REVERSED_COMMA_ABOVE'                                  : '0314',
  \ 'COMMA_ABOVE_RIGHT'                                     : '0315',
  \ 'GRAVE_ACCENT_BELOW'                                    : '0316',
  \ 'ACUTE_ACCENT_BELOW'                                    : '0317',
  \ 'LEFT_TACK_BELOW'                                       : '0318',
  \ 'RIGHT_TACK_BELOW'                                      : '0319',
  \ 'LEFT_ANGLE_ABOVE'                                      : '031A',
  \ 'HORN'                                                  : '031B',
  \ 'LEFT_HALF_RING_BELOW'                                  : '031C',
  \ 'UP_TACK_BELOW'                                         : '031D',
  \ 'DOWN_TACK_BELOW'                                       : '031E',
  \ 'PLUS_SIGN_BELOW'                                       : '031F',
  \ 'MINUS_SIGN_BELOW'                                      : '0320',
  \ 'PALATIZED_HOOK_BELOW'                                  : '0321',
  \ 'RETROFLEX_HOOK_BELOW'                                  : '0322',
  \ 'DOT_BELOW'                                             : '0323',
  \ 'DIAERESIS_BELOW'                                       : '0324',
  \ 'RING_BELOW'                                            : '0325',
  \ 'COMMA_BELOW'                                           : '0326',
  \ 'CEDILLA'                                               : '0327',
  \ 'OGONEK'                                                : '0328',
  \ 'VERTICAL_LINE_BELOW'                                   : '0329',
  \ 'BRIDGE_BELOW'                                          : '032A',
  \ 'INVERTED_DOUBLE_ARCH_BELOW'                            : '032B',
  \ 'CARON_BELOW'                                           : '032C',
  \ 'CIRCUMFLEX_ACCENT_BELOW'                               : '032D',
  \ 'BREVE_BELOW'                                           : '032E',
  \ 'INVERTED_BREVE_BELOW'                                  : '032F',
  \ 'TILDE_BELOW'                                           : '0330',
  \ 'MACRON_BELOW'                                          : '0331',
  \ 'LOW_LINE'                                              : '0332',
  \ 'DOUBLE_LOW_LINE'                                       : '0333',
  \ 'TILDE_OVERLAY'                                         : '0334',
  \ 'SHORT_STROKE_OVERLAY'                                  : '0335',
  \ 'LONG_STROKE_OVERLAY'                                   : '0336',
  \ 'SHORT_SOLIDUS_OVERLAY'                                 : '0337',
  \ 'LONG_SOLIDUS_OVERLAY'                                  : '0338',
  \ 'RIGHT_HALF_RING_BELOW'                                 : '0339',
  \ 'INVERTED_BRIDGE_BELOW'                                 : '033A',
  \ 'SQUARE_BELOW'                                          : '033B',
  \ 'SEAGULL_BELOW'                                         : '033C',
  \ 'X_ABOVE'                                               : '033D',
  \ 'VERTICAL_TILDE'                                        : '033E',
  \ 'DOUBLE_OVERLINE'                                       : '033F',
  \ 'GRAVE_TONE_MARK'                                       : '0340',
  \ 'ACUTE_TONE_MARK'                                       : '0341',
  \ 'GREEK_PERSIPOMENI'                                     : '0342',
  \ 'GREEK_KORONIS'                                         : '0343',
  \ 'GREEK_DIALYTIKA_TONOS'                                 : '0344',
  \ 'GREEK_YPOGEGRAMMENI'                                   : '0345',
  \ 'BRIDGE_ABOVE'                                          : '0346',
  \ 'EQUALS_SIGN_BELOW'                                     : '0347',
  \ 'DOUBLE_VERTICAL_LINE_BELOW'                            : '0348',
  \ 'LEFT_ANGLE_BELOW'                                      : '0349',
  \ 'NOT_TILDE_ABOVE'                                       : '034A',
  \ 'HOMOTHETIC_ABOVE'                                      : '034B',
  \ 'ALMOST_EQUAL_TO_ABOVE'                                 : '034C',
  \ 'LEFT_RIGHT_ARROW_BELOW'                                : '034D',
  \ 'UPWARDS_ARROW_BELOW'                                   : '034E',
  \ 'GRAPHEME_JOINER'                                       : '034F',
  \ 'RIGHT_ARROWHEAD_ABOVE'                                 : '0350',
  \ 'LEFT_HALF_RING_ABOVE'                                  : '0351',
  \ 'FERMATA'                                               : '0352',
  \ 'X_BELOW'                                               : '0353',
  \ 'LEFT_ARROWHEAD_BELOW'                                  : '0354',
  \ 'RIGHT_ARROWHEAD_BELOW'                                 : '0355',
  \ 'RIGHT_ARROWHEAD_AND_UP_ARROWHEAD_BELOW'                : '0356',
  \ 'RIGHT_HALF_RING_ABOVE'                                 : '0357',
  \ 'DOT_ABOVE_RIGHT'                                       : '0358',
  \ 'ASTERISK_BELOW'                                        : '0359',
  \ 'DOUBLE_RING_BELOW'                                     : '035A',
  \ 'ZIGZAG_ABOVE'                                          : '035B',
  \ 'DOUBLE_BREVE_BELOW'                                    : '035C',
  \ 'DOUBLE_BREVE'                                          : '035D',
  \ 'DOUBLE_MACRON'                                         : '035E',
  \ 'DOUBLE_MACRON_BELOW'                                   : '035F',
  \ 'DOUBLE_TILDE'                                          : '0360',
  \ 'DOUBLE_INVERTED_BREVE'                                 : '0361',
  \ 'DOUBLE_RIGHTWARDS_ARROW_BELOW'                         : '0362',
  \ 'LATIN_SMALL_LETTER_A'                                  : '0363',
  \ 'LATIN_SMALL_LETTER_E'                                  : '0364',
  \ 'LATIN_SMALL_LETTER_I'                                  : '0365',
  \ 'LATIN_SMALL_LETTER_O'                                  : '0366',
  \ 'LATIN_SMALL_LETTER_U'                                  : '0367',
  \ 'LATIN_SMALL_LETTER_C'                                  : '0368',
  \ 'LATIN_SMALL_LETTER_D'                                  : '0369',
  \ 'LATIN_SMALL_LETTER_H'                                  : '036A',
  \ 'LATIN_SMALL_LETTER_M'                                  : '036B',
  \ 'LATIN_SMALL_LETTER_R'                                  : '036C',
  \ 'LATIN_SMALL_LETTER_T'                                  : '036D',
  \ 'LATIN_SMALL_LETTER_V'                                  : '036E',
  \ 'LATIN_SMALL_LETTER_X'                                  : '036F',
  \ 'DOUBLED_CIRCUMFLEX_ACCENT'                             : '1AB0',
  \ 'DIAERESIS_RING'                                        : '1AB1',
  \ 'INFINITY'                                              : '1AB2',
  \ 'DOWNWARDS_ARROW'                                       : '1AB3',
  \ 'TRIPLE_DOT'                                            : '1AB4',
  \ 'XX_BELOW'                                              : '1AB5',
  \ 'WIGGLY_LINE_BELOW'                                     : '1AB6',
  \ 'OPEN_MARK_BELOW'                                       : '1AB7',
  \ 'DOUBLE_OPEN_MARK_BELOW'                                : '1AB8',
  \ 'LIGHT_CENTRALIZATION_STROKE_BELOW'                     : '1AB9',
  \ 'STRONG_CENTRALIZATION_STROKE_BELOW'                    : '1ABA',
  \ 'PARENTHESIS_ABOVE'                                     : '1ABB',
  \ 'DOUBLE_PARENTHESIS_ABOVE'                              : '1ABC',
  \ 'PARENTHESIS_BELOW'                                     : '1ABD',
  \ 'PARENTHESES_OVERLAY'                                   : '1ABE',
  \ 'DOTTED_GRAVE_ACCENT'                                   : '1DC0',
  \ 'DOTTED_ACUTE_ACCENT'                                   : '1DC1',
  \ 'SNAKE_BELOW'                                           : '1DC2',
  \ 'SUSPENSION_MARK'                                       : '1DC3',
  \ 'MACRON_ACUTE'                                          : '1DC4',
  \ 'GRAVE_MACRON'                                          : '1DC6',
  \ 'MACRON_GRAVE'                                          : '1DC7',
  \ 'ACUTE_MACRON'                                          : '1DC7',
  \ 'GRAVE_ACUTE_GRAVE'                                     : '1DC8',
  \ 'ACUTE_GRAVE_ACUTE'                                     : '1DC9',
  \ 'LATIN_SMALL_LETTER_R_BELOW'                            : '1DCA',
  \ 'BREVE_MACRON'                                          : '1DCB',
  \ 'MACRON_BREVE'                                          : '1DCC',
  \ 'DOUBLE_CIRCUMFLEX_ABOVE'                               : '1DCD',
  \ 'OGONEK_ABOVE'                                          : '1DCE',
  \ 'ZIGZAG_BELOW'                                          : '1DCF',
  \ 'IS_BELOW'                                              : '1DD0',
  \ 'UR_ABOVE'                                              : '1DD1',
  \ 'US_ABOVE'                                              : '1DD2',
  \ 'LATIN_SMALL_LETTER_FLATTENED_OPEN_A_ABOVE'             : '1DD3',
  \ 'LATIN_SMALL_LETTER_AE'                                 : '1DD4',
  \ 'LATIN_SMALL_LETTER_AO'                                 : '1DD5',
  \ 'LATIN_SMALL_LETTER_AV'                                 : '1DD6',
  \ 'LATIN_SMALL_LETTER_C_CEDILLA'                          : '1DD7',
  \ 'LATIN_SMALL_LETTER_INSULAR_D'                          : '1DD8',
  \ 'LATIN_SMALL_LETTER_ETH'                                : '1DD9',
  \ 'LATIN_SMALL_LETTER_G'                                  : '1DDA',
  \ 'LATIN_LETTER_SMALL_CAPITAL_G'                          : '1DDB',
  \ 'LATIN_SMALL_LETTER_K'                                  : '1DDC',
  \ 'LATIN_SMALL_LETTER_L'                                  : '1DDD',
  \ 'LATIN_LETTER_SMALL_CAPITAL_L'                          : '1DDE',
  \ 'LATIN_LETTER_SMALL_CAPITAL_M'                          : '1DDF',
  \ 'LATIN_SMALL_LETTER_N'                                  : '1DE0',
  \ 'LATIN_LETTER_SMALL_CAPITAL_N'                          : '1DE1',
  \ 'LATIN_LETTER_SMALL_CAPITAL_R'                          : '1DE2',
  \ 'LATIN_SMALL_LETTER_R_ROTUNDA'                          : '1DE3',
  \ 'LATIN_SMALL_LETTER_S'                                  : '1DE4',
  \ 'LATIN_SMALL_LETTER_LONG_S'                             : '1DE5',
  \ 'LATIN_SMALL_LETTER_Z'                                  : '1DE6',
  \ 'LATIN_SMALL_LETTER_ALPHA'                              : '1DE7',
  \ 'LATIN_SMALL_LETTER_B'                                  : '1DE8',
  \ 'LATIN_SMALL_LETTER_BETA'                               : '1DE9',
  \ 'LATIN_SMALL_LETTER_SCHWA'                              : '1DEA',
  \ 'LATIN_SMALL_LETTER_F'                                  : '1DEB',
  \ 'LATIN_SMALL_LETTER_L_WITH_DOUBLE_MIDDLE_TILDE'         : '1DEC',
  \ 'LATIN_SMALL_LETTER_O_WITH_LIGHT_CENTRALIZATION_STROKE' : '1DED',
  \ 'LATIN_SMALL_LETTER_P'                                  : '1DEE',
  \ 'LATIN_SMALL_LETTER_ESH'                                : '1DEF',
  \ 'LATIN_SMALL_LETTER_U_WITH_LIGHT_CENTRALIZATION_STROKE' : '1DF0',
  \ 'LATIN_SMALL_LETTER_W'                                  : '1DF1',
  \ 'LATIN_SMALL_LETTER_A_WITH_DIAERESIS'                   : '1DF2',
  \ 'LATIN_SMALL_LETTER_O_WITH_DIAERESIS'                   : '1DF3',
  \ 'LATIN_SMALL_LETTER_U_WITH_DIAERESIS'                   : '1DF4',
  \ 'UP_TACK_ABOVE'                                         : '1DF5',
  \ 'KAVYKA_ABOVE_RIGHT'                                    : '1DF6',
  \ 'KAVYKAK_ABOVE_LEFT'                                    : '1DF7',
  \ 'DOT_ABOVE_LEFT'                                        : '1DF8',
  \ 'WIDE_INVERTED_BRIDGE_BELOW'                            : '1DF9',
  \ 'DELETION_MARK'                                         : '1DFB',
  \ 'DOUBLE_INVERTED_BREVE_BELOW'                           : '1DFC',
  \ 'ALMOST_EQUAL_TO_BELOW'                                 : '1DFD',
  \ 'LEFT_ARROWHEAD_ABOVE'                                  : '1DFE',
  \ 'RIGHT_ARROWHEAD_AND_DOWN_ARROWHEAD_BELOW'              : '1DFF',
  \ 'LEFT_HARPOON_ABOVE'                                    : '20D0',
  \ 'RIGHT_HARPOON_ABOVE'                                   : '20D1',
  \ 'LONG_VERTICAL_LINE_OVERLAY'                            : '20D2',
  \ 'SHORT_VERTICAL_LINE_OVERLAY'                           : '20D3',
  \ 'ANTICLOCKWISE_ARROW_ABOVE'                             : '20D4',
  \ 'CLOCKWISE_ARROW_ABOVE'                                 : '20D5',
  \ 'LEFT_ARROW_ABOVE'                                      : '20D6',
  \ 'RIGHT_ARROW_ABOVE'                                     : '20D7',
  \ 'RING_OVERLAY'                                          : '20D8',
  \ 'CLOCKWISE_RING_OVERLAY'                                : '20D9',
  \ 'ANTICLOCKWISE_RING_OVERLAY'                            : '20DA',
  \ 'THREE_DOTS_ABOVE'                                      : '20DB',
  \ 'FOUR_DOTS_ABOVE'                                       : '20DC',
  \ 'ENCLOSING_CIRCLE'                                      : '20DD',
  \ 'ENCLOSING_SQUARE'                                      : '20DE',
  \ 'ENCLOSING_DIAMOND'                                     : '20DF',
  \ 'ENCLOSING_CIRCLE_BACKSLASH'                            : '20E0',
  \ 'LEFT_RIGHT_ARROW_ABOVE'                                : '20E1',
  \ 'ENCLOSING_SCREEN'                                      : '20E2',
  \ 'ENCLOSING_KEYCAP'                                      : '20E3',
  \ 'ENCLOSING_UPWARD_POINTING_TRIANGLE'                    : '20E4',
  \ 'REVERSE_SOLIDUS_OVERLAY'                               : '20E5',
  \ 'DOUBLE_VERTICAL_STROKE_OVERLAY'                        : '20E6',
  \ 'ANNUITY_SYMBOL'                                        : '20E7',
  \ 'TRIPLE_UNDERDOT'                                       : '20E8',
  \ 'WIDE_BRIDGE_ABOVE'                                     : '20E9',
  \ 'LEFTWARDS_ARROW_OVERLAY'                               : '20EA',
  \ 'LONG_DOUBLE_SOLIDUS_OVERLAY'                           : '20EB',
  \ 'RIGHTWARDS_HARPOON_WITH_BARB_DOWNWARDS'                : '20EC',
  \ 'LEFTWARDS_HARPOON_WITH_BARB_DOWNWARDS'                 : '20ED',
  \ 'LEFT_ARROW_BELOW'                                      : '20EE',
  \ 'RIGHT_ARROW_BELOW'                                     : '20EF',
  \ 'ASTERISK_ABOVE'                                        : '20F0',
  \ 'LIGATURE_LEFT_HALF'                                    : 'FE20',
  \ 'LIGATURE_RIGHT_HALF'                                   : 'FE21',
  \ 'DOUBLE_TILDE_LEFT_HALF'                                : 'FE22',
  \ 'DOUBLE_TILDE_RIGHT_HALF'                               : 'FE23',
  \ 'MACRON_LEFT_HALF'                                      : 'FE24',
  \ 'MACRON_RIGHT_HALF'                                     : 'FE25',
  \ 'CONJOINING_MACRON'                                     : 'FE26',
  \ 'LIGATURE_LEFT_HALF_BELOW'                              : 'FE27',
  \ 'LIGATURE_RIGHT_HALF_BELOW'                             : 'FE28',
  \ 'TILDE_LEFT_HALF_HELOW'                                 : 'FE29',
  \ 'TILDE_RIGHT_HALF_BELOW'                                : 'FE2A',
  \ 'MACRON_LEFT_HALF_BELOW'                                : 'FE2B',
  \ 'MACRON_RIGHT_HALF_BELOW'                               : 'FE2C',
  \ 'CONJOINING_MACRON_BELOW'                               : 'FE2D',
  \ 'CYRILLIC_TITLO_LEFT_HALF'                              : 'FE2E',
  \ 'CYRILLIC_TITLO_RIGHT_HALF'                             : 'FE2F',
\ }

let s:range = '['
      \ . nr2char(768)   . '-' . nr2char(879)   " 0300-036F
      \ . nr2char(6832)  . '-' . nr2char(6846)  " 1AB0 1ABE
      \ . nr2char(7616)  . '-' . nr2char(7679)  " 1DC0 1DFF
      \ . nr2char(8400)  . '-' . nr2char(8432)  " 20D0 20F0
      \ . nr2char(65056) . '-' . nr2char(65071) " FE20 FE2F
      \ . ']'

" TODO: Not working currently
fun! isotope#diacritic#search()
  exe 'normal! /'.s:range.'\+'
  let @/ = s:range
endfun

let s:diacritic_alias = {
  \ 'a'            : 'LATIN_SMALL_LETTER_A',
  \ 'b'            : 'LATIN_SMALL_LETTER_B',
  \ 'c'            : 'LATIN_SMALL_LETTER_C',
  \ 'd'            : 'LATIN_SMALL_LETTER_D',
  \ 'e'            : 'LATIN_SMALL_LETTER_E',
  \ 'f'            : 'LATIN_SMALL_LETTER_F',
  \ 'g'            : 'LATIN_SMALL_LETTER_G',
  \ 'h'            : 'LATIN_SMALL_LETTER_H',
  \ 'i'            : 'LATIN_SMALL_LETTER_I',
  \ 'k'            : 'LATIN_SMALL_LETTER_K',
  \ 'l'            : 'LATIN_SMALL_LETTER_L',
  \ 'm'            : 'LATIN_SMALL_LETTER_M',
  \ 'n'            : 'LATIN_SMALL_LETTER_N',
  \ 'o'            : 'LATIN_SMALL_LETTER_O',
  \ 'p'            : 'LATIN_SMALL_LETTER_P',
  \ 'r'            : 'LATIN_SMALL_LETTER_R',
  \ 's'            : 'LATIN_SMALL_LETTER_S',
  \ 't'            : 'LATIN_SMALL_LETTER_T',
  \ 'u'            : 'LATIN_SMALL_LETTER_U',
  \ 'v'            : 'LATIN_SMALL_LETTER_V',
  \ 'w'            : 'LATIN_SMALL_LETTER_W',
  \ 'x'            : 'LATIN_SMALL_LETTER_X',
  \ 'z'            : 'LATIN_SMALL_LETTER_Z',
  \ 'G'            : 'LATIN_LETTER_SMALL_CAPITAL_G',
  \ 'L'            : 'LATIN_LETTER_SMALL_CAPITAL_L',
  \ 'M'            : 'LATIN_LETTER_SMALL_CAPITAL_M',
  \ 'N'            : 'LATIN_LETTER_SMALL_CAPITAL_N',
  \ 'R'            : 'LATIN_LETTER_SMALL_CAPITAL_R',
  \ 'α'            : 'LATIN_SMALL_LETTER_ALPHA',
  \ 'β'            : 'LATIN_SMALL_LETTER_BETA',
  \ '()center'     : 'PARENTHESES_OVERLAY',
  \ '()above'      : 'PARENTHESIS_ABOVE',
  \ '()below'      : 'PARENTHESIS_BELOW',
  \ '*above'       : 'ASTERISK_ABOVE',
  \ '*below'       : 'ASTERISK_BELOW',
  \ '+below'       : 'PLUS_SIGN_BELOW',
  \ '--below'      : 'DOUBLE_LOW_LINE',
  \ '->above'      : 'RIGHT_ARROW_ABOVE',
  \ '->below'      : 'RIGHT_ARROW_BELOW',
  \ '-above'       : 'DOUBLE_MACRON',
  \ '-below'       : 'DOUBLE_MACRON_BELOW',
  \ '-center'      : 'LONG_STROKE_OVERLAY',
  \ '...above'     : 'THREE_DOTS_ABOVE',
  \ '...below'     : 'TRIPLE_UNDERDOT',
  \ '.above'       : 'DOT_ABOVE',
  \ '.below'       : 'DOT_BELOW',
  \ '//center'     : 'LONG_DOUBLE_SOLIDUS_OVERLAY',
  \ '/center'      : 'LONG_SOLIDUS_OVERLAY',
  \ '<-center'     : 'LEFTWARDS_ARROW_OVERLAY',
  \ '<->above'     : 'LEFT_RIGHT_ARROW_ABOVE',
  \ '<->below'     : 'LEFT_RIGHT_ARROW_BELOW',
  \ '<-above'      : 'LEFT_ARROW_ABOVE',
  \ '<-below'      : 'LEFT_ARROW_BELOW',
  \ '=below'       : 'EQUALS_SIGN_BELOW',
  \ '\center'      : 'REVERSE_SOLIDUS_OVERLAY',
  \ '^above'       : 'CIRCUMFLEX',
  \ '^below'       : 'CIRCUMFLEX_ACCENT_BELOW',
  \ 'circle'       : 'ENCLOSING_CIRCLE',
  \ 'diamond'      : 'ENCLOSING_DIAMOND',
  \ 'keycap'       : 'ENCLOSING_KEYCAP',
  \ 'ring-above'   : 'RING_ABOVE',
  \ 'ring-below'   : 'RING_BELOW',
  \ 'ring-center'  : 'RING_OVERLAY',
  \ 'square'       : 'ENCLOSING_SQUARE',
  \ 'triangle'     : 'ENCLOSING_UPWARD_POINTING_TRIANGLE',
  \ 'vbelow'       : 'CARON_BELOW',
  \ 'xabove'       : 'X_ABOVE',
  \ 'xbelow'       : 'X_BELOW',
  \ 'zabove'       : 'ZIGZAG_ABOVE',
  \ 'zbelow'       : 'ZIGZAG_BELOW',
  \ '^|below'      : 'UPWARDS_ARROW_BELOW',
  \ '|above'       : 'VERTICAL_LINE_ABOVE',
  \ '|below'       : 'VERTICAL_LINE_BELOW',
  \ '|center'      : 'LONG_VERTICAL_LINE_OVERLAY',
  \ 'v|above'      : 'DOWNWARDS_ARROW',
  \ '~above'       : 'TILDE',
  \ '~below'       : 'TILDE_BELOW',
  \ '~center'      : 'TILDE_OVERLAY',
\ }

fun! s:reverse_dict(dict)
  let reversed = {}
  for [key, val] in items(a:dict)
    let reversed[val] = key
  endfor
  return reversed
endfun

let s:raw_keys = sort(copy(keys(s:diacritic_raw)))
let s:alias_keys = sort(copy(keys(s:diacritic_alias)))
let s:diacritic_reverse_alias = s:reverse_dict(s:diacritic_alias)
