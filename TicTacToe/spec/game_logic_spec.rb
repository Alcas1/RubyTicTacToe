require "rspec"
require 'game_logic'


describe GameLogic do
  it "Makes a move on turn 2" do
    newGame=GameLogic.new
    newGame.computerMoveSecond([0,0,0,2,0,0,0,0,0],2).should==4
  end
  it "Makes 0 move on turn 4" do
    newGame=GameLogic.new
    newGame.moveOptions=0
    newGame.computerMoveSecond([0,0,2,2,1,0,0,0,0],4).should==0
  end
  it "Makes 1 move on turn 4" do
    newGame=GameLogic.new
    newGame.moveOptions=0
    newGame.computerMoveSecond([0,0,2,0,1,0,2,0,0],4).should==1
  end
  it "Makes 6 move on turn 4" do
    newGame=GameLogic.new
    newGame.moveOptions=0
    newGame.computerMoveSecond([0,0,0,2,1,0,0,0,2],4).should==6
  end
  it "Defends Against the 3,2, fork on turn 4 " do
    newGame=GameLogic.new
    newGame.forkTestComputerSecond(3,2,0,[0,0,2,2,1,0,0,0,0]).should==0
  end
  it "Takes the center on turn 1" do
    newGame=GameLogic.new
    newGame.computerMoveFirst([0,0,0,0,0,0,0,0],1).should==4
  end
  it "Tests top left move" do
    newGame=GameLogic.new
    newGame.moveOptions=1
    newGame.computerMoveSecond([1,0,0,0,2,0,0,0,2],4).should==0
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
    newGame.computerMoveSecond([1,0,0,0,2,2,0,0,0],4).should==3
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
    newGame.computerMoveSecond([2,2,1,0,1,0,0,0,2],6).should==6
  end
  it "Takes winning move on turn 8" do
    newGame=GameLogic.new
    newGame.computerMoveSecond([2,1,2,1,1,2,2,0,0],8).should==8
  end
  it "Takes corner turn 3" do
    newGame=GameLogic.new
    newGame.computerMoveFirst([1,0,0,0,2,0,0,0,0],3).should==0
  end
  it "Makes 1 move turn 5" do
    newGame=GameLogic.new
    newGame.moveOptions=1
    newGame.computerMoveFirst([1,0,1,0,2,0,2,0,0],5).should==1
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
    newGame.computerMoveFirst([1,2,1,1,2,1,2,2,0],9).should==8
  end
  it "Fills a space on turn 9" do
    newGame=GameLogic.new
    newGame.computerMoveFirst([0,2,1,2,2,1,2,2,1],9).should==0
  end
  it "Takes 3 move" do
    newGame=GameLogic.new
    newGame.computerMoveFirst([1,0,0,0,2,2,0,1,1],5).should==3
  end
  it "Takes 6 move" do
    newGame=GameLogic.new
    newGame.computerMoveFirst([0,0,0,0,0,0,0,2,2],5).should==6
  end
  it "Takes 7 move" do
    newGame=GameLogic.new
    newGame.computerMoveFirst([1,0,1,0,0,0,2,0,2],7).should==7
  end
  it "Takes 8 move" do
    newGame=GameLogic.new
    newGame.computerMoveFirst([0,0,0,0,0,0,2,2,0],7).should==8
  end
  it "Takes 1 move" do
    newGame=GameLogic.new
    newGame.computerMoveFirst([2,0,2,0,1,0,0,0,0],7).should==1
  end
  it "Takes 7 move" do
    newGame=GameLogic.new
    newGame.computerMoveFirst([1,0,0,0,0,0,2,0,2],7).should==7
  end
  it "Takes 4 move" do
    newGame=GameLogic.new
    newGame.computerMoveFirst([0,2,0,0,0,0,0,2,0],7).should==4
  end
  it "Takes 6 move" do
    newGame=GameLogic.new
    newGame.computerMoveFirst([2,0,0,2,0,0,0,0,0],7).should==6
  end
  it "Takes 2 move" do
    newGame=GameLogic.new
    newGame.computerMoveFirst([0,0,0,0,0,2,0,0,2],7).should==2
  end
  it "Takes 3 move" do
    newGame=GameLogic.new
    newGame.computerMoveFirst([2,0,0,0,0,0,2,0,0],7).should==3
  end
  it "Takes 8 move" do
    newGame=GameLogic.new
    newGame.computerMoveSecond([0,0,1,0,0,1,0,0,0],6).should==8
  end
  it "Takes 7 move" do
    newGame=GameLogic.new
    newGame.computerMoveSecond([0,2,0,0,2,0,0,0,0],6).should==7
  end
end