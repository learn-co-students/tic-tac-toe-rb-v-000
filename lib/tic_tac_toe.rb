require 'pry'
  # Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

# Helper Methods
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
# code your #valid_move? method here
def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index)
end
# re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
def position_taken?(board, index)
  #Check for an empty board is equal to " "
  if board[index] == " "
    return false
  end
  if board[index] == ""
    return false
  end
  if board[index] == nil
    return false
  end
  if board[index] == "X" || board[index] == "O"
    return true
  end
end
# Input to Index and move method
def input_to_index(user_input)
  user_input.to_i - 1
end
# Add move to board
def move(board, index, player_token)
  board[index] = player_token
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  player_token = current_player(board)
  if valid_move?(board, index)
    move(board, index, player_token)
    display_board(board)
  else
    puts "Number taken please choose again."
    turn(board)
  end
  move(board, index, player_token)
end

def turn_count(board)
  moves = 0
  # Checking each position on the board for an entry
  board.each do |move|
    # If not empty increment moves by one
    if move == "X" || move == "O"
      moves += 1
    end
  end
  #return moves with or without 'return'
  moves
end

def current_player(board)
  # if turn_count(board) % 2 == 0
  #   return "X"
  # else turn_count(board) % 2 != 0
  #   return "O"
  # end
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    position_1 == "X" && position_2 == "X" && position_3 == "X" ||
    position_1 == "O" && position_2 == "O" && position_3 == "O"
  end
end

def full?(board)
  #This is checking to see if there is an x or o in all the spaces on the board
    board.all? do |move|
      move == "X" || move == "O"
    end
end

def draw?(board)
  #If full board and not won
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if won?(board)
     win_index_1 = won?(board)[0]
     return board[win_index_1]
  end
end

def play(board)
  until over?(board) || won?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations " + winner(board) + "!"
  else
    puts "Cat's Game!"
  end
end
