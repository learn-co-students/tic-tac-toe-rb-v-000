WIN_COMBINATIONS = [
  [0,1,2], 
  [3,4,5],
  [6,7,8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6] 

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index
  input.to_i -1
end

def move (board, position, token)
  board(position) = token
end

def position_taken?(board, position)
  board(position) == "X" || board(position) == "O"
end

def valid_move?(board, position)
  board(position).between(0,8) && position_taken?(board, position)
end

def turn(board)
  puts "Choose a position (1-9)"
  position = input_to_index
  valid_move(board, position) ? move(board, position, current_player(board)) : turn(board)
end

def turn_count
  board.count = {|position|, position_taken?(board, board.index(position))}
end

def current_player(board)
  turn_count(board) ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |COMBO|
    (board[COMBO[0]] == "X" && board[COMBO[1]] == "X" && board[COMBO[2]] == "X") ||
    (board[COMBO[0]] == "O" && board[COMBO[1]] == "O" && board[COMBO[2]] == "O")
  end
end

def full?(board)
  turn_count(board) == 9 
end

def draw?(board)
  full?(board) == !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
 winning_combo = WIN_COMBINATIONS.select do |COMBO|
     (board[COMBO[0]] == "X" && board[COMBO[1]] == "X" && board[COMBO[2]] == "X") ||
    (board[COMBO[0]] == "O" && board[COMBO[1]] == "O" && board[COMBO[2]] == "O")
  end
   !winning_combo.empty? ? board[winning_combo.first.first] : nil 
 end
 
 def play(board)
   until over?(board)
   turn?(board)
 end
 if won?(board)
   puts "Congradulations #{winner(board)}!"
 else 
   puts "Cats Game!"
 end