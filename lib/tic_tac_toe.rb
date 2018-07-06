WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i-1
end

def move(board, index, value)
  board[index] = value
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
false
  else board[index] == "X" || board[index] == "O"
true
  end
end

def valid_move?(board,index)
  if index.between?(0,8) && (board[index] == " " || board[index] == "")
    true
  else
    false
  end
end

def turn_count(board)
  counter = 0
  board.each do |space|
    if space != " "
      counter += 1
    end
  end
  counter
end

def current_player(board)
  counter = turn_count(board)
  if counter % 2 == 0
     "X"
  else
    "O"
  end
end

def turn(board)
  puts "Where do you want to go? 1-9"
  user_input = gets.strip
  index = input_to_index(user_input)
  if position_taken?(board,index) == false && valid_move?(board,index) == true
    value = current_player(board)
    move(board,index,value)
    display_board(board)
  else
    turn(board)
  end
end

def won? (board)
  WIN_COMBINATIONS.each do |win_index|
    board_position_1 = board[win_index[0]]
    board_position_2 = board[win_index[1]]
    board_position_3 = board[win_index[2]]
    if board_position_1 == board_position_2 && board_position_2 == board_position_3 && position_taken?(board, win_index[0])
      return win_index
    end
  end
  false
end

def full? (board)
  board.none?{|space| space == " " }
end

def draw? (board)
  if won?(board) == false && full?(board) == true
    return true
  end
end

def over? (board)
  if won?(board) || full?(board) || draw?(board) == true
    return true
  end
end

def winner (board)
  if won?(board) == false
    return nil
  end
  if board[won?(board)[0]] == "X"
    return "X"
  else "O"
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  else
    puts "Cat's Game!"
  end
end
