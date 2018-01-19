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

def display_board (board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end 

def input_to_index(input)
  index = input.to_i - 1  
end

def move(board, index, character)
    board[index] = character 
 end 

def position_taken?(board, index)
  if board[index] == " " || board [index] == "" || board[index] == nil
    return false
  else
    return true
  end
end

def valid_move? (board, index)
  if board[index] == " " && index.between?(0, 8)
    return true 
  else 
    return false  
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  while valid_move?(board, index) == false
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
    return true
  end 
  move(board, index, character = current_player(board))
  display_board(board)
end

def turn_count(board)
  counter = 0 
  board.each do |element|
    if element != " "  
      counter += 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board) % 2 == 0 
    return "X"
  else 
    return "O"
  end 
end

def won?(board)
  WIN_COMBINATIONS.select do |win_combination|
    if board[win_combination[0]] != " " && board[win_combination[0]] == board[win_combination[1]] && board[win_combination[0]] == board[win_combination[2]]
      return win_combination 
    end
  end
  return false
end
def full?(board)
  board.none? do |index|
    index == " "
  end
end
def draw?(board)
  full?(board) == true && won?(board) == false
end
def over?(board)
  won?(board) != false || draw?(board) == true || full?(board) == true
end
def winner(board)
  if won?(board) != false
    board[won?(board)[0]]
  end
end

def play(board) 
  if won?(board) != false
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board) == true
    puts "Cat's Game!"
  end 
  until over?(board) == true 
  turn(board)
  end
end


