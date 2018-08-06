WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def display_board(board)
puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "
   end

def input_to_index(user_input)
   index = user_input.to_i
   index - 1
end

def move(board, position, character)
  board[position] = character
end

def position_taken?(board, position)
 if board[position] == " "
 return false
elsif board[position] == ""
 return false
elsif board[position] == "X" || board[position] == "O"
 return true
else
  return false
  end
end

def valid_move?(board, position)
if position.to_i.between?(0, 8) && position_taken?(board, position) == false
return true
else
  return false
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
  board.each do |board|
if board == "X" || board == "O"
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
  WIN_COMBINATIONS. each do |win_combination|
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
    end
  end
  return false
end

def full?(board)
if board.none?{|i| i ==" " }
  return true
else
  return false
  end
end

def draw?(board)
    full?(board) && !won?(board)
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    position_1 = board[win_combination[0]]
    position_2 = board[win_combination[1]]
    position_3 = board[win_combination[2]]
    if (position_1 == "X" && position_2 == "X" && position_3 == "X")
      return "X"
    elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return "O"
    else
    end
  end
else
  return nil
end
end

def play(board)
  until over?(board) #until the game is over...
    turn(board) #players will keep taking turns
  end
    if won?(board) #if there's a winner...
      winner(board) == "X" || winner(board) == "O" #we check who the winner is...
        puts "Congratulations #{winner(board)}!" #and congratulate them
    elsif draw?(board) #if there's a draw, then print the below strings
      puts "Cat's Game!"
    end
end
