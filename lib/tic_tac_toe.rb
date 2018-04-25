board = Array.new [" ", " ", " ", " ", " ", " ", " ", " ", " "]

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
  board[index] = value
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  value = current_player(board)
  if valid_move?(board, index)
    move(board, index, value)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn.downcase == "x" || turn.downcase == "o"
      counter += 1
      puts "#{counter}"
    end
  end
  counter
end

def current_player(board)
    num = turn_count(board)
    if num % 2 == 0
      return "X"
    else
      return "O"
    end
  end

WIN_COMBINATIONS = [
  [0,1,2], # top_row
  [3,4,5], # middle_row
  [6,7,8], # bottom_row
  [0,3,6], # left_column
  [1,4,7], # center_column
  [2,5,8], # right_column
  [0,4,8], # left_diagonal
  [6,4,2]  # right_diagonal
]

def won?(board)
  combo = 0
  while combo < WIN_COMBINATIONS.length
    current_combo = WIN_COMBINATIONS[combo]

    win1 = current_combo.all? { |position| board[position] == "X" }
    win2 = current_combo.all? { |position| board[position] == "O" }

    if win1 == true || win2 == true
      return current_combo
    else
      false
    end
    combo += 1
  end
end

def full?(board)
  board.all? {|i| i == "X" || i == "O"}
end    
  
def draw?(board)
  if !won?(board) && full?(board)
    return true
  end
end 

def over?(board)
  if draw?(board) || won?(board) || full?(board)
    return true
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end

def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations " + winner(board) + "!"
  elsif draw?(board)
    puts "Cat's Game!"
  else
    #do nothing
  end
end
