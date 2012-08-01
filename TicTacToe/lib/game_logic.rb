require_relative '../lib/check_for_win'
require_relative '../lib/output'


class GameLogic
  attr_accessor :turn,:board,:first,:moved,:moveOptions,:moveOptions2,:winTester,:player
  def fullSetup
    setupWinTester
    setupTurns
    setupMoved
    setupMoveOptions
    createNewGameBoard
    playerGet
  end
  def playerGet
    if @first==1
      @player=2
    else
      @player=1
    end
  end
  def setupMoved
    @moved=false
  end
  def setupWinTester
    @winTester=CheckForWin.new
  end
  def setupTurns
    @turn=1
  end
  def setupMoveOptions
    @moveOptions=0
    @moveOptions2=0
  end
  def createNewGameBoard
    @board=[0,0,0,0,0,0,0,0,0]
  end
  def setWhosFirst
    @first=rand(2)+1
  end
  def startGame
    if @first==1
      return computerMoveFirst
    else
      return computerMoveSecond
    end
  end
  def checkIfMoveIsGood move

    return move.to_i
  end

  def computerMoveSecond
    checkIfTurn2
    checkIfTurn4
    checkIfTurn6
    checkIfTurn8
  end

  def computerMoveFirst
    checkIfTurn1
    checkIfTurn3
    checkIfTurn5
    checkIfTurn7
    checkIfTurn9
  end

  def checkIfTurn1
    if @turn==1
      turn1
    end
  end
  def checkIfTurn3
    if @turn==3
      turn3
    end
  end
  def checkIfTurn5
    if @turn==5
      turn5
    end
  end
  def checkIfTurn7
    if @turn==7
      turn7
    end
  end
  def checkIfTurn9
    if @turn==9
      turn9
    end
  end
  def checkIfTurn2
    if @turn==2
      turn2
    end
  end
  def checkIfTurn4
    if turn==4
      turn4
    end
  end
  def checkIfTurn6
    if @turn==6
      turn6
    end
  end
  def checkIfTurn8
    if @turn==8
      turn8
    end
  end
  def turn1
    @turn+=1
    return turn1Logic
  end
  def turn3
    @turn+=1
    return turn3Logic
  end
  def turn5
    @turn+=1
    return turn5Logic
  end
  def turn7
    @turn+=1
    return turn7Logic
  end
  def turn9
    @turn+=1
    return turn9Logic
  end
  def turn2
    @turn+=1
    return turn2Logic
  end
  def turn4
    @turn+=1
    return  turn4Logic
  end
  def turn6
    @turn+=1
    return turn6Logic
  end
  def turn8
    @turn+=1
    return turn8Logic
  end
  def turn1Logic
    @board[4]=2
    return @board
  end
  def turn3Logic
    testAllCorners
    takeRandomSpot(2)
    return @board
  end
  def turn5Logic
    testForWinningMovesComputerFirst
    checkIfMovedTestWhichOption
    @moved=false
    return @board
  end
  def turn7Logic
    testForWinningMovesComputerFirst
    checkIfMovedTestWhichOptionSet
    @moved=false
    return @board
  end
  def turn9Logic
    fillInASpace 2
    return @board
  end
  def testAllCorners
    testCorners 0,8,0
    testCorners 2,6,1
    testCorners 6,2,2
    testCorners 8,0,3
  end
  def checkIfMovedTestWhichOptionSet
    if !@moved
      testWhichOptionSet 1
      testWhichOptionSet 2
      testWhichOptionSet 3
      testWhichOptionSet 4
    end
  end
  def checkIfMovedTestWhichOption
    if !@moved
      testWhichOption @moveOptions
    end
  end
  def testOptionSet1


  end
  def testOptionSet1Section1
    testNextPositionTakeBest 1,5,6
    testNextPositionTakeWin 2,7,5
    testNextPositionTakeBest 3,2,7
  end
  def testOptionSet1Section2
    testNextPositionTakeBest 4,2,7
    testNextPositionTakeWin 5,5,7
    testNextPositionTakeBest 6,5,6
  end
  def testOptionSet2
    testOptionSet2Section1
    testOptionSet2Section2
  end
  def testOptionSet2Section1
    testNextPositionTakeWin 7,7,3
    testNextPositionTakeBest 8,3,8
    testNextPositionTakeBest 9,0,7
  end
  def testOptionSet2Section2

  end
  def testOptionSet3
    testOptionSet3Section1
    testOptionSet3Section2
  end
  def testOptionSet3Section1
    testNextPositionTakeWin 13,5,1
    testNextPositionTakeBest 14,0,8
    testNextPositionTakeBest 15,1,8
  end
  def testOptionSet3Section2
    testNextPositionTakeBest 16,1,8
    testNextPositionTakeBest 17,0,5
    testNextPositionTakeWin 18,1,5
  end
  def testOptionSet4
    testOptionSet4Section1
    testOptionSet4Section2
  end
  def testOptionSet4Section1
    testNextPositionTakeBest 19,2,3
    testNextPositionTakeWin 20,3,1
    testNextPositionTakeBest 21,1,6
  end
  def testOptionSet4Section2
    testNextPositionTakeBest 22,1,6
    testNextPositionTakeWin 23,1,3
    testNextPositionTakeBest 24,2,3
  end
  def testWhichOptionSet set
    if set==1
      testOptionSet1
    elsif set==2
      testOptionSet2
    elsif set==3
      testOptionSet3
    else
      testOptionSet4
    end
  end
  def testNextPositionTakeWin option,winMove,nextBest
    if option==@moveOptions2
      if @board[winMove]!=1
        @board[winMove]=2
      elsif @board[winMove]==1
        @board[nextBest]=2
      end
    end
  end
  def testNextPositionTakeBest option,firstBestMove,otherBestMove
    if option==@moveOptions2
      if @board[firstBestMove]==1
        @board[otherBestMove]=2
      elsif @board[otherBestMove]==1
        @board[firstBestMove]=2
      else
        @board[firstBestMove]=2
      end
    end
  end

  def testWhichOption option
    if option==0
      testOption0
    elsif option==1
      testOption1
    elsif option==2
      testOption2
    else
      testOption3
    end

  end
  def testOption0
    testOption0Section1
    testOption0Section2
  end
  def testOption0Section1
    testOption 1,2,1
    testOption 2,1,2
    testOption 3,6,3
  end
  def testOption0Section2
    testOption 5,1,4
    testOption 6,3,5
    testOption 7,2,6
  end
  def testOption1
    testOption1Section1
    testOption1Section2
  end
  def testOption1Section1
    testOption 0,1,7
    testOption 1,0,8
    testOption 3,8,9
  end
  def testOption1Section2
    testOption 5,8,10
    testOption 7,0,11
    testOption 8,5,12
  end
  def testOption2
    testOption2Section1
    testOption2Section2
  end
  def testOption2Section1
    testOption 0,3,13
    testOption 1,8,14
    testOption 3,0,15
  end
  def testOption2Section2
    testOption 5,0,16
    testOption 7,8,17
    testOption 8,7,18
  end
  def testOption3
    testOption3Section1
    testOption3Section2
  end
  def testOption3Section1
    testOption 1,6,19
    testOption 2,5,20
    testOption 3,2,21
  end
  def testOption3Section2
    testOption 5,2,22
    testOption 6,7,23
    testOption 7,6,24
  end
  def testOption forkPosition,counter,optionSet
    if @board[forkPosition]==1
      @board[counter]=2
      @moveOptions2=optionSet
    end
  end

  def testCorners box,counter,option
    if @board[box]==1
      @board[counter]=2
      @moveOptions2=option
    end
  end


  def turn2Logic
    if centerMoveNotTaken?
      @moveOptions=0
      @board[4]=1
    else
      takeRandomSpot 1
    end
    return @board
  end
  def turn4Logic
    testForDefendingMoves
    if !@moved
      centerMoveSet0
    end
    topLeftMoveTest1
    topRightMoveTest2
    bottomLeftMoveTest3
    bottomRightMoveTest4
    if !@moved
      fillInASpace 1
    end
    @moved=false
    return @board
  end
  def turn6Logic
    testForWinningMovesComputerSecond
    if !@moved
      testForDefendingMoves
    end
    if !@moved
      fillInASpace 1
    end
    @moved=false
    return @board
  end
  def turn8Logic
    testForWinningMovesComputerSecond
    if !@moved
      testForDefendingMoves
    end
    if !@moved
      fillInASpace 1
    end
    @moved=false
    return @board
  end
  def fillInASpace player
    counter=-1
    while counter<=@board.length do counter+=1
    if @board[counter]==0
      @board[counter]=player
      return @board
    end
    end
  end


  def centerMoveSet0
    if @moveOptions==0
      forkTestComputerSecond1
      forkTestComputerSecond2
      forkTestComputerSecond3
    end
  end
  def forkTestComputerSecond1
    forkTestComputerSecond 3,2,0
    forkTestComputerSecond 1,6,0
    forkTestComputerSecond 3,8,6
    forkTestComputerSecond 1,8,2
  end
  def forkTestComputerSecond2
    forkTestComputerSecond 1,3,0
    forkTestComputerSecond 1,5,2
    forkTestComputerSecond 3,7,6
    forkTestComputerSecond 7,5,8
  end
  def forkTestComputerSecond3
    forkTestComputerSecond 0,8,1
    forkTestComputerSecond 2,6,1
    forkTestComputerSecond 2,7,8
    forkTestComputerSecond 0,7,6
  end



  def forkTestComputerFirst forkSpot1,forkSpot2,counter
    if @board[forkSpot1]==1&&@board[forkSpot2]==1&&@board[counter]==0
      @board[counter]=2
      @moved=true
    end
  end
  def forkTestComputerSecond forkSpot1,forkSpot2,counter
    if @board[forkSpot1]==2&&@board[forkSpot2]==2&&@board[counter]==0
      @board[counter]=1
      @moved=true
    end
  end

  def tryToWinComputerFirst winPosition1,winPosition2,winningPosition
    if @board[winPosition1]==2&&@board[winPosition2]==2&&@board[winningPosition]==0
      @board[winningPosition]=2
      @moved=true
    end
  end
  def tryToWinComputerSecond winPosition1,winPosition2,winningPosition
    if @board[winPosition1]==1&&@board[winPosition2]==1&&@board[winningPosition]==0
      @board[winningPosition]=1
      @moved=true
    end
  end

  def topLeftMoveTest1
    if @moveOptions==1
      forkTestComputerSecond 8,4,2
    end
  end
  def topRightMoveTest2
    if @moveOptions==2
      forkTestComputerSecond 6,4,0
    end
  end

  def bottomLeftMoveTest3
    if @moveOptions==3
      forkTestComputerSecond 2,4,8
    end
  end

  def bottomRightMoveTest4
    if @moveOptions==4
      forkTestComputerSecond 0,4,6
    end
  end
  def takeRandomSpot player
    test=rand(4)
    if player==1
      @moveOptions=test+1
    end
    if player==2
      setMoveOptions test
    end
    if test==0
      takeSpot(0,player)
    elsif test==1
      takeSpot(2,player)
    elsif test==2
      takeSpot(6,player)
    else
      takeSpot(8,player)
    end
  end
  def setMoveOptions move
    if move==0
      @moveOptions=3
    elsif move==1
      @moveOptions=2
    elsif move==2
      @moveOptions=1
    else
      @moveOptions=0
    end
  end
  def takeSpot box,player
    @board[box]=player
  end

  def centerMoveNotTaken?
    return @board[4]==0
  end


  def testForWinningMovesComputerFirst
    winForAllHorizontalWinsComputerFirst
    winForAllVerticalWinsComputerFirst
    winForAllDiagonalWinsComputerFirst
  end
  def winForAllHorizontalWinsComputerFirst
    winningHorizontalLeftComputerFirst
    winningHorizontalCenterComputerFirst
    winningHorizontalRightComputerFirst
  end
  def winningHorizontalLeftComputerFirst
    tryToWinComputerFirst 1,2,0
    tryToWinComputerSecond 4,5,3
    tryToWinComputerSecond 7,8,6
  end
  def winningHorizontalCenterComputerFirst
    tryToWinComputerFirst 0,2,1
    tryToWinComputerFirst 3,5,4
    tryToWinComputerFirst 8,6,7
  end
  def winningHorizontalRightComputerFirst
    tryToWinComputerFirst 0,1,2
    tryToWinComputerFirst 3,4,5
    tryToWinComputerFirst 6,7,8
  end
  def winForAllVerticalWinsComputerFirst
    winningVerticalTopComputerFirst
    winningVerticalCenterComputerFirst
    winningVerticalBottomComputerFirst
  end
  def winningVerticalTopComputerFirst
    tryToWinComputerFirst 3,6,0
    tryToWinComputerFirst 4,7,1
    tryToWinComputerFirst 5,8,2
  end
  def winningVerticalCenterComputerFirst
    tryToWinComputerFirst 0,6,3
    tryToWinComputerFirst 1,7,4
    tryToWinComputerFirst 8,2,5
  end
  def winningVerticalBottomComputerFirst
    tryToWinComputerFirst 0,3,6
    tryToWinComputerFirst 1,4,7
    tryToWinComputerFirst 2,5,8
  end
  def winForAllDiagonalWinsComputerFirst
    winningDiagonalLeftComputerFirst
    winningDiagonalRightComputerFirst
  end
  def winningDiagonalRightComputerFirst
    tryToWinComputerFirst 2,4,6
    tryToWinComputerFirst 2,6,4
    tryToWinComputerFirst 6,4,2
  end
  def winningDiagonalLeftComputerFirst
    tryToWinComputerFirst 0,4,8
    tryToWinComputerFirst 0,8,4
    tryToWinComputerFirst 8,4,0
  end


  def testForWinningMovesComputerSecond
    winForAllHorizontalWins
    winForAllVerticalWins
    winForAllDiagonalWins
  end
  def winForAllHorizontalWins
    winningHorizontalLeft
    winningHorizontalCenter
    winningHorizontalRight
  end
  def winningHorizontalLeft
    tryToWinComputerSecond 1,2,0
    tryToWinComputerSecond 4,5,3
    tryToWinComputerSecond 7,8,6
  end
  def winningHorizontalCenter
    tryToWinComputerSecond 0,2,1
    tryToWinComputerSecond 3,5,4
    tryToWinComputerSecond 8,6,7
  end
  def winningHorizontalRight
    tryToWinComputerSecond 0,1,2
    tryToWinComputerSecond 3,4,5
    tryToWinComputerSecond 6,7,8
  end
  def winForAllVerticalWins
    winningVerticalTop
    winningVerticalCenter
    winningVerticalBottom
  end
  def winningVerticalTop
    tryToWinComputerSecond 3,6,0
    tryToWinComputerSecond 4,7,1
    tryToWinComputerSecond 5,8,2
  end
  def winningVerticalCenter
    tryToWinComputerSecond 0,6,3
    tryToWinComputerSecond 1,7,4
    tryToWinComputerSecond 8,2,5
  end
  def winningVerticalBottom
    tryToWinComputerSecond 0,3,6
    tryToWinComputerSecond 1,4,7
    tryToWinComputerSecond 2,5,8
  end
  def winForAllDiagonalWins
    winningDiagonalLeft
    winningDiagonalRight
  end
  def winningDiagonalRight
    tryToWinComputerSecond 2,4,6
    tryToWinComputerSecond 2,6,4
    tryToWinComputerSecond 6,4,2
  end
  def winningDiagonalLeft
    tryToWinComputerSecond 0,4,8
    tryToWinComputerSecond 0,8,4
    tryToWinComputerSecond 8,4,0
  end
  def testForDefendingMoves
    defendAgainstAllHorizontalWins
    defendAgainstAllVerticalWins
    defendAgainstAllDiagonalWins
  end
  def defendAgainstAllHorizontalWins
    defendAgainstAllHorizontalLeftWins
    defendAgainstAllHorizontalCenterWins
    defendAgainstAllHorizontalRightWins
  end
  def defendAgainstAllHorizontalLeftWins
    forkTestComputerSecond 1,2,0
    forkTestComputerSecond 4,5,3
    forkTestComputerSecond 8,7,6
  end
  def defendAgainstAllHorizontalCenterWins
    forkTestComputerSecond 0,2,1
    forkTestComputerSecond 3,5,4
    forkTestComputerSecond 6,8,7
  end
  def defendAgainstAllHorizontalRightWins
    forkTestComputerSecond 0,1,2
    forkTestComputerSecond 3,4,5
    forkTestComputerSecond 6,7,8
  end
  def defendAgainstAllVerticalWins
    defendAgainstAllVerticalTopWins
    defendAgainstAllVerticalCenterWins
    defendAgainstAllVerticalBottomWins
  end
  def defendAgainstAllVerticalTopWins
    forkTestComputerSecond 3,6,0
    forkTestComputerSecond 4,7,1
    forkTestComputerSecond 8,5,2
  end
  def defendAgainstAllVerticalCenterWins
    forkTestComputerSecond 0,6,3
    forkTestComputerSecond 7,1,4
    forkTestComputerSecond 2,8,5
  end
  def defendAgainstAllVerticalBottomWins
    forkTestComputerSecond 0,3,6
    forkTestComputerSecond 1,4,7
    forkTestComputerSecond 2,5,8
  end
  def defendAgainstAllDiagonalWins
    defendAgainstAllDiagonalRightWins
    defendAgainstAllDiagonalLeftWins

  end
  def defendAgainstAllDiagonalRightWins
    forkTestComputerSecond 4,6,2
    forkTestComputerSecond 6,2,4
    forkTestComputerSecond 2,4,6
  end
  def defendAgainstAllDiagonalLeftWins
    forkTestComputerSecond 8,4,0
    forkTestComputerSecond 0,8,4
    forkTestComputerSecond 0,4,8
  end
end


