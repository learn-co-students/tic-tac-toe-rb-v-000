WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

 def display_board(board)
   puts " #{board[0]} | #{board[1]} | #{board[2]} "
   puts "-----------"
   puts " #{board[3]} | #{board[4]} | #{board[5]} "
   puts "-----------"
   puts " #{board[6]} | #{board[7]} | #{board[8]} "
 end

def move(board, position, character = "X")
  board[position.to_i-1] = character
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, position)
  position.to_i.between?(1,9) && !position_taken?(board, position.to_i-1)
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

def turn_count(board)
  counter = 0
  board.each do |b|
    if b == "X" || b == "O"
    counter += 1
    end
  end
  counter
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |set|
    board[set[0]] == board[set[1]] && board[set[1]] == board[set[2]] &&
    position_taken?(board, set[0])
  end
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

 def draw?(board)
   !won?(board) && full?(board)
 end

def draw?(board)
  !won?(board) && board.all? do |check|
    check == "X" || check == "O"
  end
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if winning_set = won?(board)
    board[winning_set.first]
  end
end

def play(board)
  puts "Players turn"
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
end
end