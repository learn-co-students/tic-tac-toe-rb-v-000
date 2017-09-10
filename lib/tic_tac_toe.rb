WIN_COMBINATIONS =
[[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[2,4,6]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input = -1)
  index = user_input.to_i - 1
end

def move(board, index, char)
  board[index] = char
  return board
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index.to_i.between?(0, 8) == true && board[index] == " " || board[index] == ""
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.chomp
  input_to_index(user_input)
  index = user_input.to_i - 1
  if valid_move?(board, index) == true
    move(board, index, char = current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |space|
    if space == "X" or space == "O"
      counter +=1
    end
  end
  return counter
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |combination|
     combination.all?{|index| board[index] == "X"} || combination.all?{|index| board[index] == "O"}
  end
end

def full?(board)
  board.none? do |space|
    space == " "
  end
end

def draw?(board)
  if full?(board) && !(won?(board))
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  WIN_COMBINATIONS.detect do |combination|
    if combination.all?{|index| board[index] == "X"}
      return "X"
    elsif combination.all?{|index| board[index] == "O"}
      return "O"
    else
      nil
    end
  end
end

def play(board)
  until over?(board)
    current_player(board)
    turn(board)
  end
  if won?(board)
    if winner(board) == "X"
      puts "Congratulations X!"
    else
      puts "Congratulations O!"
    end
  else
    puts "Cat's Game!"
  end
end
