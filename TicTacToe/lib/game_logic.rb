require_relative '../lib/check_for_win'
require_relative '../lib/output'


class GameLogic
  attr_accessor :moved,:moveOptions,:moveOptions2,:winTester,:move
  def initialize
    @moved=false
    @winTester=CheckForWin.new
    @moveOptions=0
    @moveOptions2=0
    @move=0
  end

  def computerMoveSecond board,turn
    checkIfTurn2 board,turn
    checkIfTurn4 board,turn
    checkIfTurn6 board,turn
    checkIfTurn8 board,turn
    return @move
  end

  def computerMoveFirst board,turn
    checkIfTurn1 turn
    checkIfTurn3 board,turn
    checkIfTurn5 board,turn
    checkIfTurn7 board,turn
    checkIfTurn9 board,turn
    return @move
  end

  def checkIfTurn1 turn
    if turn==1
      turn1Logic
    end
  end
  def checkIfTurn3 board,turn
    if turn==3
      turn3Logic board
    end
  end
  def checkIfTurn5 board,turn
    if turn==5
      turn5Logic board
    end
  end
  def checkIfTurn7 board,turn
    if turn==7
      turn7Logic board
    end
  end
  def checkIfTurn9 board,turn
    if turn==9
      turn9Logic board
    end
  end
  def checkIfTurn2 board,turn
    if turn==2
      turn2Logic board
    end
  end
  def checkIfTurn4 board,turn
    if turn==4
      turn4Logic board
    end
  end
  def checkIfTurn6 board,turn
    if turn==6
      turn6Logic board
    end
  end
  def checkIfTurn8 board,turn
    if turn==8
      turn8Logic board
    end
  end
  def turn1Logic
    @move=4
  end
  def turn3Logic board
    testAllCorners board
    if !@moved
      @moveOptions=3
      @move=0
    end
    @moved=false

  end
  def turn5Logic board
    testForWinningMovesComputerFirst board
    checkIfMovedTestWhichOption board
  end
  def turn7Logic board
    testForWinningMovesComputerFirst board
    checkIfMovedTestOptionSets board
  end
  def turn9Logic board
    fillInASpace board
  end
  def testAllCorners board
    testCorners 0,8,0,board
    testCorners 2,6,1,board
    testCorners 6,2,2,board
    testCorners 8,0,3,board
  end
  def checkIfMovedTestOptionSets board
    if !@moved
      testOptionSet1 board
      testOptionSet2 board
      testOptionSet3 board
      testOptionSet4 board
    end
  end
  def checkIfMovedTestWhichOption board
    if @moveOptions==0
      testOption0 board
    elsif @moveOptions==1
      testOption1 board
    elsif @moveOptions==2
      testOption2 board
    else
      testOption3 board
    end

  end
  def testOptionSet1 board
    testOptionSet1Section1 board
    testOptionSet1Section2 board
  end
  def testOptionSet1Section1 board
    testNextPositionTakeBest 1,5,6,board
    testNextPositionTakeWin 2,7,5,board
    testNextPositionTakeBest 3,2,7,board
  end
  def testOptionSet1Section2 board
    testNextPositionTakeBest 4,2,7,board
    testNextPositionTakeWin 5,5,7,board
    testNextPositionTakeBest 6,5,6,board
  end
  def testOptionSet2 board
    testOptionSet2Section1 board
    testOptionSet2Section2 board
  end
  def testOptionSet2Section1 board
    testNextPositionTakeWin 7,7,3,board
    testNextPositionTakeBest 8,3,8,board
    testNextPositionTakeBest 9,0,7,board
  end
  def testOptionSet2Section2 board
    testNextPositionTakeBest 10,0,7,board
    testNextPositionTakeBest 11,3,8,board
    testNextPositionTakeWin 12,3,7,board
  end
  def testOptionSet3 board
    testOptionSet3Section1 board
    testOptionSet3Section2 board
  end
  def testOptionSet3Section1 board
    testNextPositionTakeWin 13,5,1,board
    testNextPositionTakeBest 14,0,8,board
    testNextPositionTakeBest 15,1,8,board
  end
  def testOptionSet3Section2 board
    testNextPositionTakeBest 16,1,8,board
    testNextPositionTakeBest 17,0,5,board
    testNextPositionTakeWin 18,1,5,board
  end
  def testOptionSet4 board
    testOptionSet4Section1 board
    testOptionSet4Section2 board
  end
  def testOptionSet4Section1 board
    testNextPositionTakeBest 19,2,3,board
    testNextPositionTakeWin 20,3,1,board
    testNextPositionTakeBest 21,1,6,board
  end
  def testOptionSet4Section2 board
    testNextPositionTakeBest 22,1,6,board
    testNextPositionTakeWin 23,1,3,board
    testNextPositionTakeBest 24,2,3,board
  end
  def testNextPositionTakeWin option,winMove,nextBest,board
    if !@moved
      if option==@moveOptions2
        board[winMove]!=1
        @move=winMove
        @moved=true
      elsif board[winMove]==1
        @move=nextBest
        @moved=true
      end
    end

  end
  def testNextPositionTakeBest option,firstBestMove,otherBestMove,board
    if !@moved
      if option==@moveOptions2
        if board[firstBestMove]==1
          @move=otherBestMove
          @moved=true
        elsif board[otherBestMove]==1
          @move=firstBestMove
          @moved=true
        else
          @move=firstBestMove
          @moved=true
        end
      end
    end
  end
  def testOption0  board
    testOption0Section1 board
    testOption0Section2 board
  end
  def testOption0Section1 board
    testOption 1,2,1,board
    testOption 2,1,2,board
    testOption 3,6,3,board
  end
  def testOption0Section2 board
    testOption 5,1,4,board
    testOption 6,3,5,board
    testOption 7,2,6,board
  end
  def testOption1 board
    testOption1Section1 board
    testOption1Section2 board
  end
  def testOption1Section1 board
    testOption 0,1,7,board
    testOption 1,0,8,board
    testOption 3,8,9,board
  end
  def testOption1Section2 board
    testOption 5,8,10,board
    testOption 7,0,11,board
    testOption 8,5,12,board
  end
  def testOption2 board
    testOption2Section1 board
    testOption2Section2 board
  end
  def testOption2Section1 board
    testOption 0,3,13,board
    testOption 1,8,14,board
    testOption 3,0,15,board
  end
  def testOption2Section2 board
    testOption 5,0,16,board
    testOption 7,8,17,board
    testOption 8,7,18,board
  end
  def testOption3 board
    testOption3Section1 board
    testOption3Section2 board
  end
  def testOption3Section1 board
    testOption 1,6,19,board
    testOption 2,5,20,board
    testOption 3,2,21,board
  end
  def testOption3Section2 board
    testOption 5,2,22,board
    testOption 6,7,23,board
    testOption 7,6,24,board
  end
  def testOption forkPosition,counter,optionSet,board
    if !@moved
      if board[forkPosition]==1
        @move=counter
        @moveOptions2=optionSet
        @moved=true
      end
    end
  end

  def testCorners box,counter,option,board
    if !@moved
      if board[box]==1
        board[counter]=2
        @moveOptions=option
        @moved=true
      end
    end
  end


  def turn2Logic board
    takeMoveSecondMove board
  end
  def turn4Logic board
    testForDefendingMoves board
    checkIfMovedCenterMoveSet0 board
    testOptions1to4 board
    checkIfMovedFillInASpace board
  end
  def turn6Logic board
    testForWinningMovesComputerSecond board
    checkIfMovedTestForDefendingMoves board
    checkIfMovedFillInASpace board
  end
  def turn8Logic board
    testForWinningMovesComputerSecond board
    checkIfMovedTestForDefendingMoves board
    checkIfMovedFillInASpace board
  end
  def testOptions1to4 board
    topLeftMoveTest1 board
    topRightMoveTest2 board
    bottomLeftMoveTest3 board
    bottomRightMoveTest4 board
  end
  def takeMoveSecondMove board
    if centerMoveNotTaken? board
      @moveOptions=0
      @move=4
    else
      takeRandomSpot
    end
  end
  def checkIfMovedTestForDefendingMoves board
    if !@moved
      testForDefendingMoves board
    end
  end
  def checkIfMovedCenterMoveSet0 board
    if !@moved
      centerMoveSet0 board
    end
  end
  def checkIfMovedFillInASpace board
    if !@moved
      fillInASpace board
    end
  end
  def fillInASpace board
    counter=-1
    while counter<=board.length do counter+=1
    if board[counter]==0
      @move=counter
    end
    end
  end


  def centerMoveSet0 board
    if @moveOptions==0
      forkTestComputerSecond1 board
      forkTestComputerSecond2 board
      forkTestComputerSecond3 board
    end
  end
  def forkTestComputerSecond1 board
    forkTestComputerSecond 3,2,0,board
    forkTestComputerSecond 1,6,0,board
    forkTestComputerSecond 3,8,6,board
    forkTestComputerSecond 1,8,2,board
  end
  def forkTestComputerSecond2 board
    forkTestComputerSecond 1,3,0,board
    forkTestComputerSecond 1,5,2,board
    forkTestComputerSecond 3,7,6,board
    forkTestComputerSecond 7,5,8,board
  end
  def forkTestComputerSecond3 board
    forkTestComputerSecond 0,8,1,board
    forkTestComputerSecond 2,6,1,board
    forkTestComputerSecond 2,7,8,board
    forkTestComputerSecond 0,7,6,board
    forkTestComputerSecond 5,6,8,board
  end



  def forkTestComputerFirst forkSpot1,forkSpot2,counter,board
    if !@moved
      if board[forkSpot1]==1&&board[forkSpot2]==1&&board[counter]==0
        @moved=true
        @move=counter
      end
    end
  end
  def forkTestComputerSecond forkSpot1,forkSpot2,counter,board
    if !@moved
      if board[forkSpot1]==2&&board[forkSpot2]==2&&board[counter]==0
        @moved=true
        @move=counter
      end
    end
  end

  def tryToWinComputerFirst winPosition1,winPosition2,winningPosition,board
    if !@moved
      if board[winPosition1]==2&&board[winPosition2]==2&&board[winningPosition]==0
        @moved=true
        @move=winningPosition
      end
    end
  end
  def tryToWinComputerSecond winPosition1,winPosition2,winningPosition,board
    if @moved
      if board[winPosition1]==1&&board[winPosition2]==1&&board[winningPosition]==0
        @move=winningPosition
      end
    end
  end

  def topLeftMoveTest1 board
    if @moveOptions==1
      forkTestComputerSecond 8,4,2,board
    end
  end
  def topRightMoveTest2 board
    if @moveOptions==2
      forkTestComputerSecond 6,4,0,board
    end
  end

  def bottomLeftMoveTest3 board
    if @moveOptions==3
      forkTestComputerSecond 2,4,8,board
    end
  end

  def bottomRightMoveTest4 board
    if @moveOptions==4
      forkTestComputerSecond 0,4,6,board
    end
  end
  def takeRandomSpot
    test=rand(4)
    @moveOptions=test+1
    if test==0
      @move=0
    elsif test==1
      @move=2
    elsif test==2
      @move=6
    else
      @move=8
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

  def centerMoveNotTaken? board
    return board[4]==0
  end


  def testForWinningMovesComputerFirst board
    winForAllHorizontalWinsComputerFirst board
    winForAllVerticalWinsComputerFirst board
    winForAllDiagonalWinsComputerFirst board
  end
  def winForAllHorizontalWinsComputerFirst board
    i=0
    while i<3
      possible_wins = returnArrays(i*3,i*3+1,i*3+2)
      possible_wins.each do |array|
        tryToWinComputerFirst(array[0],array[1],array[2],board)
      end
      i+=1
    end
  end
  def winForAllVerticalWinsComputerFirst board
    i=0
    while i<3
      possible_wins = returnArrays(0+i,3+i,6+i)
      possible_wins.each do |array|
        tryToWinComputerFirst(array[0],array[1],array[2],board)
      end
      i+=1
    end
  end
  def returnArrays(a,b,c)
    answer = []
    answer << [a,b,c]
    answer << [a,c,b]
    answer << [b,c,a]
    answer
  end

  def winForAllDiagonalWinsComputerFirst board
    winningDiagonalLeftComputerFirst board
    winningDiagonalRightComputerFirst board
  end
  def winningDiagonalRightComputerFirst board
    tryToWinComputerFirst 2,4,6,board
    tryToWinComputerFirst 2,6,4,board
    tryToWinComputerFirst 6,4,2,board
  end
  def winningDiagonalLeftComputerFirst board
    tryToWinComputerFirst 0,4,8,board
    tryToWinComputerFirst 0,8,4,board
    tryToWinComputerFirst 8,4,0,board
  end


  def testForWinningMovesComputerSecond board
    winForAllHorizontalWinsComputerSecond board
    winForAllVerticalWinsComputerSecond board
    winForAllDiagonalWinsComputerSecond board
  end
  def winForAllHorizontalWinsComputerSecond board
    i=0
    while i<3
      possible_wins = returnArrays(i*3,i*3+1,i*3+2)
      possible_wins.each do |array|
        tryToWinComputerSecond(array[0],array[1],array[2],board)
      end
      i+=1
    end
  end

  def winForAllVerticalWinsComputerSecond board
    i=0
    while i<3
      possible_wins = returnArrays(0+i,3+i,6+i)
      possible_wins.each do |array|
        tryToWinComputerSecond(array[0],array[1],array[2],board)
      end
      i+=1
    end
  end
  def winForAllDiagonalWinsComputerSecond board
    winningDiagonalLeftComputerSecond board
    winningDiagonalRightComputerSecond board
  end
  def winningDiagonalRightComputerSecond board
    tryToWinComputerSecond 2,4,6,board
    tryToWinComputerSecond 2,6,4,board
    tryToWinComputerSecond 6,4,2,board
  end
  def winningDiagonalLeftComputerSecond board
    tryToWinComputerSecond 0,4,8,board
    tryToWinComputerSecond 0,8,4,board
    tryToWinComputerSecond 8,4,0,board
  end

  def testForDefendingMoves board
    defendAgainstAllHorizontalWins board
    defendAgainstAllVerticalWins board
    defendAgainstAllDiagonalWins board
  end
  def defendAgainstAllHorizontalWins board
    defendAgainstAllHorizontalLeftWins board
    defendAgainstAllHorizontalCenterWins board
    defendAgainstAllHorizontalRightWins board
  end
  def defendAgainstAllHorizontalLeftWins board
    forkTestComputerSecond 1,2,0,board
    forkTestComputerSecond 4,5,3,board
    forkTestComputerSecond 8,7,6,board
  end
  def defendAgainstAllHorizontalCenterWins board
    forkTestComputerSecond 0,2,1,board
    forkTestComputerSecond 3,5,4,board
    forkTestComputerSecond 6,8,7,board
  end
  def defendAgainstAllHorizontalRightWins board
    forkTestComputerSecond 0,1,2,board
    forkTestComputerSecond 3,4,5,board
    forkTestComputerSecond 6,7,8,board
  end
  def defendAgainstAllVerticalWins board
    defendAgainstAllVerticalTopWins board
    defendAgainstAllVerticalCenterWins board
    defendAgainstAllVerticalBottomWins board
  end
  def defendAgainstAllVerticalTopWins board
    forkTestComputerSecond 3,6,0,board
    forkTestComputerSecond 4,7,1,board
    forkTestComputerSecond 8,5,2,board
  end
  def defendAgainstAllVerticalCenterWins board
    forkTestComputerSecond 0,6,3,board
    forkTestComputerSecond 7,1,4,board
    forkTestComputerSecond 2,8,5,board
  end
  def defendAgainstAllVerticalBottomWins board
    forkTestComputerSecond 0,3,6,board
    forkTestComputerSecond 1,4,7,board
    forkTestComputerSecond 2,5,8,board
  end
  def defendAgainstAllDiagonalWins board
    defendAgainstAllDiagonalRightWins board
    defendAgainstAllDiagonalLeftWins board

  end
  def defendAgainstAllDiagonalRightWins board
    forkTestComputerSecond 4,6,2,board
    forkTestComputerSecond 6,2,4,board
    forkTestComputerSecond 2,4,6,board
  end
  def defendAgainstAllDiagonalLeftWins board
    forkTestComputerSecond 8,4,0,board
    forkTestComputerSecond 0,8,4,board
    forkTestComputerSecond 0,4,8,board
  end


end

