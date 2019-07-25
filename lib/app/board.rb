##Class for Morpion tic-tac-toe game
require 'pry'
require_relative 'boardcase'

class Board

  attr_accessor :array, :case_index, :player

  def initialize
    @array = Array.new
    @case_index = {"a1" => 0, "b1" => 1, "c1" => 2, "a2" => 3, "b2" => 4, "c2" => 5, "a3" => 6, "b3" => 7, "c3" => 8, }
    for i in (1..3) do
      @array << Boardcase.new("a#{i}")
      @array << Boardcase.new("b#{i}")
      @array << Boardcase.new("c#{i}")
    end
  end

  def is_full?
    for i in (0..8) do
      if @array[i].value == "."
        return false
      end
    end
    return true
  end

  def reset
    for i in (0..8) do
      @array[i].value = "."
    end
  end

  def where_is(boardcase)
    return case_index[boardcase]
  end

  def is_case_free?(move)
    move_index = where_is(move)
    if @array[move_index].value == "."
      return true
    else
      return false
    end
  end

  def play_turn(team)
    isfree = false
    while isfree == false
      print "Where do you want to play : "
      move = gets.chomp
      isfree = is_case_free?(move)
      if isfree == false
        puts "This case is already taken! Please choose another one."
      else
        move_index = where_is(move)
        @array[move_index].value = team
      end
    end
  end

  def display
    puts "  1 2 3"
    print "a "
    for i in [0,3,6] do
      print "#{@array[i].value} "
    end
    puts ""
    print "b "
    for i in [1,4,7] do
      print "#{@array[i].value} "
    end
    puts ""
    print "c "
    for i in [2,5,8] do
      print "#{@array[i].value} "
    end
    puts ""
  end

  def has_winner(team)
    if @array[0].value == team && @array[1].value == team && @array[2].value == team
      return true
    elsif @array[3].value == team && @array[4].value == team && @array[5].value == team
      return true
    elsif @array[6].value == team && @array[7].value == team && @array[8].value == team
      return true
    elsif @array[0].value == team && @array[3].value == team && @array[6].value == team
      return true
    elsif @array[1].value == team && @array[4].value == team && @array[7].value == team
      return true
    elsif @array[2].value == team && @array[5].value == team && @array[8].value == team
      return true
    elsif @array[0].value == team && @array[4].value == team && @array[8].value == team
      return true
    elsif @array[2].value == team && @array[4].value == team && @array[6].value == team
      return true
    else
      return false
    end
  end

end # end of class Board
