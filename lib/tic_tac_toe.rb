WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

board = [" "," "," "," "," "," "," "," "," "]

def display_board(board)

  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "

end

def input_to_index(move)
  move = move.to_i - 1
end

def move(array, index, value)
  array[index] = value
end

def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
      true
  elsif
    board[index] = 0
 false
   end
 end

 def valid_move?(board, index)
   index.between?(0, 8) && !position_taken?(board, index)
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
  board.count{|token| token == "X" || token == "O"}
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.each do |index|
    if (board[index[0]] == "X" && board[index[1]] == "X" && board[index[2]] == "X") ||
      (board[index[0]] == "O" && board[index[1]] == "O" && board[index[2]] == "O")
      return index
    end
  end
  return
  false
end

def full?(board)
  board.none? {|i| i == " "}
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  end
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if winner = won?(board)
    board[winner[0]]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif
    draw?(board)
    puts "Cat's Game!"
  end
end
