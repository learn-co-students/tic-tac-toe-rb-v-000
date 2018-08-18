# Helper Methods
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

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def play(board)
  counter = 0
  until over?(board)
    turn(board)
    counter += 1
  end
   if won?(board)
     winner(board) == "X" || winner(board) == "O"
     puts "Congratulations #{winner(board)}!"
   else draw?(board)
     puts "Cat's Game!"
   end
end


def turn_count(board)
  counter = 0
  board.each do |space|
    if space != " "
       counter += 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

def position_taken?(board, location)
  board[location] != " "
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],#Top_row_win
  [3,4,5],#Middle_row_win
  [6,7,8],#Bottom_row_win
  [0,3,6],#Left_column_win
  [1,4,7],#Middle_column_win
  [2,5,8],#Right_column_win
  [0,4,8],#Top_left_to_bottom_right_win
  [2,4,6],#Top_right_to_bottom_left_win
]

def won?(board)
  WIN_COMBINATIONS.find do |win_combo|
    board[win_combo[0]] == board[win_combo[1]] && board[win_combo[0]] == board[win_combo[2]] && position_taken?(board, win_combo[1])
  end
end

def full?(board)
 if board.include?(' ')
   return false
 else
   return true
 end
end

 def draw?(board)
   if !won?(board) && full?(board)
     return true
   end
 end

 def over?(board)
   draw?(board) == true || won?(board) != nil
 end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end
