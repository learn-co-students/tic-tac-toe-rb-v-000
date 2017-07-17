#require 'pry'
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [0,4,8],
  [2,5,8],
  [6,4,2]
]

board = [" "," "," "," "," "," "," "," "," "]

def display_board(board)
 puts " #{board[0]} | #{board[1]} | #{board[2]} "
 puts "-----------"
 puts " #{board[3]} | #{board[4]} | #{board[5]} "
 puts "-----------"
 puts " #{board[6]} | #{board[7]} | #{board[8]} "
 end

def input_to_index(user_input)
   user_input = user_input.to_i - 1
 end

def move(board, index, value)
board[index] = value
end

def position_taken?(board, index)
if board[index] == " " || board[index] == "" || board[index] == nil
  return false
else true
  end
end

def valid_move?(board, index)
  if !position_taken?(board, index) && index.between?(0, 8)
    return true
  end
  false
end

def turn(board)
  puts "Please enter 1-9"
  user_input = gets.strip
  index = input_to_index(user_input)
  value = current_player(board)
  if valid_move?(board, index)
    move(board, index, value)
    display_board(board)
  else
    turn(board)
  end
end
def turn_count(board)
  counter = 0
  board.each do |position|
    if  position == "X" || position == "O"
      counter +=1
    end
  end
  counter
end
def current_player(board)
  counter = 0
  if turn_count(board) % 2 == 0
    return "X"
    counter += 1
  else
    return "O"
  end
end

def won?(board)
 WIN_COMBINATIONS.each do |combo|
   position1 = board[combo[0]]
   position2 = board[combo[1]]
   position3 = board[combo[2]]
  if position1 == position2 && position2 == position3 && position_taken?(board, combo[0])
    return combo
  end
 end
 false
end
def full?(board)
  board.all? do |position|
      position != " "
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if won?(board)
     index = won?(board)[0]
     return board[index]
  end
  nil
end


 def play(board)
  until over?(board)
    turn(board)
    end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  else
 end
end
#binding.pry
