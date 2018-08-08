
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
 
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def input_to_index(index)
  index.to_i - 1
end 

def move(board, index, token)
  board[index] = token
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
    move(board, index, token = "X")
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |element|
    if element == "X" || element == "O"
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

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]
  
def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]
  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
    end
  end
end

def full?(board)
  board.none?{|element| element == " "}
end

def draw?(board)
  full?(board)&&!won?(board)
end

def over?(board)
  draw?(board)|| won?(board)
end

def winner(board)
  if winning = won?(board)
  board[winning[0]]
  end
end

def play(board)
 input = gets.strip
 turn(board) until over?(board)
 if winner(board)
   puts "Congratulation, you win!"
 elsif draw?(board)
   puts "It has been a draw."
 end
end


