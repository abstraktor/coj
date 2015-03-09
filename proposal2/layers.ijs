cocurrent <'layers'
clear ''
ownProps =: 3 : ' nl__loc '''' [ loc =. <y'
bindTo =: 1 : 0
cocurrent y
".u
)
NB. 'Collection' hasOwnProp 'add'
hasOwnProp =: 4 : '+/ -. (<y) i. (ownProps x)'

delete =: 4 : 0
if. x hasOwnProp y do.
	4!:55 < (y,'_',x,'_')
end.
)

layer =: 4 : 0
   NB. move all methods to Collection-z
   add_CollectionZ_ =: add_Collection_ f.
   remove_CollectionZ_ =: remove_Collection_ f.
   destroy_CollectionZ_ =: destroy_Collection_ f.
   
   'Collection' delete 'add'
   'Collection' delete 'remove'
   'Collection' delete 'destroy'
   
   NB. 
   18!:4 <'CollectionWriteonly'
)

enable_layer =: 3 : 0
   ('Collection';'CollectionWriteonly';'CollectionZ';'z') copath C1
   ('CollectionWriteonly';'CollectionZ';'z') copath 'Collection'
)

disable_layer =: 3 : 0
   ('Collection';'CollectionZ';'z') copath C1
   ('CollectionZ';'z') copath 'Collection'
)

with_layer =: 3 : 0
   enable_layer >0}y
   NB. run the code
   ". >1}y
   NB. disable the layer again
   disable_layer >0}y
)

without_layer =: 3 : 0
   disable_layer >0}y
   NB. run the code
   ". >1}y
   enable_layer >0}y
)

('layers';'z') copath 'base'
cocurrent <'base'

NB. define a Collection
coclass 'Collection'
   create  =: 3 : 'items =: 0 $ 0'
   add     =: 3 : '# items =: (< y) , items'
   remove  =: 3 : '# items =: items -. < y'
   inspect =: 3 : 'items'
   destroy =: codestroy
   
NB. testing a collection
cocurrent 'base'
   C1 =: 0 conew 'Collection'
   add__C1 'foo'
   add__C1 37
   inspect__C1 0
   remove__C1 'foo'
   inspect__C1 0

NB. describe the writeonly layer
'Collection' layer 'writeonly'
   coname ''
   add =: 3 : '# items'
   remove =: 3 : '# items'
   destroy =: 3 : '0'

NB. tesing a layered collection
cocurrent 'base'
   disable_layer 'writeonly'
   inspect__C1 0
   enable_layer 'writeonly'
   add__C1 'bar' NB. no modification
   inspect__C1 0
   disable_layer 'writeonly'
   add__C1 'bar'
   inspect__C1 0


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
   enable_layer 'writeonly'

   NB. show add method from Collection
   add_Collection_

   NB. disable the 'writeonly' layer, i.e.
   NB. remove the CollectionWriteonly locale from lookup path
   disable_layer 'writeonly'

   NB. show add method from Collection
   add_Collection_
   
   
