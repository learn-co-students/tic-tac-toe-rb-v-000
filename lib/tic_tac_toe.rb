WIN_COMBINATIONS = [

  [0,1,2],  #Top Row Combo
  [3,4,5],  #Middle Row Combo
  [6,7,8],  #Bottom Row Combo
  [0,3,6],  #Left Row Combo
  [1,4,7],  #Middle Row Combo
  [2,5,8],  #Right Row Combo
  [0,4,8],  #Left Diag Combo
  [2,4,6]   #Right Diag Combo
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

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  if board[index] == "" || board[index] == " " || board[index] == nil
  return false

else 
  return true
end
end

def valid_move?(board, index)
  if index.between?(0, 8) && position_taken?(board, index) == false
    return true
    
  else
    return false
     end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.chomp
  index = input_to_index(input)
  if index.between?(0, 8) == false || valid_move?(board, index) == false
    turn(board)    
  else
      move(board, index, current_player(board))
      display_board(board)
      
    end
end

def turn_count(board)
  turns = 0
  board.each do |space|
    if space == "X" || space == "O"
      turns += 1
    end
  end
  return turns
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
top_row_1 = WIN_COMBINATIONS[0][0]
top_row_2 = WIN_COMBINATIONS[0][1]
top_row_3 = WIN_COMBINATIONS[0][2]
mid_row_1 = WIN_COMBINATIONS[1][0]
mid_row_2 = WIN_COMBINATIONS[1][1]
mid_row_3 = WIN_COMBINATIONS[1][2]
bot_row_1 = WIN_COMBINATIONS[2][0]
bot_row_2 = WIN_COMBINATIONS[2][1]
bot_row_3 = WIN_COMBINATIONS[2][2]
left_row_1 = WIN_COMBINATIONS[3][0]
left_row_2 = WIN_COMBINATIONS[3][1]
left_row_3 = WIN_COMBINATIONS[3][2]
mid_2_1 = WIN_COMBINATIONS[4][0]
mid_2_2 = WIN_COMBINATIONS[4][1]
mid_2_3 = WIN_COMBINATIONS[4][2]
right_row_1 = WIN_COMBINATIONS[5][0]
right_row_2 = WIN_COMBINATIONS[5][1]
right_row_3 = WIN_COMBINATIONS[5][2]
left_diag_1 = WIN_COMBINATIONS[6][0]
left_diag_2 = WIN_COMBINATIONS[6][1]
left_diag_3 = WIN_COMBINATIONS[6][2]
right_diag_1 = WIN_COMBINATIONS[7][0]
right_diag_2 = WIN_COMBINATIONS[7][1]
right_diag_3 = WIN_COMBINATIONS[7][2]


position_1 = board[top_row_1]
position_2 = board[top_row_2]
position_3 = board[top_row_3]
position_4 = board[mid_row_1]
position_5 = board[mid_row_2]
position_6 = board[mid_row_3]
position_7 = board[bot_row_1]
position_8 = board[bot_row_2]
position_9 = board[bot_row_3]
position_10 = board[left_row_1]
position_11 = board[left_row_2]
position_12 = board[left_row_3]
position_13 = board[mid_2_1]
position_14 = board[mid_2_2]
position_15 = board[mid_2_3]
position_16 = board[right_row_1]
position_17 = board[right_row_2]
position_18 = board[right_row_3]
position_19 = board[left_diag_1]
position_20 = board[left_diag_2]
position_21 = board[left_diag_3]
position_22 = board[right_diag_1]
position_23 = board[right_diag_2]
position_24 = board[right_diag_3]


case

when position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
return WIN_COMBINATIONS[0]
when position_4 == "X" && position_5 == "X" && position_6 == "X" || position_4 == "O" && position_5 == "O" && position_6 == "O"
return WIN_COMBINATIONS[1]
when position_7 == "X" && position_8 == "X" && position_9 == "X" || position_7 == "O" && position_8 == "O" && position_9 == "O"
return WIN_COMBINATIONS[2]
when position_10 == "X" && position_11 == "X" && position_12 == "X" || position_10 == "O" && position_11 == "O" && position_12 == "O"
return WIN_COMBINATIONS[3]
when position_13 == "X" && position_14 == "X" && position_15 == "X" || position_13 == "O" && position_14 == "O" && position_15 == "O"
return WIN_COMBINATIONS[4]
when position_16 == "X" && position_17 == "X" && position_18 == "X" || position_16 == "O" && position_17 == "O" && position_18 == "O"
return WIN_COMBINATIONS[5]
when position_19 == "X" && position_20 == "X" && position_21 == "X" || position_19 == "O" && position_20 == "O" && position_21 == "O"
return WIN_COMBINATIONS[6]
when position_22 == "X" && position_23 == "X" && position_24 == "X" || position_22 == "O" && position_23 == "O" && position_24 == "O"
return WIN_COMBINATIONS[7]
else
  false
end
end

def full?(board)
  board.all? {|spots| spots == "X" || spots == "O"}
  end
  
def draw?(board)
  if full?(board) && won?(board) == false
    return true 
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
if won?(board) == false
  return nil
else
numbers = won?(board)

first = numbers[0]
second = numbers[1]
third = numbers[2]

win_1 = board[first]
win_2 = board[second]
win_3 = board[third]

case
when
  won?(board) && win_1 == "X" && win_2 == "X" && win_3 == "X"
  return "X"
when
  won?(board) && win_1 == "O" && win_2 == "O" && win_3 == "O"
  return "O"
when
 !won?(board)
 return nil
end
end
end

def play(board)
  until over?(board)
  turn(board)
end
 if draw?(board)
  end
      puts "Cat's Game!"
  if won?(board)
end  
    puts "Congratulations #{winner(board)}!"
  end
