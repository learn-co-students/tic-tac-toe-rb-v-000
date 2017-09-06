def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [[0,1,2],[0,3,6],[0,4,8],[1,4,7],[2,5,8],[2,4,6],[3,4,5],[6,7,8]]

def won?(board)
  WIN_COMBINATIONS.detect do|win|
    if board[win[0]] == "X" && board[win[1]] == "X" && board[win[2]] == "X"
      true
    elsif board[win[0]] == "O" && board[win[1]] == "O" && board[win[2]] == "O"
      true
      return win
    end
  end
end

def full?(board)
  board.all? do |space|
    if space == "X" || space == "O"
      true
    end
  end
end

def draw?(board)
  if !!full?(board) && !won?(board)
    true
  end
end

def over?(board)
  if !!draw?(board) || !!won?(board) || !!full?(board)
    true
  end
end

def winner(board)
  board[won?(board)[0]] if won?(board)
end

def turn_count(board)
  counter = 0
  board.each do |position|
    if position == "X" || position == "O"
   counter += 1
  end
 end
 return counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  elsif turn_count(board) % 2 != 0
    return "O"
  end
end

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

def move(board, index, player)
  board[index] = player
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def play(board)
while !over?(board)
  turn(board)
end
if winner(board) == "X"
  puts "Congratulations X!"
elsif winner(board) == "O"
  puts "Congratulations O!"
elsif !!draw?(board)
  puts "Cat's Game!"
  end
end
