WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,4,8], # Top Left to Bottom right diagonals
  [2,4,6], # Top right to bottom left diagonals
  [1,4,7], # Middle Up/Down
  [0,3,6], # Left Up/Down
  [2,5,8]  # Right Up/Down
]

def display_board (board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index (user_input)
  user_input.to_i - 1

end

def move(board, index, character)
 board[index] = character
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board, index)
    true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets
  user_input = input_to_index(user_input)

  if valid_move?(board, user_input)
    character = current_player(board)
    move(board, user_input, character)
    display_board(board)
  else
    puts "Invalid Move!"
    turn(board)
end
end

def turn_count(board)
counter = 0
board.each do |spot|
  if spot != " "
    counter += 1
  end
end
return counter
end

def current_player(board)
  if turn_count(board).even?
    board = "X"
  elsif turn_count(board).odd?
    board = "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all? do |combo|
    if combo == "X" || combo == "O"
      true
    end
  end
end

def draw?(board)
  (!won?(board) && full?(board))?  true : false
end

def over?(board)
  (won?(board) || draw?(board) || full?(board))? true : false
end

def winner(board)
  winner_token = won?(board)
  (winner_token)? board[winner_token[0]] : nil
end

def play(board)
  turn(board) until over?(board)
  won?(board) ? puts("Congratulations #{winner(board)}!") : puts("Cat's Game!")
end
