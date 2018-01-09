WIN_COMBINATIONS = [
  [0,1,2], #Top row win
  [3,4,5], #Middle row win
  [6,7,8], #Bottom row win
  [0,3,6], #Left column win
  [1,4,7], #Middle column win
  [2,5,8], #Left column win
  [0,4,8], #Left top to bottom right diagonal win
  [2,4,6]  #Right top to bottom left diaganon win
]

def display_board (board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index (user_input)
  index = user_input.to_i - 1
end

def move (board, index, player_token)
  board[index] = player_token
end

def position_taken? (board, index)
  board[index] == "X" || board[index] == "O"
end

def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board, index)
      true
    else
      false
    end
end

def turn(board)
  puts "Hello! Please pick a number from 1 - 9"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    player_token = current_player(board)
    move(board,index,player_token)
    display_board(board)
  else
    puts "Oops! That is not a valid move.
    Please pick another number between 1-9."
    turn(board)
  end
end

def turn_count(board)
  board.count do |position|
    position != " "
  end
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  won?(board) && board[won?(board)[0]]
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
