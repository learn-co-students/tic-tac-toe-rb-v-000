require 'pry'
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

def move(board, position, marker = current_player(board))
  board[position.to_i - 1] = marker
end

def position_taken?(board, position)
  board[position] != " "
end

def valid_move?(board, position)
  position = position.to_i
  position.between?(1, 9) && !position_taken?(board, position.to_i-1)
end

def empty_squares(board)
  empty_squares = []
  board.each_with_index do |marker, index|
    empty_squares << index + 1 if marker == " "
  end
  empty_squares
end

def turn(board)
  loop do
    puts "Please choose a square: #{empty_squares(board).join(", ")}:"
    input = gets.chomp
    if valid_move?(board, input) # think: maybe best to pass current_player(board) here instead of in the #move method
      move(board, input)
      break
    else
      puts "Sorry, that's not a valid move."
    end
  end
  display_board(board)
end

def turn_count(board)
  board.select{ |square| square != " "}.count
end

def current_player(board)
 turn_count(board).even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect { |combo| board.values_at(*combo).count("X") == 3 || 
    board.values_at(*combo).count("O") == 3 }
end

def full?(board)
  !board.include?(" ")
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  draw?(board) || won?(board) || full?(board)
end

def winner(board)
  if winner_combo = won?(board)
    board[winner_combo.first]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end

# NOTE: test did not pass when #play looked like the following:
# def play(board)
#  until over?(board)
#    turn(board)
#    if won?(board)
#      puts "Congratulations #{winner(board)}!"
#    elsif draw?(board)
#      puts "Cats Game!"
#    end
# end