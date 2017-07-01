WIN_COMBINATIONS = [
  [0,1,2], # Top Row
  [3,4,5], # Middle Row
  [6,7,8], # Bottom Row
  [0,3,6], # First Column
  [1,4,7], # Second Column
  [2,5,8], # Third Column
  [0,4,8], # First Diagonal
  [2,4,6] # Second diagonal
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

def move(board, index, player_token)
  board[index] = player_token
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
  player_token = current_player(board)
  if valid_move?(board, index)
    move(board, index, player_token)
      display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
board.each do |token|
if  token == "X" || token == "O"
    counter += 1
  end
end
return counter
    end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.find do |combination|
    combination.all? {|i| board[i] == "X"} || combination.all? {|i| board[i] == "O"}
  end
end

def full?(board)
 board.none? {|i| i == "" || i == " "}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    nil
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
    if draw?(board)
      puts "Cats Game!"
  elsif
    winner(board)
      puts "Congratulations #{winner(board)}!"
  end
end
