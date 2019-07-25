##Class for Morpion tic-tac-toe game
require_relative '../app/board'

class Show
  attr_accessor :board, :test

  def initialize
    @test = Board.new

  end

  def display (board)
    @board = board
    puts @board
  end

end # end of class
