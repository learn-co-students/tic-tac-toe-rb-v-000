class TicTacToe

def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

 WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]

def input_to_index (user_input)
      user_input.to_i- 1
    end

def position_taken?(index)
  if @board[index] == " " || @board[index] == ''
    return false
  else
    return true
  end
end

def move(index, player_token = "X")
      @board[index] = player_token
end

def valid_move? (index)
      if @board[index] == " "
        true
      else
        false
        end
      end

# def turn(board)
#         puts "Please enter 1-9:"
#         input = gets.strip
#         index = input_to_index(input)
#         if valid_move?(board, index)
#           move(board, index)
#           display_board(board)
#         else
#           puts "Please enter 1-9:"
#           turn(board)
#   end
# end
end
