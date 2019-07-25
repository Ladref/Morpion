##Class for Morpion tic-tac-toe game
require 'pry'

require_relative 'game'
require_relative 'board'
require_relative 'player'

class Application

  attr_accessor :game, :player

  def initialize
    @game = Game.new
  end

  def perform

    loop do

    system("clear")
    game.board.display

    loop do
      #turn for team X
      puts ""
      puts "#{game.player[0].name} it's your turn now."
      game.board.play_turn("X")
      system("clear")
      game.board.display
      if game.board.is_full? == true
        puts ""
        puts "Nobody wins. It's a draw!"
        print "Press Enter to continue."
        gets
        break
      end
      if game.board.has_winner("X") == true
        puts ""
        puts "Congratulation player team 'X' you win!"
        print "Press Enter to continue."
        gets
        break
      end

      #turn for team O
      puts ""
      puts "#{game.player[1].name} it's your turn now."
      game.board.play_turn("O")
      system("clear")
      game.board.display
      if game.board.is_full? == true
        puts ""
        puts "Nobody wins. It's a draw"
        print "Press Enter to continue."
        gets
        break
      end
      if game.board.has_winner("O") == true
        puts ""
        puts "Congratulation player team 'X' you win!"
        print "Press Enter to continue."
        gets
        break
      end

    end #loop do

      puts ""
      print "Press 'y' to play again or any key to quit the game : "
      again = gets.chomp
      if again != "y"
        break
      end
    game.board.reset

    end #loop do

  end #def perform

end #class Application
