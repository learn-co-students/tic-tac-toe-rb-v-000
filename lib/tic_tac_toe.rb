# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
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

def input_to_index (x)
  x = x.to_i - 1
end

def move(board, index, char)
  board[index] = char
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# code your #valid_move? method here
def valid_move?(board, index)
  if !position_taken?(board, index) && (index >= 0 && index < 9)
    true
  else
    false
  end
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

def turn_count(board)
  counter = 0
  board.each do |space|
    if space == "X" || space == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|

    if ((position_taken?(board,win_combination[0])) &&  (board[win_combination[0]] == "X")) && ((position_taken?(board,win_combination[0])) && (board[win_combination[1]] == "X")) &&
      ((position_taken?(board,win_combination[0])) && (board[win_combination[2]] == "X"))
      return win_combination
  elsif ((position_taken?(board,win_combination[0])) && (board[win_combination[0]] == "O")) && ((position_taken?(board,win_combination[0])) && (board[win_combination[1]] == "O")) &&
    ((position_taken?(board,win_combination[0])) && (board[win_combination[2]] == "O"))
      return win_combination
  end
end
  return false
end

def full?(board)
  board.all? {|cell| cell != " "}
end

def draw?(board)
!won?(board) && full?(board) ? true : false
end

def over?(board)
  won?(board) || full?(board) || draw?(board) ? true : false
end

def winner(board)
  won?(board) ? board[won?(board)[0]] : nil
end

def play(board)
  while !over?(board)
    turn(board)
  end
if winner(board) == "X"
  puts "Congratulations X!"
elsif winner(board) == "O"
  puts "Congratulations O!"
else
  puts "Cats Game!"
end
end
