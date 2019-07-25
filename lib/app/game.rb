##Class for Morpion tic-tac-toe game
require 'pry'
require_relative 'board'
require_relative 'player'
require_relative '../views/show'

class Game
  attr_accessor :board, :player, :status, :current_player

  def initialize
    @board = Board.new
    @player = Array.new
    @status = "On going"
    @current_player = 0
    system("clear")
    puts "Welcome to Morpion OO"
    print "-" * 20
    puts ""
    print "Player for team 'X' enter your name : "
    name = gets.chomp
    @player << Player.new(name, "X")
    print "Player for team 'O' enter your name : "
    name = gets.chomp
    @player << Player.new(name, "O")
  end #initialize

end # end of class
