require 'pry'
WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                    [0, 3, 6], [1, 4, 7], [2, 5, 8],
                    [0, 4, 8], [2, 4, 6]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(index)
  index.to_i - 1
end

def move(board, index, player)
  board[index] = player
end

def position_taken?(board, index)
  board[index] != " "
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  index = input_to_index(gets)
  while !valid_move?(board, index)
    puts "Invalid move. Please enter 1-9:"
    index = input_to_index(gets)
  end
  move(board, index, current_player(board))
  display_board(board)
end

def turn_count(board)
  count = 0
  board.each do |position|
    if position == "X" || position == "O"
      count += 1
    end
  end
  count
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  end
  "O"
end

def won?(board)
  WIN_COMBINATIONS.each do |win|
    x_won = [board[win[0]], board[win[1]], board[win[2]]].all? do |i|
      i == "X"
    end
    o_won = [board[win[0]], board[win[1]], board[win[2]]].all? do |i|
      i == "O"
    end
    if x_won || o_won
      return win
    end
  end
  false
end

def full?(board)
  board.none?{|i| i == " "}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  WIN_COMBINATIONS.each do |win|
    x_won = [board[win[0]], board[win[1]], board[win[2]]].all? do |i|
      i == "X"
    end
    o_won = [board[win[0]], board[win[1]], board[win[2]]].all? do |i|
      i == "O"
    end
    if x_won
      return "X"
    elsif o_won
      return "O"
    end
  end
  nil
end

def play(board)
  until over?(board) do
    turn(board)
  end
  if winner(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end
