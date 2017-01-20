WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,4,8], # Diagonal top left to bottom right
  [6,4,2], # Diagonal bottom left to top right
  [0,3,6], # Left vertical
  [1,4,7], # Middle vertical
  [2,5,8], # Right vertical
]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, character)
  board[index] = character
  board
end

def position_taken?(board, index)
  pos = board[index]
  ["X", "O"].include? pos
end

def valid_move?(board, i)
  i.between?(0, 8) && !position_taken?(board, i)
end

def turn(board)
  puts "Please enter 1-9:"
  array_index = input_to_index(gets.strip)
  if valid_move?(board, array_index)
    display_board(move(board, array_index, current_player(board)))
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |cell|
    if cell == "X" || cell == "O"
      counter += 1
    end
  end
  counter
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    if win_combination.all? {|i| position_taken?(board, i)}
      if win_combination.all? {|i| board[i] == "X"}
        true
      elsif win_combination.all?{|i| board[i] == "O"}
        true
      end
    end
  end
end

def full?(board)
  board.all? {|i| i != " "}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  draw?(board) || full?(board) || won?(board)
end

def winner(board)
   if won?(board)
     board_array = won?(board).map {|e| board[e] }
     board_array.detect {|e| e == "X" || e == "O"}
   end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if winner(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
