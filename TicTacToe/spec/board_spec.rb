require "rspec"
require 'board'

describe Board do
  it "Initializes board to be used" do
     board=Board.new
    board.boxes.should==[0,0,0,0,0,0,0,0,0]
  end





end