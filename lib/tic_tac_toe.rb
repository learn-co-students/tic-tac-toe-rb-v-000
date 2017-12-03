# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
   [0,1,2], # Top row
   [3,4,5],  # Middle row
   [6,7,8],  # Bottom row
   [0,3,6],  # Left col
   [1,4,7],  # Middle col
   [2,5,8],  #Right col
   [0,4,8], #Diag Right
   [2,4,6] #diag left
 ]

def won? (board)#returns winning array if someone won, false if no one did
if board==[" "," "," "," "," "," "," "," "," "]
  false
end
WIN_COMBINATIONS.each do |win_combination|
  # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
  # grab each index from the win_combination that composes a win.
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
false
end

def full? (board)
if board.include?(" ")
    false
else
  true
end
end

def draw? (board)
  if !full?(board)
    false
  elsif !won?(board)
    true
  else
    false
  end
end

def over?(board)
if draw?(board)
  true
elsif won?(board)
  true
else
  false
end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end

def turn_count (board)
cell = 0
turnCT=0
while cell !=9
  if board[cell]== "X" || board[cell]== "O"
    turnCT +=1
  end
  cell+=1
end
turnCT
end

def current_player (board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end

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

def move(board, index, player)
  board[index] = player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
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

# Define your play method below
def play(board)
moves=0
until moves==8
  if won?(board) != false
    puts "Congratulations #{winner(board)}!"
    break
  end
  if draw?(board)
    puts "Cat's Game!"
    break
  end
  if over?(board)
    break
  end
  turn(board)
  moves+=1
end

end
