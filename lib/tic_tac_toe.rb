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

board = [" "," "," "," "," "," "," "," "," "]

def input_to_index(input)
  index = input.to_i - 1 
  index
end

def move(board, index, character)
  board[index] = character
  board
end 

def position_taken?(board, index)
  if board[index] == " " || board[index] == ""
    return false 
  elsif board[index] == "X" || board[index] == "O"
    return true 
  end
end

def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index)
end 

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    character = "#{current_player(board)}"
    move(board, index, character)
    display_board(board)
  else
    puts "This is an invalid entry."
    turn(board)
  end
end

def turn_count(board)
  counter = 0 
  board.each do |spot|
    if spot == "X" || spot == "O"
      counter += 1 
    end
  end 
  return counter
end 

def current_player(board)
  if turn_count(board).even?
    return "X" 
  else 
    return "O" 
  end 
end 

def won?(board)
    WIN_COMBINATIONS.detect do |wins|
      wins1 = wins[0]
      wins2 = wins[1]
      wins3 = wins[2]
      if board[wins1] == "X" && board[wins2] == "X" && board[wins3] == "X"
        wins 
      elsif board[wins1] == "O" && board[wins2] == "O" && board[wins3] == "O"
        wins
      end 
    end 
  end 
  
  def full?(board)
    board.all? do |move|
      move == "X" || move == "O"
    end
  end 

 def draw?(board)
    !won?(board) && full?(board)
  end 
  
def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else 
    return false
  end
end 
  
def winner(board)
  if won?(board)
  winnerwinner = won?(board)
  board[winnerwinner.first]
  end 
end 

def play(board)
  until over?(board) == true 
    turn(board)
  end 
    if won?(board) 
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cat's Game!"
    end
end 





