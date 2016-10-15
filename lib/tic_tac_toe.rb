WIN_COMBINATIONS = [
  [0, 1, 2],#horizontal
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],#vertical
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],#diagonal
  [2, 4, 6],
]
board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
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
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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
def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
  end
end
counter
end
def current_player(board)
  turn_count(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end
def won?(board)

  WIN_COMBINATIONS.detect do |combination|
    board[combination[0]] == board[combination[1]] &&
    board[combination[1]] == board[combination[2]] &&
    position_taken?(board, combination[0])

  end
end
def full?(board)
  #returns true if every board tile is full
  board.all? {|tile| tile == "X" || tile == "O" }
end
def draw?(board)
  #returns true if board is full but no one has won
  #returns false if board is nto won and is not full
  #returns false if board is won
  if !won?(board) && full?(board)
    true
  else
  false
  end
end
def over?(board)
  #returns true if board is won, is a draw, or is full
  if draw?(board) || full?(board) || won?(board)
    true
  else
    false
  end
end
def winner(board)
WIN_COMBINATIONS.each do |combination|
  if board[combination[0]] == "X" && board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]]
    return "X"
  end
  if board[combination[0]] == "O" && board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]]
    return "O"
  end
end
  nil
end

def play(board)
  #input = gets.strip
  until over?(board)
    turn(board)
  end
  if won?(board)
    #congratulate winner
    puts "Congratulations #{winner(board)}!" 
  elsif draw?(board)
    puts "Cats Game!"
  end
end
