# Helper Methods
WIN_COMBINATIONS = [
  [0, 1, 2], # Top Row
  [3, 4, 5], # Middle Row
  [6, 7, 8], # Bottom Row
  [0, 3, 6], # First Column
  [1, 4, 7], # Second Column
  [2, 5, 8], # Third Column
  [0, 4, 8], # Top Left Diagonal
  [2, 4, 6] # Top Right Diagonal
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, position, current_player = "X")
  board[position.to_i-1] = current_player
end

def position_taken?(board, position)
  if board[position] == " " || board[position] == "" || board[position] == nil
    false
  else
    true
  end
end

def valid_move?(board,position)
  position = position.to_i - 1
  if position.between?(0,8)
    if board[position]== " " || board[position] == ""
        true
    end
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  position = gets.chomp
  if valid_move?(board,position)
    move(board, position, current_player(board))
  else
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
  counter = 0
  board.each do |random|
    if random == "X" || random == "O"
      counter +=1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.any? do |combination|
    if (board[combination[0]] == "X" || board[combination[0]] == "O") && board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]]
      return combination
    end
  end
end

def full?(board)
  board.all? {|spot| spot == "X" || spot == "O"}
end

def draw?(board)
  if won?(board) == false && full?(board) == true
      true
   else
      false
   end
 end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  end
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations " + winner(board) + "!"
  elsif draw?(board)
      puts "Cats Game!"
  end
end

