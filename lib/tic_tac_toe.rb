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

def position_taken?(board,index)
  if (board[index] == "X") || (board[index] == "O")
    true
  else
    false
  end
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board,index)
    move(board,index, current_player = "X")
  else
    turn(board)
  end
display_board(board)
end

def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn.downcase == "x" || turn.downcase == "o"
      counter += 1
      puts "#{counter}"
    end
  end
  counter
end

def current_player (board)
  num = turn_count(board)
  if num % 2 == 0
    return "X"
  else
    return "O"
  end
end


def won?(board)
  WIN_COMBINATIONS.each do |win|
  index = win[0]
    if position_taken?(board, index) == true && board[win[0]] == board[win[1]] && board[win[1]] == board[win[2]]
      return win
    end
  end
false
end

def full? (board)
  if board.include? (" ")
    return false
  else
    return true
  end
end

def draw? (board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over? (board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end

def play(board)
  until over?(board) || won?(board) || full?(board)
  puts 'turn'
    turn(board)
  end
  if winner(board)
    puts board[won?(board)[0]]!
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
