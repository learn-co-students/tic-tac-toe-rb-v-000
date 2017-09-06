WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [2,5,8],
  [1,4,7]
]

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

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
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
  # we have the board that of course can pass to other method calls

  until over?(board)
    turn(board)
  end
  if won?(board)
  puts "Congratulations #{winner(board)}!"
else
  puts "Cat's Game!"
end
end

def turn_count(board)
  board.count{|token| token != " "}
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.each do |win_array|
    if win_array.all? { |win_index| position_taken?(board, win_index) }
      win_index_1 = win_array[0]
      win_index_2 = win_array[1]
      win_index_3 = win_array[2]

      if board[win_index_1] == board[win_index_2] && board[win_index_1] == board[win_index_3]
        return win_array
      else
      end
    end
  end
  return false
end

def full?(board)
  board.all?{|i| i=="X" || i=="O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end
