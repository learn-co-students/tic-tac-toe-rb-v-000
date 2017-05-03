require "pry"
WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8],
  [0,3,6], [1,4,7], [2,5,8],
  [0,4,8],[6,4,2]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(number)
  number.to_i - 1
end

def move(array, index, character)
  array[index] = character
end

def position_taken?(board, index)
  board[index] == "X" || board[index] == "O"
end

def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input=gets.strip
  input=input_to_index(input)
  if valid_move?(board, input)
    move(board, input, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  #iterate over the array and determine if there is an "X" OR "O" or != " ".
  #if space is taken, add to count.
  board.count do |index|
    index != " "
  end
end

def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[2]] == board[combo[0]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all? {|index| index != " "}
end

def draw?(board)
  if !(won?(board)) && full?(board)
    return true
  else
    false
  end
end

def over?(board)
  full?(board) || draw?(board) || won?(board)
end

def winner(board)
  my_winning_position = won?(board)
  if(my_winning_position != nil)
    board[my_winning_position[0]]
  else
    nil
  end
end

def play(board)
  while !(over?(board))
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
