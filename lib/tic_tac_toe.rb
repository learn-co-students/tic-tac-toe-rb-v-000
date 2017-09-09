# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,4,8],  # Diagonal Left Top to Right Bottom
  [2,4,6],  # Diagonal Right Top to Left Bottom
  [0,3,6],  # Left Col
  [1,4,7],  # Middle Col
  [2,5,8]   # Right Col
]

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

def move(board, index, current_player)
  board[index] = current_player
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

def turn_count(board)
  spaces = 0
  board.each do |space|
    if space != " " && space != "" && space != nil
      spaces += 1
    end
  end
  return spaces
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination # return the win_combination indexes that won.
    end
  end
  false
end

def full?(board)
  board.all?{|position| position == "X" || position == "O"}
end

def draw?(board)
  if full?(board) && !(won?(board))
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  win = won?(board)
  if win != false
    board[win[0]]
  else
    return nil
  end
end


# Define your play method below
def play(board)
  while !(over?(board)) do
    turn(board)
  end
  if won?(board)
    win = winner(board)
    puts "Congratulations #{win}!"
  else
    puts "Cat's Game!"
  end
end
