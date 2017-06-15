#Helper methods
#WIN_COMBINATIONS CONSTANT

WIN_COMBINATIONS = [
  [0, 1, 2], # Top rows
  [3, 4, 5], # middle row
  [6, 7, 8], # bottom row
  [0, 4, 8], # Left diagonal
  [2, 4, 6], # Right diagonal
  [0, 3, 6], # Left column
  [1, 4, 7], # middle column
  [2, 5, 8] # Right column
]

#display_board method
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#input_to_index method
def input_to_index(user_input)
  user_input.to_i - 1
end

#move method
def move(board, index, current_player)
  board[index] = current_player
end

#position_taken method
def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

#valid_move method
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

#turn method
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

#turn_count nethod
def turn_count(board)
  board.count("X") + board.count("O")
end

#current_player methods
def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

#won?(board) method
def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
end

#full?(board) method
def full?(board)
  board.all? do |token|
    if token == "X" || token == "O"
    true
    end
  end
end

#draw?(board) method
def draw?(board)
  if !won?(board) && full?(board)
    true
  end
end

#over?(board) method
def over?(board)
  if won?(board) || draw?(board)
    true
  end
end

#winner method
def winner(board)
  token = won?(board)
  if token != nil
    return board[token[0]]
  else
    nil
  end
end

#play(board) method
def play(board)
  while !over?(board) do
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
