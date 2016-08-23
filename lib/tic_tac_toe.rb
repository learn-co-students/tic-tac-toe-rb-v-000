WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

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

def position_taken?(board, index)
  board[index] == "X" || board[index] == "O"
end

def valid_move?(board, index)
  index <= 8 && index >= 0 == true &&
  position_taken?(board, index) == false
end

def move(board, index, current_player)
  board[index] = current_player
  display_board(board)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index) == true
    move(board, index, current_player(board))
    board
  else valid_move?(board, index) == false
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |index|
    if index != "" && index != " "
      counter += 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board).even?
    "X"
  elsif turn_count(board).odd?
    "O"
  end
end

def won?(board)
   WIN_COMBINATIONS.detect do |win_index|
     board[win_index[0]] == board[win_index[1]] &&
     board[win_index[1]] == board[win_index[2]] &&
     position_taken?(board, win_index[0])
   end
 end


def full? (board)
  board.all? do |occupied|
     occupied == "X" || occupied == "O"
   end
 end

def draw?(board)
   won?(board) == nil && full?(board) == true
end

def over?(board)
  if (draw?(board) == true) || (won?(board) != nil)
    over = true
  else
    over = false
  end
end

def winner(board)
  if won?(board) != nil
    winner = board[won?(board)[0]]
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end
  if draw?(board) == true
      puts "Cats Game!"
  else puts "Congratulations #{winner(board)}!"
  end
end
