WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

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

def move(board, index, character)
 board[index] = character
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if index.between?(0, 8) && !position_taken?(board, index)
    return true
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  character = current_player(board)
  if valid_move?(board, index) == true
  move(board, index, character)
  display_board(board)
else
  puts "Enter a valid move"
    input = gets.strip
 end
end

def turn_count(board)
  counter = 0
board.each do |element|
  if element == "X" || element == "O"
  counter += 1
  end
end
return counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  result = WIN_COMBINATIONS.select do |win|
    board[win[0]] == board[win[1]] && board[win[1]] == board[win[2]] && position_taken?(board, win[0])
  end 
  if result == []
    nil
  else
    result.flatten
  end
end

def full?(board)
  if board.find{|i| i == " "}
    false
  else
    true
end
end

def draw?(board)
  if full?(board) == true && won?(board) == nil
    true
  else
    false
  end  
end

def over?(board)
  if !!won?(board) == true || draw?(board) == true || full?(board) == true
    true
  else 
    false
  end
end

def winner(board)
  if !!won?(board) == true
    board[won?(board)[0]]
end
end

def play(board)
  counter = 0 
  while counter < 9 && !over?(board)
    turn(board)
    counter += 1
  end  
    if winner(board) == "X"
      puts "Congratulations X!"
      elsif winner(board) == "O"
      puts "Congratulations O!"
    elsif draw?(board) == true
      puts "Cat's Game!"
    else
      puts "Keep playing"
    end
end