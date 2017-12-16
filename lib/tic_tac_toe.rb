def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[2,4,6],[0,4,8]]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|

if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X" ||
  board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
    return win_combination
  end
end
end

def full?(board)
 final_tally = 0
 board.each do |token|
   if token == "X" || token == "O"
     final_tally += 1
   end
 end
  if final_tally == 9
    true
  else
    false
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  combo = won?(board)
  if !combo
    return nil
  else
    return board[combo[2]]
  end

end

def valid_move?(board, index)
!position_taken?(board,index) &&  index.between?(0,8)
end

def input_to_index(input)
  input.to_i - 1
end

def move (board, index, player)
  board[index] = player
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def turn_count(board)
  counter = 0
  board.each do |space|
    if space == "X" || space == "O"
      counter += 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board).even?
return  "X"
else
  return "O"
end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board,index)
    move(board, index, current_player(board))
  else
    turn(board)
  end
  display_board(board)
end

def play(board)
  while !over?(board)
    turn(board)
  end
  if draw?(board)
    puts "Cat's Game!"
  else won?(board)
    puts "Congratulations #{winner(board)}!"
  end
end
