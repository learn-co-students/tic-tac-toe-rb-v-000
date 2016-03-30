WIN_COMBINATIONS = [
   [0,1,2],
   [3,4,5],
   [6,7,8],
   [2,4,6],
   [0,4,8],
   [0,3,6],
   [1,4,7],
   [2,5,8]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]


def valid_move?(board, position)
  position = position.to_i - 1
  if position_taken?(board, position) == false && position.between?(0, 10)
    return true
  elsif board[position] == "X" || board[position] == "O"
    return false
  end
end

def position_taken?(board, position)
  if board[position] == "X" || board[position] == "O"
    true
  elsif board[position] == "" || board[position] == " " || board[position] == nil
    false
  end
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def move(board, position, current_player = "X")
  board[(position.to_i - 1)] = current_player
end

def turn(board)
  puts "Please enter 1-9:"
   position = gets.strip
   if valid_move?(board, position)
    move(board, position, current_player(board))
    display_board(board)
  else  
    puts "Invalid input, try again:" 
    turn(board)
  end
end
  board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
def turn_count(board)
  counter = 0
  board.each do |x|
  
  if x == "X" || x == "O"
  counter += 1

    end
  end
  return counter
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
end
  end
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def won?(board)
    WIN_COMBINATIONS.detect do |combo|
      
   board[combo[0]] == board[combo[1]] &&
   board[combo[1]] == board[combo[2]] &&
   position_taken?(board, combo[0])
      end
end
   
  

def full?(board)
  board.all? do |token|
      token == "X" || token == "O"
end 
end

def draw?(board)
  full?(board) && !won?(board)
    
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
if winning_combo = won?(board)
  board[winning_combo.first]
end
end
def play(board)
   until over?(board)
      turn(board)
    end
  if over?(board)
    if won?(board)
      puts "Congratulations " + winner(board) + "!"
        else
          puts "Cats Game!"
  end
 end
end 
