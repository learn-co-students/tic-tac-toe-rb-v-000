# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def empty_board?(board)
  board.all? do |position|
  position == nil || position == "" || position == " "
 end
end

def draw?(board)
  if full_board?(board) == true
    return true
  end
end

def top_board_win?(board)
  if board[0] == "X" &&  board[1] == "X" && board[2] == "X"
    return true
   elsif board[0] == "O" &&  board[1] == "O" && board[2] == "O"
     return true
  end
end
 
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
 
def input_to_index(input)
  input.to_i - 1
end
  
def move(board, position, player = "X")
  board[position] = player
end

def valid_move?(board, index)
  valid = nil
  if position_taken?(board, index) == true || !index.between?(0 , 8)
    valid = false
  elsif position_taken?(board, index) == false && index.between?(0 , 8)
    valid = true
  end
end
    
def position_taken?(board, index)
  taken = nil
  if board[index] == nil || board[index] == " " || board[index] == ""
  taken = false
  elsif board[index] == "X" || board[index] == "O"
  taken = true
end
end

def turn(board)
 puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
 if valid_move?(board, index) == true
   move(board, index, character = "X")
   display_board(board)
 else 
   turn(board)
 end
end

def turn_count(board)
  counter = 0
  board.each do |space|
  if space == "X" || space == "O"
    counter += 1
  end
  end
counter
end
    
 def current_player(board)
  # board.each do |move|
  if turn_count(board) % 2 != 0
    "O"
  elsif turn_count(board) % 2 == 0
    "X"
  end
end

def play(board)
  count = 0
  until count == 9
   turn(board)
   count += 1
 end
 end

 WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # Bottom row
  [0,4,8], # Diagonal A
  [2,4,6], # Diagonal B
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8] # Right column
]

def won?(board)
WIN_COMBINATIONS.detect do |position| 
  if board[position[0]] == "X" && board[position[1]] == "X" && board[position[2]] == "X"
    position
  elsif board[position[0]] == "O" && board[position[1]] == "O" && board[position[2]] == "O"
    position
  else
    false
  end
  end 
end

def full?(board)
  board.all?{|i| i == "X" || i == "O"}
end
 
def draw?(board)
  if !won?(board) && full?(board)
    true
  # elsif !won?(board) && !full?(board)
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  elsif 
    false
  end
end

def winner(board)
  if !won?(board)
    return nil
  elsif won?(board)
    return board[won?(board)[0]]
end
end

