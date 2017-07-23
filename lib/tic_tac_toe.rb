WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

board=[" "," "," "," "," "," "," "," "," "]

def display_board(board)
puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
 index = input.to_i
position = index - 1
end

def move(board,position,symbol)
  board[position] = symbol
end

def position_taken?(board, index)
 if board[index] == " " || board[index] == "" || board[index] == nil
  return false
  else
   return true
 end
end

def valid_move?(board, index)
  if index.between?(0,8) && position_taken?(board,index)
    return false
  elsif !index.between?(0,8)
      return false
    else
        return true
end
end

def turn(board)
puts "Please enter 1-9:"
input = gets.strip
index = input_to_index(input)
if valid_move?(board,index)
  move(board,index,symbol="X")
  display_board(board)
else
  turn(board)
end
end

def turn_count(board)
 counter = 0
 board.each do |symbol|
    if symbol == "O"|| symbol == "X"
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

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|

  position_1 = board[win_combination[0]]
  position_2 = board[win_combination[1]]
  position_3 = board[win_combination[2]]

  if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
   return win_combination
  end
 end
 return false
end


def full?(board)
  board.each do |position|
    if position == " " || position == ""
      return false
    end
  end
  board.detect do |i|
    if i == "X" || i == "O"
      return true
    end
  end
end

def draw?(board)
if won?(board)
  return false
end
  board.each do |position|
   if position == "" || position == " "
    return false
   end
  end
  if full?(board)
    return true
end
end

def over?(board)
  WIN_COMBINATIONS.each do |win_combination|

   position_1 = board[win_combination[0]]
   position_2 = board[win_combination[1]]
   position_3 = board[win_combination[2]]

   if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
    return true
  end
end
board.each do |position|
 if position == "" || position == " "
  return false
 end
end
board.detect do |i|
 if i == "X" || i == "O"
   return true
 end
end
end

def winner(board)
  WIN_COMBINATIONS.each do |win_combination|

   position_1 = board[win_combination[0]]
   position_2 = board[win_combination[1]]
   position_3 = board[win_combination[2]]

   if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return "X"
  end
end
WIN_COMBINATIONS.each do |win_combination|

 position_1 = board[win_combination[0]]
 position_2 = board[win_combination[1]]
 position_3 = board[win_combination[2]]

 if position_1 == "O" && position_2 == "O" && position_3 == "O"
  return "O"
end
end
  return nil
end

def play(board)
  counter = 0
  while counter < 9
    turn(board)
    counter += 1
  end
end
