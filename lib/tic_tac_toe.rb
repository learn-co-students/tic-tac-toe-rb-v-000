WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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
def move(board, index, player)
  board[index] = player
end
def position_taken?(board, index)
  if (board[index] == " ") || (board[index] == "") || (board[index] == nil)
  return false 
    else
      return true
  end
end
def valid_move?(board, index)
  if (board[index] == " ") || (board[index] == "") || (board[index] == nil) && (index.between?(0,8))
  return false 
    else
      return true 
  end
end
def turn(board)
  until over?(board)
  turn(board)
end
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index) == true
    move(board, index)
  else
    puts "try again"
  end
display_board(board)
end
def turn_count(board)
  counter = 0
  board.each do |space|
    if space == "X" || space == "O"
      counter +=1
  end
end
return counter
end
def current_player(board)
  if turn_count(board)%2 ==0
    current_player = "X"
  else
    current_player = "O"
end
return current_player
end
def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_combination.all? { |win_index| board[win_index] == "X" } ||
    win_combination.all? { |win_index| board[win_index] == "O" }
  end
end
 def full?(board)
  board.all? {|i| i == "X" || i == "O"}
end 
def draw?(board)
  if won?(board) == nil && full?(board) == true
    true
  else
    false 
  end
end
def over?(board)
  if draw?(board) || won?(board) || full?(board)
    return true
  end
end
def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end
def play(board)
  input = gets
  until over?(board)
    turn(board) 
  end
  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else 
      puts "Cats Game!"
    end
   end
 end