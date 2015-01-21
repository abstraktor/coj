before_all=: 3 : 0
  load jpath '~user/projects/coj/utils.ijs'
)

test_copy_methods =: 3 : 0
  coerase 'LocaleA';'LocaleB'
  coclass 'LocaleA'
    name =: 'LocaleA'
    printA =: 3 : '''LocaleA'''
    printName =: 3 : 'name'
    setName   =: 3 : 'name =: y'

  coclass 'LocaleB'
    name =: 'LocaleB'
    printB =: 3 : '''LocaleB'''
  cocurrent <'base'

  assert 'LocaleA' -: printA_LocaleA_ ''
  assert 'LocaleB' -: printB_LocaleB_ ''

  NB. when
  (<'LocaleA') copy_methods_utils_ (<'LocaleB')

  NB. then it appeared in B
  assert 'LocaleA' -: printA_LocaleB_ ''
  NB. then printB is still present there
  assert 'LocaleB' -: printB_LocaleB_ ''
)


test_replaceFakeParen =: 3 : 0
  assert 'abcd)efg' -: replaceFakeParen_utils_ 'abcd).efg'
)

test_replaceFakeParenOfNoString =: 3 : 0
  assert '' -: replaceFakeParen_utils_ ''
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
  assert fp_multiRow_output -: replaceFakeParen_utils_ fp_multiRow_input
)