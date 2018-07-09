 WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
[6,7,8],
[2,4,6],
[0,3,6],
[1,4,7],
[0,8,4],
[2,5,8]]
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
if index <0 || index >8
  return false
end
if !(position_taken?(board, index))
  return true
end 
end
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board,index)
    move(board,index,current_player="X")
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  count=0
board.each do |board|
  if board == "X" || board =="O"
  count+=1
end
end
return count
end

def current_player(board)
  if turn_count(board) % 2 == 0 
    return "X"
  return  "O"
end
 end


def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_combination.all? { |win_index| board[win_index] == "X" } ||
    win_combination.all? { |win_index| board[win_index] == "O" }
  end
end

def full?(board)
  board.each do |i|
 if board.any?{|i|i ==" "}
   return false 
else return true 
 end 
end
end
def draw?(board)
 if full?(board) && !won?(board)
   return true
 else return false
 end
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    return true
  else return false
end
  end
  
def winner(board)
  won = won?(board)
  if won != nil
    return board[won[0]]
  end
  end

def play(board)
  counter= 1
 while counter<=9
 turn(board)
 counter += 1
 end
end


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
if index <0 || index >8
  return false
end
if !(position_taken?(board, index))
  return true
end 
end
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board,index)
    move(board,index,current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  count=0
board.each do |board|
  if board == "X" || board =="O"
  count+=1
end
end
return count
end

def current_player(board)
  if turn_count(board) % 2 ==0
    return  "X"
  else return "O"
end
 end
  
def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_combination.all? { |win_index| board[win_index] == "X" } ||
    win_combination.all? { |win_index| board[win_index] == "O" }
  end
end

def full?(board)
  board.each do |i|
 if board.any?{|i|i ==" "}
   return false 
else return true 
 end 
end
end
def draw?(board)
 if full?(board) && !won?(board)
   return true
 else return false
 end
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    return true
  else return false
end
  end
  
def winner(board)
  won = won?(board)
  if won != nil
    return board[won[0]]
  end
  end

def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
