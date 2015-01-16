
before_each =: 3 : 0
  cocurrent <'base' 
  clear ''
  load jpath '~user/projects/coj/utils.ijs'
  load jpath '~user/projects/coj/layer.ijs'

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

test_layer =: 3 : 0
  cocurrent <'base'
  assert (>@coname '') -: 'base'

  NB. when
  'Collection' layer 'Writeonly'
  
  NB. then
  assert 'CollectionWriteonly' -: (>@coname '')
  assert ('CollectionZ';,'z')  -: (copath 'Collection')
)

test_layer_empty_y =: 3 : 0
  cocurrent <'base'
  'Collection' layer ''
  assert 'Collection' -: (>@coname '')
)

test_enable_layer =: 3 : 0
  cocurrent <'base'
   assert 2 = #inspect__C1 ''

  NB. describe the writeonly layer
  'Collection' layer 'Writeonly'
    add =: 3 : '# items'
    remove =: 3 : '# items'
    destroy =: 3 : '0'

  NB. tesing a layered collection
  cocurrent 'base'
  
  disable_layer 'Writeonly'
  assert 2 = #inspect__C1 ''
  add__C1 'bar'
  assert 3 = #inspect__C1 '' NB. modification
  
  enable_layer 'Writeonly'
  add__C1 'bar'
  assert 3 = #inspect__C1 '' NB. no modification
)

xtest_others =: 3 : 0
NB. how does it work?
   NB. there is three locales involved:
   NB. - Collection contains non-layered members
   ownProps 'Collection'
   NB. - CollectionWriteonly contains the layered implementations
   ownProps 'CollectionWriteonly'
   NB. - CollectionZ contains the non-layered implementations
   ownProps 'CollectionZ'

   NB. the add method from CollectionWriteonly
   NB. only return the number of items
   add_CollectionWriteonly_
   
   NB. the add method from CollectionZ
   NB. adds the item and returns the number of items
   add_CollectionZ_
   
   NB. enable the 'writeonly' layer, i.e.
   NB. pluck the CollectionWriteonly locale into the lookup path
   enable_layer 'Writeonly'

   NB. show add method from Collection
   add_Collection_

   NB. disable the 'writeonly' layer, i.e.
   NB. remove the CollectionWriteonly locale from lookup path
   disable_layer 'Writeonly'

   NB. show add method from Collection
   add_Collection_

)