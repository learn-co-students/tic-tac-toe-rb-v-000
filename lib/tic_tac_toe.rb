
# Define your WIN_COMBINATIONS constant
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
  taken  = nil
  if board[index] ==  " " || board[index] == "" || board[index] == nil
    taken = false
  else
    taken = true
  end
  return taken
end 

def valid_move?(board, index)
  if index.between?(0, 8)
    if !position_taken?(board, index)
      true
    end 
  end 
end 
  

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  current_player = current_player(board)
  if valid_move?(board, index)
    move(board, index, current_player)
  else 
    turn(board)
  end 
end 
  


def turn_count(board)
  turns = 0
  board.each do |token|
    if token == "X" || token == "O"
      turns += 1
    end
  end
  turns
 end
 
 def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end
  


def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    if win_combo.all?{|win_index| board[win_index] == "X"}
      return win_combo
    elsif win_combo.all? {|win_index| board[win_index] == "O"}
      return win_combo
    end 
  end
  return false
end 
      
      
def full?(board)
  board.all? do |index|
    index == "X" || index == "O"
  end
end 

def draw?(board)
  if full?(board) && won?(board) == false
    TRUE
  end 
end 

def over?(board)
  if won?(board) != false || draw?(board)
    TRUE
  end
end

def winner(board)
  WIN_COMBINATIONS.each do |win_combo|
    if win_combo.all?{|win_index| board[win_index] == "X"}
      return "X"
    elsif win_combo.all? {|win_index| board[win_index] == "O"}
      return "O"
    end 
  end
  return nil
end 

def play(board)
until over?(board) do
  turn(board)
end 
if won?(board)
  champion = winner(board)
  puts "Congratulations #{champion}!"
else if draw?(board)
  puts "Cat's Game!"
  end
end 
end 

    
    
