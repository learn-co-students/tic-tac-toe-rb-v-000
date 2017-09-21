def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]

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

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board, index)
    return true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index=input_to_index(input)
  if valid_move?(board,index)
  move(board, index, current_player(board))
  display_board(board)
  else
  puts "invalid move"
  turn(board)
  end
end

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
   # win_combination == [3,4,5]
  win_index_1 = win_combination[0] # 3
  win_index_2 = win_combination[1] # 4
  win_index_3 = win_combination[2] # 5

  position_1 = board[win_index_1] #board[3]
  position_2 = board[win_index_2] #board[4]
  position_3 = board[win_index_3] #board[5]

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
  else
    false
  end
  end
  false
end

def full?(board)
  if board.include?(" ")
  false
  else
  true
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    true
  else
    false
  end
end

def over?(board)
  if won?(board) == true || full?(board) == true || draw?(board) == true
    true
  else
    false
  end
end

def turn_count(board)
  counter = 0
  board.each do |turns|
  if turns == "X" || turns == "O"
    counter += 1
  end
end
  counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
     "X"
  else turn_count(board) % 2 == 1
     "O"
  end
end

def winner(board)
  if won? (board)
  if board[won?(board)[0]] == "X"
    return "X"
  elsif board[won?(board)[0]] == "O"
    return "O"
  else
    nil
  end
end
end

def play(board)
  until over?(board) || won?(board) || draw?(board)
    turn(board)
  end

  if won?(board)
     puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
     puts "Cats Game!"
  else
    
  end
end
