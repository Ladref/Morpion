##Class for Morpion tic-tac-toe game
require 'pry'

class Player
  attr_accessor :name, :team

  def initialize (name, team)
    @name = name
    @team = team
  end

end # end of class Player
