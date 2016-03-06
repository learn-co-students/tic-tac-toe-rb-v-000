WIN_COMBINATIONS = [
[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[6,4,2]
]

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]}  "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, location, character = "X")
  board[location.to_i-1] = character
end

def position_taken?(board, position)
  if board[position]=="X"|| board[position]=="O"
    true
  else
    false
  end
end

def valid_move?(board, position)
  position = position.to_i-1
  position.between?(0,8) && !position_taken?(board,position)
end

def turn(board)
  input = gets.strip
  until valid_move?(board, input)
    puts "Invalid entry."
    display_board(board)
    input = gets.strip
  end
  move(board, input, current_player(board))   
end



def turn_count(board)
   board.count do |token|
     token == "X" || token == "O"
   end
  count = 0
  board.each do |token|
    if token == "X" || token == "O"
      count += 1
    end
  end
  count
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else 
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if (combo.all? {|index| board[index] == "X"}) || (combo.all? {|index| board[index] == "O"})
      return combo
    end
  end
  return false
end

def full?(board)
  if board.all? do |value|
    value == "X" || value == "O"
    end
    return true
  else
    return false
  end
end

def draw? (board)
  if won?(board) == false && full?(board) == true
    return true
  else
    return false
  end 
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  return board[won?(board).first] if won?(board)
end

def play(board)
  until over?(board)
     turn(board)
  end

  if draw?(board)
    puts "Cats Game!"

  elsif won?(board)
    puts "Congratulations #{winner(board)}!"

  end
end


