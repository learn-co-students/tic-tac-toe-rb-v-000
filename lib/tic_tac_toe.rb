
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #left diagonal
  [2,4,6] #right diagonal
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  integer_array = user_input.to_i - 1
end

def move(board, position, character)
  board[position] = character
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  elsif board[index] == "X" || board[index] == "O"
    true 
  end
end

def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0, 8) == true
    true
  end
end

def turn(board)
  character = current_player(board)
  
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  
    if valid_move?(board, index)
        move(board, index, character)
        display_board(board)
    else
      turn(board)
    end
end

def turn_count(board)
  counter = 0
  
  board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
      puts counter
    end
  end
  counter
end

def current_player(board)
  counter = turn_count(board) 
    if counter.even? 
      "X"
    else
      "O"
    end
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    
    index0 = combo[0]
    index1 = combo[1]
    index2 = combo[2]   
  
    position1 = board[index0]
    position2 = board[index1]
    position3 = board[index2]
  
    if position1 == "X" && position2 == "X" && position3 == "X"
      return combo
    elsif position1 == "O" && position2 == "O" && position3 == "O"
      return combo
    end
  end
    return false
end

def full?(board)
  board.all? { |index| index == "X" || index == "O" }
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  else
    false
  end
end

def over?(board)
  if draw?(board) || full?(board) || won?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board) != false
    won = won?(board)
    player = won[0]
    return board[player]
  else
    nil
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end
  
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board) == true
    puts "Cat's Game!"
  end
end

