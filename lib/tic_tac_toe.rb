user_input = ""
def display_board(board)
  puts " #{board [0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

WIN_COMBINATIONS = [
[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[2,4,6],
[0,4,8]
]

def input_to_index(user_input)
  user_input.to_i - 1
end

def move (board,input_to_index,user_token)
  board[input_to_index.to_i]= user_token
  display_board(board)
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]]=="X"&&board[combo[1]]=="X"&&board[combo[2]]=="X"
    return combo
  elsif board[combo[0]]=="O"&&board[combo[1]]=="O"&&board[combo[2]]=="O"
    return combo
  end
end
  return false
end

def full?(board)
  if board.any?{|i|i==" "}
    return false
  else return true
  end
end

def draw?(board)
  if full?(board) == false
    return false
  elsif won?(board) != false
    return false
  else
    return true
  end
end

def over?(board)
  if won?(board) != false || full?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) != false
    win_arr = won?(board)
    return board[win_arr[0]]
  end
end

def turn_count(board)
turn = []
turn = board.select{|v|v=="X"||v=="O"}
return turn.length
end

def current_player(board)
  player = turn_count(board)
  if player % 2 == 1
    return "O"
  else
    return "X"
  end
end

#turn and play
def turn (board,user_input)
  index = input_to_index(user_input)
  user_token = current_player(board)
  if valid_move?(board,index) == false
    puts "invalid move!"
    play(board)
  else
    move(board,index,user_token)
    play(board)
  end
end

def play(board)
  user_input = ""
  if over?(board) == false
    puts "Please Pick A Number 1-9"
    user_input = gets
    turn(board,user_input)
  elsif won?(board) != false
    puts"Congratulations #{winner(board)}!"
      return nil
  elsif draw?(board) == true
    puts "CATS GAME!"
      return nil
  end
end
