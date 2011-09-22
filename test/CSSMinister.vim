" =============================================================================
" File:          CSSMinister.vim
" Author:        Luis Gonzalez
" Description:   Unit tests
" Last Modified: March 03, 2010
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

" Invalid values
TAssert IsEqual(ToRGB('#GGGGGG'), '')
TAssert IsEqual(ToRGB('hsl(690, -100%, -40%)'), '')
TAssert IsEqual(ToRGB('rgb(204, 102, 0)'), '')

" ToHSL Tests {{{1
TAssert IsEqual(ToHSL('rgb(204, 0, 102)'), 'hsl(330, 100%, 40%)') 
TAssert IsEqual(ToHSL('rgb(255, 0, 0)'), 'hsl(0, 100%, 50%)')
TAssert IsEqual(ToHSL('#CC0066'), 'hsl(330, 100%, 40%)')
TAssert IsEqual(ToHSL('#CCC'), 'hsl(0, 0%, 80%)')

" Invalid arguments for ToHSL
TAssert IsEqual(ToHSL('rgb(-204, 0, -102)'), '') 
TAssert IsEqual(ToHSL('#GGGGGG'), '')

" ToHSLA Tests {{{1
TAssert IsEqual(ToHSLA('hsl(104, 49%, 30%)'), 'hsla(104, 49%, 30%, 1)') 
TAssert IsEqual(ToHSLA('rgb(204, 0, 102)'), 'hsla(330, 100%, 40%, 1)') 
TAssert IsEqual(ToHSLA('rgb(255, 0, 0)'), 'hsla(0, 100%, 50%, 1)')
" TODO: add tests for rgba conversions
TAssert IsEqual(ToHSLA('#CC0066'), 'hsla(330, 100%, 40%, 1)')
TAssert IsEqual(ToHSLA('#CCC'), 'hsla(0, 0%, 80%, 1)')

" Invalid arguments for ToHSL
TAssert IsEqual(ToHSLA('rgb(-204, 0, -102)'), '') 
TAssert IsEqual(ToHSLA('#GGGGGG'), '')

" ToHex Tests {{{1
TAssert IsEqual(ToHex('rgb(204, 0, 102)'), '#CC0066')
TAssert IsEqual(ToHex('rgb(204, 204, 204)'), '#CCCCCC')
TAssert IsEqual(ToHex('hsl(330, 100%, 40%)'), '#CC0066')
TAssert IsEqual(ToHex('hsl(0, 100%, 50%)'), '#FF0000')
TAssert IsEqual(ToHex('red'), '#FF0000')
TAssert IsEqual(ToHex('black'), '#000000')
TAssert IsEqual(ToHex('aqua'), '#00FFFF')
TAssert IsEqual(ToHex('aquamarine'), '#7FFFD4')

" Invalid arguments for ToHex
TAssert IsEqual(ToHex('rgb(-204, 0, 102)'), '')
TAssert IsEqual(ToHex('rgb()'), '')
TAssert IsEqual(ToHex('emerald'), '')
TAssert IsEqual(ToHex('white-space'), '')
