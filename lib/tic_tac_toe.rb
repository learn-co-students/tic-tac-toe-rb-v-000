#win combinations constant
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

#1. display_board method
 board = [ " " , " " , " " , " " , " " , " " , " " , " " , " " ]
 def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#2. input_to_index method
def input_to_index(user_input)
  user_input.to_i - 1
end

#3. move method
def move(board, index, current_player)
  board[index] = current_player
end


#4. position taken
def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

#5. valid move
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end


#6. turn method
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if !valid_move?(board, index)
    turn(board)
  else
    move(board, index, current_player(board))
    end
  display_board(board)
end



#7. turn_count
def turn_count(board)
 count = 0
 board.each do |index|
   if index != " "
     count += 1
    end
 end
 count
end

#8. current_player
def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

#9. won method
def won?(board)
WIN_COMBINATIONS.each do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]


  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination
   elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
     return win_combination
    else
      false
    end
  end
  false
end


#10. full method
def full?(board)
  board.all? do |position|
    position != " "
  end
end

#11. draw method
def draw?(board)
  !(won?(board)) && full?(board)
end

#12. over method
def over?(board)
  draw?(board) || won?(board) || full?(board)
end

#13. winner method
def winner(board)
  if !won?(board)
   return nil
 elsif (board[won?(board)[0]] == "X")
    return "X"
  elsif (board[won?(board)[0]] == "O")
    return "O"
  end
end

#14. play method

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
