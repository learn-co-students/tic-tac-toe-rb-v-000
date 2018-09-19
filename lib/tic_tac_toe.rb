def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(i)
  i = i.to_i
  i = i - 1
end

def player_move(board, j, character)
    display_board(board)
  board[j] = "#{character}"
end

def position_taken?(board, x)
  if board[x] == " "
    return false 
 return false
 elsif board[x] == ""
 return false
  elsif board[x] == "X" || board[x] == "O"
    return true 
  else 
    return false
  end
end

def valid_move?(board, x)
  if x < 0 || x > 8 
    return false
  end
  if board[x] == " "
    return true
 elsif board[x] == ""
    return true
  elsif board[x] == "X" || board[x] == "O"
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  q = gets.strip
  r = input_to_index(q)
  s = valid_move?(board,r)
  if s == true
    board[r] = current_player(board)
    display_board(board)
  elsif !s 
  turn(board)
  end
end



def turn_count(board)
  x = 0
  board.each do |space|
    if space == "X"
      x += 1 
    elsif space == "O"
      x += 1
    end
  end
  return x
end

def current_player(board)
  x = turn_count(board)
  y = x % 2
  if y == 0 
    character = "X"
  elsif y == 1 
    character = "O"
  end
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
  ]
  
  def won?(board)
    WIN_COMBINATIONS.each do |combo|
      a = combo[0]
      b = combo[1]
      c = combo[2]
      if board[a] == board[b] && board[b] == board[c] && board[a] != " "
        return combo
      end
    end
    false
    end
    
    def full?(board)
      if won?(board) == false && board[0] != " " && board[1] != " " && board[2] != " " && board[3] != " " && board[4] != " " && board[5] != " " && board[6] != " " && board[7] != " " && board[8] != " "
        return true 
   end
 end
 
 def draw?(board)
   if !full?(board)
     return false
   elsif !won?(board) 
        return true 
   end
 end
 
 def over?(board)
   if won?(board)
     return true
     elsif draw?(board)
     return true
   elsif won?(board) == false && draw?(board) == false
     return false
   end
 end

def winner(board)
  x = won?(board)
 if x == false
     return nil
else 
  board[won?(board)[0]]
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