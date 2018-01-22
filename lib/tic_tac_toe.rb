

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [2,5,8],
  [6,4,2],
  [0,3,6],
  [1,4,7],
  [0,4,8]
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
 board[index] = player
end

def position_taken?(board, index)
  if board[index] != ("X") && board[index] != ("O")
    return false
  elsif board[index] == ("X") || board[index] == ("O")
    return true
  end
end

def valid_move?(board, index)
  if index.between?(0, 8) && !(position_taken?(board, index))
    return true
  else !index.between?(0, 8) || (position_taken?(board, index))
      return false
  end
end


def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  current_player = board[index]
  if valid_move?(board, index)
    move(board, index, current_player(board))
  else
    turn(board)
  end
  display_board(board)
end

def turn_count(board)

  move_count = []
  board.each do |token|
    counter = 0
    if token == "X" || token == "O"
      move_count.push(1)
    else
      counter += 1
    end
  end
  move_count.length.to_i
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)

empty_board = board.all? {|location| location == " "}
WIN_COMBINATIONS.detect do |sub_array|
 board[sub_array[0]] == board[sub_array[1]] && board[sub_array[1]] == board[sub_array[2]] && position_taken?(board, sub_array[0])
  #if sub_array.all? { |value| board[value] =="X" } || sub_array.all? { |value| board[value] =="O" }
  #    return sub_array
  #elsif empty_board || full?(board)
  #  return false
  #  end

end
end


def full?(board)
  !board.any? { |location| location == " " }
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if won?(board).nil?
    return nil
  end
  if board[won?(board).first] == "X"
    return board[won?(board).first]
  elsif board[won?(board).first] == "O"
return board[won?(board).first]

  end
end
