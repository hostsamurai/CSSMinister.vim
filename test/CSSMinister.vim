" =============================================================================
" File:          CSSMinister.vim
" Author:        Luis Gonzalez
" Description:   Unit tests
" Last Modified: January 22, 2012
" =============================================================================

if !exists("loaded_tassert")
    echoerr 'tAssert (vimscript #1730) is required'
endif


" ToRGB Tests {{{1
TAssert IsEqual(ToRGB('#CC0066'), 'rgb(204, 0, 102)')
TAssert IsEqual(ToRGB('#CCC'), 'rgb(204, 204, 204)')
TAssert IsEqual(ToRGB('red'), 'rgb(255, 0, 0)')
TAssert IsEqual(ToRGB('black'), 'rgb(0, 0, 0)')
TAssert IsEqual(ToRGB('hsl(0, 0%, 0%)'), 'rgb(0, 0, 0)')
TAssert IsEqual(ToRGB('hsl(0, 0%, 100%)'), 'rgb(255, 255, 255)')
TAssert IsEqual(ToRGB('hsl(330, 100%, 40%)'), 'rgb(204, 0, 102)')
TAssert IsEqual(ToRGB('hsl(690, 100%, 40%)'), 'rgb(204, 0, 102)')
TAssert IsEqual(ToRGB('hsl(0, 100%, 50%)'), 'rgb(255, 0, 0)')
TAssert IsEqual(ToRGB('hsl(-330, 100%, 40%)'), 'rgb(204, 102, 0)')
TAssert IsEqual(ToRGB('hsl(030, 090%, 040%)'), 'rgb(155, 66, 8)')
TAssert IsEqual(ToRGB('hsl(003, 009%, 006%)'), 'rgb(16, 14, 13)')
TAssert IsEqual(ToRGB('rgba(204, 0, 102, 1)'), 'rgb(204, 102, 0)')
TAssert IsEqual(ToRGB('hsla(-330, 100%, 40%, 0.4)'), 'rgb(204, 102, 0)')
" Invalid values
TAssert IsEqual(ToRGB('#GGGGGG'), '')
TAssert IsEqual(ToRGB('hsl(690, -100%, -40%)'), '')
TAssert IsEqual(ToRGB('rgb(204, 102, 0)'), '')

" ToRGBA Tests {{{1
TAssert IsEqual(ToRGBA('#CC0066'),              'rgba(204, 0, 102, 1)')
TAssert IsEqual(ToRGBA('#CCC'),                 'rgba(204, 204, 204, 1)')
TAssert IsEqual(ToRGBA('red'),                  'rgba(255, 0, 0, 1)')
TAssert IsEqual(ToRGBA('black'),                'rgba(0, 0, 0, 1)')
TAssert IsEqual(ToRGBA('rgb(204, 0, 102)'),     'rgba(204, 0, 102, 1)')
TAssert IsEqual(ToRGBA('hsl(690, 100%, 40%)'),  'rgba(204, 0, 102, 1)')
TAssert IsEqual(ToRGBA('hsl(-330, 100%, 40%)'), 'rgba(204, 102, 0, 1)')
TAssert IsEqual(ToRGBA('hsl(030, 090%, 040%)'), 'rgba(155, 66, 8, 1)')
TAssert IsEqual(ToRGBA('hsl(003, 009%, 006%)'), 'rgba(16, 14, 13, 1)')
TAssert IsEqual(ToRGBA('hsla(-330, 100%, 40%, 0.4)'), 'rgba(204, 102, 0, 0.4)')
TAssert IsEqual(ToRGBA('hsla(323, 90%, 49%, 0.7)'), 'rgba(237, 12, 151, 0.7)')
TAssert IsEqual(ToRGBA('hsla(003, 009%, 006%, 0.9)'), 'rgba(16, 14, 13, 0.9)')

" ToHSL Tests {{{1
TAssert IsEqual(ToHSL('rgb(204, 0, 102)'), 'hsl(330, 100%, 40%)')
TAssert IsEqual(ToHSL('rgb(255, 0, 0)'), 'hsl(0, 100%, 50%)')
TAssert IsEqual(ToHSL('rgb(255, 099, 066)'), 'hsl(10, 100%, 63%)')
TAssert IsEqual(ToHSL('#CC0066'), 'hsl(330, 100%, 40%)')
TAssert IsEqual(ToHSL('#CCC'), 'hsl(0, 0%, 80%)')
TAssert IsEqual(ToHSL('red'), 'hsl(0, 100%, 50%)')
TAssert IsEqual(ToHSL('hsla(0, 0%, 80%, 0.7)'), 'hsl(0, 0%, 80%)')
" Invalid arguments for ToHSL
TAssert IsEqual(ToHSL('rgb(-204, 0, -102)'), '')
TAssert IsEqual(ToHSL('#GGGGGG'), '')

" ToHSLA Tests {{{1
TAssert IsEqual(ToHSLA('hsl(104, 49%, 30%)'), 'hsla(104, 49%, 30%, 1)')
TAssert IsEqual(ToHSLA('#CC0066'), 'hsla(330, 100%, 40%, 1)')
TAssert IsEqual(ToHSLA('#CCC'), 'hsla(0, 0%, 80%, 1)')
TAssert IsEqual(ToHSLA('red'), 'hsla(0, 100%, 50%, 1)')
TAssert IsEqual(ToHSLA('rgb(204, 0, 102)'), 'hsla(330, 100%, 40%, 1)')
TAssert IsEqual(ToHSLA('rgb(255, 0, 0)'), 'hsla(0, 100%, 50%, 1)')
TAssert IsEqual(ToHSLA('rgb(255, 099, 066)'), 'hsl(10, 100%, 63%, 1)')
TAssert IsEqual(ToHSLA('rgba(204, 102, 0, 0.4)'), 'hsla(30, 100%, 40%, 0.4)')
TAssert IsEqual(ToHSLA('rgba(237, 12, 151, 0.7)'), 'hsla(323, 90%, 49%, 0.7)')
TAssert IsEqual(ToHSLA('rgba(255, 099, 066, 0.1)'), 'hsla(10, 100%, 63%, 0.1)')
" Invalid arguments for ToHSLA
TAssert IsEqual(ToHSLA('rgb(-204, 0, -102)'), '')
TAssert IsEqual(ToHSLA('#GGGGGG'), '')

" ToHex Tests {{{1
TAssert IsEqual(ToHex('rgb(204, 0, 102)'), '#CC0066')
TAssert IsEqual(ToHex('rgb(204, 204, 204)'), '#CCCCCC')
TAssert IsEqual(ToHex('rgba(204, 204, 204, 1)'), '#CCCCCC')
TAssert IsEqual(ToHex('hsl(330, 100%, 40%)'), '#CC0066')
TAssert IsEqual(ToHex('hsl(0, 100%, 50%)'), '#FF0000')
TAssert IsEqual(ToHex('hsla(0, 100%, 50%, 1)'), '#FF0000')
TAssert IsEqual(ToHex('red'), '#FF0000')
TAssert IsEqual(ToHex('black'), '#000000')
TAssert IsEqual(ToHex('aqua'), '#00FFFF')
TAssert IsEqual(ToHex('aquamarine'), '#7FFFD4')
" Invalid arguments for ToHex
TAssert IsEqual(ToHex('rgb(-204, 0, 102)'), '')
TAssert IsEqual(ToHex('rgb()'), '')
TAssert IsEqual(ToHex('emerald'), '')
TAssert IsEqual(ToHex('white-space'), '')
