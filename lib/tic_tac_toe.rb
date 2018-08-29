# Helper Method

# def position_taken?(board, index)
#   !(board[index].nil? || board[index] == " ")
# end

# Helper Methods for Game Play

# Define your play method below

def play(board)
  until over?(board) == true
    turn(board)
  end
  if won?(board) != nil
    winner(board)
  elsif draw?(board) == true
    puts "Cat's Game!"
  else
    nil
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    player_token = current_player(board)
    move(board, index, player_token)
  else
    turn(board)
  end
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def move(board, index, player_token)
  board[index] = player_token
  over?(board)
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def current_player(board)
  count = turn_count(board)
  current_player = ""
  if count % 2 == 0 
    current_player = "X"
  else 
    current_player = "O"
  end
  current_player
end

def turn_count(board)
  count = 0
  board.each do | object |
    if object == "X" || object == "O"
      count += 1
    end
  end
  count
end

# Helper Methods for Determining Game State

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
  
def won?(board)
count = 0
while count <= WIN_COMBINATIONS.length-1
  win_combination = WIN_COMBINATIONS[count]

  win_index1 = win_combination[0]
  win_index2 = win_combination[1]
  win_index3 = win_combination[2]
  
  position_1 = board[win_index1]
  position_2 = board[win_index2]
  position_3 = board[win_index3]

  if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
    winning_array = [win_index1,win_index2,win_index3]
  end
  count += 1
end
winning_array
end

def full?(board)
  !board.include?(" ") #=> true
end

def draw?(board)
  won = won?(board)
  full = full?(board)
  if won == nil && full == true
    true
  elsif won != ""
    false
  end
end

def over?(board)
  if won?(board) != nil || draw?(board) == true || full?(board) == true
    true
  end
end

def winner(board)
  won = won?(board)
  winner = board[won[0]]
  if winner != nil
    puts "Congratulations #{winner}!"
  end
  winner
  end
end
end