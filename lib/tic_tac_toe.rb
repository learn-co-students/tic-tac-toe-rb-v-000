# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [ 
[0,1,2], #top row 
[3,4,5], #middle row 
[6,7,8], #bottom row 
[0,3,6], #left column 
[1,4,7], #middle column 
[2,5,8], #right column 
#diagonal top left -> bottom right 
[0,4,8], 
#diagonal top right -> bottom left 
[2,4,6] 
]


# Define your display_board method

def display_board(board) 
puts " #{board[0]} | #{board[1]} | #{board[2]} " 
puts "-----------" 
puts " #{board[3]} | #{board[4]} | #{board[5]} " 
puts "-----------" 
puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


# Define the input_to_index method.

def input_to_index(user_input) 
converted_input = user_input.to_i 
converted_input -= 1 
return converted_input
end


# Define the move method

def move(board, index, current_player) 
board[index] = current_player
return board
end


# Define the position_taken? method

def position_taken?(board, index) 
!(board[index].nil? || board[index] == " ")
end


# Define the valid_move? method

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
index = 0

def valid_move?(board, index) 
  if position_taken?(board, index) 
    false 
  elsif index.between?(0, 8) 
    true 
  else 
    false 
  end 
end


# Define the turn method

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    token = current_player(board)
    move(board, index, token)
    display_board(board)
  else
    turn(board)
  end
end


# Define the turn_count method

def turn_count(board) 
  counter = 0 
  board.each do |token| 
    if token == "X" || token == "O" 
      counter += 1 
    end 
  end 
  counter
end


# Define the current_player method

def current_player(board) 
  if turn_count(board) % 2 == 0 
    return "X" 
  else 
    return "O" 
  end
end


# Define the won? method

def won?(board) 
  WIN_COMBINATIONS.detect do | win_combination |
  
  win_index_1 = win_combination[0] 
  win_index_2 = win_combination[1] 
  win_index_3 = win_combination[2] 
  
  board[win_index_1] == board[win_index_2] &&
  board[win_index_2] == board[win_index_3] && 
  board[win_index_1] != " " 
  
  end 
end


# Define the full? method

def full?(board) 
  board.none? { |position| position == " " } 
end


# Define the draw? method

def draw?(board) 
  full?(board) && !won?(board) 
end


# Define the over? method

def over?(board) 
  won?(board) || draw?(board) 
end 


# Define the winner method

def winner(board)
  if winner = !won?(board)
    return nil
  else
    who_won = board[won?(board)[0]]
  end
  
  if who_won == "X"
    return "X"
  elsif who_won == "O"
    return "O"
  end
end


# Define the play method, and put it all together

def play(board)
  if !over?(board)
    turn(board)
    play(board)
  elsif over?(board)
    if won?(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cat's Game!"
    end
  end
end










