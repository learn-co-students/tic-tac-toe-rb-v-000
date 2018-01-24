
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

WIN_COMBINATIONS = [
  [0,1,2],   #top row
  [3,4,5],   #middle row
  [6,7,8],   #bottom row
  [0,3,6],   #first column
  [1,4,7],   #second column
  [2,5,8],   #third column
  [0,4,8],   #diagonaly
  [6,4,2]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i-1
end

def move(board,index,player)
  board[index] = player
end

def position_taken?(board,index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
   else board[index] == "X" or board[index] == "O"
    return true
  end
end

def valid_move?(board,index)
  board[index].to_i-1
  if position_taken?(board,index) == true
    return false
  elsif index > 9 || index < 0
    return false
  else
    return true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  player=current_player(board)
  if valid_move?(board,index)
    move(board,index,player)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  count=0
  board.each do |character|
    if character != " "
    count+=1
  end
  end
  return count
end

def current_player(board)
  count=turn_count(board)
  current_turn = count % 2
  if current_turn == 0
     return "X"
   else
     return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
   win_index_1=win_combination[0]
   win_index_2=win_combination[1]
   win_index_3=win_combination[2]
   position_1=board[win_index_1]
   position_2=board[win_index_2]
   position_3=board[win_index_3]
   if position_1 == "X" && position_2 == "X" && position_3 == "X"
     return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
     return win_combination
   end
  end
  return false
end

def full?(board)
board.none?{|position| position == (" ")}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
won?(board)
full?(board)
if won?(board) != false or full?(board) == true
  return true
else
  return false
end
end

def winner(board)
  WIN_COMBINATIONS.each do |win_combination|
   win_index_1=win_combination[0]
   win_index_2=win_combination[1]
   win_index_3=win_combination[2]
   position_1=board[win_index_1]
   position_2=board[win_index_2]
   position_3=board[win_index_3]
   if position_1 == "X" && position_2 == "X" && position_3 == "X"
     return "X"
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
     return "O"
   end
  end
  return nil
end
