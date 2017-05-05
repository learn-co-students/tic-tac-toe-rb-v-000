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

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, char)
  board[index] = char
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else board[index] == "X" || board[index] == "O"
    true
  end
end

def valid_move?(board, index)
  if index > 8 || index < 0
    false
  elsif position_taken?(board, index) == false
    true
  else position_taken?(board, index) == true
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  input = input_to_index(input)
  if valid_move?(board, input)
    move(board, input, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |index|
    if index == "X" || index == "O"
    counter += 1
  end
  end
  counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    if (board[combo[0]]) == "X" && (board[combo[1]]) == "X" && (board[combo[2]]) == "X"
      return combo
    elsif (board[combo[0]]) == "O" && (board[combo[1]]) == "O" && (board[combo[2]]) == "O"
      return combo
    end
  end
  false
end

def full?(board)
  board.none? do |i|
    i == " "
  end
end

def draw?(board)
  if !won?(board) && full?(board) == true
    return true
  else
    return false
  end
end

def over?(board)
  draw?(board) || won?(board) 
end

def winner(board)
  WIN_COMBINATIONS.detect do |combo|
    if (board[combo[0]]) == "X" && (board[combo[1]]) == "X" && (board[combo[2]]) == "X"
      return "X"
    elsif (board[combo[0]]) == "O" && (board[combo[1]]) == "O" && (board[combo[2]]) == "O"
      return "O"
    end
  end
end

def play(board)
  until (over?(board))
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
