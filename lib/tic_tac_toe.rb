WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
#returns modified and updated board

def input_to_index(user_input)
  return "#{user_input}".to_i - 1
end
#returns converted user input to index in board array

def move(board, index, character)
  return board[index] = character
end
#returns modified board array updated with player's token

def position_taken?(board, index)
  !(board[index] == " " || board[index] == "" || board[index] == nil)
end
#returns false if position is not taken & true if taken

def valid_move?(board, index)
  !(position_taken?(board,index)) && index.between?(0, 8)
end
#returns true if move is value & false if move is invalid

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, character = current_player(board))
    display_board(board)
  else
    turn(board)
  end
end
#returns board with turn (X or O) if move is valid & returns "Please enter 1-9" if not valid

def turn_count(board)
  counter = 0
  board.each do | move |
    if move == "X" || move == "O"
      puts counter += 1
    end
  end
  counter #This should be the number of turns
end
#returns the number of turns that have been played

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end
#returns X if turn count is even & returns O if turn count is odd

def won?(board)
  WIN_COMBINATIONS.detect do | win_combination |
      (board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X")||
      (board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O")
  end
end
#returns array if winning combo is found & false/nil if no winning combo

def full?(board)
  board.all? do |spot|
    (spot == "X") || (spot == "O")
  end
end
#returns true if board is full & false if board is empty/in progress

def draw?(board)
  if (!full?(board) && !won?(board)) || won?(board)
    false
  elsif full?(board) == true
    true
  end
end
#returns true if board is full & false if board is not full and no one has won or someone has won

def over?(board)
  draw?(board) || full?(board) || won?(board)
end
#returns true if draw, full, or won

def winner(board)
  won = won?(board) #get the indexes of the winning player
  if won # if it did not return false, you can also use an array check
    board[won[0]] # return the item on the board at the winning index
  end
end
#returns X if X wins or O if O wins

def play(board)
  character = current_player(board)
  until over?(board)
    turn(board)
  end
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
