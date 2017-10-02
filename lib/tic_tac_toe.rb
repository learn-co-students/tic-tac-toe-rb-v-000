board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def display_board(board)
  puts " #{board[0]} " + "|" + " #{board[1]} " + "|" + " #{board[2]} "
  puts "-----------"
  puts " #{board[3]} " + "|" + " #{board[4]} " + "|" + " #{board[5]} "
  puts "-----------"
  puts " #{board[6]} " + "|" + " #{board[7]} " + "|" + " #{board[8]} "
end


def input_to_index(input)
  input.to_i - 1
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
      "X"
    else
      "O"
  end
end


def move(board, input, token)
  board[input] = token
end

def position_taken?(board, index)
  board[index] != " " && board[index] != "" && board[index] != nil
end

def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index)
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

# def play(board)
#   counter = 0
#   while counter < 9
#     turn(board)
#     counter += 1
# end
# end






def won?(board)
  WIN_COMBINATIONS.each do |win_combos|
    if position_taken?(board, win_combos[0]) && board[win_combos[0]] == board[win_combos[1]] && board[win_combos[1]] == board[win_combos[2]]
      return win_combos
    else
    end
  end
  nil
end

def full?(board)
  board.all? do |positions|
    positions == "O" || positions == "X"
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || full?(board) || won?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end

def play(board)
    until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end


# Define your play method below
