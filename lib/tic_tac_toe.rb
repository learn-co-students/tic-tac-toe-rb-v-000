WIN_COMBINATIONS = [
  [0,1,2], # top row win
  [3,4,5], # middle row win
  [6,7,8], # bottom row win
  [0,3,6], # left column win
  [1,4,7], # middle column win
  [2,5,8], # right column win
  [0,4,8], # left diagonal win
  [2,4,6]  # right diagonal win
  ]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  index = input.to_i - 1
  return index
end

def move(board, index, token)
  board[index] = token
end
  
def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    return true
  else board[index] != " " || board[index] != "" || board[index] != nil
    return FALSE
  end
end

def valid_move?(board,index)
  if index.between?(0,8) && (position_taken?(board,index) == FALSE)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets
  index = input_to_index(input)
  if valid_move?(board,index)
    move(board,index,value)
  else
    while !valid_move?(board,index)
      puts "Please enter 1-9:"
      input = gets
      index = input_to_index(input)
    end
    move(board,index,value)
  end
  display_board(board)
end

def turn_count(board)
  count = 0
  board.each do |token|
    if token == "O" || token == "X"
      count += 1
    end
  end
  return count
end

def current_player(board)
  if turn_count(board) == 0
    return "X"
  elsif turn_count(board).even?
    return "X"
  else turn_count(board).odd?
    return "O"
  end
end
  
def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]
  
  position_1 = board[win_index_1] # load the value of the board at win_index_1
  position_2 = board[win_index_2] # load the value of the board at win_index_2
  position_3 = board[win_index_3] # load the value of the board at win_index_3
  
  if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
    return win_combination
    end
  end
  return false
end

def full?(board)
  board.each do |i|
    if i == "" || i == " " || i == nil
      return FALSE
    end
  end
end

def draw?(board)
  full?(board) && won?(board) == FALSE
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  combination = won?(board)
  if(combination)
    if(board[combination[0]] =='X') 
      return 'X'
    else 
      return 'O'
    end
  else
    nil
  end
end

def play(board)
  while !over?(board)
    turn(board)
    turn_count(board)
    current_player(board)
    if won?(board)
      winner(board)
    else draw?(board)
      puts "Cat's Game!"
    end
  end
end