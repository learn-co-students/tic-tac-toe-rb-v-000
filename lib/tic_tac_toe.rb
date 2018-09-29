
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
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

def player_move(board, index, token)
  board[index] = token
end

def position_taken?(board, position)
  if board[position] == "X" || board[position] == "O" || board[position] == nil
    return true
  else
    return false
  end
end

def valid_move?(board, position)
  if position_taken?(board, position) == false && position.between?(0,8)
    return true
  else
    return false
  end
end

def turn(board)
  puts "Please enter position 1-9:"
  input = gets.chomp
  input = input_to_index(input)
  if valid_move?(board, input)
    token = current_player(board)
    player_move(board, input, token)
  else
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
  count = (board.select {|i| i == "X" || i == "O"}).length
  return count
end

def current_player(board)
  if turn_count(board).odd?
    return "O"
  else
    return "X"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |position|
    position_1 = position[0]
    position_2 = position[1]
    position_3 = position[2]

    index_1 = board[position_1]
    index_2 = board[position_2]
    index_3 = board[position_3]

    if index_1 == "X" && index_2 == "X" && index_3 == "X"
      return position
    elsif index_1 == "O" && index_2 == "O" && index_3 == "O"
      return position
    end
  end
  return false
end

def full?(board)
  if board.select {|i| i == "X" || i == "O"} == board
    return true
  else
    return false
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) != false || draw?(board) == true || full?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) != false
    winner = won?(board)
    return board[winner[0]]
  else
    return nil
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end
  if won?(board) != false
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board) == true
    puts "Cat's Game!"
  end
end
