WIN_COMBINATIONS = [
  [0, 1, 2], #top row win
  [3, 4, 5], #middle row win
  [6, 7, 8], #bottom row win
  [0, 3, 6], #first column win
  [1, 4, 7], #second column win
  [2, 5, 8], #third column win
  [0, 4, 8], #first diagonal win
  [2, 4, 6] #second diagonal win
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
  counter = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
    end
  end
  counter
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |win|
    if board[win[0]] == "X" && board[win[1]] == "X" && board[win[2]] =="X"
      return win
    elsif board[win[0]] == "O" && board[win[1]] == "O" && board[win[2]] =="O"
      return win
    else
      false
    end
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
  draw?(board) || won?(board)
end

def winner(board)
  WIN_COMBINATIONS.detect do |win|
    if board[win[0]] == "X" && board[win[1]] == "X" && board[win[2]] =="X"
      return "X"
    elsif board[win[0]] == "O" && board[win[1]] == "O" && board[win[2]] =="O"
      return "O"
    else
      false
    end
  end
end

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

#until the game is over
#  take turns
#end
#if the game was won
#  congratulate the winner
#else if the game was a draw
#  tell the players it has been a draw
#end
