
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(board, idx, token)
  board[idx] = token
end

def position_taken?(board, idx)
  board[idx] != " "
end

def valid_move?(board, idx)
  idx.between?(0, 8) && !position_taken?(board, idx)
end

def turn(board)
  puts "Please enter 1-9:"
   input = gets.strip
      idx = input_to_index(input)
   if valid_move?(board, idx)
      move(board, idx, current_player(board))
   else turn(board)
   end
 display_board(board)
end


def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def turn_count(board)
  board.count { |cell| cell != " " }
end

def won?(board)
  WIN_COMBINATIONS.find do |cmbo|
    board[cmbo[0]] == board[cmbo[1]] &&
    board[cmbo[1]] == board[cmbo[2]] &&
    position_taken?(board, cmbo[0])
  end
end

def play(board)
if over?(board)
  display_board(end)
end
turn(board)
end

def full?(board)
 board.all? { |cell| cell != " " }
end

def draw?(board)
!won?(board) && full?(board)
end

def over?(board)
 draw?(board) || full?(board)
  end

def winner(board)
 if cmbo = won?(board)
  board[cmbo.first]
 end
end
