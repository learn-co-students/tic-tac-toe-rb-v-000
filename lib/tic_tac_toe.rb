#defines a constant WIN_COMBINATIONS with arrays for each win combination
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
#prints arbitrary arrangements of the board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# converts a user_input to an integer
def input_to_index(user_input)
  user_input.to_i - 1
end

#does not allow for a default third argument
#takes three arguments: board, position, and player token
def move (board, user_input, character)
  board[user_input] = character
end

#returns true/false based on position in board
def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    true
  elsif board[index] == " " || "" || nil
    false
  end
end

#returns true/false based on position
def valid_move?(board, index)
  if !(position_taken?(board, index)) && index.between?(0,8)
    true
  else
    false
  end
end

#makes valid moves
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

#counts occupied positions
def turn_count(board)
counter = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
    end
 end
 return counter
end

#current player
def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

#returns false for a draw
#returns true for a win
def won?(board)
  WIN_COMBINATIONS.each do |combination|
    if board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X" || board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
      return combination
    end
  end
  return false
end

#returns true for a draw
#returns false for an in-progress game
def full?(board)
  board.each do |index|
    if index != "X" && index != "O"
      return false
    end
  end
  return true
end

#calls won? and full?
def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

#over method
def over?(board)
  if draw?(board) || full?(board) || won?(board)
    true
  end
end

#winner method
def winner(board)
  WIN_COMBINATIONS.detect do |combination|
    if board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X"
      return "X"
    elsif board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
      return "O"
    end
  end
  nil
end


#play
def play(board)
  until over?(board)
    turn(board)
  end

 if winner(board) == "X"
   puts "Congratulations X!"
 elsif winner(board) == "O"
   puts "Congratulations O!"
 else
   puts "Cats Game!"
  end
end
