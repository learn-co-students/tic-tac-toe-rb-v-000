WIN_COMBINATIONS = [
  [0, 1, 2], # top rows
  [3, 4, 5], # middle rows
  [6, 7, 8], # bottom rows
  [0, 3, 6], # first vertical rows
  [1, 4, 7], # second vertical rows
  [2, 5, 8], # third vertical rows
  [0, 4, 8], # diagonal rows
  [2, 4, 6] # diagonal rows
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

def move(board, index, player)
  board[index] = "#{player}"
    return board
end

def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    return true
  else
    return false
  end
end

def valid_move?(board, index)
  if index.between?(0,8) == true && position_taken?(board, index) == false
    return  true
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.chomp
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
  board.each do |i|
    if i == "X" || i == "O"
      counter += 1
    end
  end
  counter
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && board[combo[0]] != " "
      combo
    end
  end
end

def full?(board)
  board.include?(" ") ? false : true
end

# game draw if board is full with no winner
def draw?(board)
  !won?(board) && full?(board)
end

# game over if board is won, full or draw
def over?(board)
  won?(board) || full?(board) || draw?(board) ? true : false
end

# return the winner, X or O
def winner(board)
  win = won?(board)
  win ? board[win[0]] : nil
end

def play(board)
  while !over?(board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cats Game!"
  end
end
