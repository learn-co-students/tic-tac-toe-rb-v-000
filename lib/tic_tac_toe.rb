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

board = Array.new(9, " ")
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

def move(board, index, char)
  board[index] = char
end

def position_taken?(board, index)
#free position should return false
  if board[index] == " " || board[index] == ""
    return false
  else
    return true
  end
end

def valid_move?(board, index)
#returns true if the move is valid
#valid move is present on the game board, not already filled with a token.
  if position_taken?(board, index) == false && index.between?(0,8)
    return true
  else
    return false
  end
end

def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    token = current_player(board)
    if valid_move?(board, index)
      move(board, index, token)
      display_board(board)
    else
      turn(board)
    end
end

def turn_count(board)
  counter = 0
  board.each do |position|
    if position == "X" || position == "O"
      counter += 1
    else
      counter
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
  #return false/nil if there is no win combination present
  WIN_COMBINATIONS.detect do |combo|
    if position_taken?(board, combo[0]) && board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]
      return combo
    end
  end
end

def full?(board)
  #return true if every element in the board contains either an "X" or an "O"
  if board.include?(" ")
    return false
  else
    return true
  end
end

def draw?(board)
  #returns true if the board has not been won
  #false if the board is not won and the board is not full
  #false if the board is won
  if !won?(board) && full?(board)
    return true
  end
end

def over?(board)
  if won?(board) == true || full?(board) == true || draw?(board) == true
    return true
  end
end

def winner(board)
   winning =  won?(board)
   if winning
     return board[winning[0]]
   end
end

def play(board)
  while !over?(board) && !won?(board)
    turn(board)
  end
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  elsif draw?(board) == true 
    puts "Cats Game!"
  end
end
