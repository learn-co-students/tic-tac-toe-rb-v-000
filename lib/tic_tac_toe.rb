require 'pry'

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Diagonal from top left to bottom right
  [2,4,6] # Diagonal from top right to bottom left
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input = user_input.to_i
  index = user_input - 1
end

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  # check for a valid move. Optional add in a check for the position taken
  if index.between?(0,8) # checks if move is valid
    if !position_taken?(board, index) # optional check to see if the position is taken. States if position_taken? not evaluates to True, then execute next line
      true
    end
  end
end

def turn(board)
  puts "Please enter 1-9:"
  index = input_to_index(gets)
  if !valid_move?(board, index)
    turn(board)
  end
  token = current_player(board)
  move(board, index, token)
  display_board(board)
end

def turn_count(board)
  turns = board.select do |position|
    position == 'X' || position == 'O'
  end
  turns = turns.length
end

def current_player(board)
  if turn_count(board).even?
    correct_player = 'X'
  else
    correct_player = 'O'
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all? { |player| player == "X" || player == "O" }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  if winning_combo = won?(board) # this works because won? returns winning array
    board[winning_combo.first]
  end
end

def play(board)
  until over?(board)

    turn(board)
  end
  if won?(board)
    winning_player = winner(board)
    puts "Congratulations #{winning_player}!" 
  else
    puts "Cat's Game!"
  end
end
