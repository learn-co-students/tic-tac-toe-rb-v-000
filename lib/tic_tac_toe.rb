#Helper Methods

#winning combinations
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

#display board method
board = [" "," "," "," "," "," "," "," "," "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#converts user string into integer
def input_to_index(user_input)
  user_input.to_i - 1
end

# move method
def move(board, index, player_token)
  board[index]= player_token
end

# is the position available
def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    true
  else board[index] == " " || board[index] == "" || board[index] == nil
    false
  end
end

# is the move vaild
def valid_move?(board, index)
  if index == nil || index < 0 || index > 8
    false
  elsif position_taken?(board, index)
    false
  else
    true
  end
end

#complete a single turn
#complete a single turn
def turn(board)
  puts "Please enter 1-9:"
	input = gets.strip
	input = input_to_index(input)
  valid = valid_move?(board, input)
  if valid == true
    move(board, input, current_player(board))
    display_board(board)
  else
    puts "please enter 1-9:"
    input = gets.strip
  end
end

# number of turns played
def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
    end
  end
  counter
end

# who is the current player
def current_player(board)
  turn_count(board)%2 == 0 ? "X" : "O"
end

#define if there is a winner
def won?(board)
 WIN_COMBINATIONS.each do |win_combo|
   if board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X"
     return win_combo
   elsif board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O"
     return win_combo
    end
  end
 return false
end

# is the board full
#define if board is full
def full?(board)
  if board.include?(" ") || board.include?("") # any empty spaces on board
    return false
  else
    return true
  end
end

#no winner and board is full
def draw?(board)
  if !won?(board) && full?(board)
    return true
  end
end

# is game over won, draw, full
def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  end
end

#who won X or O or draw
def winner(board)
  WIN_COMBINATIONS.detect do |win_combo|
    if board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X"
      return "X"
    elsif board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O"
      return "O"
    else
    end
  end
end

# main method of TTT creates game loop
def play(board)
 until over?(board)
	turn(board)
 end
 if won?(board)
   puts "Congratulations #{winner(board)}!"
 else
   puts "Cats Game!"
 end
end
