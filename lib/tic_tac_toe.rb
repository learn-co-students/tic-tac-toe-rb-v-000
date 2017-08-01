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

def move(board, index, value)
  board[index]= value
end

def position_taken?(board,position)
  if board[position] == "" || board[position] == " " || board[position] == nil
    return false
  else return true
  end
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board,index)
    move(board,index,value=current_player(board))
    display_board(board)
  else turn(board)
  end
end

def turn_count(board)
  count = 0
  board.each do |index|
    if index != "" && index != " " && index != nil
      count +=1
    end
  end
  return count
end

def current_player(board)
  if turn_count(board) % 2 == 0
      return "X"
    else return "O"
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
  !board.any?{|element| element == nil || element == "" || element == " "}
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else return false
  end
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end

def play(board)
display_board(board)
while !over?(board) && !draw?(board)
  turn(board)
end
if draw?(board)
  puts "Cats Game!"
elsif won?(board)
  puts "Congratulations #{winner(board)}!"
else
  puts "Congratulations X!"
end
end
