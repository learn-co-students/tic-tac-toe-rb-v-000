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

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS =[
[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[6,4,2]
]

def won?(board)

    WIN_COMBINATIONS.detect do |win_combination|
(board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X") || (board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O")
end
end


def full?(board)
  if board.include?(" ")
    return false
  else
    return true
  return true
end
end

def draw?(board)
  if  !won?(board) && full?(board) == true
      return true
    elsif  won?(board) == false && full?(board) == false
return false
  else   won?(board)  && full?(board) == true
return false
  end
end

def over?(board)
  if won?(board) || draw?(board) == true || full?(board) == true
  return true
end
end

def winner(board)
  if !won?(board)
  return  nil
  else board[won?(board)[0]]
end
end

def turn (board)
  puts "Please enter 1-9:"
input = gets.strip
index = input_to_index(input)
if valid_move?(board,index)
  move(board, index, current_player(board))
  display_board (board)
else
  turn(board)
end
end

def valid_move?(board,index)
  if index.between?(0,8) && position_taken?(board,index) == false
    true
  else
    false
end
end

def turn_count (board)
counter = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      counter +=1
    end
  end
    return counter
  end


def current_player(board)
  if turn_count(board)%2 == 0
    return "X"
  else
    return "O"
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
      puts "Congratulations O!"
  else draw?(board) == true
    puts "Cat's Game!"
  end
end
