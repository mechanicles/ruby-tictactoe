#----------------------------------------------
# TicTacToe game in Ruby Language
# author: [Sanosh Wadghule, santosh.wadghule@gmail.com]
# copyright: (c) 2011 Santosh Wadghule
#----------------------------------------------

class Player
  attr_accessor :mark

  def initialize(mark) # initialize Player's Mark (i.e "X" or "O")
    @mark = mark
  end

  def move(board, position) # X player move
    board.positions_with_values[position] = self.mark
    board.display
    winner = board.check_winner
    if winner != "No One"
      display_winner
    end
  end

  def best_move(board) # Robot (O Player) best move, include artificial intelligence
    puts ""
    puts "Robot (O player) is taking turn..."
    flag = true
    sleep 2
    position = check_priority(board)
    board.positions_with_values["#{position}"] = "O"
    winner = board.check_winner
    if winner != "No One"
      puts ""
      board.display
      display_winner
    end
    puts ""
    board.display
  end

  private

  def check_priority(board) # artificial intelligence logic comes here
    flag = true

    x_mark = "X"
    o_mark = "O"

    o_position = position_priority(board, o_mark) # O's position should check first.

    if !o_position.nil?
      return o_position
    end

    x_position = position_priority(board, x_mark)

    if !x_position.nil?
      return x_position
    end

    while flag do
      random_position = 1 + rand(8)
      if board.positions_with_values["#{random_position}"] != "X" and board.positions_with_values["#{random_position}"] != "O"
        board.positions_with_values["#{random_position}"] = "O"
        return random_position
        flag false
      end
    end
  end

  def position_priority(board, mark)
    Board::WINNING_PLACES.each do |winning_place|
      priority_positions_order = [[0, 1, 2], [0, 2, 1], [1, 2, 0]]
      priority_positions_order.each do |priority|
        if (board.positions_with_values["#{winning_place[priority[0]]}"] == mark) and (board.positions_with_values["#{winning_place[priority[1]]}"] == mark)
          if board.positions_with_values["#{winning_place[priority[2]]}"] == " "
            return winning_place[priority[2]]
          end
        end
      end
    end
    return nil
  end

  def display_winner
    puts "\n*************| Result |*************"
    if self.mark == "X"
      puts "Congratulation!!!, you won the game\n\n"
    else
      puts "Sorry, you lost the game :( \n\n"
    end
    exit
  end

end