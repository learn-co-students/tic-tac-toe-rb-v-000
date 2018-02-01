WIN_COMBINATIONS = [
  [0, 1, 2]
  [3, 4, 5]
  [6, 7, 8]
  [0, 3, 6]
  [1, 4, 7]
  [2, 5, 8]
  [0, 4, 8]
  [6, 4, 2]
  ]

def display_board(board)
 puts " #{board[0]} | #{board[1]} | #{board[2]} "
 puts "-----------"
 puts " #{board[3]} | #{board[4]} | #{board[5]}"
 puts "-----------"
 puts " #{board[6]} | #{board[7]} | #{board[8]}"
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, character)
  board[index] = character
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
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
    counter += 1 if spot != " "
  end
  return counter
end

# The #current_player method should take in an argument of the game board and
# use the #turn_count method to determine if it is "X"'s turn or "O"'s.

def current_player(board)
  if turn_count(board).even?
    board = "X"
  else
    board = "0"
  end
end

def won?(board)
  WIN_COMBINATIONS.find do |combo|
    board[combo[0]] == board[cobmo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all? do |combo|
    if combo == "X" || combo == "0"
    end
  end
end

def draw?(board)
  (!won?(board)) && full(board))? true : false
end

def over?(board)
  (won?(board) || draw?(board) || full?(board) true : false)
end

def winner(board)
  winner_token = won?(board)
  (winner_token)? board[winner_token[0]] : nil
end

def play(board)
  turn(board) until over?(board)
  won?(board) ? puts("Congratulations #{winner(board)}!") : puts("Cat's Game!")
end
