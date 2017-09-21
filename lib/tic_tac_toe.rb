puts "Welcome to Tic Tac Toe!"
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

board = [" "," "," "," "," "," "," "," "," "]
def display_board(board)
	puts " #{board[0]} | #{board[1]} | #{board[2]} "
	puts "-----------"
	puts " #{board[3]} | #{board[4]} | #{board[5]} "
	puts "-----------"
	puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(string)
  return string.to_i - 1
end

def position_taken?(board, index)
  if board[index] == " "
  return false
  elsif board[index] == ""
  return false
  elsif board[index] == nil
  return false
  else board[index] == "X" || board[index] == "O"
  end
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def move(board, index, player)
  return board[index] = player
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

def turn_count(board)
  counter = 0
  whilecounter = 0
  while board.length > whilecounter
    if (board[whilecounter] == "X" || board[whilecounter] == "O")
    counter += 1
    end
    whilecounter += 1
  end
  return counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  #if empty board, return false
  #if draw, return false
  WIN_COMBINATIONS.detect do | win_combination | # win_combination is going to be on the first loop [0,1,2]
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    position_1 == position_2 && position_1 == position_3 && position_taken?(board, win_index_1)
  end
end

def full?(board)
 #  if draw, return true
 #  if in-progress game, return false
 # if draw? == true
 #   return true
 # if over? == false
 #   return false
 board.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
# if there is a draw, no one has won and the board is full
# conditions automatically return true and false, and if that condition is the last thing a ruby method reads, it will return the condition's return value
  if won?(board) == nil && full?(board) == true
    return true
  end
    return false
end

def over?(board)
  #if a draw, returns true
  if draw?(board) || full?(board)|| won?(board)
    return true
  end
  # if !position_taken(board)
  #   return false
  # end
end

def winner(board)
  win_combination = won?(board)
  if win_combination == nil
    return nil
  end
  if board[win_combination[0]] == "X"
    return "X"
  end
  if board[win_combination[0]] == "O"
    return "O"
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations " + winner(board) + "!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end




#   input = gets.strip
#   index = input_to_index(input)
#   if valid_move?(board, index)
#     while turn_count < 9
#       turn(board)
#       turn_count += 1
#     end
#   else

#until is the opposite of while loop, stated
  #4 things that can ever be happening
  #1 GET the value of a variable
  #2 SET the value of a variable
  #examples:
  #puts index
  #a = 9
  #3 DEFINE the steps of a function
  #4 EXECUTE the steps of a function
  # turn_count = 0
