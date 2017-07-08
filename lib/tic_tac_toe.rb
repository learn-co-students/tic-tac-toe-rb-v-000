def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

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

  def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def turn_count(board)
  board.count{|player| player == "X" || player == "O"}
end

def valid_move?(board, index)
  !position_taken?(board, index) && index.between?(0, 8)
end

def position_taken?(board, index)
 board[index] == "X" || board[index] == "O"
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

  def turn(board)
    print "Please enter 1-9:"
    user_input = gets.strip
     position = input_to_index(user_input)
    if valid_move?(board, position)
      puts move(board, position, current_player(board))
      display_board(board)
    else
      puts turn(board)
    end
  end

WIN_COMBINATIONS = [
 [0,1,2],
 [3,4,5],
 [6,7,8],
 [0,4,8],
 [2,4,6],
 [0,3,6],
 [1,4,7],
 [2,5,8]
]

def won?(board)
 WIN_COMBINATIONS.detect do |combo|
   board[combo[0]] == board[combo[1]] &&
   board[combo[1]] == board[combo[2]] &&
   position_taken?(board, combo[0])
 end
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

def winner(board)
 if winner = won?(board)
   board[winner.first]
 end
end
