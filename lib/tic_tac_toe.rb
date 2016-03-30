WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, position, character = "X")
    position = position.to_i - 1
    board[position] = character

end
def position_taken?(board, position)
  board == position
  if board[position]== " " 
     return false
   elsif board[position]== ""
    return false
  elsif board[position] == nil
    return false
   else 
    return true 
  end
end
def valid_move?(board, position)
  position = position.to_i - 1 
  
  if position.between?(0, 8) == false 
   return false
  elsif position_taken?(board, position)
   return false
  else 
    return true
  end 
end
def turn(board)
  
  puts "Please enter 1-9:"
  position = gets.strip
    if valid_move?(board, position) 
       move(board, position, current_player(board))
    else 
      turn(board)
      
  end
  display_board(board)
end
def turn_count(board)
board.select {|position| position != " "}.count
end
 
 def current_player(board)
  turn_count(board) % 2 == 0
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end
end

def won?(board)
  
  WIN_COMBINATIONS.detect do |win_combination|
   position_taken?(board, win_combination[0]) && board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]]

    end

end
def full?(board)
  board.each do |array|
    if array == " "
      return false
    else 
      true
    
    end
    end
  end
  def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    true
  else
    false
  end
end
def winner(board)
  if won?(board)
  WIN_COMBINATIONS.each do |win_combination|

if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
  return "X"
 elsif
  board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
  return "O"
    else
      nil
    
    end
  end
  end
  end
def play(board)
  
  until over?(board)
   turn(board)
  end
  if winner(board) == "X"
    puts "Congratulations X!"
 elsif winner(board) == "O"
    puts "Congratulations O!"
  else
    puts "Cats Game!"
  end
end

