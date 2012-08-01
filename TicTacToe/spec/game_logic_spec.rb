require "rspec"
require 'game_logic'


describe GameLogic do
  it "Sets up turns" do
    newGame=GameLogic.new
    newGame.setupTurns
    newGame.turn.should==1
  end
  it "sets moved to false" do
    newGame=GameLogic.new
    newGame.setupMoved
    newGame.moved.should==false
  end
  it "Sets move options" do
    newGame=GameLogic.new
    newGame.setupMoveOptions
    newGame.moveOptions.should==0
  end
  it "Creates new game board" do
    newGame=GameLogic.new
    newGame.createNewGameBoard
    newGame.board.should==[0,0,0,0,0,0,0,0,0]
  end
  it "Makes a move on turn 2" do
    newGame=GameLogic.new
    newGame.setupWinTester
    newGame.createNewGameBoard
    newGame.setupTurns
    newGame.board=[0,0,0,2,0,0,0,0,0]
    newGame.turn=2
    newGame.computerMoveSecond
    newGame.board.should==[0,0,0,2,1,0,0,0,0]
  end
  it "Makes 0 move on turn 4" do
    newGame=GameLogic.new
    newGame.fullSetup
    newGame.moveOptions=0
    newGame.board=[0,0,2,2,1,0,0,0,0]
    newGame.turn=4
    newGame.computerMoveSecond
    newGame.board.should==[1,0,2,2,1,0,0,0,0]
  end
  it "Makes 1 move on turn 4" do
    newGame=GameLogic.new
    newGame.fullSetup
    newGame.moveOptions=0
    newGame.board=[0,0,2,0,1,0,2,0,0]
    newGame.turn=4
    newGame.computerMoveSecond
    newGame.board.should==[0,1,2,0,1,0,2,0,0]
  end
  it "Makes 6 move on turn 4" do
    newGame=GameLogic.new
    newGame.fullSetup
    newGame.moveOptions=0
    newGame.board=[0,0,0,2,1,0,0,0,2]
    newGame.turn=4
    newGame.computerMoveSecond
    newGame.board.should==[0,0,0,2,1,0,1,0,2]
  end
  it "Defends Against the 3,2, fork on turn 4 " do
    newGame=GameLogic.new
    newGame.fullSetup
    newGame.moveOptions=0
    newGame.board=[0,0,2,2,1,0,0,0,0]
    newGame.turn=4
    newGame.forkTestComputerSecond(3,2,0)
    newGame.board.should==[1,0,2,2,1,0,0,0,0]
  end
  it "takes spot 5" do
    newGame=GameLogic.new
    newGame.fullSetup
    newGame.moveOptions=0
    newGame.board=[0,0,0,2,0,0,0,0,0]
    newGame.turn=2
    newGame.takeSpot(8,1)
    newGame.board.should==[0,0,0,2,0,0,0,0,1]
  end
  it "Tests top left move" do
    newGame=GameLogic.new
    newGame.fullSetup
    newGame.moveOptions=1
    newGame.board=[1,0,0,0,2,0,0,0,2]
    newGame.turn=4
    newGame.topLeftMoveTest1
    newGame.board.should==[1,0,1,0,2,0,0,0,2]
  end
  it "Tests top right move" do
    newGame=GameLogic.new
    newGame.fullSetup
    newGame.moveOptions=2
    newGame.board=[0,0,1,0,2,0,2,0,0]
    newGame.turn=4
    newGame.topRightMoveTest2
    newGame.board.should==[1,0,1,0,2,0,2,0,0]
  end
  it "Tests bottom left move" do
    newGame=GameLogic.new
    newGame.fullSetup
    newGame.moveOptions=3
    newGame.board=[0,0,2,0,2,0,1,0,0]
    newGame.turn=4
    newGame.bottomLeftMoveTest3
    newGame.board.should==[0,0,2,0,2,0,1,0,1]
  end
  it "Tests bottom right move" do
    newGame=GameLogic.new
    newGame.fullSetup
    newGame.moveOptions=4
    newGame.board=[2,0,0,0,2,0,0,0,1]
    newGame.turn=4
    newGame.bottomRightMoveTest4
    newGame.board.should==[2,0,0,0,2,0,1,0,1]
  end
  it "Asks if center move is not taken" do
    newGame=GameLogic.new
    newGame.fullSetup
    newGame.moveOptions=0
    newGame.board=[0,0,0,0,2,0,0,0,1]
    newGame.turn=4
    newGame.centerMoveNotTaken?.should==false
  end
  it "Fills in a space" do
    newGame=GameLogic.new
    newGame.fullSetup
    newGame.moveOptions=0
    newGame.board=[0,0,0,2,2,0,0,0,1]
    newGame.turn=4
    newGame.fillInASpace 1
    newGame.board.should==[1,0,0,2,2,0,0,0,1]
  end
  it "Fills in a space on turn 6" do
    newGame=GameLogic.new
    newGame.fullSetup
    newGame.moveOptions=0
    newGame.board=[2,0,0,1,1,2,2,0,0]
    newGame.turn=6
    newGame.fillInASpace 1
    newGame.board.should==[2,1,0,1,1,2,2,0,0]
  end
  it "Defends against winning move" do
    newGame=GameLogic.new
    newGame.fullSetup
    newGame.board=[1,0,0,0,2,2,0,0,0]
    newGame.turn=4
    newGame.testForDefendingMoves
    newGame.board.should==[1,0,0,1,2,2,0,0,0]
  end
  it "Defends against winning move" do
    newGame=GameLogic.new
    newGame.fullSetup
    newGame.board=[1,0,2,0,2,0,0,0,0]
    newGame.turn=4
    newGame.testForDefendingMoves
    newGame.board.should==[1,0,2,0,2,0,1,0,0]
  end
  it "Wins when possible" do
    newGame=GameLogic.new
    newGame.fullSetup
    newGame.board=[2,2,0,1,1,0,0,0,2]
    newGame.turn=6
    newGame.testForWinningMovesComputerSecond
    newGame.board.should==[2,2,0,1,1,1,0,0,2]
  end
  it "Takes winning move on turn 6" do
    newGame=GameLogic.new
    newGame.fullSetup
    newGame.board=[2,2,1,0,1,0,0,0,2]
    newGame.turn=6
    newGame.testForWinningMovesComputerSecond
    newGame.board.should==[2,2,1,0,1,0,1,0,2]
  end
  it "Takes winning move on turn 8" do
    newGame=GameLogic.new
    newGame.fullSetup
    newGame.board=[2,1,2,1,1,2,2,0,0]
    newGame.turn=8
    newGame.testForWinningMovesComputerSecond
    newGame.board.should==[2,1,2,1,1,2,2,1,0]
  end
  it "Takes corner turn 3" do
    newGame=GameLogic.new
    newGame.fullSetup
    newGame.board=[1,0,0,0,2,0,0,0,0]
    newGame.turn=3
    newGame.testCorners 0,8,0
    newGame.board.should==[1,0,0,0,2,0,0,0,2]
  end
  it "Makes 1 move turn 5" do
    newGame=GameLogic.new
    newGame.fullSetup
    newGame.moveOptions=1
    newGame.board=[1,0,1,0,2,0,2,0,0]
    newGame.turn=5
    newGame.turn5
    newGame.board.should==[1,2,1,0,2,0,2,0,0]
  end
  it "Makes 8 move turn 5" do
    newGame=GameLogic.new
    newGame.fullSetup
    newGame.moveOptions=1
    newGame.board=[0,0,1,1,2,0,2,0,0]
    newGame.turn=5
    newGame.turn5
    newGame.board.should==[0,0,1,1,2,0,2,0,2]
  end
  it "Fills a space on turn 9" do
    newGame=GameLogic.new
    newGame.fullSetup
    newGame.board=[1,2,1,1,2,1,2,2,0]
    newGame.turn=9
    newGame.turn9
    newGame.board.should==[1,2,1,1,2,1,2,2,2]
  end
  it "Fills a space on turn 9" do
    newGame=GameLogic.new
    newGame.fullSetup
    newGame.board=[0,2,1,2,2,1,2,2,1]
    newGame.turn=9
    newGame.turn9
    newGame.board.should==[2,2,1,2,2,1,2,2,1]
  end
  it "Takes 6 on turn 7" do
    newGame=GameLogic.new
    newGame.fullSetup
    newGame.moveOptions=4
    newGame.moveOptions2=21
    newGame.turn=7
    newGame.testOptionSet4Section1
    newGame.board[1].should==2
  end

end