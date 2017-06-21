WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # bottom row
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]

]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(userinput)
  num = userinput.to_i
  num = num -1
end

def move(board_array, position, token)
  board_array[position] = token
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == ""
    return false
  elsif board[index] == nil
    return nil 
  else
    return true
  end
end

def valid_move?(board, index)
   if index < 0 || index > 8
     return false
   elsif position_taken?(board, index)
     return false
   else
     return true
   end
end

def turn(board)
  puts "Please enter 1-9:"
  userinput = gets.strip
  index = input_to_index(userinput)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  count = 0
  board.each do|turns|
    if turns == "X" || turns == "O"
      count += 1
    end
  end
  return count
end

def current_player(board)
   turn_count(board) % 2 == 0 ?  "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.find do |i|
    win_index1 = i[0]
  	win_index2 = i[1]
  	win_index3 = i[2]

  	pos_1 = board[win_index1]
  	pos_2 = board[win_index2]
  	pos_3 = board[win_index3]

  	if pos_1 == "X" && pos_2 == "X" && pos_3 == "X" || pos_1 == "O" && pos_2 =="O" && pos_3 == "O"
      i
    end
  end
end

def full?(board)
  if board.include?(" ")
    false
  else
    true
  end
end

def draw?(board)
  if won?(board) == nil && full?(board)
    true
  else
    false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    true
  else
    false
  end
end

def winner(board)

  if test = won?(board)
    win_index = test[0]
    if board[win_index] == "X"
      "X"
    else
      "O"
    end
  else
    nil
  end
end

=begin
def play(board)
  while over?(board) == false
    turn(board)
    if won?(board)
      puts "Congratulations " + winner(board) +"!"
      break
    elsif draw?(board) == true
      puts "Cats Game!"
      break
    end
  end
end

=end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations " + winner(board) +"!"
  elsif draw?(board) == true
    puts "Cats Game!"
  end
end
