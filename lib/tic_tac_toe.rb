WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # From index 0 straight down left
  [1,4,7], # From index 1 straight down center
  [2,5,8], # From index 2 straight down right
  [2,4,6], # From index 0 diagonal to index 8
  [0,4,8] # From index 2 diagonal to index 6
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  move = user_input.to_i - 1
end

def move(board, index, character) #something seems stuck here
  board[index] = character
end

def position_taken? (board, index)
  taken = nil
  if (board[index] ==  " " || board[index] == " " || board[index] == nil)
  taken = false
  else
  taken = true
  end
  taken
end

def valid_move?(board, index)
  move = index.to_i - 1
  if (position_taken?(board, index) || index.between?(0, 8) == false) # <- originally got syntax error, added parentheses to get tests passings.
    return false
  else
    return true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  token = current_player(board)
end

def turn_count(board)
  count = 0
  board.each do |index|
    if index == "X" || index == "O"
      count += 1
    end
  end
  count #changed from turn_count to count
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
    WIN_COMBINATIONS.detect do |win_combination| #review .detect method
        position_taken?(board, win_combination[0]) && (board[win_combination[0]] == board[win_combination[1]]) && (board[win_combination[1]] == board[win_combination[2]])
    end
end

def full?(board)
  WIN_COMBINATIONS.all? do |turn|
    position_taken?(board, turn[0])
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    return true
  end
end

def winner(board)
  WIN_COMBINATIONS.detect do |winner|
    if position_taken?(board, winner[0]) && board[winner[0]] == "X" && board[winner[1]] == "X" && board[winner[2]] == "X"
      return "X"
    elsif position_taken?(board, winner[0]) && board[winner[0]] == "O" && board[winner[1]] == "O" && board[winner[2]] == "O"
      return "O"
    end
  end
end

def play(board) #Needs work here
  until over?(board) || won?(board) = true
    turn(board)
  end
  if draw?(board)
    puts "Cats Game!"
  elsif won?(board)
    puts "Congratulations!"
  end
end

#Review lab as this was not clear and there are some errors
