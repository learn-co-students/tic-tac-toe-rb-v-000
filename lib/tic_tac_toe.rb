
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

board = [" "," "," "," "," "," "," "," "," "]

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

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if !position_taken?(board, index) && index.between?(0, 8)
    return true
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  token = current_player(board)
  puts index
  if valid_move?(board, index)
    puts move(board, index, token) && display_board(board)
  else
    puts "Your choice is invalid, please try again."
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |space|
    if space == "X" || space == "O"
      counter += 1
    end
end
  return counter
end

def current_player(board)
 if turn_count(board) % 2 == 0
   "X"
 else
   "O"
 end
end

def won?(board)
  WIN_COMBINATIONS.detect do |w|
    board[w[0]] ==  board[w[1]] && board[w[2]] == board[w[0]] && position_taken?(board, w[0])
  end
end

def full?(board)
  board.all? do |b|
    b == "X" || b == "O"
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
    end
end

def over?(board)
  board.all? do |b|
    b == "X" || b == "O" && !won?(board) || won?(board)
  end
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo[0]]
  end
end

def play(board)
    until over?(board) == true || draw?(board) != false
        turn(board)
    end
    if winner(board)
      puts "Congratulations X!"
      puts "Congratulations O!"
    else draw?(board)
      puts "Cat's Game!"
    end
  end
