WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
]

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

def move(board, index, character)
  board[index] = character
end

def position_taken?(board, index)
  if board[index] == " "
    return false
  elsif board[index] == ""
    return false
  elsif board[index] == nil
    return false
  elsif board[index] == "O"
    return true
  elsif board[index] == "X"
    return true
  end
end

def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  character = current_player(board)
  if valid_move?(board, index) == true
    move(board, index, character)
    display_board(board)
  else
    turn(board)
  end
end

def current_player(board)
  if turn_count(board).even?
     "X"
  else
     "O"
  end
end

def turn_count(board)
  board.count{|character| character == "X" || character == "O" }
  # turn = 0
  # board.each do |character|
  #   if character == "X" || character == "O"
  #     turn += 1
  #   end
  # end
  # turn
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all? do |box|
    box == "X" || box == "O"
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
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) && board[won?(board)[0]] == "X"
    return "X"
  elsif won?(board) && board[won?(board)[0]] == "O"
    return "O"
  else
    nil
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end

    if over?(board) && won?(board)
      puts "Congratulations #{winner(board)}!"
    elsif over?(board) && draw?(board)
      puts "Cat's Game!"
    end
end
