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
  
  board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
def display_board(board)
      puts " #{board[0]} | #{board[1]} | #{board[2]} "
      puts "-----------"
      puts " #{board[3]} | #{board[4]} | #{board[5]} "
      puts "-----------"
      puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input = input.to_i - 1 
end

def move(board, index, character)
  return board[index] = character
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == ""
   false
   elsif board[index] == "X" || board[index] == "O"
   true
 else
   false
  end
end

def valid_move?(board, index)
  if position_taken?(board, index)
    false
    elsif index.between?(0,8) 
    true
  end
end


def turn(board) 
  puts "Please make a move 1-9"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index) == true
    move(board, index, current_player(board))
  else
    "Please try again"
    input = gets.strip
  end
    display_board(board)
end

def turn_count(board)
  count = 0 
  board.each do |moves|
    if moves == "X" || moves == "O"
    count += 1
  end
  end
  count
end

def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
   if board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X"
    return win_combo
  elsif board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O"
     return win_combo
    end
  end
    return false
 end


def full?(board)
  board.none? {|moves| moves == " "}
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  end
end

def winner(board)
 if won?(board)
    won?(board).each do |token|
      return board[token]
    end
  end
end

def play(board) 
  until over?(board) == true
  turn(board)
end

if won?(board)
  puts "Congratulations #{winner(board)}!"
elsif draw?(board)
  puts "Cat's Game!"
end
end