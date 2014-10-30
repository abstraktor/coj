before_all=: 3 : 0
  require '/users/reflektor/j64-802-user/projects/coj/utils.ijs'
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
  (<'LocaleA') copy_methods_layer_ (<'LocaleB')

  NB. then it appeared in B
  assert 'LocaleA' -: printA_LocaleB_ ''
  NB. then printB is still present there
  assert 'LocaleB' -: printB_LocaleB_ ''
)