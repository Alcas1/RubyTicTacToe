require "rspec"
require 'check_for_win'
require 'game_logic'

describe CheckForWin do
  it "Checks for vertical wins being false" do
    newGame=GameLogic.new
    winTester=CheckForWin.new
    newGame.createNewGameBoard
    winTester.checkForVerticalWins?(newGame.board,2).should==false
  end
  it "Checks for first vertical win being false" do
    newGame=GameLogic.new
    winTester=CheckForWin.new
    newGame.createNewGameBoard
    winTester.checkForVerticalWin1?(newGame.board,2).should==false
  end
  it "Checks for second vertical win being false" do
    newGame=GameLogic.new
    winTester=CheckForWin.new
    newGame.createNewGameBoard
    winTester.checkForVerticalWin2?(newGame.board,2).should==false
  end
  it "Checks for third vertical win being false" do
    newGame=GameLogic.new
    winTester=CheckForWin.new
    newGame.createNewGameBoard
    winTester.checkForVerticalWin3?(newGame.board,2).should==false
  end
  it "Checks for vertical wins being true" do
    newGame=GameLogic.new
    winTester=CheckForWin.new
    newGame.createNewGameBoard
    newGame.board[0]=2
    newGame.board[3]=2
    newGame.board[6]=2
    winTester.checkForVerticalWins?(newGame.board,2).should==true
  end
  it "Checks for first vertical win being true" do
    newGame=GameLogic.new
    winTester=CheckForWin.new
    newGame.createNewGameBoard
    newGame.board[0]=2
    newGame.board[3]=2
    newGame.board[6]=2
    winTester.checkForVerticalWin1?(newGame.board,2).should==true
  end
  it "Checks for second vertical win being true" do
    newGame=GameLogic.new
    winTester=CheckForWin.new
    newGame.createNewGameBoard
    newGame.board[1]=2
    newGame.board[4]=2
    newGame.board[7]=2
    winTester.checkForVerticalWin2?(newGame.board,2).should==true
  end
  it "Checks for third vertical win being true" do
    newGame=GameLogic.new
    winTester=CheckForWin.new
    newGame.createNewGameBoard
    newGame.board[2]=2
    newGame.board[5]=2
    newGame.board[8]=2
    winTester.checkForVerticalWin3?(newGame.board,2).should==true
  end
  it "Checks for horizontal wins being false" do
    newGame=GameLogic.new
    winTester=CheckForWin.new
    newGame.createNewGameBoard
    winTester.checkForHorizontalWins?(newGame.board,2).should==false
  end
  it "Checks for first horizontal win being false" do
    newGame=GameLogic.new
    winTester=CheckForWin.new
    newGame.createNewGameBoard
    winTester.checkForHorizontalWin1?(newGame.board,2).should==false
  end
  it "Checks for second horizontal win being false" do
    newGame=GameLogic.new
    winTester=CheckForWin.new
    newGame.createNewGameBoard
    winTester.checkForHorizontalWin2?(newGame.board,2).should==false
  end
  it "Checks for third horizontal win being false" do
    newGame=GameLogic.new
    winTester=CheckForWin.new
    newGame.createNewGameBoard
    winTester.checkForHorizontalWin3?(newGame.board,2).should==false
  end
  it "Checks for horizontal wins being true" do
    newGame=GameLogic.new
    winTester=CheckForWin.new
    newGame.createNewGameBoard
    newGame.board[0]=2
    newGame.board[1]=2
    newGame.board[2]=2
    winTester.checkForHorizontalWins?(newGame.board,2).should==true
  end
  it "Checks for first horizontal win being true" do
    newGame=GameLogic.new
    winTester=CheckForWin.new
    newGame.createNewGameBoard
    newGame.board[0]=2
    newGame.board[1]=2
    newGame.board[2]=2
    winTester.checkForHorizontalWin1?(newGame.board,2).should==true
  end
  it "Checks for second horizontal win being true" do
    newGame=GameLogic.new
    winTester=CheckForWin.new
    newGame.createNewGameBoard
    newGame.board[3]=2
    newGame.board[4]=2
    newGame.board[5]=2
    winTester.checkForHorizontalWin2?(newGame.board,2).should==true
  end
  it "Checks for third horizontal win being true" do
    newGame=GameLogic.new
    winTester=CheckForWin.new
    newGame.createNewGameBoard
    newGame.board[6]=2
    newGame.board[7]=2
    newGame.board[8]=2
    winTester.checkForHorizontalWin3?(newGame.board,2).should==true
  end
  it "Checks for diagonal win being false" do
    newGame=GameLogic.new
    winTester=CheckForWin.new
    newGame.createNewGameBoard
    newGame.board[0]=2
    newGame.board[1]=2
    newGame.board[2]=2
    winTester.checkForDiagonalWins?(newGame.board,2).should==false
  end
  it "Checks for diagonal wins being true" do
    newGame=GameLogic.new
    winTester=CheckForWin.new
    newGame.createNewGameBoard
    newGame.board[2]=2
    newGame.board[4]=2
    newGame.board[6]=2
    winTester.checkForDiagonalWins?(newGame.board,2).should==true
  end
  it "Checks for first diagonal win being false" do
    newGame=GameLogic.new
    winTester=CheckForWin.new
    newGame.createNewGameBoard
    newGame.board[3]=2
    newGame.board[4]=2
    newGame.board[5]=2
    winTester.checkForDiagonalWin1?(newGame.board,2).should==false
  end
  it "Checks for second diagonal win being false" do
    newGame=GameLogic.new
    winTester=CheckForWin.new
    newGame.createNewGameBoard
    newGame.board[6]=2
    newGame.board[7]=2
    newGame.board[8]=2
    winTester.checkForDiagonalWin2?(newGame.board,2).should==false
  end
  it "Checks for first diagonal win being true" do
    newGame=GameLogic.new
    winTester=CheckForWin.new
    newGame.createNewGameBoard
    newGame.board[0]=2
    newGame.board[4]=2
    newGame.board[8]=2
    winTester.checkForDiagonalWin1?(newGame.board,2).should==true
  end
  it "Checks for second diagonal win being true" do
    newGame=GameLogic.new
    winTester=CheckForWin.new
    newGame.createNewGameBoard
    newGame.board[2]=2
    newGame.board[4]=2
    newGame.board[6]=2
    winTester.checkForDiagonalWin2?(newGame.board,2).should==true
  end
end