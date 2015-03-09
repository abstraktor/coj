NB. define a Collection
coclass 'Collection'
   create  =: 3 : 'items =: 0 $ 0'
   add     =: 3 : '# items =: (< y) , items'
   remove  =: 3 : '# items =: items -. < y'
   inspect =: 3 : 'items'
   destroy =: codestroy
   
NB. tesing a collection
cocurrent 'base'
   C1 =: 0 conew 'Collection'
   add__C1 'foo'
   add__C1 37
   remove__C1 'foo'
   inspect__C1 0
   add__C1 <38
   inspect__C1 0
   
NB. define a Set
coclass 'Set'
   coinsert 'Collection'
   add =: 3 : '# items =: ~. (< y) , items'
   
NB. testing a Set
cocurrent 'base'
   s1 =: 0 conew 'Set'  NB. make new Set object.
   add__s1 'a'
   add__s1 'b'
   add__s1 'a'
   remove__s1 'b'
   inspect__s1 0        NB. should have just one 'a' 
   
NB. patch Set class to avoid using internal property _items_
add_Set_ =: 3 : 0
if. (< y) e. inspect 0
do.  0
else. add_Collection_ f. y
end.
)

NB. testing the patched Set
cocurrent 'base'
   inspect__s1 0
   add__s1     'a'
   add__s1     'z'
   inspect__s1 0        NB. should equal to 'z';'a'


NB. show me the 'lookup path'
copath > s1             NB. should equal to 'Set';'Collection';'z'


NB. modify the lookup path
('stat';'z') copath 'base'
copath 'base'           NB. should be equal to 'stat';'z'
