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

board = [" "," "," "," "," "," "," "," "," "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  index = input.to_i - 1
end

def move(board, position, player_token)
  board[position] = player_token
end

def position_taken?(board, position)
  board[position] != " " && board[position] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  token = current_player(board)
  if valid_move?(board, index)
    move(board, index, token)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |field|
    if field == "X" || field == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.each do |winning_combo|
    if board[winning_combo[0]] == "X" && board[winning_combo[1]] == "X" && board[winning_combo[2]] == "X" || board[winning_combo[0]] == "O" && board[winning_combo[1]] == "O" && board[winning_combo[2]] == "O"
      return winning_combo
    end
  end
  false
end

def full?(board)
  turn_count(board) == 9
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if !won?(board)
    return nil
  elsif board[won?(board)[0]].include?("X")
    "X"
  else
    "O"
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if draw?(board)
    puts "Cats Game!"
  else
    puts "Congratulations #{winner(board)}!"
  end
end
