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
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    current_player = current_player(board)
    move(board, index, current_player)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do|position|
    if position == "X"
      counter += 1
    elsif position == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  if turn_count(board) % 2 == 0 
    return "X"
  else
    return "O"
  end
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0, 1, 2], 
  [3, 4, 5], 
  [6, 7, 8], 
  [0, 3, 6], 
  [1, 4, 7], 
  [2, 5, 8], 
  [0, 4, 8], 
  [2, 4, 6]
  ]
  
 def won?(board) 
   WIN_COMBINATIONS.detect do |win_combination|
     win_index_1 = win_combination[0]
     win_index_2 = win_combination[1]
     win_index_3 = win_combination[2]
     position_1 = board[win_index_1]
     position_2 = board[win_index_2]
     position_3 = board[win_index_3]
      (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
    end
  end
  
  def full?(board)
    board.all? do |position|
      position == "X" || position == "O"
    end
  end
    
  def draw?(board)
    !won?(board) && !!full?(board)
  end
  
  def over?(board)
    !!won?(board) || !!full?(board)
  end

def winner(board)
  if won?(board) 
    winning_positions = won?(board)
    variable_location = winning_positions[0]
    if board[variable_location] == "X"
    board.detect{|x| x == "X"}
    else board.detect{|o| o == "O"}
  end
  end
end

def play(board)
  turn(board)
  if won?(board) == true 
    winner = winner(board)
    puts "Congratulations ${winner}!"
  elsif over?(board)
    puts "Cat's Game!"
  else
    play(board)
  end
end