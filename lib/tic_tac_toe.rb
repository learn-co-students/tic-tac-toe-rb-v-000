# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Left column
  [1,4,7],  # Middle column
  [2,5,8],  # Right column
  [0,4,8],  # Diagonal
  [2,4,6]   # Diagonal
]

#Helper methods
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# code your input_to_index and move method here!
def input_to_index(user_input)
  return user_input.to_i - 1
end

def move(board,index,value)
    board[index] = value
    return board
end

def position_taken?(board,index)
  if board[index] == "" || board[index] == " " || board[index] == nil
    return false;
  elsif board[index] == "X" || board[index] == "O"
    return true;
 end
 # (board[index] ==  " " || board[index] == "" || board[index] == nil) ? false : true
end

def valid_move?(board, index)
  if (index.between?(0, 8)  && !position_taken?(board,index))
   return true
 end
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
  display_board(board)
end

def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end

def turn_count(board)
  turn_count = 0
  board.each do |item|
    if (item != nil && item != " ")
      turn_count+=1
    end
  end
  return turn_count
end

def current_player(board)
    return turn_count(board).even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_0 = win_combination[0]
    win_index_1 = win_combination[1]
    win_index_2 = win_combination[2]

    board[win_index_0] == board[win_index_1] && board[win_index_1] == board[win_index_2] && position_taken?(board, win_index_0)

  end
end

def full?(board)
  board.all? do |i|
    i == "X" || i == "O"
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  draw?(board) || won?(board) || full?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[won?(board)[0]]
  end
end
