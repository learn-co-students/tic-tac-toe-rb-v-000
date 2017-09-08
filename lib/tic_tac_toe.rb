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
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
def input_to_index (user_input)
  user_input = user_input.to_i - 1
end
def move(array, index, value)
  array[index] = value
end
def position_taken?(board, index)

  if board[index] == " "
    false
  elsif board[index] == ""
    false
  elsif board[index] == nil
    false
  else board[index] == "X" || "O"
    true
  end
end #position_taken? method here,
def valid_move? (board,index)
  if index.between?(0, 8) && position_taken?(board,index) == false
    true
  else
    false
  end
end
def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  value = current_player(board)
  if valid_move?(board, index) == true
    move(board, index, value)
    display_board(board)
  else
    turn(board)
  end
end
def turn_count(board)
  counter = 0
  board.each do |player|
    if player == "X" || player == "O"
      counter += 1
    end
  end
  counter = counter
end
def current_player(board)
  turns = " "
  if turn_count(board) % 2 == 0
    turns = "X"
  elsif turn_count(board) % 2 == 1
    turns = "O"
  end
  turns = turns
end
def won?(board)
  win_combo = WIN_COMBINATIONS.find { |combo| board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X" || board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"}
end
def full?(board)
 board.all?{|space| space == "X" || space == "O"}
end
def draw?(board)
 if !won?(board) && full?(board)
   true
 else
   false
 end
end
def over?(board)
 if won?(board) || draw?(board)
   true
 else
   false
 end
end

def winner(board)
 champ = won?(board)
 champ != nil ? board[champ[0]] : nil
end
def play(board)
  until over?(board) || won?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts"Cat's Game!"
  end
end
