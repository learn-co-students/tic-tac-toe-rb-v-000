WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} \n-----------\n #{board[3]} | #{board[4]} | #{board[5]} \n-----------\n #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  int_input = (input.to_i) - 1
end

def move(board, position, player_token)
  board[position] = player_token
end

def position_taken?(board,index)
  if board[index] == " " or board[index] == "" or board[index]== nil
    return false
  end
  if board[index] == "X" or board[index] == "O"
    return true
  end
end

def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0,8) == true
    return true
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
  else
    turn(board)
  end  
  display_board(board)
end

def turn_count(board)
  count = 0 
  board.each do |i|
    if i == "X" || i == "O"
      count += 1 
    end
  end
  return count
end

def current_player(board)
  if turn_count(board) % 2 == 0 
    return "X"
  else
    return "O"
  end

end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 =="O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
else
  false
end

def full?(board)
  board.all? do |box|
    box == "X" || box == "O"
  end
end

def draw?(board)
  if !won?(board) == true && full?(board) == true
    return true
  end
  if won?(board) == false || full?(board) == false
    return false
  end
  if won?(board) == true 
    return false
  end
end


def over?(board)
  if draw?(board) || won?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if win_combination = won?(board)
   return board[win_combination.first]
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end
  
  if won?(board) && winner(board) == "X"
    puts "Congratulations X!"
  end
  if won?(board) && winner(board) == "O" 
    puts "Congratulations O!"
  end
  if draw?(board) == true
    puts "Cat's Game!"
  end
end

  