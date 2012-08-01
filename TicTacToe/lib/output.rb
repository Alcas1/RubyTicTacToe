require_relative '../lib/check_for_win'
require_relative '../lib/game_logic'




class Output
  def self.welcome
    puts "Welcome to TicTacToe!"
  end
  def self.board board
    showBoard1,showBoard2,showBoard3=[],[],[]
    puts board1Sort(showBoard1,board).to_s
    puts board2Sort(showBoard2,board).to_s
    puts board3Sort(showBoard3,board).to_s
  end
  def self.board1Sort(board1,board)
    board1<< board[0]
    board1<< board[1]
    board1<< board[2]
    return board1
  end
  def self.board2Sort(board2,board)
    board2<< board[3]
    board2<< board[4]
    board2<< board[5]
    return board2
  end
  def self.board3Sort(board3,board)
    board3<< board[6]
    board3<< board[7]
    board3<< board[8]
    return board3
  end

  def self.lose
    puts "You lose!"
  end
  def self.tie
    puts "Tie!"
  end
  def self.move
    puts "Your Move:"
  end
  def self.whoFirst who
    puts "Who Goes First:#{who}"
  end
end