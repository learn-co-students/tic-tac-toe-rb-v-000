 require "pry"
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

def move(board, index, symbol)
  board[index] = symbol
end

def position_taken?(board, index)
    if board[index] == "X" || board[index] == "O"
      true
    elsif board[index] == "" || board[index] == nil || board[index] == " "
      false
    end
end

def valid_move?(board, index)
    if index.between?(0,8) && board[index] == " "
      true
    elsif board[index] == "X" || board[index] == "O"
      false
    end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets
  index = input_to_index(user_input)
  puts "Please enter 1-9:"
  if valid_move?(board, index)
    symbol = current_player(board)
    move(board, index, symbol)
  else
    #binding.pry
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
    counter = 0
    board.each do |token|
      if token == "X" || token == "O"
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
  WIN_COMBINATIONS.each do |win_combination|
    position_1 = win_combination[0]
    position_2 = win_combination[1]
    position_3 = win_combination[2]
    if position_taken?(board, position_1) && board[position_1] == board[position_2] && board[position_3] == board[position_1]
      return win_combination
    end
  end
  return false
end

def full?(board)
  board.each do |token|
    if token == " "
      return false
    else token == "X" || token == "O"
    end
  end
end

def draw?(board)
  if won?(board)
    return false
  end
  if full?(board)
    return true
  end
  board.each do |token|
    if token != "X" || token != "O"
      return false
    end
  end
  true
end

def over?(board)
  if full?(board)
    print "In full"
    return true
  end
  if draw?(board)
    print "In draw"
    return true
  end
  if won?(board)
    print "In won"
    return true
  end
  false
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo[0]]
  end
end

def play(board)
  current_player(board)
  while over?(board) != true
  	 turn(board)
  end
  if winner(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
