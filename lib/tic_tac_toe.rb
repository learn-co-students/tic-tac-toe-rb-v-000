WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def display_board(board)
  puts " #{board[0]} |" + " #{board[1]} |" + " #{board[2]} "
  puts "-----------"
  puts " #{board[3]} |" + " #{board[4]} |" + " #{board[5]} "
  puts "-----------"
  puts " #{board[6]} |" + " #{board[7]} |" + " #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
  return board
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  !(!index.between?(0, 9) || position_taken?(board, index) == true)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  count = board.select {|i| i != " "}
  return count.length
end

def current_player(board)
  if turn_count(board).even? || turn_count(board) == 0
    return "X"
  else
    return "O"
  end
end


def won?(board)
  if board != [" ", " ", " ", " ", " ", " ", " ", " ", " "]
   WIN_COMBINATIONS.detect do |combo|
     if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
       return combo
     elsif board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
       return combo
     else
       false
     end
   end
end
end

def full?(board)
  board.none? {|position| position == " "}
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if combo = won?(board)
    return board[combo.first]
  else
    return nil
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
