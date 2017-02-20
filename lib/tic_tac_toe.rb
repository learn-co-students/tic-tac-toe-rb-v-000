WIN_COMBINATIONS = [
  [0,1,2],[0,3,6],[0,4,8],[1,4,7],[2,5,8],[2,4,6],[3,4,5],[6,7,8]
]

def display_board(board)
 puts " #{board[0]}"+" | "+"#{board[1]}"+" | "+"#{board[2]} "
 puts "-----------"
 puts " #{board[3]}"+" | "+"#{board[4]}"+" | "+"#{board[5]} "
 puts "-----------"
 puts " #{board[6]}"+" | "+"#{board[7]}"+" | "+"#{board[8]} "

end

def input_to_index(user_input)
  index = user_input.to_i - 1
end

def move(board, index, character)
  board[index] = character
end

def position_taken?(board,index)
  if board[index] == "X" || board[index] == "O"
    return true
  else
    return false
  end
end

def valid_move?(board,index)
  if index > 8 || index < 0
    return false
  elsif position_taken?(board,index)
    return false
  else
    return true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board,index)
    move(board,index,current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  count = 0
  board.each do |space|
   if (space == "X" || space == "O")
     count +=1
   end
 end
 return count
 end

def current_player(board)
  count = turn_count(board)
  if count == 0
    current_player = "X"
  elsif(count % 2 == 0)
    current_player = "X"
  else
    current_player = "O"
  end
return current_player
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all? {|token| token == "X" || token == "O"}
end

def draw?(board)
 !won?(board) && full?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if !over?(board) || draw?(board)
    return nil
  end
   if won?(board) != false
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

  
