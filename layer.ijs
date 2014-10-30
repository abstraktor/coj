cocurrent <'layer'
clear ''


enable_layer =: 3 : 0
   ('Collection';'CollectionWriteonly';'CollectionZ';'z') copath C1
   ('CollectionWriteonly';'CollectionZ';'z') copath 'Collection'
)

disable_layer =: 3 : 0
   ('Collection';'CollectionZ';'z') copath C1
   ('CollectionZ';'z') copath 'Collection'
)

layer =: 4 : 0
   klass =. <x
   layer =. <y
   newLocale =. <x,y

   NB. copy all methods to Collection-z
   klass copy_methods (< x,'Z')
   
   'Collection' deleteOwn 'add'
   'Collection' deleteOwn 'remove'
   'Collection' deleteOwn 'destroy'
   
   NB. create layer
   18!:4 <'CollectionWriteonly'
   disable_layer_layer_ 'CollectionWriteonly'
   NB. make layer current
   18!:4 <'CollectionWriteonly'
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

('layer';'z') copath 'base'
cocurrent <'base'