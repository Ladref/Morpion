##Class for Morpion tic-tac-toe game
require 'pry'

class Boardcase

  attr_accessor :name, :value

  def initialize(name, value = ".")
    @name = name
    @value = value
  end

#  def hash
#    return {@name => @value}
#  end

  def get_value(name) #return value of a boardcase
    return self.value
  end

  def set_value(name, value)
    @value = value
  end

end # end of class Boardcase
