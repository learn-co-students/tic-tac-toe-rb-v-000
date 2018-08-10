WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  return (user_input.to_i) - 1
end

def move(board, pos, char)
  board[pos] = char
  return board
end

def position_taken?(board, position)
  if !(board[position] == nil || board[position] == '' || board[position] == ' ')
    return true
  else
    return false
  end
end

def valid_move?(board, position)
  if !(position_taken?(board, position)) && (position >=0 && position <=8)
    return true
  else
    return false
  end
end

def turn_count(board)
  board.count {|char| char == "X" || char == "O"}
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def turn(board)
 puts "Please choose a space 1-9"
 move = input_to_index(gets.strip)
 if valid_move?(board, move) && !position_taken?(board, move)
   board[move] = current_player(board)
   display_board(board)
   return board
 else
   turn(board)
 end
end


def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end

def play(board)
  while !over?(board)
    if draw?(board)
      puts "Cat's Game!"
    else
      turn(board)
    end
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end
