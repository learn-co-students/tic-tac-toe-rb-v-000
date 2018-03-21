

WIN_COMBINATIONS = [
  [0, 1, 2], # top row  index =  0
  [3, 4, 5], # middle row
  [6, 7, 8], # bottom row
  [0, 3, 6], # left columns
  [1, 4, 7], # middle columns
  [2, 5, 8], # right columns
  [0, 4, 8], # Ltop Rbottom diagonals
  [6, 4, 2] # Rtop Lbottom diagonal
]

def display_board(board)
  print " #{board[0]} | #{board[1]} | #{board[2]} \n-----------\n #{board[3]} | #{board[4]} | #{board[5]} \n-----------\n #{board[6]} | #{board[7]} | #{board[8]} \n"
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && (board[combo[0]] == 'X' || board[combo[0]] == 'O')

      return combo
    end
  end
  false
end

def full?(board)
  board.each do |i|
    if i == " " || i == ""
      return false
    end
  end
end

def draw?(board)
  if won?(board) == false && full?(board) != false
    true
  else
    false
  end
end

def over?(board)
  if won?(board) != false || full?(board) != false || draw?(board) == true
    return true
  end
  false
end

def winner(board)
  if won?(board) != false
    board[(won?(board))[0]]
  else
    nil
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
end


def turn_count(board)
  counter = 0
  board.each do|item|
    if item == "X" || item == "O"
    counter += 1
    end
  end
  counter
end

def current_player(board)
  counter = turn_count(board)
  if counter.even?
    "X"
  else
    "O"
  end
end

def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end
