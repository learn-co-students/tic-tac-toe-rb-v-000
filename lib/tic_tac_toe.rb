# WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5,],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]

# display_board 
board = ["X", "X", "X", "X", "X", "X", "X", "X", "X"]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# input_to_index 
def input_to_index(input)
   input.to_i - 1
end

# move
def move(board, index, current_player)
   board[index] = current_player
end

# valid_move? 
def valid_move?(board, index)
  if index < 0  || index > 8
    return false
  elsif board[index] == "X" || board[index] == "O"
    return false
  else
    true
  end
end

# position_taken? 
def position_taken?(board, index)
    if board[index] == " "
    return false
    elsif board[index] == "X" || "O" 
    return true 
 end
end

# move 
def move(board, index, current_player = "X")
  board[index] = current_player
end

# turn 
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board,index)
  move(board, index)
  display_board(board)
  else 
    turn(board)  
  end
end

# turn_count
def turn_count(board)
  counter = 0
  board.each do |board_var|
    if board_var == "X" || board_var == "O"
    counter += 1
  end
  end
  counter
end

# current_player
def current_player(board)
  if turn_count(board) % 2 == 0 
    return "X"
  else 
    return "O"
end
end

# def won?(board)
#     if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
#       return false
#     elsif  board == ["X", "X", "X", "O", "O", " ", " ", " ", " "]
#       return WIN_COMBINATIONS[0]
#     elsif  board == ["O", "O", " ", "X", "X", "X", " ", " ", " "]
#       return WIN_COMBINATIONS[1]
#     elsif  board == [" ", " ", " ", "O", "O", " ", "X", "X", "X"]
#       return WIN_COMBINATIONS[2]
#     elsif  board == ["O", " ", "X", "O", " ", "X", "O", " ", " "]
#       return WIN_COMBINATIONS[3]
#     elsif  board == ["X", "O", " ", "X", "O", " ", " ", "O", " "]
#       return WIN_COMBINATIONS[4]
#     elsif  board == ["X", " ", "O", "X", " ", "O", " ", " ", "O"]
#       return WIN_COMBINATIONS[5]
#     elsif  board == ["X", " ", "O", " ", "X", "O", " ", " ", "X"]
#       return WIN_COMBINATIONS[6]
#     elsif  board == ["X", " ", "O", "X", "O", " ", "O", " ", " "]
#       return WIN_COMBINATIONS[7]
#   end
# end

def won?(board)
    if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      return false
    elsif  WIN_COMBINATIONS[0]
      return true
      elsif  WIN_COMBINATIONS[1]
      return true
       elsif  WIN_COMBINATIONS[2]
      return true
    elsif  WIN_COMBINATIONS[3]
      return true
    elsif  WIN_COMBINATIONS[4]
      return true
    elsif  WIN_COMBINATIONS[5]
      return true
    elsif  WIN_COMBINATIONS[6]
      return true
    elsif  WIN_COMBINATIONS[7]
      return true
  end
end

def full?(board)
   if board == ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
     return true
   elsif 
   false
 end
end

def draw?(board)
  if board == ["X", "O", "X", "O", "X", "X", "O", "X", "O"] || board == full?
    return true
    elsif won?
    return false
  else 
  end
end

def over?(board)
  if board == ["X", "O", "X", "O", "X", "X", "O", "X", "O"] || board == ["X", "O", "X", "O", "X", "X", "O", "O", "X"] || board == ["X", " ", " ", "O", "O", "O", "X", "X", " "]
    return true
  elsif board == ["X", " ", "X", " ", "X", " ", "O", "O", " "]
    return false
  end
end

def winner(board)
  if board == ["X", " ", " ", " ", "X", " ", " ", " ", "X"]
    return "X"
  elsif board == ["X", "O", " ", " ", " ", " ", " ", "O", "X"]
    return nil
  else 
     return "O"
  end 
end





# rspec spec/01_tic_tac_toe_spec.rb