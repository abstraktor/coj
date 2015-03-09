
before_each =: 3 : 0
  cocurrent <'base' 
  clear ''
  load jpath '~user/projects/coj/utils.ijs'
  load jpath '~user/projects/coj/layer2.ijs'

  NB. define a Collection
  coclass 'Collection'
    create  =: 3 : 'items =: 0 $ 0'
    add     =: 3 : '# items =: (< y) , items'
    remove  =: 3 : '# items =: items -. < y'
    inspect =: 3 : 'items'
    destroy =: codestroy
   
  NB. build a collection
  cocurrent <'base'
    C1 =: 0 conew 'Collection'
    add__C1 'foo'
    add__C1 'bar'
    add__C1 37
    inspect__C1 0
    remove__C1 'bar'
    inspect__C1 0
)


test_lname =: 3 : 0
  assert ('Collection' lname_layer2_ 'Writeonly') -: <'CollectionLayerWriteonly'
)

test_lnameShape =: 3 : 0
  assert ($>('Collection' lname_layer2_ 'Writeonly')) -: ,24
)


load jpath '~user/projects/coj/layer2.ijs'
coinsert 'layer2'

NB. describe the writeonly layer
'Collection' lwhen 'Writeonly'
  add =: 3 : '# items'
  remove =: 3 : '# items'
  destroy =: 3 : '0'
)

'Collection' lwhen 'Writeable'
  add     =: 3 : '# items =: (< y) , items'
  remove  =: 3 : '# items =: items -. < y'
  destroy =: codestroy
)

test_lwhen_lwhenActivatedChanges =: 3 : 0
  assert ('add';'remove';'destroy')-: lwhenActivatedChanges_CollectionLayerWriteonly_
)

test_lwhen_collectionWriteonly =: 3 : 0
  cocurrent <'base'
  'Collection' lenable 'Writeable'
  assert 2 = #inspect__C1 ''
  add__C1 'bar'
  assert 3 = #inspect__C1 '' NB. modification
  
  'Collection' lenable 'Writeonly'
  add__C1 'bar'
  assert 3 = #inspect__C1 '' NB. no modification
)