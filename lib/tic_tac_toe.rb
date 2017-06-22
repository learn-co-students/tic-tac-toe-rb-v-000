# win combination constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

# define the board
board = [" "," "," "," "," "," "," "," "," "]

# define board and print it out
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# convert user_input to integer
def input_to_index(user_input)
  user_input.to_i - 1
end

# takes 3 arguments to make a move (should board >> array?)
def move(board, index, value)
  board[index] = value
end

# is the position taken?
def position_taken?(board, index)
  board[index] != " "
end

# is the move valid?
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

# code for a complete turn
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board)) # this needs to reference the current player! 
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  9 - board.count(" ")
end

# check whose turn it is
def current_player(board)
  if turn_count(board).even?
    return "X"
  else return "O"
end
end

# has the game been won?
def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination # return the win_combination indexes that won.
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination # return the win_combination indexes that won.
    end
  end
  return false
end

def draw?(board)
  full?(board) && !won?(board) # full and not won > true, else false
end

def full?(board)
  board.all? {|spot| spot != " "}
end

def over?(board) # full or won?
  draw?(board) || won?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end

# play the game!
def play(board)
  until over?(board)
    turn(board)
  end
  if draw?(board)
    puts "Cats Game!"
  else
    puts "Congratulations #{winner(board)}!"
  end
end
