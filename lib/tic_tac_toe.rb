WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(x)
  x = x.to_i
  x = x - 1
end

def move(array, index, char)
  array[index] = char
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


def valid_move?(board, index)
  index = index.to_i
  if index.between?(0,8) == false
    return false
  elsif index.between?(0,8) == true && position_taken?(board, index) == true
    return false
  elsif index.between?(0,8) == true && position_taken?(board, index) == false
    return true
  else return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.chomp
  user_input = input_to_index(user_input)
  if valid_move?(board, user_input) == true
    move(board, user_input, current_player(board))
    display_board(board)
  elsif valid_move?(board, user_input) == false
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |index|
  if index == "X" || index == "O"
    counter += 1
  elsif counter == " "
    counter = counter
  end
end
return counter
end

def current_player(board)
  if turn_count(board).even?
    "X"
  elsif turn_count(board).odd?
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    position_taken?(board, win_combination[0]) && board[win_combination[0]] == board[win_combination[1]] && board[win_combination[0]] == board[win_combination[2]]
  end
end

def full?(board)
 board.each do |index|
   if index == " "
     return false
 end
 end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) == true || draw?(board) == true
end

def winner(board)
  if won?(board) == false || won?(board) == nil
    return nil
  else
    return board[won?(board)[0]]
  end
end

def play(board)
  until over?(board) == true do
    turn(board)
  end
  if won?(board) == true
    puts "Congratulations (win_combination[O])!"
  elsif draw?(board) == true
    puts "Cats game!"
  end
end
