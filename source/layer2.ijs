require '~user/projects/coj/utils.ijs'

cocurrent <'layer2'
clear ''
coinsert 'utils'


NB. from http://swatouch.hpi.uni-potsdam.de/demo.html#workspaces/7
NB. select column
sc=:{"1
NB. select rows where
srw=: 4 : '((3 : x)"1 y)#y'
NB. cross product
cr =. 4 : ',/((,"1)&x)"1 y'


lcreate =: 3 : 0
  oldLocale =. coname''
  cocurrent <y
  coinsert 'layer2'
  cocurrent oldLocale
)

NB. builds the name of the locale where we save the callbacks
lname =: 3 : 0
  NB. monadic case falls back to current locale
  (>coname '') lname y
:
  
  < ([ lcreate) x,'Layer',y
)

NB. saves an activation callback for the layer _y_
lwhen =: 3 : 0
  NB. monadic case falls back to current locale
  (>coname '') lwhen y
:
  targetLocale =. x lname y
  lwhenActivatedTxt__targetLocale =: replaceFakeParen noun define
  lwhenActivatedChanges__targetLocale =: extractModifiedNames lwhenActivatedTxt__targetLocale 

  NB. initialize in the layer locale to allow proceeding by explicitly calling the layer
  x lenable__targetLocale y
)

lwhenActivated_z_ =: 3 :'0!:100 lwhenActivatedTxt'

NB. enables layer _y_ in layer _x_
lenable =: 3 : 0
  NB. monadic case falls back to current locale
  (>coname '') lenable y
:
  oldLocale =. coname''
  targetLocale =. x lname y
  if. (type 'lwhenActivatedTxt__targetLocale') -: <'not defined' do.
    smoutput 'error: lwhenActivatedTxt_', (>targetLocale),'_ is not defined'
    return.
  end.

  NB. apply callback to layer x
  cocurrent <x
  (0!:100) lwhenActivatedTxt__targetLocale
  cocurrent oldLocale
)

ldisable =: 3 : 0
  NB. monadic case falls back to current locale
  (>coname '') lenable y
:
  NB. TBD
  NB. lwhenActivatedChanges__targetLocale extractModifiers (x lname 'Z')
)

('layer2';'z') copath 'base'
cocurrent <'base'