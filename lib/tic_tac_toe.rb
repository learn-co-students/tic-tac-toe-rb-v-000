
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def move(board, index, current_player)
  index = index.to_i
  board[index] = current_player
  return board
end

def position_taken?(board, location)
  location = location.to_i
  if board[location] == "X" || board[location] == "O"
    return true
  else
    return false
  end
end

def valid_move?(board,index)
  index = index.to_i
  if (index > -1 && index < 9)
    if position_taken?(board, index)
      return false
    else
      return true
    end
  else
    return false
  end
end

def input_to_index(user_input)
  user_input = user_input.to_i - 1
  return user_input
end

def turn_count(board)
  counter = 0
  board.each do |position|
    if position == "X" || position == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  turns = turn_count(board) % 2
  player = "O"
  if turns == 0
    player = "X"
  end
  return player
end

def won?(board)
  winning_combo = false
  WIN_COMBINATIONS.each do |combo|
    winning_x = combo.each.all? do |position|
      board[position] == "X"
    end
    winning_o = combo.each.all? do |position|
      board[position] == "O"
    end
    if winning_x || winning_o
      winning_combo = combo
    end
  end
  return winning_combo
end

def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  won = won?(board)
  first_position = false
  name = nil
  if won
    first_position = won[0]
    name = board[first_position]
  end
  return name
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  valid = valid_move?(board,index)
  if valid
    board = move(board,index,current_player(board))
    display_board(board)
    play(board)
  else
    turn(board)
  end

end

def play(board)
  if won?(board)
    winner = winner(board)
    puts "Congratulations, #{winner}!"
  elsif full?(board) && draw?(board)
    puts "Cat's Game!"
  else
    turn(board)
  end
end
