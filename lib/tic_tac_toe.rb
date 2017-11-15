require "pry"
WIN_COMBINATIONS = [
    [0,1,2], #Top row
    [3,4,5], #Middle row
    [6,7,8], #Bottom row
    [0,3,6], #1st vertical
    [1,4,7], #2nd vertical
    [2,5,8], #3rd vertical
    [0,4,8], #diagonal
    [2,4,6]  #diagonal
  ]

def won?(board)

 WIN_COMBINATIONS.each do |win_index|

  position_1 = board[win_index[0]]
  position_2 = board[win_index[1]]
  position_3 = board[win_index[2]]

  if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")

    return win_index

  end

  end
 false

end


board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} ",
      "-----------",
      " #{board[3]} | #{board[4]} | #{board[5]} ",
      "-----------",
      " #{board[6]} | #{board[7]} | #{board[8]} "
end


def input_to_index(input)
  index = input.to_i - 1
end


def position_taken?(board, index)
  if board[index] == " " || board[index] ==  "" || board[index] == nil
    false
  else board[index] == "X" || "O"
    true
  end
end


def valid_move?(board, index)
  if !position_taken?(board, index)
    true
    if index.between?(0, 8)
    true
    end
  end
end

#token = board[index]
def move(board, index, token)
  board[index] = token
  #board
end


def turn(board)
  puts "Please enter 1-9:"
  input = gets.chomp
  index = input_to_index(input)
  validation = valid_move?(board, index)
  #token = board[index]
    #gets.strip
  if !validation
    puts "Please enter 1-9:"
    turn(board)
  else
    move(board, index, current_player(board))
    display_board(board)
  #elsif
    #move(board, index, token = "O")
    #display_board(board)
  end
end


def turn_count(board)
counter = 0
board.each do |position|
  if position == "X" || position == "O"
     counter += 1
  end
  end
  return counter
end


def current_player(board)
if turn_count(board) % 2 == 0
  return "X"
else
  return "O"
end
end
#binding.pry

def won?(board)

 WIN_COMBINATIONS.each do |win_index|

  position_1 = board[win_index[0]]
  position_2 = board[win_index[1]]
  position_3 = board[win_index[2]]

  if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
    return win_index
  end
  end
 false

end

def full?(board)
  board.all? {|full_board| full_board == "X" || full_board == "O"}

end

def draw?(board)
  if won?(board) == false && full?(board) == true
     true
  end

end

def over?(board)
  if draw?(board)
    true
  elsif won?(board) && full?(board)
    true
  elsif won?(board) && !full?(board)
    true

  end
end

def winner(board)
  #token = board[0] == board[1]
  value = won?(board)
  #binding.pry
  if value
    board[value[0]]
  else
    nil
  end
end

def play(board)
until over?(board)
  turn(board)
end


if winner(board) == "X"
  puts "Congratulations X!"
elsif winner(board) == "O"
  puts "Congratulations O!"
else draw?(board)
  puts "Cat's Game!"
end


end
