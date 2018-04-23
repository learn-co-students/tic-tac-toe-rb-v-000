WIN_COMBINATIONS = [
  [0, 1, 2], # top row
  [3, 4, 5], # middle row
  [6, 7, 8], # bottom row
  [0, 4, 8], # diagonal left to right
  [2, 4, 6], # diagonal right to left
  [0, 3, 6], # left column
  [1, 4, 7], # center column
  [2, 5, 8] # right column
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
end

def move(board, index, character)
    board[index] = character
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  elsif board[index] == "X" || board[index] == "O"
    return true
  end
end

def valid_move?(board, index)
 if index.between?(0, 8) && (board[index] == " " || board[index] == "" || board[index] == nil)
   return true
 end
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
 counter = 0
 board.each do |turn|
   if turn == "X" || turn == "O"
     counter += 1
   end
 end
 return counter
end

def current_player(board)
  if turn_count(board) % 2 == 1
    return "O"
  else
    return "X"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
   win_index_1 = win_combination[0]
   win_index_2 = win_combination[1]
   win_index_3 = win_combination[2]
   position_1 = board[win_index_1]
   position_2 = board[win_index_2]
   position_3 = board[win_index_3]
     if position_1 == "X" && position_2 == "X" && position_3 == "X"
       return win_combination
     elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
       return win_combination
     else
       false
     end
   end
   return false
end

def full?(board)
  counter = 0
  board.each do |move|
    if move == "X" || move == "O"
      counter += 1
    else
      false
    end
  end
  if counter < 9
    return false
  else
    return true
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

def over?(board)
  if full?(board) == true || won?(board) != false || draw?(board) == true
    return true
  else
    false
  end
end

def winner(board)
  if won?(board) == false
    return nil
  elsif board[won?(board)[0]] == "X"
    return "X"
  elsif board[won?(board)[0]] == "O"
    return "O"
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end
  if won?(board) != false
    if winner(board) == "X"
      puts "Congratulations X!"
    elsif winner(board) == "O"
      puts "Congratulations O!"
    end
  elsif draw?(board) == true
    puts "Cat's Game!"
  end
end
