WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #1st column
  [1,4,7], #2nd column
  [2,5,8], #third column
  [0,4,8], #1 diagonal
  [2,4,6] #2nd diagonal
]

#displays game board
def display_board(board)
  puts " #{board[0]} " + "|" + " #{board[1]} " + "|" + " #{board[2]} "
  puts "-----------"
  puts " #{board[3]} " + "|" + " #{board[4]} " + "|" + " #{board[5]} "
  puts "-----------"
  puts " #{board[6]} " + "|" + " #{board[7]} " + "|" + " #{board[8]} "
end

#converts player input to board index
def input_to_index(input)
  input = input.to_i - 1
end

#assign player X or O's move
def move(board, input, player)
  board[input] = player
end

#checks is position is taken
def position_taken?(board, index)
  if board[index] == " " || board[index] == ""
     false
  elsif board[index] == "O" || board[index] == "X"
     true
   elsif board[index] == nil
     false
  end
end

#checks if move is valid
def valid_move?(board, index)
  if position_taken?(board, index)
    false
  elsif index.between?(0, 8)
    true
  end
end

#player turn
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

#counts the amount of turns
def turn_count(board)
  counter = 0
  board.each do |space|
    if space == "X" || space == "O"
      counter += 1
    end
  end
  return counter
end

#returns X or O based on turn count
def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

#checks for win combinations
def won?(board)
  WIN_COMBINATIONS.each do |combo|
     if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
       return combo
     elsif board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
       return combo
     else
     end
  end
  return false
end

#checks if board has all indexes filled
def full?(board)
  all_full = false
  board.all? do |space|
    if space == "X" || space == "O"
      all_full = true
    end
  end
end

#checks if board is full w/o a win
def draw?(board)
  if won?(board)
    false
  elsif full?(board)
    true
  else
    false
  end
end

#checks if the game is won or if there is a draw
def over?(board)
  if won?(board)
    true
  elsif draw?(board)
    true
  else
    false
  end
end

#checks and returns winner's token
def winner(board)
  WIN_COMBINATIONS.each do |combo|
     if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
       return "X"
     elsif board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
       return "O"
     else
     end
  end
  return nil
end

def play(board)
  until over?(board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations " + winner(board) + "!"
  end
  if draw?(board)
    puts "Cats Game!"
  end

end
