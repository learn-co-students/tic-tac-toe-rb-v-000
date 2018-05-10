# Helper Methods

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

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, player_token)
  board[index] = player_token
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  player_token = current_player(board)
  if valid_move?(board, index)
    move(board, index, player_token)
    display_board(board)
  else turn(board)
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
  if turn_count(board).even?
    "X" 
  else 
    "O"
 end
end

def won?(board)
 WIN_COMBINATIONS.each do |win_index|
   pos1 = board[win_index[0]]
   pos2 = board[win_index[1]]
   pos3 = board[win_index[2]]
   
   if (pos1 == "X" && pos2 == "X" && pos3 == "X") || (pos1 == "O" && pos2 == "O" && pos3 == "O")
    return  win_index
end
end
else false
end

def full?(board)
  board.all? do |index|
   index == "X" || index == "O"
    end
  end

def draw?(board)
 full?(board) && !(won?(board))
    end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if won?(board)
  return board[won?(board)[0]]
end
end

def play(board)
  until over?(board)
    turn(board)
   end
   if won?(board)
      puts "Congratulations #{winner(board)}!"
    else 
      puts "Cat's Game!"
    end
end
