
NB. Console user interface for Minesweeper game
NB. Should work in all J front ends.
NB. Viewing the Minefield using viewmat currently only works on J6


Note 'Example commands to run'
  fld=: MinesweeperCon ''
  fld=: MinesweeperCon 6 10     NB. 6 rows, 10 cols
)
MinesweeperCon_z_=: conew&'mineswpcon'


load jpath '~user/projects/coj/layer2.ijs'
require 'games/minesweeper/minefield'
coclass 'mineswpcon'
coinsert 'mineswp'
coinsert 'layer2'

NB. mit cop
'mineswpcon' lwhen 'J6'
  NB. use viewmat
  AddonPath=. jpath '~addons/games/minesweeper/'
  Tiles =: ,((2 2 $ #) <;._3 ]) readimg AddonPath,'tiles26.png'
  display =: monad define
    closeall_jviewmat_ :: ] ''
    ([: viewrgb@; ,.&.>/"1) y
    NB. proceed…
    display_mineswpconLayerZ_ ''
  ).
)

'mineswpcon' lwhen 'NotJ6'
  Tiles =: ' 12345678**.?'
  display =: monad define
    smoutput@< y
    display_mineswpconLayerZ_ ''
  ).
)

'mineswpcon' lwhen 'Z'
  display=: monad define
    empty''
  ).
)

'mineswpcon' lenable 'Z'
'mineswpcon' lenable 'NotJ6'

NB. Methods
NB. =========================================================


create=: 3 : 0
  smoutput Instructions
  mscon_startnew y
)
destroy=: codestroy
quit=: destroy


mscon_startnew=: mscon_update@newMinefield


mscon_update=: 3 : 0
  'isend msg'=. eval ''
  IsEnd=: isend
  smoutput msg
  display Tiles showField isend
  if. isend do.
    msg=. ('K'={.msg) {:: 'won';'lost'
    smoutput 'You ',msg,'! Try again?'
    destroy ''
  end.
  empty''
)


clear=: mscon_update@clearTiles@|.
mark=: mscon_update@markTiles@|.


NB. Text Nouns
NB. =========================================================


Instructions=: 0 : 0
=== MineSweeper ===
Object:
   Uncover (clear) all the tiles that are not mines.


How to play:
- the left, top tile is: 1 1
- clear an uncleared tile (.) using the command:
      clear__fld <row index> <column index>
- mark and uncleared tile (?) as a suspected mine using the command:
      mark__fld <row index> <column index>
- if you uncover a number, that is the number of mines adjacent
   to the tile
- if you uncover a mine (*) the game ends (you lose)
- if you uncover all tiles that are not mines the game ends (you win).
- quit a game before winning or losing using the command:
      quit__fld ''
- start a new game using the command:
      fld=: MinesweeperCon <num rows> <num columns>
)


NB. Auto-run UI
NB. =========================================================
cocurrent 'base'

fld=: MinesweeperCon ''
