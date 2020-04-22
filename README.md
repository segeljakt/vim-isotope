<h1 align="center">vim-isotope</h1>

<p align="center">
  <img src="https://user-images.githubusercontent.com/15143039/75606665-66680c80-5aef-11ea-9b0b-6f75b62fd049.png">
</p>

This plugin provides mappings for inserting characters as `ˢᵘᵖᵉʳˢᶜʳⁱᵖᵗˢ`, `ₛᵤbₛ꜀ᵣᵢₚₜₛ`, `u͟n͟d͟e͟r͟l͟i͟n͟e͟`, `s̶t̶r̶i̶k̶e̶t̶h̶r̶o̶u̶g̶h̶`, `𝐒𝐄𝐑𝐈𝐅-𝐁𝐎𝐋𝐃`, `𝐒𝐄𝐑𝐈𝐅-𝐈𝐓𝐀𝐋𝐈𝐂`, `𝔉ℜ𝔄𝔎𝔗𝔘ℜ`, `𝔻𝕆𝕌𝔹𝕃𝔼-𝕊𝕋ℝ𝕌ℂ𝕂`, `ᴙƎVƎᴙꙄƎD`, `INΛƎᴚ⊥Ǝᗡ`, `ⒸⒾⓇⒸⓁⒺⒹ`, and much more. Depending on your setup, some characters may not display correctly.

# Installation

If you are using [vim-plug](https://github.com/junegunn/vim-plug), add this to your config.

```vim
Plug 'segeljakt/vim-isotope'
```


# Special characters

<p align="center">
  <img src="https://github.com/segeljakt/assets/blob/master/Isotope-hello-world.gif?raw=true">
</p>

The `IsotopeInsert` and `IsotopeToggle` can be used to insert special characters.

```vim
" Convert the next typed character into SERIF_BOLD
:IsotopeInsert SERIF_BOLD

  𝐗

" While toggled ON, convert all typed characters into FRAKTUR
:IsotopeToggle FRAKTUR

  𝔖𝔞𝔪𝔭𝔩𝔢 𝔗𝔢𝔵𝔱

" Toggle character conversion OFF.
:IsotopeToggle
```

A list of the supported classes of special characters can be viewed at the bottom of this README.

# Combining characters

<p align="center">
  <img src="https://github.com/segeljakt/assets/blob/master/Isotope-Heart-Vim-2.gif?raw=true">
</p>

The `IsotopeAttach` command can be used to attach one or multiple diacritics (combining characters).

```vim
:'<,'>IsotopeAttach h e h e

  Sͤͪͤͪaͤͪͤͪmͤͪͤͪpͤͪͤͪlͤͪͤͪeͤͪͤͪ ͤͪͤͪtͤͪͤͪeͤͪͤͪxͤͪͤͪtͤͪͤͪ

:'<,'>IsotopeAttach *below /center zabove

  S̸͙͛a̸͙͛m̸͙͛p̸͙͛l̸͙͛e̸͙͛ ̸͙͛t̸͙͛e̸͙͛x̸͙͛t̸͙͛

:'<,'>IsotopeAttach .below .above

  Ṩạ̇ṃ̇ṗ̣ḷ̇ẹ̇ ̣̇ṭ̇ẹ̇ẋ̣ṭ̇

:'<,'>IsotopeAttach xabove xbelow

  S͓̽a͓̽m͓̽p͓̽l͓̽e͓̽ ͓̽t͓̽e͓̽x͓̽t͓̽

:'<,'>IsotopeAttach ^below ~below ring-above <->below ~above

  S͍̰͎̃̊ã͍̰͎̊m͍̰͎̃̊p͍̰͎̃̊l͍̰͎̃̊ẽ͍̰͎̊ ͍̰͎̃̊t͍̰͎̃̊ẽ͍̰͎̊x͍̰͎̃̊t͍̰͎̃̊
```

You may also insert diacritics by their raw unicode name through the `IsotopeAttach!` command. The following commands are equivalent to the ones above:

```vim
:'<,'>IsotopeAttach! LATIN_SMALL_LETTER_H LATIN_SMALL_LETTER_E LATIN_SMALL_LETTER_H LATIN_SMALL_LETTER_E
:'<,'>IsotopeAttach! ASTERISK_BELOW LONG_DOUBLE_SOLIDUS_OVERLAY ZIGZAG_ABOVE
:'<,'>IsotopeAttach! DOT_BELOW DOT_ABOVE 
:'<,'>IsotopeAttach! X_ABOVE X_BELOW
:'<,'>IsotopeAttach! CIRCUMFLEX_ACCENT_BELOW CIRCUMFLEX TILDE_BELOW RING_ABOVE LEFT_RIGHT_ARROW_ABOVE TILDE
```

By default, Vim can display 2 diacritics on top of each other. You can raise this limit through the `maxcombine` option. The maximum is 6:

```vim
set maxcombine=6
```

You can also activate the `delcombine` option which permits removal of diacritics without deleting the character they are attached to.

```vim
set delcombine
```

# Default mappings

Below are the default mappings.

```vim
" Superscript/subscript/circled-white
inoremap <C-g><C-j>      <C-o>:IsotopeInsert SUPERSCRIPT<CR>
inoremap <C-g><C-k>      <C-o>:IsotopeInsert SUBSCRIPT<CR>
inoremap <C-g><C-c>      <C-o>:IsotopeInsert CIRCLED_WHITE<CR>

inoremap <C-g><C-g><C-j> <C-o>:IsotopeToggle SUPERSCRIPT<CR>
inoremap <C-g><C-g><C-k> <C-o>:IsotopeToggle SUBSCRIPT<CR>
inoremap <C-g><C-g><C-c> <C-o>:IsotopeToggle CIRCLED_WHITE<CR>

" Underline
vnoremap <C-g><C-g><C-u> <C-o>:IsotopeAttach -below<CR>
```

These can be disabled by:

```vim
let g:isotope_use_default_mappings = 0
```

# Custom commands

For readability, it can be useful to define custom shortcut commands like this:

```vim
command -range Underline     IsotopeAttach -below
command -range Strikethrough IsotopeAttach -center
command -range Slashthrough  IsotopeAttach /center
```

# Searching for characters

To locate characters, you can use the `IsotopeSearch` command:

```vim
" Locate all classes of special characters.
:IsotopeSearch

" Locate specific classes of special characters.
:IsotopeSearch SERIF_BOLD DOUBLE_STRUCK
```

Currently, this command cannot be used to find diacritic characters. PRs are welcome.

# Character preview

A list of all special characters and diacritics can be viewed by running this command:

```
:IsotopePreview
```

<details><summary><b>List of Special Characters</b></summary><p>

Below is a list of all special classes of characters, sorted in alphabetic order. Note that some characters have no conversions from ASCII. Also, GitHub might render some with longer widths.

```
Default ASCII     : !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~
------------------------------------------------------------------------------------------------------------------
ACUTE             :                                 Á Ć É Ǵ í ḰĹḾŃŐṔ Ŕś Ű Ẃ ӲŹ      á ć é ǵ í ḱĺḿńőṕ ŕś ú ẃ ӳź    
CIRCLED_BLACK     :                🄌➊➋➌➍➎➏➐➑➒       🅐🅑🅒🅓🅔🅕🅖🅗🅘🅙🅚🅛🅜🅝🅞🅟🅠🅡🅢🅣🅤🅥🅦🅧🅨🅩                                    
CIRCLED_WHITE     :          ⊛⊕ ⊖⨀⊘⓪①②③④⑤⑥⑦⑧⑨  ⧀⊜⧁  ⒶⒷⒸⒹⒺⒻⒼⒽⒾⒿⓀⓁⓂⓃⓄⓅⓆⓇⓈⓉⓊⓋⓌⓍⓎⓏ ⦸    ⓐⓑⓒⓓⓔⓕⓖⓗⓘⓙⓚⓛⓜⓝⓞⓟⓠⓡⓢⓣⓤⓥⓦⓧⓨⓩ ⦶  
CURSIVE           :                                 𝒜ℬ𝒞𝒟ℰℱ𝒢ℋℐ𝒥𝒦ℒℳ𝒩𝒪𝒫𝒬ℛ𝒮𝒯𝒰𝒱𝒲𝒳𝒴𝒵      𝒶𝒷𝒸𝒹ℯ𝒻ℊ𝒽𝒾𝒿𝓀𝓁𝓂𝓃ℴ𝓅𝓆𝓇𝓈𝓉𝓊𝓋𝓌𝓍𝓎𝓏    
CURSIVE_BOLD      :                                 𝓐𝓑𝓒𝓓𝓔𝓕𝓖𝓗𝓘𝓙𝓚𝓛𝓜𝓝𝓞𝓟𝓠𝓡𝓢𝓣𝓤𝓥𝓦𝓧𝓨𝓩      𝓪𝓫𝓬𝓭𝓮𝓯𝓰𝓱𝓲𝓳𝓴𝓵𝓶𝓷𝓸𝓹𝓺𝓻𝓼𝓽𝓾𝓿𝔀𝔁𝔂𝔃    
DOUBLE_STRUCK     :                𝟘𝟙𝟚𝟛𝟜𝟝𝟞𝟟𝟠𝟡       𝔸𝔹ℂ𝔻𝔼𝔽𝔾ℍ𝕀𝕁𝕂𝕃𝕄ℕ𝕆ℙℚℝ𝕊𝕋𝕌𝕍𝕎𝕏𝕐ℤ      𝕒𝕓𝕔𝕕𝕖𝕗𝕘𝕙𝕚𝕛𝕜𝕝𝕞𝕟𝕠𝕡𝕢𝕣𝕤𝕥𝕦𝕧𝕨𝕩𝕪𝕫    
FRAKTUR           :                                 𝔄𝔅ℭ𝔇𝔈𝔉𝔊ℌℑ𝔍𝔎𝔏𝔐𝔑𝔒𝔓𝔔ℜ𝔖𝔗𝔘𝔙𝔚𝔛𝔜ℨ      𝔞𝔟𝔠𝔡𝔢𝔣𝔤𝔥𝔦𝔧𝔨𝔩𝔪𝔫𝔬𝔭𝔮𝔯𝔰𝔱𝔲𝔳𝔴𝔵𝔶𝔷    
FRAKTUR_BOLD      :                                 𝕬𝕭𝕮𝕯𝕰𝕱𝕲𝕳𝕴𝕵𝕶𝕷𝕸𝕹𝕺𝕻𝕼𝕽𝕾𝕿𝖀𝖁𝖂𝖃𝖄𝖅      𝖆𝖇𝖈𝖉𝖊𝖋𝖌𝖍𝖎𝖏𝖐𝖑𝖒𝖓𝖔𝖕𝖖𝖗𝖘𝖙𝖚𝖛𝖜𝖝𝖞𝖟    
INVERTED          : ¡„   ⅋     ‘ ˙            ؛   ¿ ∀ ϽᗡƎℲƃ  ſʞ˥   ԀὉᴚ ⊥∩Λ  ʎ     ‾ ɐ ɔ ǝɟƃɥıɾʞןɯ    ɹ ʇ ʌʍ ʎ     
MONOSPACE         :                𝟶𝟷𝟸𝟹𝟺𝟻𝟼𝟽𝟾𝟿       𝙰𝙱𝙲𝙳𝙴𝙵𝙶𝙷𝙸𝙹𝙺𝙻𝙼𝙽𝙾𝙿𝚀𝚁𝚂𝚃𝚄𝚅𝚆𝚇𝚈𝚉      𝚊𝚋𝚌𝚍𝚎𝚏𝚐𝚑𝚒𝚓𝚔𝚕𝚖𝚗𝚘𝚙𝚚𝚛𝚜𝚝𝚞𝚟𝚠𝚡𝚢𝚣    
PARENTHESIZED     :                 ⑴⑵⑶⑷⑸⑹⑺⑻⑼       ⒜⒝⒞⒟⒠⒡⒢⒣⒤⒥⒦⒧⒨⒩⒪⒫⒬⒭⒮⒯⒰⒱⒲⒳⒴⒵      ⒜⒝⒞⒟⒠⒡⒢⒣⒤⒥⒦⒧⒨⒩⒪⒫⒬⒭⒮⒯⒰⒱⒲⒳⒴⒵    
REVERSED          :                 ߁         ⁏   ⸮   Ↄ Ǝꟻ     ⅃ ᴎ ꟼ ᴙꙄ               ↄ ɘꟻ       ᴎ   ᴙꙅ          ∽
ROCK_DOTS         :             ⸚∵    ӟ             ÄḄĊḊЁḞĠḦЇ ḲḶṀṄÖṖ ṚṠṪÜṾẄẌŸŻ      äḅċḋëḟġḧï ḳḷṁṅöṗ ṛṡẗüṿẅẍÿż    
SANS              :                𝟢𝟣𝟤𝟥𝟦𝟧𝟨𝟩𝟪𝟫       𝖠𝖡𝖢𝖣𝖤𝖥𝖦𝖧𝖨𝖩𝖪𝖫𝖬𝖭𝖮𝖯𝖰𝖱𝖲𝖳𝖴𝖵𝖶𝖷𝖸𝖹      𝖺𝖻𝖼𝖽𝖾𝖿𝗀𝗁𝗂𝗃𝗄𝗅𝗆𝗇𝗈𝗉𝗊𝗋𝗌𝗍𝗎𝗏𝗐𝗑𝗒𝗓    
SANS_BOLD         :                𝟬𝟭𝟮𝟯𝟰𝟱𝟲𝟳𝟴𝟵       𝗔𝗕𝗖𝗗𝗘𝗙𝗚𝗛𝗜𝗝𝗞𝗟𝗠𝗡𝗢𝗣𝗤𝗥𝗦𝗧𝗨𝗩𝗪𝗫𝗬𝗭      𝗮𝗯𝗰𝗱𝗲𝗳𝗴𝗵𝗶𝗷𝗸𝗹𝗺𝗻𝗼𝗽𝗾𝗿𝘀𝘁𝘂𝘃𝘄𝘅𝘆𝘇    
SANS_BOLD_ITALIC  :                                 𝘼𝘽𝘾𝘿𝙀𝙁𝙂𝙃𝙄𝙅𝙆𝙇𝙈𝙉𝙊𝙋𝙌𝙍𝙎𝙏𝙐𝙑𝙒𝙓𝙔𝙕      𝙖𝙗𝙘𝙙𝙚𝙛𝙜𝙝𝙞𝙟𝙠𝙡𝙢𝙣𝙤𝙥𝙦𝙧𝙨𝙩𝙪𝙫𝙬𝙭𝙮𝙯    
SANS_ITALIC       :                                 𝘈𝘉𝘊𝘋𝘌𝘍𝘎𝘏𝘐𝘑𝘒𝘓𝘔𝘕𝘖𝘗𝘘𝘙𝘚𝘛𝘜𝘝𝘞𝘟𝘠𝘡      𝘢𝘣𝘤𝘥𝘦𝘧𝘨𝘩𝘪𝘫𝘬𝘭𝘮𝘯𝘰𝘱𝘲𝘳𝘴𝘵𝘶𝘷𝘸𝘹𝘺𝘻    
SERIF_BOLD        :                𝟎𝟏𝟐𝟑𝟒𝟓𝟔𝟕𝟖𝟗       𝐀𝐁𝐂𝐃𝐄𝐅𝐆𝐇𝐈𝐉𝐊𝐋𝐌𝐍𝐎𝐏𝐐𝐑𝐒𝐓𝐔𝐕𝐖𝐗𝐘𝐙      𝐚𝐛𝐜𝐝𝐞𝐟𝐠𝐡𝐢𝐣𝐤𝐥𝐦𝐧𝐨𝐩𝐪𝐫𝐬𝐭𝐮𝐯𝐰𝐱𝐲𝐳    
SERIF_BOLD_ITALIC :                                 𝑨𝑩𝑪𝑫𝑬𝑭𝑮𝑯𝑰𝑱𝑲𝑳𝑴𝑵𝑶𝑷𝑸𝑹𝑺𝑻𝑼𝑽𝑾𝑿𝒀𝒁      𝒂𝒃𝒄𝒅𝒆𝒇𝒈𝒉𝒊𝒋𝒌𝒍𝒎𝒏𝒐𝒑𝒒𝒓𝒔𝒕𝒖𝒗𝒘𝒙𝒚𝒛    
SERIF_ITALIC      :                                 𝐴𝐵𝐶𝐷𝐸𝐹𝐺𝐻𝐼𝐽𝐾𝐿𝑀𝑁𝑂𝑃𝑄𝑅𝑆𝑇𝑈𝑉𝑊𝑋𝑌𝑍      𝑎𝑏𝑐𝑑𝑒𝑓𝑔ℎ𝑖𝑗𝑘𝑙𝑚𝑛𝑜𝑝𝑞𝑟𝑠𝑡𝑢𝑣𝑤𝑥𝑦𝑧    
SMALL_CAPS        :                                 ᴀʙᴄᴅᴇꜰɢʜɪᴊᴋʟᴍɴᴏᴩ ʀꜱᴛᴜᴠᴡ  ᴢ                                    
SQUARED_BLACK     :                                 🅰🅱🅲🅳🅴🅵🅶🅷🅸🅹🅺🅻🅼🅽🅾🅿🆀🆁🆂🆃🆄🆅🆆🆇🆈🆉                                    
SQUARED_WHITE     :          ⧆⊞ ⊟⊡⧄                 🄰🄱🄲🄳🄴🄵🄶🄷🄸🄹🄺🄻🄼🄽🄾🄿🅀🅁🅂🅃🅄🅅🅆🅇🅈🅉 ⧅                                  
STROKED           :                  ƻ              ȺɃȻĐɆ ǤĦƗɈꝀŁ  ØⱣꝖɌ Ŧᵾ   ɎƵ      Ⱥƀȼđɇ ǥħɨɉꝁł  øᵽꝗɍ ŧᵾ   ɏƶ    
SUBSCRIPT         :        ₍₎ ₊ ₋  ₀₁₂₃₄₅₆₇₈₉   ₌                                   ₐ   ₑ  ₕᵢⱼₖₗₘₙₒₚ ᵣₛₜᵤᵥ ₓ      
SUPERSCRIPT       :        ⁽⁾ ⁺ ⁻  ⁰¹²³⁴⁵⁶⁷⁸⁹   ⁼   ᴬᴮᶜᴰᴱᶠᴳᴴᴵᴶᴷᴸᴹᴺᴼᴾ ᴿˢᵀᵁⱽᵂ         ᵃᵇᶜᵈᵉᶠᵍʰⁱʲᵏˡᵐⁿᵒᵖ ʳˢᵗᵘᵛʷˣʸᶻ    
```
</p></details>
<details><summary><b>List of Combining Characters</b></summary><p>

Below is a list of all different kinds of diacritics.

```
1ᷙ2ᷙ3ᷙaᷙbᷙcᷙAᷙBᷙCᷙ = LATIN_SMALL_LETTER_ETH

1᷑2᷑3᷑a᷑b᷑c᷑A᷑B᷑C᷑ = UR_ABOVE

1͍2͍3͍a͍b͍c͍A͍B͍C͍ = LEFT_RIGHT_ARROW_BELOW [ <->below ]

1᷋2᷋3᷋a᷋b᷋c᷋A᷋B᷋C᷋ = BREVE_MACRON

1᷌2᷌3᷌a᷌b᷌c᷌A᷌B᷌C᷌ = MACRON_BREVE

1︢2︢3︢a︢b︢c︢A︢B︢C︢ = DOUBLE_TILDE_LEFT_HALF

1̤2̤3̤a̤b̤c̤A̤B̤C̤ = DIAERESIS_BELOW

1̥2̥3̥ḁb̥c̥ḀB̥C̥ = RING_BELOW [ ring-below ]

1̋2̋3̋a̋b̋c̋A̋B̋C̋ = DOUBLE_ACCUTE_ACCENT

1᷁2᷁3᷁a᷁b᷁c᷁A᷁B᷁C᷁ = DOTTED_ACUTE_ACCENT

1᷸2᷸3᷸a᷸b᷸c᷸A᷸B᷸C᷸ = DOT_ABOVE_LEFT

1ᷩ2ᷩ3ᷩaᷩbᷩcᷩAᷩBᷩCᷩ = LATIN_SMALL_LETTER_BETA [ β ]

1⃢2⃢3⃢a⃢b⃢c⃢A⃢B⃢C⃢ = ENCLOSING_SCREEN

1̧2̧3̧a̧b̧çA̧B̧Ç = CEDILLA

1̜2̜3̜a̜b̜c̜A̜B̜C̜ = LEFT_HALF_RING_BELOW

1̀2̀3̀àb̀c̀ÀB̀C̀ = GRAVE_TONE_MARK

1᷐2᷐3᷐a᷐b᷐c᷐A᷐B᷐C᷐ = IS_BELOW

1᷀2᷀3᷀a᷀b᷀c᷀A᷀B᷀C᷀ = DOTTED_GRAVE_ACCENT

1̿2̿3̿a̿b̿c̿A̿B̿C̿ = DOUBLE_OVERLINE

1᷻2᷻3᷻a᷻b᷻c᷻A᷻B᷻C᷻ = DELETION_MARK

1᷒2᷒3᷒a᷒b᷒c᷒A᷒B᷒C᷒ = US_ABOVE

1᪹2᪹3᪹a᪹b᪹c᪹A᪹B᪹C᪹ = LIGHT_CENTRALIZATION_STROKE_BELOW

1́2́3́áb́ćÁB́Ć = ACCUTE_ACCENT

1͢2͢3͢a͢b͢c͢A͢B͢C͢ = DOUBLE_RIGHTWARDS_ARROW_BELOW

1̱2̱3̱a̱ḇc̱A̱ḆC̱ = MACRON_BELOW

1︧2︧3︧a︧b︧c︧A︧B︧C︧ = LIGATURE_LEFT_HALF_BELOW

1̨2̨3̨ąb̨c̨ĄB̨C̨ = OGONEK

1̈2̈3̈äb̈c̈ÄB̈C̈ = DIAERESIS

1᪳2᪳3᪳a᪳b᪳c᪳A᪳B᪳C᪳ = DOWNWARDS_ARROW [ v|above ]

1̘2̘3̘a̘b̘c̘A̘B̘C̘ = LEFT_TACK_BELOW

1ᷢ2ᷢ3ᷢaᷢbᷢcᷢAᷢBᷢCᷢ = LATIN_LETTER_SMALL_CAPITAL_R [ R ]

1⃭2⃭3⃭a⃭b⃭c⃭A⃭B⃭C⃭ = LEFTWARDS_HARPOON_WITH_BARB_DOWNWARDS

1̄2̄3̄āb̄c̄ĀB̄C̄ = MACRON

1͇2͇3͇a͇b͇c͇A͇B͇C͇ = EQUALS_SIGN_BELOW [ =below ]

1᷹2᷹3᷹a᷹b᷹c᷹A᷹B᷹C᷹ = WIDE_INVERTED_BRIDGE_BELOW

1᪰2᪰3᪰a᪰b᪰c᪰A᪰B᪰C᪰ = DOUBLED_CIRCUMFLEX_ACCENT

1̓2̓3̓a̓b̓c̓A̓B̓C̓ = COMMA_ABOVE

1̵2̵3̵a̵b̵c̵A̵B̵C̵ = SHORT_STROKE_OVERLAY

1ᷗ2ᷗ3ᷗaᷗbᷗcᷗAᷗBᷗCᷗ = LATIN_SMALL_LETTER_C_CEDILLA

1̸2̸3̸a̸b̸c̸A̸B̸C̸ = LONG_SOLIDUS_OVERLAY [ /center ]

1̛2̛3̛a̛b̛c̛A̛B̛C̛ = HORN

1͗2͗3͗a͗b͗c͗A͗B͗C͗ = RIGHT_HALF_RING_ABOVE

1᷊2᷊3᷊a᷊b᷊c᷊A᷊B᷊C᷊ = LATIN_SMALL_LETTER_R_BELOW

1⃦2⃦3⃦a⃦b⃦c⃦A⃦B⃦C⃦ = DOUBLE_VERTICAL_STROKE_OVERLAY

1̗2̗3̗a̗b̗c̗A̗B̗C̗ = ACUTE_ACCENT_BELOW

1᪶2᪶3᪶a᪶b᪶c᪶A᪶B᪶C᪶ = WIGGLY_LINE_BELOW

1͘2͘3͘a͘b͘c͘A͘B͘C͘ = DOT_ABOVE_RIGHT

1⃬2⃬3⃬a⃬b⃬c⃬A⃬B⃬C⃬ = RIGHTWARDS_HARPOON_WITH_BARB_DOWNWARDS

1᷏2᷏3᷏a᷏b᷏c᷏A᷏B᷏C᷏ = ZIGZAG_BELOW [ zbelow ]

1̌2̌3̌ǎb̌čǍB̌Č = CARON

1⃧2⃧3⃧a⃧b⃧c⃧A⃧B⃧C⃧ = ANNUITY_SYMBOL

1̮2̮3̮a̮b̮c̮A̮B̮C̮ = BREVE_BELOW

1̙2̙3̙a̙b̙c̙A̙B̙C̙ = RIGHT_TACK_BELOW

1⃩2⃩3⃩a⃩b⃩c⃩A⃩B⃩C⃩ = WIDE_BRIDGE_ABOVE

1⃑2⃑3⃑a⃑b⃑c⃑A⃑B⃑C⃑ = RIGHT_HARPOON_ABOVE

1̷2̷3̷a̷b̷c̷A̷B̷C̷ = SHORT_SOLIDUS_OVERLAY

1͡2͡3͡a͡b͡c͡A͡B͡C͡ = DOUBLE_INVERTED_BREVE

1⃰2⃰3⃰a⃰b⃰c⃰A⃰B⃰C⃰ = ASTERISK_ABOVE [ *above ]

1᪼2᪼3᪼a᪼b᪼c᪼A᪼B᪼C᪼ = DOUBLE_PARENTHESIS_ABOVE

1̎2̎3̎a̎b̎c̎A̎B̎C̎ = DOUBLE_VERTICAL_LINE_ABOVE

1᷽2᷽3᷽a᷽b᷽c᷽A᷽B᷽C᷽ = ALMOST_EQUAL_TO_BELOW

1᪺2᪺3᪺a᪺b᪺c᪺A᪺B᪺C᪺ = STRONG_CENTRALIZATION_STROKE_BELOW

1⃠2⃠3⃠a⃠b⃠c⃠A⃠B⃠C⃠ = ENCLOSING_CIRCLE_BACKSLASH

1͝2͝3͝a͝b͝c͝A͝B͝C͝ = DOUBLE_BREVE

1̣2̣3̣ạḅc̣ẠḄC̣ = DOT_BELOW [ .below ]

1̬2̬3̬a̬b̬c̬A̬B̬C̬ = CARON_BELOW [ vbelow ]

1⃨2⃨3⃨a⃨b⃨c⃨A⃨B⃨C⃨ = TRIPLE_UNDERDOT [ ...below ]

1︬2︬3︬a︬b︬c︬A︬B︬C︬ = MACRON_RIGHT_HALF_BELOW

1︩2︩3︩a︩b︩c︩A︩B︩C︩ = TILDE_LEFT_HALF_HELOW

1᷷2᷷3᷷a᷷b᷷c᷷A᷷B᷷C᷷ = KAVYKAK_ABOVE_LEFT

1̕2̕3̕a̕b̕c̕A̕B̕C̕ = COMMA_ABOVE_RIGHT

1︫2︫3︫a︫b︫c︫A︫B︫C︫ = MACRON_LEFT_HALF_BELOW

1̐2̐3̐a̐b̐c̐A̐B̐C̐ = CANDRABINDU

1ᷛ2ᷛ3ᷛaᷛbᷛcᷛAᷛBᷛCᷛ = LATIN_LETTER_SMALL_CAPITAL_G [ G ]

1ᷞ2ᷞ3ᷞaᷞbᷞcᷞAᷞBᷞCᷞ = LATIN_LETTER_SMALL_CAPITAL_L [ L ]

1ᷟ2ᷟ3ᷟaᷟbᷟcᷟAᷟBᷟCᷟ = LATIN_LETTER_SMALL_CAPITAL_M [ M ]

1ᷡ2ᷡ3ᷡaᷡbᷡcᷡAᷡBᷡCᷡ = LATIN_LETTER_SMALL_CAPITAL_N [ N ]

1̚2̚3̚a̚b̚c̚A̚B̚C̚ = LEFT_ANGLE_ABOVE

1ͤ2ͤ3ͤaͤbͤcͤAͤBͤCͤ = LATIN_SMALL_LETTER_E [ e ]

1̲2̲3̲a̲b̲c̲A̲B̲C̲ = LOW_LINE

1ᷚ2ᷚ3ᷚaᷚbᷚcᷚAᷚBᷚCᷚ = LATIN_SMALL_LETTER_G [ g ]

1̠2̠3̠a̠b̠c̠A̠B̠C̠ = MINUS_SIGN_BELOW

1︣2︣3︣a︣b︣c︣A︣B︣C︣ = DOUBLE_TILDE_RIGHT_HALF

1⃓2⃓3⃓a⃓b⃓c⃓A⃓B⃓C⃓ = SHORT_VERTICAL_LINE_OVERLAY

1͕2͕3͕a͕b͕c͕A͕B͕C͕ = RIGHT_ARROWHEAD_BELOW

1᷵2᷵3᷵a᷵b᷵c᷵A᷵B᷵C᷵ = UP_TACK_ABOVE

1ͣ2ͣ3ͣaͣbͣcͣAͣBͣCͣ = LATIN_SMALL_LETTER_A [ a ]

1ᷨ2ᷨ3ᷨaᷨbᷨcᷨAᷨBᷨCᷨ = LATIN_SMALL_LETTER_B [ b ]

1̉2̉3̉ảb̉c̉ẢB̉C̉ = HOOK_ABOVE 

1᪴2᪴3᪴a᪴b᪴c᪴A᪴B᪴C᪴ = TRIPLE_DOT

1⃝2⃝3⃝a⃝b⃝c⃝A⃝B⃝C⃝ = ENCLOSING_CIRCLE [ circle ]

1ᷫ2ᷫ3ᷫaᷫbᷫcᷫAᷫBᷫCᷫ = LATIN_SMALL_LETTER_F [ f ]

1͆2͆3͆a͆b͆c͆A͆B͆C͆ = BRIDGE_ABOVE

1ͪ2ͪ3ͪaͪbͪcͪAͪBͪCͪ = LATIN_SMALL_LETTER_H [ h ]

1ͥ2ͥ3ͥaͥbͥcͥAͥBͥCͥ = LATIN_SMALL_LETTER_I [ i ]

1ᷜ2ᷜ3ᷜaᷜbᷜcᷜAᷜBᷜCᷜ = LATIN_SMALL_LETTER_K [ k ]

1ᷝ2ᷝ3ᷝaᷝbᷝcᷝAᷝBᷝCᷝ = LATIN_SMALL_LETTER_L [ l ]

1ͫ2ͫ3ͫaͫbͫcͫAͫBͫCͫ = LATIN_SMALL_LETTER_M [ m ]

1ᷠ2ᷠ3ᷠaᷠbᷠcᷠAᷠBᷠCᷠ = LATIN_SMALL_LETTER_N [ n ]

1ͦ2ͦ3ͦaͦbͦcͦAͦBͦCͦ = LATIN_SMALL_LETTER_O [ o ]

1ᷮ2ᷮ3ᷮaᷮbᷮcᷮAᷮBᷮCᷮ = LATIN_SMALL_LETTER_P [ p ]

1᷉2᷉3᷉a᷉b᷉c᷉A᷉B᷉C᷉ = ACUTE_GRAVE_ACUTE

1ͬ2ͬ3ͬaͬbͬcͬAͬBͬCͬ = LATIN_SMALL_LETTER_R [ r ]

1ᷤ2ᷤ3ᷤaᷤbᷤcᷤAᷤBᷤCᷤ = LATIN_SMALL_LETTER_S [ s ]

1ͭ2ͭ3ͭaͭbͭcͭAͭBͭCͭ = LATIN_SMALL_LETTER_T [ t ]

1ͧ2ͧ3ͧaͧbͧcͧAͧBͧCͧ = LATIN_SMALL_LETTER_U [ u ]

1ͮ2ͮ3ͮaͮbͮcͮAͮBͮCͮ = LATIN_SMALL_LETTER_V [ v ]

1ᷱ2ᷱ3ᷱaᷱbᷱcᷱAᷱBᷱCᷱ = LATIN_SMALL_LETTER_W [ w ]

1ͯ2ͯ3ͯaͯbͯcͯAͯBͯCͯ = LATIN_SMALL_LETTER_X [ x ]

1ᷦ2ᷦ3ᷦaᷦbᷦcᷦAᷦBᷦCᷦ = LATIN_SMALL_LETTER_Z [ z ]

1︨2︨3︨a︨b︨c︨A︨B︨C︨ = LIGATURE_RIGHT_HALF_BELOW

1᷿2᷿3᷿a᷿b᷿c᷿A᷿B᷿C᷿ = RIGHT_ARROWHEAD_AND_DOWN_ARROWHEAD_BELOW

1ᷔ2ᷔ3ᷔaᷔbᷔcᷔAᷔBᷔCᷔ = LATIN_SMALL_LETTER_AE

1ᷧ2ᷧ3ᷧaᷧbᷧcᷧAᷧBᷧCᷧ = LATIN_SMALL_LETTER_ALPHA [ α ]

1⃖2⃖3⃖a⃖b⃖c⃖A⃖B⃖C⃖ = LEFT_ARROW_ABOVE [ <-above ]

1̽2̽3̽a̽b̽c̽A̽B̽C̽ = X_ABOVE [ xabove ]

1ᷕ2ᷕ3ᷕaᷕbᷕcᷕAᷕBᷕCᷕ = LATIN_SMALL_LETTER_AO

1᪵2᪵3᪵a᪵b᪵c᪵A᪵B᪵C᪵ = XX_BELOW

1᷄2᷄3᷄a᷄b᷄c᷄A᷄B᷄C᷄ = MACRON_ACUTE

1̞2̞3̞a̞b̞c̞A̞B̞C̞ = DOWN_TACK_BELOW

1ᷖ2ᷖ3ᷖaᷖbᷖcᷖAᷖBᷖCᷖ = LATIN_SMALL_LETTER_AV

1̫2̫3̫a̫b̫c̫A̫B̫C̫ = INVERTED_DOUBLE_ARCH_BELOW

1ͅ2ͅ3ͅaͅbͅcͅAͅBͅCͅ = GREEK_YPOGEGRAMMENI

1ᷰ2ᷰ3ᷰaᷰbᷰcᷰAᷰBᷰCᷰ = LATIN_SMALL_LETTER_U_WITH_LIGHT_CENTRALIZATION_STROKE

1⃪2⃪3⃪a⃪b⃪c⃪A⃪B⃪C⃪ = LEFTWARDS_ARROW_OVERLAY [ <-center ]

1᷍2᷍3᷍a᷍b᷍c᷍A᷍B᷍C᷍ = DOUBLE_CIRCUMFLEX_ABOVE

1ᷥ2ᷥ3ᷥaᷥbᷥcᷥAᷥBᷥCᷥ = LATIN_SMALL_LETTER_LONG_S

1᷼2᷼3᷼a᷼b᷼c᷼A᷼B᷼C᷼ = DOUBLE_INVERTED_BREVE_BELOW

1̼2̼3̼a̼b̼c̼A̼B̼C̼ = SEAGULL_BELOW

1᷶2᷶3᷶a᷶b᷶c᷶A᷶B᷶C᷶ = KAVYKA_ABOVE_RIGHT

1᷾2᷾3᷾a᷾b᷾c᷾A᷾B᷾C᷾ = LEFT_ARROWHEAD_ABOVE

1᪷2᪷3᪷a᪷b᪷c᪷A᪷B᪷C᪷ = OPEN_MARK_BELOW

1︤2︤3︤a︤b︤c︤A︤B︤C︤ = MACRON_LEFT_HALF

1᪻2᪻3᪻a᪻b᪻c᪻A᪻B᪻C᪻ = PARENTHESIS_ABOVE [ ()above ]

1̴2̴3̴a̴b̴c̴A̴B̴C̴ = TILDE_OVERLAY [ ~center ]

1ᷣ2ᷣ3ᷣaᷣbᷣcᷣAᷣBᷣCᷣ = LATIN_SMALL_LETTER_R_ROTUNDA

1︯2︯3︯a︯b︯c︯A︯B︯C︯ = CYRILLIC_TITLO_RIGHT_HALF

1᷎2᷎3᷎a᷎b᷎c᷎A᷎B᷎C᷎ = OGONEK_ABOVE

1͜2͜3͜a͜b͜c͜A͜B͜C͜ = DOUBLE_BREVE_BELOW

1⃐2⃐3⃐a⃐b⃐c⃐A⃐B⃐C⃐ = LEFT_HARPOON_ABOVE

1᷂2᷂3᷂a᷂b᷂c᷂A᷂B᷂C᷂ = SNAKE_BELOW

1̩2̩3̩a̩b̩c̩A̩B̩C̩ = VERTICAL_LINE_BELOW [ |below ]

1̆2̆3̆ăb̆c̆ĂB̆C̆ = BREVE

1᪸2᪸3᪸a᪸b᪸c᪸A᪸B᪸C᪸ = DOUBLE_OPEN_MARK_BELOW

1︮2︮3︮a︮b︮c︮A︮B︮C︮ = CYRILLIC_TITLO_LEFT_HALF

1⃙2⃙3⃙a⃙b⃙c⃙A⃙B⃙C⃙ = CLOCKWISE_RING_OVERLAY

1⃗2⃗3⃗a⃗b⃗c⃗A⃗B⃗C⃗ = RIGHT_ARROW_ABOVE [ ->above ]

1̦2̦3̦a̦b̦c̦A̦B̦C̦ = COMMA_BELOW

1ᷭ2ᷭ3ᷭaᷭbᷭcᷭAᷭBᷭCᷭ = LATIN_SMALL_LETTER_O_WITH_LIGHT_CENTRALIZATION_STROKE

1⃛2⃛3⃛a⃛b⃛c⃛A⃛B⃛C⃛ = THREE_DOTS_ABOVE [ ...above ]

1͉2͉3͉a͉b͉c͉A͉B͉C͉ = LEFT_ANGLE_BELOW

1̡2̡3̡a̡b̡c̡A̡B̡C̡ = PALATIZED_HOOK_BELOW

1̹2̹3̹a̹b̹c̹A̹B̹C̹ = RIGHT_HALF_RING_BELOW

1᪾2᪾3᪾a᪾b᪾c᪾A᪾B᪾C᪾ = PARENTHESES_OVERLAY [ ()center ]

1᪲2᪲3᪲a᪲b᪲c᪲A᪲B᪲C᪲ = INFINITY

1̑2̑3̑ȃb̑c̑ȂB̑C̑ = INVERTED_BREVE

1︥2︥3︥a︥b︥c︥A︥B︥C︥ = MACRON_RIGHT_HALF

1͠2͠3͠a͠b͠c͠A͠B͠C͠ = DOUBLE_TILDE

1ᷳ2ᷳ3ᷳaᷳbᷳcᷳAᷳBᷳCᷳ = LATIN_SMALL_LETTER_O_WITH_DIAERESIS

1᷇2᷇3᷇a᷇b᷇c᷇A᷇B᷇C᷇ = MACRON_GRAVE

1ᷬ2ᷬ3ᷬaᷬbᷬcᷬAᷬBᷬCᷬ = LATIN_SMALL_LETTER_L_WITH_DOUBLE_MIDDLE_TILDE

1̢2̢3̢a̢b̢c̢A̢B̢C̢ = RETROFLEX_HOOK_BELOW

1⃣2⃣3⃣a⃣b⃣c⃣A⃣B⃣C⃣ = ENCLOSING_KEYCAP [ keycap ]

1̏2̏3̏ȁb̏c̏ȀB̏C̏ = DOUBLE_GRAVE_ACCENT

1͊2͊3͊a͊b͊c͊A͊B͊C͊ = NOT_TILDE_ABOVE

1⃡2⃡3⃡a⃡b⃡c⃡A⃡B⃡C⃡ = LEFT_RIGHT_ARROW_ABOVE [ <->above ]

1︠2︠3︠a︠b︠c︠A︠B︠C︠ = LIGATURE_LEFT_HALF

1᷃2᷃3᷃a᷃b᷃c᷃A᷃B᷃C᷃ = SUSPENSION_MARK

1̊2̊3̊åb̊c̊ÅB̊C̊ = RING_ABOVE [ ring-above ]

1̻2̻3̻a̻b̻c̻A̻B̻C̻ = SQUARE_BELOW

1̳2̳3̳a̳b̳c̳A̳B̳C̳ = DOUBLE_LOW_LINE [ --below ]

1͙2͙3͙a͙b͙c͙A͙B͙C͙ = ASTERISK_BELOW [ *below ]

1͈2͈3͈a͈b͈c͈A͈B͈C͈ = DOUBLE_VERTICAL_LINE_BELOW

1̶2̶3̶a̶b̶c̶A̶B̶C̶ = LONG_STROKE_OVERLAY [ -center ]

1͑2͑3͑a͑b͑c͑A͑B͑C͑ = LEFT_HALF_RING_ABOVE

1⃒2⃒3⃒a⃒b⃒c⃒A⃒B⃒C⃒ = LONG_VERTICAL_LINE_OVERLAY [ |center ]

1⃜2⃜3⃜a⃜b⃜c⃜A⃜B⃜C⃜ = FOUR_DOTS_ABOVE

1︪2︪3︪a︪b︪c︪A︪B︪C︪ = TILDE_RIGHT_HALF_BELOW

1̒2̒3̒a̒b̒c̒A̒B̒C̒ = TURNED_COMMA_ABOVE

1ᷴ2ᷴ3ᷴaᷴbᷴcᷴAᷴBᷴCᷴ = LATIN_SMALL_LETTER_U_WITH_DIAERESIS

1︦2︦3︦a︦b︦c︦A︦B︦C︦ = CONJOINING_MACRON

1́2́3́áb́ćÁB́Ć = ACUTE_TONE_MARK

1᷇2᷇3᷇a᷇b᷇c᷇A᷇B᷇C᷇ = ACUTE_MACRON

1̖2̖3̖a̖b̖c̖A̖B̖C̖ = GRAVE_ACCENT_BELOW

1⃚2⃚3⃚a⃚b⃚c⃚A⃚B⃚C⃚ = ANTICLOCKWISE_RING_OVERLAY

1⃔2⃔3⃔a⃔b⃔c⃔A⃔B⃔C⃔ = ANTICLOCKWISE_ARROW_ABOVE

1̟2̟3̟a̟b̟c̟A̟B̟C̟ = PLUS_SIGN_BELOW [ +below ]

1⃞2⃞3⃞a⃞b⃞c⃞A⃞B⃞C⃞ = ENCLOSING_SQUARE [ square ]

1ͨ2ͨ3ͨaͨbͨcͨAͨBͨCͨ = LATIN_SMALL_LETTER_C [ c ]

1᷆2᷆3᷆a᷆b᷆c᷆A᷆B᷆C᷆ = GRAVE_MACRON

1̔2̔3̔a̔b̔c̔A̔B̔C̔ = REVERSED_COMMA_ABOVE

1̍2̍3̍a̍b̍c̍A̍B̍C̍ = VERTICAL_LINE_ABOVE [ |above ]

1ͩ2ͩ3ͩaͩbͩcͩAͩBͩCͩ = LATIN_SMALL_LETTER_D [ d ]

1ᷪ2ᷪ3ᷪaᷪbᷪcᷪAᷪBᷪCᷪ = LATIN_SMALL_LETTER_SCHWA

1̝2̝3̝a̝b̝c̝A̝B̝C̝ = UP_TACK_BELOW

1⃫2⃫3⃫a⃫b⃫c⃫A⃫B⃫C⃫ = LONG_DOUBLE_SOLIDUS_OVERLAY [ //center ]

1̪2̪3̪a̪b̪c̪A̪B̪C̪ = BRIDGE_BELOW

1͋2͋3͋a͋b͋c͋A͋B͋C͋ = HOMOTHETIC_ABOVE

1̅2̅3̅a̅b̅c̅A̅B̅C̅ = OVERLINE

1︭2︭3︭a︭b︭c︭A︭B︭C︭ = CONJOINING_MACRON_BELOW

1⃮2⃮3⃮a⃮b⃮c⃮A⃮B⃮C⃮ = LEFT_ARROW_BELOW [ <-below ]

1͓2͓3͓a͓b͓c͓A͓B͓C͓ = X_BELOW [ xbelow ]

1᷈2᷈3᷈a᷈b᷈c᷈A᷈B᷈C᷈ = GRAVE_ACUTE_GRAVE

1̾2̾3̾a̾b̾c̾A̾B̾C̾ = VERTICAL_TILDE

1⃕2⃕3⃕a⃕b⃕c⃕A⃕B⃕C⃕ = CLOCKWISE_ARROW_ABOVE

1͛2͛3͛a͛b͛c͛A͛B͛C͛ = ZIGZAG_ABOVE [ zabove ]

1̃2̃3̃ãb̃c̃ÃB̃C̃ = TILDE [ ~above ]

1͟2͟3͟a͟b͟c͟A͟B͟C͟ = DOUBLE_MACRON_BELOW [ -below ]

1̈́2̈́3̈́ä́b̈́c̈́Ä́B̈́C̈́ = GREEK_DIALYTIKA_TONOS

1͔2͔3͔a͔b͔c͔A͔B͔C͔ = LEFT_ARROWHEAD_BELOW

1̀2̀3̀àb̀c̀ÀB̀C̀ = GRAVE_ACCENT

1̭2̭3̭a̭b̭c̭A̭B̭C̭ = CIRCUMFLEX_ACCENT_BELOW [ ^below ]

1᪽2᪽3᪽a᪽b᪽c᪽A᪽B᪽C᪽ = PARENTHESIS_BELOW [ ()below ]

1ᷘ2ᷘ3ᷘaᷘbᷘcᷘAᷘBᷘCᷘ = LATIN_SMALL_LETTER_INSULAR_D

1︡2︡3︡a︡b︡c︡A︡B︡C︡ = LIGATURE_RIGHT_HALF

1͞2͞3͞a͞b͞c͞A͞B͞C͞ = DOUBLE_MACRON [ -above ]

1͒2͒3͒a͒b͒c͒A͒B͒C͒ = FERMATA

1⃘2⃘3⃘a⃘b⃘c⃘A⃘B⃘C⃘ = RING_OVERLAY [ ring-center ]

1̯2̯3̯a̯b̯c̯A̯B̯C̯ = INVERTED_BREVE_BELOW

1͖2͖3͖a͖b͖c͖A͖B͖C͖ = RIGHT_ARROWHEAD_AND_UP_ARROWHEAD_BELOW

1͌2͌3͌a͌b͌c͌A͌B͌C͌ = ALMOST_EQUAL_TO_ABOVE

1᪱2᪱3᪱a᪱b᪱c᪱A᪱B᪱C᪱ = DIAERESIS_RING

1̇2̇3̇ȧḃċȦḂĊ = DOT_ABOVE [ .above ]

1͂2͂3͂a͂b͂c͂A͂B͂C͂ = GREEK_PERSIPOMENI

1͎2͎3͎a͎b͎c͎A͎B͎C͎ = UPWARDS_ARROW_BELOW [ ^|below ]

1ᷯ2ᷯ3ᷯaᷯbᷯcᷯAᷯBᷯCᷯ = LATIN_SMALL_LETTER_ESH

1ᷲ2ᷲ3ᷲaᷲbᷲcᷲAᷲBᷲCᷲ = LATIN_SMALL_LETTER_A_WITH_DIAERESIS

1̓2̓3̓a̓b̓c̓A̓B̓C̓ = GREEK_KORONIS

1⃟2⃟3⃟a⃟b⃟c⃟A⃟B⃟C⃟ = ENCLOSING_DIAMOND [ diamond ]

1⃯2⃯3⃯a⃯b⃯c⃯A⃯B⃯C⃯ = RIGHT_ARROW_BELOW [ ->below ]

1̺2̺3̺a̺b̺c̺A̺B̺C̺ = INVERTED_BRIDGE_BELOW

1⃤2⃤3⃤a⃤b⃤c⃤A⃤B⃤C⃤ = ENCLOSING_UPWARD_POINTING_TRIANGLE [ triangle ]

1ᷓ2ᷓ3ᷓaᷓbᷓcᷓAᷓBᷓCᷓ = LATIN_SMALL_LETTER_FLATTENED_OPEN_A_ABOVE

1͐2͐3͐a͐b͐c͐A͐B͐C͐ = RIGHT_ARROWHEAD_ABOVE

1̂2̂3̂âb̂ĉÂB̂Ĉ = CIRCUMFLEX [ ^above ]

1⃥2⃥3⃥a⃥b⃥c⃥A⃥B⃥C⃥ = REVERSE_SOLIDUS_OVERLAY [ \center ]

1͚2͚3͚a͚b͚c͚A͚B͚C͚ = DOUBLE_RING_BELOW

1̰2̰3̰a̰b̰c̰A̰B̰C̰ = TILDE_BELOW [ ~below ]

1͏2͏3͏a͏b͏c͏A͏B͏C͏ = GRAPHEME_JOINER
```
</p></details>
