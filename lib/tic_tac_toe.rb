
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

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, character)
  board[index] = character
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
if position_taken?(board, index) == false && index.between?(0,8) == true
  true
elsif position_taken?(board, index) == true || index.between?(0,8) == false
  false
end
end

def turn(board)
puts "Please enter 1-9:"
input = gets.strip
index = input_to_index(input)
character = current_player(board)
if !valid_move?(board, index) && !over?(board)
  turn(board)
else
  move(board, index, character)
end
display_board(board)
end

def turn_count(board)
counter = 0
board.each do |place|
  if place == "X" || place== "O"
    counter+=1
  end
end
  return counter
end

def current_player(board)
turn_count(board).even? ? (return'X'):(return'O')
end

def won?(board)
    WIN_COMBINATIONS.each do |set|
      position_1 = board[set[0]]
      position_2 = board[set[1]]
      position_3 = board[set[2]]
      if (position_1 == "X" && position_2 == "X" && position_3 == "X")||(position_1 == "O" && position_2 == "O" && position_3 == "O")
        return [set[0], set[1], set[2]]
      end
  end
  return false
end

def full?(board)
  index = 0
  while index<8
    if position_taken?(board, index) == false
      return false
    else
      index+= 1
    end
  end
  return true
end

def draw?(board)
  if  !won?(board) && full?(board)
    return true
  end
end

def over?(board)
if won?(board) || draw?(board)
  return true
end
end

def winner(board)
set = won?(board)
if won?(board) == false
  return nil
else
  return board[set[0]]
end
end

def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
