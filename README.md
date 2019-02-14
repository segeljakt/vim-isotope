# vim-isotope

![Isotope](https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/204_Isotopes_of_Hydrogen-01.jpg/800px-204_Isotopes_of_Hydrogen-01.jpg)


This plugin provides mappings which convert typed characters into `ˢᵘᵖᵉʳˢᶜʳⁱᵖᵗˢ` and `ₛᵤbₛ꜀ᵣᵢₚₜₛ`.


# Default mappings

```vim
" Convert the next character that is typed to a superscript/subscript 
imap <C-g><C-k> <Plug>Isotope(InsertSuperscript)
imap <C-g><C-j> <Plug>Isotope(InsertSubscript)

" While toggled on, convert all characters that are typed to superscripts/subscripts
imap <C-g><C-g><C-k> <Plug>Isotope(ToggleSuperscript)
imap <C-g><C-g><C-j> <Plug>Isotope(ToggleSubscript)
```

# Supported conversions

Note that unicode does not offer superscript and subscript variants for all characters. Below is a list of the supported conversions. Missing characters are marked as `█`.

```
Digits       Lowercase    Capital      Symbols
------       ---------    -------      -------
0 => ⁰/₀     a => ᵃ/ₐ     A => ᴬ/█     + => ⁺/₊
1 => ¹/₁     b => ᵇ/█     B => ᴮ/█     - => ⁻/₋
2 => ²/₂     c => ᶜ/꜀     C => █/█     = => ⁼/₌
3 => ³/₃     d => ᵈ/█     D => ᴰ/█     ( => ⁽/₍
4 => ⁴/₄     e => ᵉ/ₑ     E => ᴱ/█     ) => ⁾/₎
5 => ⁵/₅     f => ᶠ/█     F => █/█
6 => ⁶/₆     g => ᵍ/█     G => ᴳ/█
7 => ⁷/₇     h => ʰ/ₕ     H => ᴴ/█
8 => ⁸/₈     i => ⁱ/ᵢ     I => ᴵ/█
9 => ⁹/₉     j => ʲ/ⱼ     J => ᴶ/█
             k => ᵏ/ₖ     K => ᴷ/█
             l => ˡ/ₗ     L => ᴸ/█
             m => ᵐ/ₘ     M => ᴹ/█
             n => ⁿ/ₙ     N => ᴺ/█
             o => ᵒ/ₒ     O => ᴼ/█
             p => ᵖ/ₚ     P => ᴾ/█
             q => █/█     Q => █/█
             r => ʳ/ᵣ     R => ᴿ/█
             s => ˢ/ₛ     S => █/█
             t => ᵗ/ₜ     T => ᵀ/█
             u => ᵘ/ᵤ     U => ᵁ/█
             v => ᵛ/ᵥ     V => ⱽ/█
             w => ʷ/█     W => ᵂ/█
             x => ˣ/ₓ     X => █/█
             y => ʸ/█     Y => █/█
             z => ᶻ/█     Z => █/█
```
