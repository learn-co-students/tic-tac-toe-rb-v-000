WIN_COMBINATIONS = [
  [0, 1, 2], #top rows
  [3, 4, 5], #middle rows
  [6, 7, 8], # bottom rows
  [0, 3, 6], #lvert
  [1, 4, 7], #mvert
  [2, 5, 8], #rvert
  [0, 4, 8], # diag1
  [2, 4, 6] # diag2
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(board, input, value = "X")
  board[input] = value
end

def position_taken?(board, index)
  if board[index] == " "
    false
  elsif board[index] == ""
    false
  elsif board[index] == nil
    false
  else board[index] == "X" || "O"
    true
  end
end

def valid_move?(board, index)
index.to_i.between?(0, 8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip.to_i
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
  turn(board)
  end
end

def turn_count(board)
 counter = 0
  board.each do | space | #array element with 9 indexes, we're on the first space
    if space == "X" || space == "O"
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
  WIN_COMBINATIONS.each do | winning_combination |
    if board[winning_combination[0]] == "X" &&
       board[winning_combination[1]] == "X" &&
       board[winning_combination[2]] == "X" ||
       board[winning_combination[0]] == "O" &&
       board[winning_combination[1]] == "O" &&
       board[winning_combination[2]] == "O"
    return winning_combination
    end
  end
  false
end

def full?(board)
board.all? do |token|
  token =="X" || token =="O"
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
 else won?(board)
    false
  end
end

def over?(board)
  if won?(board) || draw?(board)
    true
  end
end

def winner(board)
  if winning_combination = won?(board)
    board[winning_combination[0]]
    end
  end

  def play(board)
    until over?(board)
      turn(board)
    end
    if won?(board)
    puts "Congratulations. You have won Tic Tac Toe"
    elsif draw?(board)
    puts "This game has ended in a draw"
    end
  end
