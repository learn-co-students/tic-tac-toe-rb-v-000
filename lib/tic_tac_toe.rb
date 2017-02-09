#index values for various win combinations in tic tac toe
WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 4, 8], #left diagonal
  [2, 4, 6], #right diagonal
  [0, 3, 6], #left vertical
  [1, 4, 7], #middle vertical
  [2, 5, 8]  #right vertical
]

# Define the variable board below.
board = [" ", " ", " ", " ", " ", " ", " ", " ", " " ]


#prints the current board respresentation
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


#converts user input into board index
def input_to_index(input)
  input.to_i - 1
end

#adds the character of the player to the index on the board
def move(board, index, char)
  board[index] = char
end

#checks to see if the position on the board is taken. If it is taken, true, if not, false.
def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    true
  else board[index] != "X" || board[index] != "O"
    false
  end
end

#checks to see if the move is valid.
def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0,8)
    true
  else
    false
  end
end

#

def turn(board)
    puts "Please enter 1-9:"
    char = current_player(board)
    input = gets.strip
    index = input_to_index(input)
      if valid_move?(board, index)
        move(board, index, char)
        display_board(board)
		# check to see if someone won
		# after making a valid move
    winner = winner(board)
    if draw?(board)
      puts "Cats Game!"
    elsif won?(board)
      puts "Congratulations #{winner}!"
		end


      else
        turn(board)
      end
end

def turn_count(board)
counter = 0
board.each do |turn|
  if turn == "X" || turn == "O"
    counter += 1
  end
end
counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combinations|
    win_index_1 = win_combinations[0]
    win_index_2 = win_combinations[1]
    win_index_3 = win_combinations[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
  if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combinations
  else
    false
  end
  end
end

def full?(board)
  board.all? do |index|
    index == "X" || index == "O"
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  win_index = won?(board)
    if won?(board)
      return board[win_index[0]]
    end
end

def play(board)
  until over?(board)
    turn(board)
  end
end
