" =============================================================================
" File:          CSSMinister.vim
" Author:        Luis Gonzalez
" Description:   Unit tests
" Last Modified: February 04, 2012
" =============================================================================

if !exists("loaded_tassert")
    echoerr 'tAssert (vimscript #1730) is required'
endif


" ToRGB Tests {{{1
TAssert IsEqual(ToRGB('#CC0066', 'Hex'), 'rgb(204, 0, 102)')
TAssert IsEqual(ToRGB('#CCC', 'Hex'), 'rgb(204, 204, 204)')
TAssert IsEqual(ToRGB('red', 'Keyword'), 'rgb(255, 0, 0)')
TAssert IsEqual(ToRGB('black', 'Keyword'), 'rgb(0, 0, 0)')
TAssert IsEqual(ToRGB('hsl(0, 0%, 0%)', 'HSL'), 'rgb(0, 0, 0)')
TAssert IsEqual(ToRGB('hsl(0, 0%, 100%)', 'HSL'), 'rgb(255, 255, 255)')
TAssert IsEqual(ToRGB('hsl(330, 100%, 40%)', 'HSL'), 'rgb(204, 0, 102)')
TAssert IsEqual(ToRGB('hsl(690, 100%, 40%)', 'HSL'), 'rgb(204, 0, 102)')
TAssert IsEqual(ToRGB('hsl(0, 100%, 50%)', 'HSL'), 'rgb(255, 0, 0)')
TAssert IsEqual(ToRGB('hsl(-330, 100%, 40%)', 'HSL'), 'rgb(204, 102, 0)')
TAssert IsEqual(ToRGB('hsl(030, 090%, 040%)', 'HSL'), 'rgb(155, 66, 8)')
TAssert IsEqual(ToRGB('hsl(003, 009%, 006%)', 'HSL'), 'rgb(16, 14, 13)')
TAssert IsEqual(ToRGB('rgba(204, 0, 102, 1)', 'RGBA'), 'rgb(204, 102, 0)')
TAssert IsEqual(ToRGB('hsla(-330, 100%, 40%, 0.4)', 'HSLA'), 'rgb(204, 102, 0)')
" Invalid values
TAssert IsEqual(ToRGB('#GGGGGG', 'Hex'), '')
TAssert IsEqual(ToRGB('hsl(690, -100%, -40%)', 'HSL'), '')
TAssert IsEqual(ToRGB('rgb(204, 102, 0)', 'RGB'), '')

" ToRGBA Tests {{{1
TAssert IsEqual(ToRGBA('#CC0066', 'Hex'), 'rgba(204, 0, 102, 1)')
TAssert IsEqual(ToRGBA('#CCC', 'Hex'), 'rgba(204, 204, 204, 1)')
TAssert IsEqual(ToRGBA('red', 'Keyword'), 'rgba(255, 0, 0, 1)')
TAssert IsEqual(ToRGBA('black', 'Keyword'), 'rgba(0, 0, 0, 1)')
TAssert IsEqual(ToRGBA('rgb(204, 0, 102)', 'RGB'), 'rgba(204, 0, 102, 1)')
TAssert IsEqual(ToRGBA('hsl(690, 100%, 40%)', 'HSL'), 'rgba(204, 0, 102, 1)')
TAssert IsEqual(ToRGBA('hsl(-330, 100%, 40%)', 'HSL'), 'rgba(204, 102, 0, 1)')
TAssert IsEqual(ToRGBA('hsl(030, 090%, 040%)', 'HSL'), 'rgba(155, 66, 8, 1)')
TAssert IsEqual(ToRGBA('hsl(003, 009%, 006%)', 'HSL'), 'rgba(16, 14, 13, 1)')
TAssert IsEqual(ToRGBA('hsla(-330, 100%, 40%, 0.4)', 'HSLA'), 'rgba(204, 102, 0, 0.4)')
TAssert IsEqual(ToRGBA('hsla(323, 90%, 49%, 0.7)', 'HSLA'), 'rgba(237, 12, 151, 0.7)')
TAssert IsEqual(ToRGBA('hsla(003, 009%, 006%, 0.9)', 'HSLA'), 'rgba(16, 14, 13, 0.9)')

" ToHSL Tests {{{1
TAssert IsEqual(ToHSL('rgb(204, 0, 102)', 'RGB'), 'hsl(330, 100%, 40%)')
TAssert IsEqual(ToHSL('rgb(255, 0, 0)', 'RGB'), 'hsl(0, 100%, 50%)')
TAssert IsEqual(ToHSL('rgb(255, 099, 066)', 'RGB'), 'hsl(10, 100%, 63%)')
TAssert IsEqual(ToHSL('#CC0066', 'Hex'), 'hsl(330, 100%, 40%)')
TAssert IsEqual(ToHSL('#CCC', 'Hex'), 'hsl(0, 0%, 80%)')
TAssert IsEqual(ToHSL('red', 'Keyword'), 'hsl(0, 100%, 50%)')
TAssert IsEqual(ToHSL('hsla(0, 0%, 80%, 0.7)', 'HSLA'), 'hsl(0, 0%, 80%)')
" Invalid arguments for ToHSL
TAssert IsEqual(ToHSL('rgb(-204, 0, -102)', 'RGB'), '')
TAssert IsEqual(ToHSL('#GGGGGG', 'Hex'), '')

" ToHSLA Tests {{{1
TAssert IsEqual(ToHSLA('hsl(104, 49%, 30%)', 'HSL'), 'hsla(104, 49%, 30%, 1)')
TAssert IsEqual(ToHSLA('#CC0066', 'Hex'), 'hsla(330, 100%, 40%, 1)')
TAssert IsEqual(ToHSLA('#CCC', 'Hex'), 'hsla(0, 0%, 80%, 1)')
TAssert IsEqual(ToHSLA('red', 'Keyword'), 'hsla(0, 100%, 50%, 1)')
TAssert IsEqual(ToHSLA('rgb(204, 0, 102)', 'RGB'), 'hsla(330, 100%, 40%, 1)')
TAssert IsEqual(ToHSLA('rgb(255, 0, 0)', 'RGB'), 'hsla(0, 100%, 50%, 1)')
TAssert IsEqual(ToHSLA('rgb(255, 099, 066)', 'RGB'), 'hsl(10, 100%, 63%, 1)')
TAssert IsEqual(ToHSLA('rgba(204, 102, 0, 0.4)', 'RGBA'), 'hsla(30, 100%, 40%, 0.4)')
TAssert IsEqual(ToHSLA('rgba(237, 12, 151, 0.7)', 'RGBA'), 'hsla(323, 90%, 49%, 0.7)')
TAssert IsEqual(ToHSLA('rgba(255, 099, 066, 0.1)', 'RGBA'), 'hsla(10, 100%, 63%, 0.1)')
" Invalid arguments for ToHSLA
TAssert IsEqual(ToHSLA('rgb(-204, 0, -102)', 'RGB'), '')
TAssert IsEqual(ToHSLA('#GGGGGG', 'Hex'), '')

" ToHex Tests {{{1
TAssert IsEqual(ToHex('rgb(204, 0, 102)', 'RGB'), '#CC0066')
TAssert IsEqual(ToHex('rgb(204, 204, 204)', 'RGB'), '#CCCCCC')
TAssert IsEqual(ToHex('rgba(204, 204, 204, 1)', 'RGBA'), '#CCCCCC')
TAssert IsEqual(ToHex('hsl(330, 100%, 40%)', 'HSL'), '#CC0066')
TAssert IsEqual(ToHex('hsl(0, 100%, 50%)', 'HSL'), '#FF0000')
TAssert IsEqual(ToHex('hsla(0, 100%, 50%, 1)', 'HSLA'), '#FF0000')
TAssert IsEqual(ToHex('red', 'Keyword'), '#FF0000')
TAssert IsEqual(ToHex('black', 'Keyword'), '#000000')
TAssert IsEqual(ToHex('aqua', 'Keyword'), '#00FFFF')
TAssert IsEqual(ToHex('aquamarine', 'Keyword'), '#7FFFD4')
" Invalid arguments for ToHex
TAssert IsEqual(ToHex('rgb(-204, 0, 102)', 'RGB'), '')
TAssert IsEqual(ToHex('rgb()', 'RGB'), '')
TAssert IsEqual(ToHex('emerald', 'Keyword'), '')
TAssert IsEqual(ToHex('white-space', 'Keyword'), '')
