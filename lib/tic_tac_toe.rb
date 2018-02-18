WIN_COMBINATIONS =
[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do | index |
    if index == "X" || index == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  return (turn_count(board) % 2 == 0 ? "X" : "O")
end

def won?(board)
  WIN_COMBINATIONS.each do | win_combination |
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    all_O = [position_1, position_2, position_3].all? do | element |
      element == "O"
    end
    all_X = [position_1, position_2, position_3].all? do | element |
          element == "X"
    end
    if all_O || all_X
      return win_combination
    end

    #if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1== "O" && position_2 == "O" && position_3 == "O")
    #  return win_combination
    # end
  end
  # return false if no winning combination found
  return false
end

def full?(board)
  return board.all? {| element | (element == "X" || element == "O")}
end

def draw?(board)
  if (full?(board)) && (!won?(board))
  elsif (!won?(board) && !(full?(board))
  end
end

def over?(board)
  (won?(board) || draw?(board) || full?(board))? true : false
end

def winner(board)
  won?(board)? board[(won?(board))[0]] : nil
end
