WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
board = [" "," "," "," "," "," "," "," "," "]
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
def move(board, index_number, token = "X")
   board[index_number]=token 
end
def position_taken?(board, index_number)
  board[index_number]!=" " && board[index_number]!="" && board[index_number]!=nil
end
def valid_move?(board, index_number)
  if position_taken?(board, index_number) == false && index_number.between?(0, 8)
      true
  end
end
def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index_number = input_to_index(user_input)
  if valid_move?(board, index_number)
    token = current_player(board)
    move(board, index_number, token = "X")
    display_board(board)
  else
    turn(board)
  end
end
def turn_counter(board)
  counter = 0
  board.each do |token|
    token == "X" || token == "O"
    counter += 1
  end 
end 
def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  elsif turn_count(board) % 2 != 0
    return "O"
  end 
end
def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    board[win_combination[0]]== board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]] && position_taken?(board,win_combination[0])
  end 
end
def full?(board)
  !board.any? { |x| x == " " }
end 
def draw?(board)
 !won?(board) && full?(board)
end
def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end 
def winner(board)
  if won?(board)
    winner = won?(board)
    board[winner[0]]
  end 
end 
def play(board)
  until over?(board) == true
    turn(board)
  end
