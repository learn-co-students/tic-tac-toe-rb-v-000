WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
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


def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.chomp
  input_to_index(input)
  index = input.to_i - 1
    if valid_move?(board, index)
      move(board, index, current_player(board))
      display_board(board)
    else
      turn(board)
    end
  end

def turn_count(board)
  counter = 0
  board.each do |element|
    if element == "X" || element == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  if turn_count(board).even? == true
    "X"
  else
    "O"
  end
end

def won?(board)
 WIN_COMBINATIONS.find do |win_combination|
   win_combination.all?{|index| board[index] == "X"} ||
   win_combination.all?{|index| board[index] == "O"}
 end
end

def full?(board)
  board.all?{|token|  token == "X" || token == "O"}
end


def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  draw?(board) || won?(board)
end


def winner(board)
   return nil unless won?(board)
   win_index = won?(board)[0]
   board[win_index]
 end

 def play(board)
  turn(board) until over?(board)
  if draw?(board)
    puts "Cats Game!"
  elsif won?(board)
    puts "Congratulations #{winner(board)}!"
    end
  end
