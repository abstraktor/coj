
before_each =: 3 : 0
   require '/users/reflektor/j64-802-user/projects/coj/jdb/northwind.ijs'
   require '/users/reflektor/j64-802-user/projects/coj/cojdb.ijs'
   db_init DBPATH
)

test_withTransactions =: 3 :
   Reads__D with('Transactions') 'from Products where UnitPrice<10'
)