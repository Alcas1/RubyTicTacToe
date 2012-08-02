require_relative '../lib/check_for_win'
require_relative '../lib/output'
require_relative '../lib/game_logic'





class CommandLineGame
  attr_accessor :turn,:first,:ai,:winTester,:game
  def initialize
    @ai=GameLogic.new
    @winTester=CheckForWin.new
    @game=Board.new
    @turn=1
    @first=rand(2)+1
  end
  def startUp
    Output.welcome
    Output.board game.board
    Output.move

  end
  def computerFirstLoop
    Output.whoFirst "Computer"
    @ai.computerMoveFirst @game.board,@turn
    Output.board @game.board

    while @turn<=9 && !@winTester.checkForWin?(@game.board,1)
      move=gets.to_i
      while move<0||move>8||@game.board[move]!=0
        Output.makeCorrectMove
        move=gets.to_i
      end
      @game.board[move]=1
      @turn+=1
      @game.board[@ai.computerMoveSecond @game.board,@turn]=1
      Output.board @game.board
    end

    if @turn==10&&!@winTester.checkForWin?(@game.board,1)
      Output.tie
    end
    if @winTester.checkForWin?(@game.board,1)
      Output.lose
    end
  end
  def computerSecondLoop
    Output.whoFirst "You"
    while @turn<=9 && !@winTester.checkForWin?(@game.board,2)
      move=gets.to_i
      move=checkMove move
      while move<0||move>8||game.board[move]!=0
        puts "Make a correct move:"
        move=gets.to_i
      end
      @game.board[move]=2
      @turn+=1
      @game.board[@ai.computerMoveSecond @game.board,@turn]=2
      Output.board @game.board
    end
    if @turn==10&&!@winTester.checkForWin?(@game.board,2)
      Output.tie
    end
    if @winTester.checkForWin?(@game.board,2)
      Output.lose
    end
  end
  def checkMove move
    while move<0||move>8||game.board[move]!=0
      puts "Make a correct move:"
      move=gets.to_i
    end
    move
  end
end



