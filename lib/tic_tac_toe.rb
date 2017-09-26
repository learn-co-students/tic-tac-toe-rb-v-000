WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
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

def position_taken? (board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
     false
  else
     true
end
end

def valid_move? (board, index)
if index.between?(0,8) && !position_taken?(board, index)
  true
else
  false
end
end

def turn(board)
  puts "Please enter 1-9:"
 user_input = gets.strip
index = input_to_index(user_input)
until valid_move?(board, index) == true
  puts "please try a valid move. Use an empty location 1 through 9"
  user_input = gets.strip
 index = input_to_index(user_input)
end
move(board, index, current_player(board))
display_board(board)
end

def turn_count(board)
    count = 0
  board.each do |player|
    if player == "X" || player == "O"
      count += 1
  end
end
  return count
end

def current_player(board)
  if turn_count(board) % 2 == 0
     "X"
  else
     "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win = win_combination.all? do |index|
      board[index] == "X"
    end
    if win
      return win_combination
    end
    win = win_combination.all? do |index|
      board[index] == "O"
    end
    if win
      return win_combination
    end
  end
  return false
end

def full?(board)
  board.none?{|token| token == " "}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end


def winner(board)
 if !(won?(board))
   return nil
 end
   if board[won?(board)[0]] == "X"
     return "X"
   end
  if board[won?(board)[0]] == "O"
    return "O"
end
end

def play(board)
   until over?(board)
     turn(board)
   end
   if won?(board)
     puts "Congratulations #{winner(board)}!"
   else draw?(board)
     puts "Cat's Game!"
   end
 end
