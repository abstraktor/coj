before_all=: 3 : 0
  load jpath '~user/projects/coj/utils.ijs'
  coinsert 'utils'
)

test_copy_methods =: 3 : 0
  base =. coname''
  coerase 'LocaleA';'LocaleB'
  coclass 'LocaleA'
    name =: 'LocaleA'
    printA =: 3 : '''LocaleA'''
    printName =: 3 : 'name'
    setName   =: 3 : 'name =: y'

  coclass 'LocaleB'
    name =: 'LocaleB'
    printB =: 3 : '''LocaleB'''
  cocurrent base

  assert 'LocaleA' -: printA_LocaleA_ ''
  assert 'LocaleB' -: printB_LocaleB_ ''

  NB. when
  (<'LocaleA') copy_methods (<'LocaleB')

  NB. then it appeared in B
  assert 'LocaleA' -: printA_LocaleB_ ''
  NB. then printB is still present there
  assert 'LocaleB' -: printB_LocaleB_ ''
)

test_replaceFakeParen =: 3 : 0
  assert 'abcd)efg' -: replaceFakeParen 'abcd).efg'
)

test_replaceFakeParenOfNoString =: 3 : 0
  assert '' -: replaceFakeParen ''
)

fp_multiRow_input =: noun define
multiple
rows
  ).
no new line ).
no dot )
and no paren .
done
)

fp_multiRow_output =: noun define
multiple
rows
)
fp_multiRow_output =: fp_multiRow_output , '  )', (10{a.),'no new line )', noun define

no dot )
and no paren .
done
)


test_replaceFakeParenMultiRow =: 3 : 0
  assert fp_multiRow_output -: replaceFakeParen fp_multiRow_input
)


emn_input =: noun define
  NB. use viewmat
  AddonPath=. jpath '~addons/games/minesweeper/'
  Tiles =: ,((2 2 $ #) <;._3 ]) readimg AddonPath,'tiles26.png'
  display =: monad define
   hi''
  ).
)

emn_output =: 'Tiles';'display'

test_extractModifiedNames =: 3 : 0
  assert emn_output -: extractModifiedNames emn_input
)


test_fromLocale =: 3 : 0
  base =. coname''
  coerase 'LocaleA';'LocaleB'
  coclass 'LocaleA'
    name =: 'LocaleA'
    printA =: 3 : '''LocaleA'''
    printName =: 3 : 'name'
    setName   =: 3 : 'name =: y'

  coclass 'LocaleB'
    name =: 'LocaleB'
    printB =: 3 : '''LocaleB'''
  cocurrent base

  assert 'LocaleA' -: 'name' fromLocale 'LocaleA'
  assert 'LocaleB' -: 'name' fromLocale 'LocaleB'

  NB. fromLocale only works for nouns
  NB. assert 'LocaleA' -: ('printA' fromLocale 'LocaleA') ''
  NB. assert 'LocaleB' -: ('printB' fromLocale 'LocaleB') ''
)