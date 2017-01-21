WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # bottom row
  [0,3,6],  # left column
  [1,4,7],  # Middle column
  [2,5,8],  # right column
  [0,4,8],  # cross left
  [2,4,6]  # cross right
]

def display_board(board)

puts " #{board[0]} | #{board[1]} | #{board[2]} \n-----------\n #{board[3]} | #{board[4]} | #{board[5]} \n-----------\n #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(n)
return n.to_i - 1 ;
end

def move(board, index, char)
board[index]=char
return board
end

def position_taken? (board, index)
  if board[index]== " " || board[index]== "" || board[index]== nil
    return false
  else return true
  end
end

def valid_move? (board, index)
  num = index.to_i
if !num.between?(0,8)
  return false
elsif !position_taken?(board, num)
  return true
end
end

def turn (board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    char =current_player(board)
    move(board, index, char)
    display_board(board)
  else
    turn(board)
  end
end

def current_player(board)
  if turn_count(board)%2==0
    "X"
  else "O"
  end
end

def turn_count(board)
  turns = 0
  board.each{ |turn| turns+=1 if turn == "X"|| turn =="O"}
  return turns
end

def won?(board)
WIN_COMBINATIONS.any? do |win_combination|
if (
  win_combination.all? do |item|
    board[item]=="X"
  end )
  return win_combination

elsif (
  win_combination.all? do |item|
    board[item]=="O"
  end )
return win_combination
end #end of if
end #end of nested array
end #end of method

def full?(board)
board.all? {|item| item=="X"  || item=="O"}
end

def draw?(board)
if !won?(board) && full?(board)
  return true
  end
end

def over?(board)
won?(board) || draw?(board) || full?(board)
end

def winner(board)
won = won?(board)
  if won == false || won == nil
    return nil
  else
    return board[won?(board)[0]]
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
