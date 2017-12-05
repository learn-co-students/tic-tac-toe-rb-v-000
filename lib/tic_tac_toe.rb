# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

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
  
WIN_NAMES = [
  
  top_row_win = WIN_COMBINATIONS[0],
  mid_row_win = WIN_COMBINATIONS[1],
  bottom_row_win = WIN_COMBINATIONS[2],
  left_vert_win = WIN_COMBINATIONS[3],
  mid_vert_win = WIN_COMBINATIONS[4],
  right_vert_win = WIN_COMBINATIONS[5],
  left_diag_win = WIN_COMBINATIONS[6],
  right_diag_win = WIN_COMBINATIONS[7]
  ]
  
def won?(board)
won = false 
winner = nil 
empty = true 
winning_combo = nil 
x_win = false
o_win = false 

  WIN_COMBINATIONS.each do |combo|
    
      x_win = combo.all? do |space|
        board[space] == "X"
      end 
      
      o_win = combo.all? do |space|
        board[space] == "O"
      end 
      if x_win || o_win
        winning_combo = combo 
      end 
    
  end 

 

empty = WIN_COMBINATIONS.each do |combo|
  combo.each do |space|
    board[space] == " "
  end 
end 

if winning_combo != nil
  return winning_combo
end 
if empty
  return false 
end 
if winning_combo == nil && !empty
  return false 
end 

end 

def winner(board)
  x_win = false
  o_win = false 

  WIN_COMBINATIONS.each do |combo|
    x_win = combo.each do |space|
      board[space] == "X"
    end
  
    o_win = combo.each do |space|
      board[space] == "O"
    end
  end 

  if o_win
    value = "O"
  end
  if x_win 
    value = "X"
  end
   
end 

def full?(board)
  full = board.all? do |space|
    space != " "
  end 
  return full 
end

def over?(board)
  if full?(board) || won?(board)
    return true 
  end 
end 

def draw?(board)
  won = won?(board)
  over = over?(board)
  if !won && over
    return true 
  end 
end 

def winner(board)
  value = won?(board)
  if !value
    return nil
  else 
    return board[value[0]]
  end
end 
   
  