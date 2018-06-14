
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

def won?(board)
  WIN_COMBINATIONS.each do |win_array|
    win_index_1 = win_array[0]
    win_index_2 = win_array[1]
    win_index_3 = win_array[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_array
    end
    if position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_array
    end
  end
  return false
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
  if full?(board) && !(won?(board))
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) != false || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  winner_chars = []
  if won?(board) == false
    return nil
  end
  winner_index = won?(board)
  winner_index.each do |index|
    winner_chars << board[index]
  end

  if X_winner(winner_chars) == true
    puts "X"
    return "X"
  elsif O_winner(winner_chars) == true
    puts "O"
    return "O"
  end
end

def X_winner(winner_chars)
  winner_chars.all? do |position|
    position == "X"
  end
end

def O_winner(winner_chars)
  winner_chars.all? do |position|
    position == "O"
  end
end
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

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn_count(board)
  filled = board.select{ |filled| filled == "X" || filled == "O"}
  return filled.count
end

def current_player(board)
  if turn_count(board) % 2 == 0
    current_player = "X"
  else
    current_player = "O"
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    player = current_player(board)
    move(board, index, player)
    display_board(board)
    else
    turn(board)
  end
end

def play(board)
  while over?(board) == false
    turn(board)
    if draw?(board) == true
      break
    end
  end
  if draw?(board) == true
    puts "Cat's Game!"
  else
    if winner(board) == "X"
      puts "Congratulations X!"
    else
      puts "Congratulations O!"
    end
  end
end
