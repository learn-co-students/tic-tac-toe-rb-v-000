def display_board(board)
  puts " #{ board[0] } | #{ board[1] } | #{ board[2] } "
  puts "-----------"
  puts " #{ board[3] } | #{ board[4] } | #{ board[5] } "
  puts "-----------"
  puts " #{ board[6] } | #{ board[7] } | #{ board[8] } "
end

def input_to_index(user_input)
  return user_input.to_i - 1
end

def player_move(array, index, value)
  array[index] = value
end



def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

def won?(board)
 WIN_COMBINATIONS.each do |combo|
  win_index_1 = combo[0]
  win_index_2 = combo[1]
  win_index_3 = combo[2]

  position_1 = board[win_index_1] # load the value of the board at win_index_1
  position_2 = board[win_index_2] # load the value of the board at win_index_2
  position_3 = board[win_index_3] # load the value of the board at win_index_3

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return combo
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return combo  # return the win_combination indexes that won.
  else
    false
    end
 end
 false
end

def full?(board)
  board.all? do |position_taken|
    position_taken == "X" || position_taken == "O"
end
end

def draw?(board)
 if full?(board) == true && won?(board) == false
   return true
 else
   false
 end
end

def over?(board)
if won?(board)  || full?(board)  || draw?(board)
  return true
end
end

def winner(board)
winning_array = won?(board)
  if winning_array
  board[winning_array[0]]
 else
  nil
  end
end
