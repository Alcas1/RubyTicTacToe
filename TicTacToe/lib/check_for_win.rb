

class CheckForWin
  def checkForWin?(board,player)
    return checkForVerticalWins?(board,player) || checkForDiagonalWins?(board,player) || checkForHorizontalWins?(board,player)
  end
  def checkForVerticalWins?(board,player)
    return checkForVerticalWin1?(board,player) || checkForVerticalWin2?(board,player) || checkForVerticalWin3?(board,player)
  end

  def checkForHorizontalWins?(board,player)
    return checkForHorizontalWin1?(board,player) || checkForHorizontalWin2?(board,player) || checkForHorizontalWin3?(board,player)
  end

  def checkForDiagonalWins?(board,player)
    return checkForDiagonalWin1?(board,player) || checkForDiagonalWin2?(board,player)
  end

  def checkForVerticalWin1? board,player
    return board[0]==board[3] && board[3]==board[6] && board[6]==player
  end
  def checkForVerticalWin2? board,player
    return board[1]==board[4] && board[4]==board[7] && board[7]==player
  end
  def checkForVerticalWin3? board,player
    return board[2]==board[5] && board[5]==board[8] && board[8]==player
  end

  def checkForHorizontalWin1? board,player
    return  (board[0]==board[1] && board[1]==board[2] && board[2]==player)
  end
  def checkForHorizontalWin2? board,player
    return  (board[3]==board[4] && board[4]==board[5] && board[5]==player)
  end
  def checkForHorizontalWin3? board,player
    return  (board[6]==board[7] && board[7]==board[8] && board[8]==player)
  end

  def checkForDiagonalWin1? board,player
    return  (board[0]==board[4] && board[4]==board[8] && board[8]==player)
  end
  def checkForDiagonalWin2? board,player
    return  (board[2]==board[4] && board[4]==board[6] && board[6]==player)
  end

end