
# Helper Method

 #index values for the various win combinations
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

# prints the current board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# Convert user input to integer
def input_to_index(user_input)
  user_input.to_i - 1
end

# Make user move
def move(board, index, current_player)
  board[index] = current_player
  board
end

# Check if space is taken
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Check if move is valid
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end


# A single complete turn
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index,current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

#Find total number or turns
def turn_count(board)
 turns = 0
 board.each do |position|   #can use .count here:  board.count{|token| token == "X" || token == "O"}
    if position == "X" || position == "O"
       turns += 1
     end
   end
   turns
end

#Determine current player
def current_player(board)
  total_turns = turn_count(board)
  if total_turns %2 == 0
    "X"
  else
    "O"
  end
end

# Determine the winning combination
def won?(board)
  the_win_combination = false
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
      (position_1 == "O" && position_2 == "O" && position_3 == "O")
      the_win_combination = win_combination
      break
    end
  end
  the_win_combination
end

# Determine if board is full
def full?(board)
  is_full = board.all? do |space|
    space =="X" || space == "O"
  end
  if is_full
    true
  end
end

# Determine if game is a draw
def draw?(board)
  if !won?(board) && full?(board)
    true
  end
end

# Determine if game is over
def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  end
end

# Determine the winner
def winner(board)
  if won?(board)
    win_arr = won?(board)
    board[win_arr[0]]
  end
end

#Create the game loop
def play(board)
  until over?(board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
