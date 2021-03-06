
before_each =: 3 : 0

  readimg_z_ =: 3 :'(1 2) $ y' NB. readimg polyfill

  load jpath '~user/projects/coj/layer2.ijs'
  load jpath '~user/projects/coj/minesweeper/3_uiconsole.ijs'

  NB. suppress output
NB.  smoutput_mineswpcon_ =: 3 : '0 0$y'

  coinsert <'layer2'
)

test_J6_Tiles =: 3 : 0
  NB. given

  NB. when
  'mineswpcon' lenable 'J6'

  NB. then
  assert (#Tiles_mineswpcon_) -: 2
)

test_NoJ6_Tiles =: 3 : 0
  NB. given

  NB. when
  'mineswpcon' lenable 'NotJ6'

  NB. then
  assert (#Tiles_mineswpcon_) -: 13
  assert Tiles_mineswpcon_ -: ' 12345678**.?'
)