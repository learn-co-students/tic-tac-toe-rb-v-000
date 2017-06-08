WIN_COMBINATIONS = [ #board[combo[0]]
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [6, 4, 2],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
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

def move(board, index, char)
  board[index] = char
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
    index.between?(0, 8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index) == true
    move(board, index, current_player(board))
  else
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
  counter = 0
  board.each do |token|
    if token == "X" || token == "O"
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

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[0])
  end
end

def full?(board)
  board.none? do |token|
    token == " "
    # blank will equal either "X", "O", " "
    # how do we check if blank is equal to a empty space?
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    puts "Draw"
    true
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
  true
  end
end

def winner(board)
  if winning_combo = won?(board)
  board[winning_combo[0]]
  end
end

def play(board)
  while !over?(board)
    turn(board)
    end
  if won?(board)
    puts "Congratulations " + winner(board) + "!"
  else
    puts "Cats Game!"
    end
end
