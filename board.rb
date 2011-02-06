#----------------------------------------------
# TicTacToe game in Ruby Language
# author: [Sanosh Wadghule, santosh.wadghule@gmail.com]
# copyright: (c) 2011 Santosh Wadghule
#----------------------------------------------

class Board

  attr_accessor :info, :positions_with_values

  WINNING_PLACES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]


  def initialize # board position starts from 1 to 9
    @positions_with_values = {"1" => " ", "2" => " ", "3" => " ",
                              "4" => " ", "5" => " ", "6" => " ",
                              "7" => " ", "8" => " ", "9" => " "}
  end

  def display_positions # initial user friendly board display
    puts ""
    puts " 1 | 2 | 3 "
    puts "-----------"
    puts " 4 | 5 | 6 "
    puts "-----------"
    puts " 7 | 8 | 9 "
    puts ""
  end

  def display
    puts ""
    puts " #{self.positions_with_values["1"]} | #{self.positions_with_values["2"]} | #{self.positions_with_values["3"]} "
    puts "-----------"
    puts " #{self.positions_with_values["4"]} | #{self.positions_with_values["5"]} | #{self.positions_with_values["6"]} "
    puts "-----------"
    puts " #{self.positions_with_values["7"]} | #{self.positions_with_values["8"]} | #{self.positions_with_values["9"]} "
    puts ""
  end

  def check_winner
    x_count = 0
    o_count = 0
    WINNING_PLACES.each do |winning_place|
      winning_place.each do |index|
        if self.positions_with_values["#{index}"] == "X"
          x_count = x_count + 1
        elsif self.positions_with_values["#{index}"] == "O"
          o_count = o_count + 1
        end
      end
      if x_count == 3 or o_count == 3
        break
      else
        x_count = 0
        o_count = 0
      end
    end
    if x_count == 3
      return "X won"
    elsif o_count == 3
      return "O won"
    end
    return "No One"
  end
end

