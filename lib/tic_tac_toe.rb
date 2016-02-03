#helper methods
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

WIN_COMBINATIONS=[
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

def move(board, location, current_player = "X")
  board[location.to_i-1] = current_player
end

def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def valid_move?(board, position)
  position.to_i.between?(1,9) && !position_taken?(board, position.to_i-1)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(board, input) && turn_count(board).even?
    move(board, input, "X")
  elsif valid_move?(board, input) && turn_count(board).odd?
    move(board, input, "O")
  else
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
  turn_counter = 0
  board.each do |character|
    if "#{character}" == "X"
      turn_counter = turn_counter + 1
    elsif "#{character}" == "O"
      turn_counter = turn_counter + 1
    else 
      turn_counter = turn_counter
    end
  end
  return turn_counter
end

def current_player(board)
  turn_count(board)
  if turn_count(board) % 2 == 0
    "X"
  elsif turn_count(board) % 2 == 1
    "O"
  end
end

def won?(board)
  if won_helper?(board) == WIN_COMBINATIONS
    false
  else
    won_helper?(board)
  end
end

def won_helper?(board)
  WIN_COMBINATIONS.each do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination [2]

  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]
  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
  end
  end
end

def full?(board)
  !board.include?(" " || "")
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  if won?(board) || draw?(board) 
    true
  end
end

def winner(board)
  if won?(board) != false
    board[won?(board)[0]]
  end
end

def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board) && winner(board) == "X"
    puts "Congratulations X!" 
  elsif won?(board) && winner(board) == "O" 
    puts "Congratulations O!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end


