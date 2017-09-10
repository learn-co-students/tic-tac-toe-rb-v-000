
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #first column
  [1,4,7], #middle column
  [2,5,8], #end column
  [0,4,8], #left diagonal
  [2,4,6] #right diagonal
]

board = [" "," "," "," "," "," "," "," "," "]

def display_board(board)
puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

display_board(board)

def input_to_index(user_input)
  user_input = user_input.to_i
  return user_input - 1
end

def move(board, index, player)
  board[index] = player
  return board
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else board[index] == "X" || board[index] = "0"
    true
  end
end

def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0, 8)
    true
  else
    false
  end
end

def turn(board)
puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
 turns = 0
 board.each do |x_or_o|
   if x_or_o == "X" || x_or_o == "O"
     turns += 1
   end
end
turns
end

def current_player(board)
 turn_count(board).even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.find do|win_combination|
    (board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X") ||
    (board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O")
    #position_taken?(board, win_combination[0]) && position_taken?(board, win_combination[1]) && position_taken?(board, win_combination[2])
  end
end

def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if win_combination = won?(board)
    return board[win_combination.first]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end

  if winner(board)
    puts "Congratulations #{winner(board)}!"
  else draw?(board)
    puts "Cat's Game!"
  end
end
