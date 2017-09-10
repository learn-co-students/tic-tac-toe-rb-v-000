#WIN_COMBINATIONS
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
#play
def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else draw?(board)
    puts "Cats Game!"
  end
end
#display_board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
board = [" "," "," "," "," "," "," "," "," "]
display_board(board)
#input_to_index
def input_to_index(user_input)
  user_input.to_i - 1
end
#move
def move (board, index, current_player)
  board[index] = current_player
end
#valid_move
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end
#position_taken
def position_taken?(board, index)
  taken = nil
  if (board[index] ==  " " || board[index] == "" || board[index] == nil)
    taken = false
  else
    taken = true
  end
end
#turn
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
#turn_count
def turn_count(board) #determining which players turn is it
  turns = 0
  board.each do |player|
    if player == "X" || player == "O"
      turns += 1
    end
  end
  turns
end
#current_player
def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end
#won method
def won?(board)
  WIN_COMBINATIONS.detect do |winning|
    board[winning[0]] == board[winning[1]] &&
    board[winning[1]] == board[winning[2]] &&
    position_taken?(board,winning[0])
  end
end
#full
def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end
#draw
def draw?(board)
  full?(board) && !won?(board)
end
#over
def over?(board)
  full?(board) || won?(board) || draw?(board)
end
#winner
def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end
