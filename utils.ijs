cocurrent <'utils'

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

copy_methods =: 4 : 0
  methods =. nl__x ''
  for_method. methods do.
    oldName =. (>method),'_',(>x),'_'
    newName =. (>method),'_',(>y),'_'
    cocurrent x
    sentence =. newName,' =: ',oldName
    if. 0 < 4!:0 (<oldName) do.
      sentence =. sentence,' f.'
    end.
    ". sentence
  end.
)

NB. replaces ). in the given noun by )
replaceFakeParen =: ] #~ (1&,@:-.@:(2 ').'&-: \ ]))`(]&'')@.((,0) -: $)

