WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [2, 4, 6],
  [0, 4, 8]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  indexInput = user_input.to_i
  indexInput - 1
end

def move(array, index, player_token)
  array[index] = player_token
end

def position_taken?(board, index)
  board[index] == "X" || board[index] == "O"
end

def valid_move?(board, index)
  indexMove = index.to_i
  indexMove - 1
  indexMove.between?(0, 8) && !position_taken?(board, index)
end

# def turn(board)
#   puts "Please enter 1-9:"
#   input = gets.strip
#   index = input_to_index(input)
#   if valid_move?(board, index)
#     move(board, index, player_token)
#     display_board(board)
#   else
#     puts "Invalid Move"
#     display_board(board)
#     turn(board)
#   end
# end
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if !valid_move?(board, index)
    turn(board)
  end
  move(board, index, current_player(board))
  display_board(board)

end

# ask for input
# get input
# convert input to index
# if move is valid
#   make the move for index and show board
# else
#   ask for input again until you get a valid move
# end

def turn_count(board)
  # in ruby we have a count method that counts the elements based on a condition
  board.count{|token| token == "X" || token == "O"}
end

def current_player(board)
 if turn_count(board) % 2 == 0
    "X"
  else
   "O"
 end

end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|

    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]


    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    position_1 == "X" && position_2 == "X" && position_3 == "X" ||
    position_1 == "O" && position_2 == "O" && position_3 == "O"

  end
end


def full?(board)
  board.all? {|token| token == "X" || token == "O"}
end


def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
 if winning_positions = won?(board) # winning_positions = return value of won?(board), which is an array or nil/false
   board[winning_positions[0]]
 end
end

def play(board)
  puts "Enter X or O, please:"
  # counter = 0
  #   if !over?(board)
  #     while counter < 9
  #     turn(board)
  #     counter +=1
  #     end
  #   else
  #     while counter < 9
  #       winner(board) == "X"
  #       puts "Congratulations X!"
  #       counter +=1
  #
  #       winner(board) == "O"
  #       puts "Congratulations O!"
  #       counter +=1
  #
  #     end

  #   turn(board)
  #   counter +=1
  # end
  # while !over?(board)
  #   turn(board)
  # end
counter = 0
  while counter < 9
    if winner(board) == "X"
      "Congratulations X!"
    elsif winner(board) == "O"
      "Congratulations O!"
    else draw?(board)
      "Cat's Game!"
    end
    turn(board)
    counter += 1
  end
end
