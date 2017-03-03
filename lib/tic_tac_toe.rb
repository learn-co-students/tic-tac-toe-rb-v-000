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

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter a number 1-9"
  user_input = gets.strip
  index = input_to_index(user_input)
    if valid_move?(board,index) == true
      user_token = current_player(board)
      move(board,index,user_token)
    else
      puts "invalid move"
      turn(board)
    end
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
  elsif !!won?(board)
    return false
  else
    return true
  end
end

def over?(board)
  # return !!won?(board) || full?(board)
  if !!won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if !!won?(board)
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

def play(board)
  # while over?(board) == false do
  until over?(board) == true do
    turn(board)
  end
  if !!won?(board)
      puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
      puts "Cats Game!"
  end
end
