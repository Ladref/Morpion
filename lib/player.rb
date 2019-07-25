class Player

  def initialize
    puts "Please, give me a username:"
    @name = gets.chomp
    puts "Please, choose your sign: X or O"
    @sign = gets.chomp
  end

end

  player1 = Player.new
