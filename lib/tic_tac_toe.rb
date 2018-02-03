
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
   index = user_input.to_i - 1
end

def input_to_index(user_input)
   index = user_input.to_i - 1
end

def move(board, index, value)
  board[index] = value
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
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
  if valid_move?(board, index)
       move(board, index, current_player(board))
  else
      puts "Invalid move."
      turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each { |token|
    if token == "O" || token == "X"
       counter += 1
    end
  }
  return counter
end

def current_player(board)
    counter = turn_count(board)
    if counter.odd?
      player = "O"
    else
      player = "X"
    end
    return player
end

def won?(board)
  WIN_COMBINATIONS.each do |combwin|
     if board[combwin[0]] == "X" && board[combwin[1]] == "X" && board[combwin[2]]  == "X"
       return combwin
     end

     if board[combwin[0]] == "O" && board[combwin[1]] == "O" && board[combwin[2]]  == "O"
       return combwin
     end
  end
  return false
end

def full?(board)
  total = board.all? do |value|
    value == "X" || value == "O"
  end
  return total
end

def draw?(board)
    if full?(board) == true && won?(board) == false
      return true
    end
end

def over?(board)
  if won?(board)
    return true
  elsif  draw?(board) == true
   return true
 else
    return false
 end
end

def winner(board)
  if won?(board) != false
  matrix = won?(board)
 return board[matrix[0]]
 end
end

def play(board)
  

  while !over?(board)  #until the game is over--> take turns
     turn(board)
  end

  if won?(board) != false
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  else
  end


end
