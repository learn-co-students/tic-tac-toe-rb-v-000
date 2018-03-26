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
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  elsif
    turn(board)
  end # if
  display_board(board)
end #def

def turn_count(board)
  n = 0 
  board.each { |x|
    if x == "X" || x == "O"
      n+=1 
    end
  }
  
  return n
  
end

def current_player(board)
  if turn_count(board) % 2 == 0 
    return "X"
  else
    return "O"
  end
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], #Left column
  [1,4,7], #Middle 
  [2,5,8], #Right
  [0,4,8], #L to r diagonol 
  [2,4,6], #R to l diagonol
]

def won?(board)
    WIN_COMBINATIONS.each do |win_combo|
      win_dex_1 = win_combo[0]
      win_dex_2 = win_combo[1]
      win_dex_3 = win_combo[2]
      pos_1 = board[win_dex_1]  
      pos_2 = board[win_dex_2]
      pos_3 = board[win_dex_3]
      
        if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
          win_combo == "X"
        end
        if (pos_1 == "O" && pos_2 == "O" && pos_3 == "O") 
          win_combo== "O"
        end #end of if
    end #end of do
  if board == [" "," "," "," "," "," "," "," "," "]
    return false
  end # end of if/else
  false
end # end of method 

def full?(board) 
  board.all? do |index|
    index == "X" || index =="O"
  end 
end


def draw?(board)
  if full?(board) && !won?(board)
    return true 
  else  
    return false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true 
  end 
end 

def winner(board)
  if won?(board)  != false
    return board[won?(board)[0]]
  else 
    return nil
  end
end

def play(board)
  while !over?(board) && !won?(board) && !draw?(board)
  turn(board)
  end #end of while


  if won?(board) 
  puts "Congratuations #{winner(board)}!"
  
  elsif draw?(board)
  puts "Cat's Game!"
  end#end of elsif
end #end of def

  

