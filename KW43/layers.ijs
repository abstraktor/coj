cocurrent <'layers'
clear ''


layer =: 4 : 0
   NB. move all methods to Collection-z
   add_CollectionZ_ =: add_Collection_ f.
   remove_CollectionZ_ =: remove_Collection_ f.
   destroy_CollectionZ_ =: destroy_Collection_ f.
   
   'Collection' deleteOwn 'add'
   'Collection' deleteOwn 'remove'
   'Collection' deleteOwn 'destroy'
   
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
   
   
