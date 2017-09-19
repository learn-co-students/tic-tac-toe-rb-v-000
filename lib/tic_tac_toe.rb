
puts "Welcome to Tic Tac Toe!"

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

board = [" "," "," "," "," "," "," "," "," "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "

end

input = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
def input_to_index(input)
  input.to_i - 1
end

def move(board, index, value)
    board[index] = value

    #def update_array_at_with(board, index, value)
  #    board[index] = value
#  end
end

def position_taken?(board,index)
  if board[index] == "X" || board[index] == "O"
    true
  else board[index] == "  " || ""
    false
  end
end

def valid_move?(board, index)
  if (0<=index) && (index<= 9) && (position_taken?(board,index) == false)
    true
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index) == true
    move(board, index, current_player(board))
    display_board(board)
  else
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
  # turn(board)
  end
end

def turn_count(board)
  #character == "X" || character == "O"
  board.count{ |character| character == "X" || character == "O"}
    #puts "The Turn Count is #{board.size}-#{board.count}"
end

def current_player(board)
  if turn_count(board) == 0 || turn_count(board).even? == true
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
  board[win_combo[0]] == board[win_combo[1]] && board[win_combo[1]] == board[win_combo[2]] && position_taken?(board, win_combo[0])
  end
end

def full?(board)
  board.all? do |element|
    element == "X" || element == "O"
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
  end
end

def over?(board)
  draw?(board) || !!won?(board)
end

def winner(board)
  if !!won?(board) == true
    win_index = won?(board).detect do |element|
      element
    end
    board[win_index]
  else
  end
end

#def turn(board)
#  puts "Please enter 1-9:"
#  input = gets.strip
#  index = input_to_index(input)
#  if valid_move?(board, index)
#    move(board, index, current_player(board))
#    display_board(board)
#  else
#    puts "Please enter 1-9:"
#    input = gets.strip
#    index = input_to_index(input)
#  end
#end
def winner(board)
  if !!won?(board) == true
    win_index = won?(board).detect do |element|
      element
    end
    board[win_index]
  else
  end
end

def play(board)
  counter = 0
  until over?(board) || counter > 10 do
    turn(board)
    counter += 1
  end
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
