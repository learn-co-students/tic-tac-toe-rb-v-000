require "pry"
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
WIN_COMBINATIONS = [
  [0, 1, 2],
  [0, 3, 6],
  [0, 4, 8],
  [1, 4, 7],
  [2, 4, 6],
  [2, 5, 8],
  [3, 4, 5],
  [6, 7, 8]
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

def move(board, index, value)
  board[index] = value
end

def position_taken?(board, location)
  board[location] == "X" || board[location] == "O"
end

def valid_move?(board, position)
  position.between?(0, 8) && !position_taken?(board, position)
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
  count = 0
  board.each do |player|
    if (player == "X" || player == "O")
      count += 1
    end
  end
   count
end


def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

def won?(board)
  x  = false
  WIN_COMBINATIONS.each do |combo|
    #combo = [0, 1, 2] board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    #combo = [2, 4, 6]
    if (board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X") || (board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O")
      x = true
    end
  end
  x
end

def full?(board)
  board.all? do |i|
    i == "X" || i == "O"
  end
end

def draw?(board)
  !won?(board) && full?(board)
  #   true
  #elsif won?(board) == nil && !full?(board) == true
  #  false
  #elsif won?(board) == true
  #  false
  #end
end

def over?(board)
  # binding.pry
  if won?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  x = nil
  WIN_COMBINATIONS.each do |combo|
    if (board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X") || (board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O")
      x = board[combo[0]]
      break
    end
  end
  x
end

#def winner(board)
  # binding.pry
#  if won?(board)
#    return board[won?(board)[0]]
#  end
#end

def play(board)
  until (over?(board) == true)

    turn(board)
  end
  #binding.pry
  if won?(board)
    #puts board.inspect
    #puts won?(board).inspect
    #puts won?(board)[0].inspect

    #puts "yay you won"
    #puts "Congratulations #{board[won?(board)[0]]}!"
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board) == true
    puts "Cat's Game!"
  end
end



#board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
#puts play(board)
