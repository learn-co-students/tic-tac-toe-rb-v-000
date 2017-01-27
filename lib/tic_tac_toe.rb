# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # bottom row
  [0,3,6],  # 1st column
  [1,4,7],  # middle column
  [2,5,8],  # 3rd column
  [0,4,8],  # diagonal 0 through 8
  [2,4,6],  # diagonal 2 through 6
]

def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!" # <-- this REALLY hung me up!
  elsif draw?(board)
    puts "Cats Game!" # don't know whatis 'Cats Game!' but added to pass rspec
  end                 # failures shown in the test env
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def won?(board)
  WIN_COMBINATIONS.detect do |row| # row accounts for a winning combination
    board[row[0]] == board[row[1]] &&
    board[row[1]] == board[row[2]] &&
    position_taken?(board, row[0])
  end
end
# had to research #detect in rubyDocs/enumerables
# the '#detect' returns the first item in the list for which the block returns TRUE

def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def position_taken?(board, index)
  board[index]== "X" || board[index] == "O"
  

end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def turn_count(board)
  board.count{|token| token == "X" || token == "O"}
end

def move(board, index, player) # copy/paste from ttt-8-turn removed "X" and
  board[index] = player        # changed current_player to player so x || o
end

def winner(board)                # coding ''#winner' to output "Congratulations"
                                 #was the biggest challenge in tic-tac-toe-rb:18
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end
