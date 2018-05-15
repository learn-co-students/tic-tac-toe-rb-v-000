require "pry"

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #left column
  [1, 4, 7], #middle column
  [2, 5, 8], #right column
  [0, 4, 8], #UL to LR diagonal
  [6, 4, 2]  #LL to UR diagonal
  ]

def input_to_index(user_input) #allows user to input
  user_input.to_i - 1 #gets user input, less one (1) to refer to array index
end

def move(board, index, token) #establishes the location and "X" or "O" of the move
  board[index] = token
end

def position_taken?(board, index) #checks to see if position is taken
  if board[index] == "" || board[index] == " "
  return false
  else
  return true
  end
end

def valid_move?(board, index) #checks if a valid move
  if index.between?(0,8) && !position_taken?(board, index)
  return true
  else
  return false
  end
end

def turn(board) #runs the cycle of each player turn
  puts "Please enter 1-9:"
    user_input = gets.strip
    #input_to_index(user_input) #delete this if doesn't fix
    index = input_to_index(user_input)
    if valid_move?(board, index) 
      move(board, index, current_player(board))
    else
      turn(board)
    end
end

def turn_count(board)
  turn_count = 0
  board.each do | cell |
    if cell == "X" || cell == "O"
      turn_count += 1
    end
  end
  return turn_count
end

def current_player(board) #determines if current player is "X" or "O"
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end
end

def won?(board) #checks for winning combination
  WIN_COMBINATIONS.detect do | win_combination |
    board[win_combination[0]] == board[win_combination[1]] && board[win_combination[0]] == board[win_combination[2]] && position_taken?(board, win_combination[0]) # checks if is "X" or "O" that occupies [0], which tells you implicitly which player occupies rest of WIN_COMBINATION that wins
  end
end

def full?(board) #checks if board full
  board.all? {|cell| cell == "X" || cell == "O"}
  #if !board.include?("") || !board.include?(" ")
#    return true
#  elsif !board.include?("") || !board.include?(" ") && !won?(board)
#    return true
 #  elsif board.include?("") || board.include?(" ") #NEED TO RETURN FALSE FOR IN-PROGRESS GAME
#  else false
#  end
end

def draw?(board) #checks if a draw
  if !won?(board) && full?(board)
    return true
#  elsif !won?(board) && !full?(board)
#    return false
#  else won?(board)
#    return false
  end
end

def over?(board) #checks if game is over
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false #NEED TO RETURN FALSE FOR IN-PROGRESS GAME
  end
end

def winner(board) #checks if a winner or not
  if won?(board)
    return board[won?(board)[0]] #returns the first instance of the winning player "X" or "O"
#    if board[won?(board)[0]] == "X"
#      puts "Congratulations X!"
#    else
#      puts "Congratulations O!"
#    end
#  else
#    nil
  end
end

def play(board)
  turn = 0
  while turn < 9
    turn(board)
    turn += 1
  end
end

def play(board)
#  input = gets
  until over?(board)
    turn(board)
  end
  if won?(board)
    winner(board) == "X" || winner(board) == "O"
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
