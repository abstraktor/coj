
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