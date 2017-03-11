WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #First column
  [1,4,7], #Second column
  [2,5,8], #Third column
  [0,4,8], #Diagonal left-to-right
  [6,4,2]  #Diagonal right-to-left
]
def display_board(board)
  print " #{board[0]} | #{board[1]} | #{board[2]} \n"
  print "-----------\n"
  print " #{board[3]} | #{board[4]} | #{board[5]} \n"
  print "-----------\n"
  print " #{board[6]} | #{board[7]} | #{board[8]} \n"
end

def input_to_index(user_input)
  user_input = user_input.to_i
  user_input = user_input - 1
  return user_input
end

def move (board, index, char)
  board[index] = char
  return board
end

def position_taken?(board, index)
  if board[index] == "" || board[index] == " " || board[index] == nil
    return false
  else
    return true
  end
end

def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board, index)
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
    move(board, index, char = "X")
  else
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
  counter = 0
  board.each do |char|
    if char == "X" || char == "O"
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
  won = false
  WIN_COMBINATIONS.each do |combination|
    win_index_1 = combination[0]
    win_index_2 = combination[1]
    win_index_3 = combination[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      won = combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      won = combination
    end
  end
  return won
end

def full?(board)
  if (board.detect{|i| i == " "}) == nil
    return true
  else
    return false
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  if draw?(board) == true
    return true
  elsif won?(board).is_a?(Array) == true
    return true
  end
end

def winner(board)
  if won?(board).is_a?(Array) == true
    winner = won?(board)
    return board[winner[0]]
  end
end

def play(board)
  turn(board)
end
