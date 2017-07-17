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
board=[" "," "," "," "," "," "," "," "," "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
def input_to_index(s)
  s.to_i - 1
end
def move(board, s , value)
  board[s] = value
end
def position_taken?(board, index)
  if board[index] == " " || board[index] == nil || board[index] == ""
    false
  else
    return true
  end
end
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end
def turn(board)
  puts "Please enter 1-9:"
  index = gets.strip
  index=input_to_index(index)
  if valid_move?(board, index)
    token=current_player(board)
    move(board, index, token)
    display_board(board)
  else turn(board)
end
end
def turn_count(board)
  9 - board.count(" ")
end
def current_player(board)
  if turn_count(board) % 2 == 0
   return "X"
 else
   return "O"
 end
end
def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    #win_combo => [0,1,2]
    #is there a win a positions 0,1,2
    #board #=> [x,x,x]
    if board[win_combo[0]] == 'X' && board[win_combo[1]] == 'X' && board[win_combo[2]] == 'X'
      return win_combo
    elsif board[win_combo[0]] == 'O' && board[win_combo[1]] == 'O' && board[win_combo[2]] == 'O'
      return win_combo
    end
  end
  false
end
def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end
def draw?(board)
  full?(board) && !won?(board)
end
def over?(board)
  draw?(board) || won?(board)
end
def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end
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
