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

def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  if !valid_move?(board, input)
    turn(board)
  end
  move(board, input, current_player(board))
  display_board(board)
end

def position_taken?(board, location)
  !(board[location]== nil || board[location] == " ")
end

def valid_move?(board, input)
  input.to_i.between?(1,9) && !position_taken?(board, input.to_i-1)
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if combo.all? {|index| board[index] == "X" }
      return combo
    elsif combo.all? {|index| board[index] == "O"}
      return combo
    end
  end
  false
end

def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end





def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def turn_count(board)
  board.count{|token| token == "X" || token == "O"}
end

def move(board, location, player = "X")
  board[location.to_i-1] = player
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end