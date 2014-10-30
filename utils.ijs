cocurrent <'layer'

ownProps =: 3 : ' nl__loc '''' [ loc =. <y'

bindTo =: 1 : 0
  cocurrent y
  ".u
)

NB. 'Collection' hasOwnProp 'add'
hasOwnProp =: 4 : '+/ -. (<y) i. (ownProps x)'

deleteOwn =: 4 : 0
  if. x hasOwnProp y do.
    4!:55 < (y,'_',x,'_')
  end.
)

addOne =: 3 : '1+y'
