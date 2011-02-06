#----------------------------------------------
# TicTacToe game in Ruby Language
# author: [Sanosh Wadghule, santosh.wadghule@gmail.com]
# copyright: (c) 2011 Santosh Wadghule
#----------------------------------------------

# Run this file into your command prompt or terminal to start the game.
# i.e. >> ruby engine.rb


require "board"
require "player"

class Engine

  POSITION = %w[1 2 3 4 5 6 7 8 9]
  INFO = <<Doc

************************************************************************
                Powerful Tic-Tac-Toe game in Ruby Language
                  Author: [santosh.wadghule@gmail.com]
                Copyright: (c) 2011-2012 Santosh Wadghule
************************************************************************

Doc

  def display_info
    puts INFO
  end

  def start(x_player, o_player, board)

    puts "\n >> PLEASE SEE THE POSITIONS OF THE BOARD << \n\n"

    print "Do you want to play first? <y/n>: "
    ans = gets.chomp

    if %w[N n].include?(ans)
      current_player = o_player
    else
      current_player = x_player
    end

    (1..9).each do
      if current_player == x_player
        play(current_player, board)
        current_player = o_player
      else
        play(current_player, board)
        current_player = x_player
      end
    end

  end

  def stop
    puts "\n************* Match Draw ****************\n\n"
  end

  def play(current_player, board)
    if current_player.mark == "X"
      flag = true

      while flag do
        puts ""
        print "Where do want to move? <1-9>: "
        position = gets.chomp

        if !POSITION.include?(position)
          puts "\nInvalid input, Please choose number between 1 to 9\n"
          flag = true
        elsif %w[X O].include?board.positions_with_values[position]
          puts "\nPosition already occupied, Please choose another number...\n"
          flag = true
        else
          flag = false
        end

      end
      
      current_player.move(board, position)

    else
      current_player.best_move(board)
    end
  end
  
end

engine = Engine.new
engine.display_info

x_player = Player.new("X")
o_player = Player.new("O") # This is a robot :)
board    = Board.new
board.display_positions

engine.start(x_player, o_player, board) # this will start game and
                                        #automatically terminate the game if player wins the game
engine.stop # if match draw