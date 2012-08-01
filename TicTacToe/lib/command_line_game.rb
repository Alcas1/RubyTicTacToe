require_relative '../lib/check_for_win'
require_relative '../lib/output'
require_relative '../lib/game_logic'



game=GameLogic.new
winTester=CheckForWin.new
game.fullSetup
Output.welcome
game.fullSetup
game.setWhosFirst
Output.board game.board
Output.move
if game.first==1
  Output.whoFirst "Computer"
  game.computerMoveFirst
  Output.board game.board
  while game.turn<=9 && !game.winTester.checkForWin?(game.board,2)
    game.board[gets.to_i]=1
    game.turn+=1

    game.computerMoveFirst
    Output.board game.board
  end
  if game.turn==10&&!game.winTester.checkForWin?(game.board,2)
    Output.tie
  end
  if game.winTester.checkForWin?(game.board,2)
    Output.lose
  end

else
  Output.whoFirst "You"
  while game.turn<=9 && !game.winTester.checkForWin?(game.board,1)
    game.board[gets.to_i]=2
    game.turn+=1
    game.computerMoveSecond
    Output.board game.board
  end
  if game.turn==10&&!game.winTester.checkForWin?(game.board,1)
    Output.tie
  end
  if game.winTester.checkForWin?(game.board,1)
    Output.lose
  end

end
Output.board game.board






