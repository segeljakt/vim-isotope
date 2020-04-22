" vim: et sw=2 sts=2

" Plugin:      https://github.com/segeljakt/vim-isotope
" Description: Insert special characters with ease.
" Maintainer:  Klas Segeljakt <klasseg@kth.se>
" Resources:
"   https://yaytext.com
"   http://qaz.wtf/u/convert.cgi

if exists('s:autoloaded') | finish | el | let s:autoloaded = 1 | en

fun! s:convert(char, kind)
  let nr = char2nr(a:char)
  if s:lo <= nr && nr <= s:hi " Only convert characters between ! and ~
    let idx = nr - s:lo
    let newchar = nr2char(strgetchar(s:charset[a:kind], idx))
    if newchar != s:undefined
      return newchar
    en
  en
  return a:char
endfun

fun! isotope#charset#complete(ArgLead, CmdLine, CursorPos)
  return filter(copy(s:keys), 'v:val =~ "^'.a:ArgLead.'"')
endfun

fun! isotope#charset#toggle(...)
  let kind = get(a:000, 0, '')
  if kind == '' || s:active == kind
    silent! au! IsotopeToggle
    silent! aug! IsotopeToggle
    echo 'Isotope: Toggled OFF'
    let s:active = ''
  el
    echo 'Isotope: Toggled ON ['.kind.']'
    aug IsotopeToggle | au!
      exe 'au InsertCharPre * let v:char = s:convert(v:char,"'.kind.'")'
    aug END
    let s:active = kind
  en
  return ''
endfun

fun! isotope#charset#insert(kind)
  aug IsotopeInsert | au!
    echo 'Isotope: Waiting for insert... ['.a:kind.']'
    exe 'au InsertCharPre * let v:char = s:convert(v:char,"'.a:kind.'")'
          \ .'| echo '
          \ .'| exe "au! IsotopeInsert"'
          \ .'| aug! IsotopeInsert'
  aug END
  return ''
endfun

fun! isotope#charset#search(...)
  if a:0 == 0
    let chars = values(s:charset)
  el
    let chars = map(copy(a:000), {_, kind -> s:charset[kind]})
  en
  let pattern = '['.substitute(join(chars, ''), ' ', '', 'g').']'
  silent! exe 'normal! /'.pattern.'\+'
  let @/ = pattern
endfun

fun! isotope#charset#preview(...)
  echom s:ascii
  echom repeat('-', winwidth(0))
  for [key, val] in items(s:charset)
    echom val.' = '.key
  endfor
endfun

let s:ascii =          "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~"
let s:charset = {
  \ 'ACUTE'             : '                                Á Ć É Ǵ í ḰĹḾŃŐṔ Ŕś Ű Ẃ ӲŹ      á ć é ǵ í ḱĺḿńőṕ ŕś ú ẃ ӳź    ',
  \ 'CIRCLED_BLACK'     : '               🄌➊➋➌➍➎➏➐➑➒       🅐🅑🅒🅓🅔🅕🅖🅗🅘🅙🅚🅛🅜🅝🅞🅟🅠🅡🅢🅣🅤🅥🅦🅧🅨🅩                                    ',
  \ 'CIRCLED_WHITE'     : '         ⊛⊕ ⊖⨀⊘⓪①②③④⑤⑥⑦⑧⑨  ⧀⊜⧁  ⒶⒷⒸⒹⒺⒻⒼⒽⒾⒿⓀⓁⓂⓃⓄⓅⓆⓇⓈⓉⓊⓋⓌⓍⓎⓏ ⦸    ⓐⓑⓒⓓⓔⓕⓖⓗⓘⓙⓚⓛⓜⓝⓞⓟⓠⓡⓢⓣⓤⓥⓦⓧⓨⓩ ⦶  ',
  \ 'CURSIVE'           : '                                𝒜ℬ𝒞𝒟ℰℱ𝒢ℋℐ𝒥𝒦ℒℳ𝒩𝒪𝒫𝒬ℛ𝒮𝒯𝒰𝒱𝒲𝒳𝒴𝒵      𝒶𝒷𝒸𝒹ℯ𝒻ℊ𝒽𝒾𝒿𝓀𝓁𝓂𝓃ℴ𝓅𝓆𝓇𝓈𝓉𝓊𝓋𝓌𝓍𝓎𝓏    ',
  \ 'CURSIVE_BOLD'      : '                                𝓐𝓑𝓒𝓓𝓔𝓕𝓖𝓗𝓘𝓙𝓚𝓛𝓜𝓝𝓞𝓟𝓠𝓡𝓢𝓣𝓤𝓥𝓦𝓧𝓨𝓩      𝓪𝓫𝓬𝓭𝓮𝓯𝓰𝓱𝓲𝓳𝓴𝓵𝓶𝓷𝓸𝓹𝓺𝓻𝓼𝓽𝓾𝓿𝔀𝔁𝔂𝔃    ',
  \ 'DOUBLE_STRUCK'     : '               𝟘𝟙𝟚𝟛𝟜𝟝𝟞𝟟𝟠𝟡       𝔸𝔹ℂ𝔻𝔼𝔽𝔾ℍ𝕀𝕁𝕂𝕃𝕄ℕ𝕆ℙℚℝ𝕊𝕋𝕌𝕍𝕎𝕏𝕐ℤ      𝕒𝕓𝕔𝕕𝕖𝕗𝕘𝕙𝕚𝕛𝕜𝕝𝕞𝕟𝕠𝕡𝕢𝕣𝕤𝕥𝕦𝕧𝕨𝕩𝕪𝕫    ',
  \ 'FRAKTUR'           : '                                𝔄𝔅ℭ𝔇𝔈𝔉𝔊ℌℑ𝔍𝔎𝔏𝔐𝔑𝔒𝔓𝔔ℜ𝔖𝔗𝔘𝔙𝔚𝔛𝔜ℨ      𝔞𝔟𝔠𝔡𝔢𝔣𝔤𝔥𝔦𝔧𝔨𝔩𝔪𝔫𝔬𝔭𝔮𝔯𝔰𝔱𝔲𝔳𝔴𝔵𝔶𝔷    ',
  \ 'FRAKTUR_BOLD'      : '                                𝕬𝕭𝕮𝕯𝕰𝕱𝕲𝕳𝕴𝕵𝕶𝕷𝕸𝕹𝕺𝕻𝕼𝕽𝕾𝕿𝖀𝖁𝖂𝖃𝖄𝖅      𝖆𝖇𝖈𝖉𝖊𝖋𝖌𝖍𝖎𝖏𝖐𝖑𝖒𝖓𝖔𝖕𝖖𝖗𝖘𝖙𝖚𝖛𝖜𝖝𝖞𝖟    ',
  \ 'INVERTED'          : '¡„   ⅋     ‘ ˙            ؛   ¿ ∀ ϽᗡƎℲƃ  ſʞ˥   ԀὉᴚ ⊥∩Λ  ʎ     ‾ ɐ ɔ ǝɟƃɥıɾʞןɯ    ɹ ʇ ʌʍ ʎ     ',
  \ 'MONOSPACE'         : '               𝟶𝟷𝟸𝟹𝟺𝟻𝟼𝟽𝟾𝟿       𝙰𝙱𝙲𝙳𝙴𝙵𝙶𝙷𝙸𝙹𝙺𝙻𝙼𝙽𝙾𝙿𝚀𝚁𝚂𝚃𝚄𝚅𝚆𝚇𝚈𝚉      𝚊𝚋𝚌𝚍𝚎𝚏𝚐𝚑𝚒𝚓𝚔𝚕𝚖𝚗𝚘𝚙𝚚𝚛𝚜𝚝𝚞𝚟𝚠𝚡𝚢𝚣    ',
  \ 'PARENTHESIZED'     : '                ⑴⑵⑶⑷⑸⑹⑺⑻⑼       ⒜⒝⒞⒟⒠⒡⒢⒣⒤⒥⒦⒧⒨⒩⒪⒫⒬⒭⒮⒯⒰⒱⒲⒳⒴⒵      ⒜⒝⒞⒟⒠⒡⒢⒣⒤⒥⒦⒧⒨⒩⒪⒫⒬⒭⒮⒯⒰⒱⒲⒳⒴⒵    ',
  \ 'REVERSED'          : '                ߁         ⁏   ⸮   Ↄ Ǝꟻ     ⅃ ᴎ ꟼ ᴙꙄ               ↄ ɘꟻ       ᴎ   ᴙꙅ          ∽',
  \ 'ROCK_DOTS'         : '            ⸚∵    ӟ             ÄḄĊḊЁḞĠḦЇ ḲḶṀṄÖṖ ṚṠṪÜṾẄẌŸŻ      äḅċḋëḟġḧï ḳḷṁṅöṗ ṛṡẗüṿẅẍÿż    ',
  \ 'SANS'              : '               𝟢𝟣𝟤𝟥𝟦𝟧𝟨𝟩𝟪𝟫       𝖠𝖡𝖢𝖣𝖤𝖥𝖦𝖧𝖨𝖩𝖪𝖫𝖬𝖭𝖮𝖯𝖰𝖱𝖲𝖳𝖴𝖵𝖶𝖷𝖸𝖹      𝖺𝖻𝖼𝖽𝖾𝖿𝗀𝗁𝗂𝗃𝗄𝗅𝗆𝗇𝗈𝗉𝗊𝗋𝗌𝗍𝗎𝗏𝗐𝗑𝗒𝗓    ',
  \ 'SANS_BOLD'         : '               𝟬𝟭𝟮𝟯𝟰𝟱𝟲𝟳𝟴𝟵       𝗔𝗕𝗖𝗗𝗘𝗙𝗚𝗛𝗜𝗝𝗞𝗟𝗠𝗡𝗢𝗣𝗤𝗥𝗦𝗧𝗨𝗩𝗪𝗫𝗬𝗭      𝗮𝗯𝗰𝗱𝗲𝗳𝗴𝗵𝗶𝗷𝗸𝗹𝗺𝗻𝗼𝗽𝗾𝗿𝘀𝘁𝘂𝘃𝘄𝘅𝘆𝘇    ',
  \ 'SANS_BOLD_ITALIC'  : '                                𝘼𝘽𝘾𝘿𝙀𝙁𝙂𝙃𝙄𝙅𝙆𝙇𝙈𝙉𝙊𝙋𝙌𝙍𝙎𝙏𝙐𝙑𝙒𝙓𝙔𝙕      𝙖𝙗𝙘𝙙𝙚𝙛𝙜𝙝𝙞𝙟𝙠𝙡𝙢𝙣𝙤𝙥𝙦𝙧𝙨𝙩𝙪𝙫𝙬𝙭𝙮𝙯    ',
  \ 'SANS_ITALIC'       : '                                𝘈𝘉𝘊𝘋𝘌𝘍𝘎𝘏𝘐𝘑𝘒𝘓𝘔𝘕𝘖𝘗𝘘𝘙𝘚𝘛𝘜𝘝𝘞𝘟𝘠𝘡      𝘢𝘣𝘤𝘥𝘦𝘧𝘨𝘩𝘪𝘫𝘬𝘭𝘮𝘯𝘰𝘱𝘲𝘳𝘴𝘵𝘶𝘷𝘸𝘹𝘺𝘻    ',
  \ 'SERIF_BOLD'        : '               𝟎𝟏𝟐𝟑𝟒𝟓𝟔𝟕𝟖𝟗       𝐀𝐁𝐂𝐃𝐄𝐅𝐆𝐇𝐈𝐉𝐊𝐋𝐌𝐍𝐎𝐏𝐐𝐑𝐒𝐓𝐔𝐕𝐖𝐗𝐘𝐙      𝐚𝐛𝐜𝐝𝐞𝐟𝐠𝐡𝐢𝐣𝐤𝐥𝐦𝐧𝐨𝐩𝐪𝐫𝐬𝐭𝐮𝐯𝐰𝐱𝐲𝐳    ',
  \ 'SERIF_BOLD_ITALIC' : '                                𝑨𝑩𝑪𝑫𝑬𝑭𝑮𝑯𝑰𝑱𝑲𝑳𝑴𝑵𝑶𝑷𝑸𝑹𝑺𝑻𝑼𝑽𝑾𝑿𝒀𝒁      𝒂𝒃𝒄𝒅𝒆𝒇𝒈𝒉𝒊𝒋𝒌𝒍𝒎𝒏𝒐𝒑𝒒𝒓𝒔𝒕𝒖𝒗𝒘𝒙𝒚𝒛    ',
  \ 'SERIF_ITALIC'      : '                                𝐴𝐵𝐶𝐷𝐸𝐹𝐺𝐻𝐼𝐽𝐾𝐿𝑀𝑁𝑂𝑃𝑄𝑅𝑆𝑇𝑈𝑉𝑊𝑋𝑌𝑍      𝑎𝑏𝑐𝑑𝑒𝑓𝑔ℎ𝑖𝑗𝑘𝑙𝑚𝑛𝑜𝑝𝑞𝑟𝑠𝑡𝑢𝑣𝑤𝑥𝑦𝑧    ',
  \ 'SMALL_CAPS'        : '                                ᴀʙᴄᴅᴇꜰɢʜɪᴊᴋʟᴍɴᴏᴩ ʀꜱᴛᴜᴠᴡ  ᴢ                                    ',
  \ 'SQUARED_BLACK'     : '                                🅰🅱🅲🅳🅴🅵🅶🅷🅸🅹🅺🅻🅼🅽🅾🅿🆀🆁🆂🆃🆄🆅🆆🆇🆈🆉                                    ',
  \ 'SQUARED_WHITE'     : '         ⧆⊞ ⊟⊡⧄                 🄰🄱🄲🄳🄴🄵🄶🄷🄸🄹🄺🄻🄼🄽🄾🄿🅀🅁🅂🅃🅄🅅🅆🅇🅈🅉 ⧅                                  ',
  \ 'STROKED'           : '                 ƻ              ȺɃȻĐɆ ǤĦƗɈꝀŁ  ØⱣꝖɌ Ŧᵾ   ɎƵ      Ⱥƀȼđɇ ǥħɨɉꝁł  øᵽꝗɍ ŧᵾ   ɏƶ    ',
  \ 'SUBSCRIPT'         : '       ₍₎ ₊ ₋  ₀₁₂₃₄₅₆₇₈₉   ₌                                   ₐ   ₑ  ₕᵢⱼₖₗₘₙₒₚ ᵣₛₜᵤᵥ ₓ      ',
  \ 'SUPERSCRIPT'       : '       ⁽⁾ ⁺ ⁻  ⁰¹²³⁴⁵⁶⁷⁸⁹   ⁼   ᴬᴮᶜᴰᴱᶠᴳᴴᴵᴶᴷᴸᴹᴺᴼᴾ ᴿˢᵀᵁⱽᵂ         ᵃᵇᶜᵈᵉᶠᵍʰⁱʲᵏˡᵐⁿᵒᵖ ʳˢᵗᵘᵛʷˣʸᶻ    ',
\ }

let s:keys = sort(keys(copy(s:charset)))
let s:lo = char2nr(s:ascii[0])
let s:hi = char2nr(s:ascii[strlen(s:ascii)-1])
let s:undefined = ' '

let s:active = ''
