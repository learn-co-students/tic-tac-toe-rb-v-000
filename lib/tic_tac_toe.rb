
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

def move(board, input, player)
  board[input] = player
end

def valid_move?(board, index)
  ok = 0..8
  if ok === index && board[index].include?(" ")
    true
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.chomp
  input = input_to_index(user_input)
  if valid_move?(board, input)
    move(board, input, player = current_player(board))
  else
    puts "Try again"
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
  counter = 0
  board.each do |i|
    unless i == " "
      counter += 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board).odd?
    "O"
  else
    "X"
  end
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  top_row_win = WIN_COMBINATIONS[0]
  mid_row_win = WIN_COMBINATIONS[1]
  bot_row_win = WIN_COMBINATIONS[2]
  l_col_win = WIN_COMBINATIONS[3]
  c_col_win = WIN_COMBINATIONS[4]
  r_col_win = WIN_COMBINATIONS[5]
  l_diag_win = WIN_COMBINATIONS[6]
  r_diag_win = WIN_COMBINATIONS[7]
 # "X"  wins
  if board[top_row_win[0]] == "X" && board[top_row_win[1]] == "X" && board[top_row_win[2]] == "X"
    top_row_win
  elsif board[mid_row_win[0]] == "X" && board[mid_row_win[1]] == "X" && board[mid_row_win[2]] == "X"
    mid_row_win
  elsif board[bot_row_win[0]] == "X" && board[bot_row_win[1]] == "X" && board[bot_row_win[2]] == "X"
    bot_row_win
  elsif board[l_col_win[0]] == "X" && board[l_col_win[1]] == "X" && board[l_col_win[2]] == "X"
    l_col_win
  elsif board[c_col_win[0]] == "X" && board[c_col_win[1]] == "X" && board[c_col_win[2]] == "X"
    c_col_win
  elsif board[c_col_win[0]] == "X" && board[r_col_win[1]] == "X" && board[r_col_win[2]] == "X"
    r_col_win
  elsif board[l_diag_win[0]] == "X" && board[l_diag_win[1]] == "X" && board[l_diag_win[2]] == "X"
    l_diag_win
  elsif board[r_diag_win[0]] == "X" && board[r_diag_win[1]] == "X" && board[r_diag_win[2]] == "X"
    r_diag_win
 # "O"  wins
  elsif board[top_row_win[0]] == "O" && board[top_row_win[1]] == "O" && board[top_row_win[2]] == "O"
    top_row_win
  elsif board[mid_row_win[0]] == "O" && board[mid_row_win[1]] == "O" && board[mid_row_win[2]] == "O"
    mid_row_win
  elsif board[bot_row_win[0]] == "O" && board[bot_row_win[1]] == "O" && board[bot_row_win[2]] == "O"
    bot_row_win
  elsif board[l_col_win[0]] == "O" && board[l_col_win[1]] == "O" && board[l_col_win[2]] == "O"
    l_col_win
  elsif board[c_col_win[0]] == "O" && board[c_col_win[1]] == "O" && board[c_col_win[2]] == "O"
    c_col_win
  elsif board[r_col_win[0]] == "O" && board[r_col_win[1]] == "O" && board[r_col_win[2]] == "O"
    r_col_win
  elsif board[l_diag_win[0]] == "O" && board[l_diag_win[1]] == "O" && board[l_diag_win[2]] == "O"
    l_diag_win
  elsif board[r_diag_win[0]] == "O" && board[r_diag_win[1]] == "O" && board[r_diag_win[2]] == "O"
    r_diag_win

  end
end

def full?(board)
  board.all? {|i| i != " "}
end

def draw?(board)
  !won?(board) && full?(board)
end


def over?(board)
  if won?(board)
    true
  elsif draw?(board)
    true
  else
    false
  end
end

def winner(board)
  top_row_win = WIN_COMBINATIONS[0]
  mid_row_win = WIN_COMBINATIONS[1]
  bot_row_win = WIN_COMBINATIONS[2]
  l_col_win = WIN_COMBINATIONS[3]
  c_col_win = WIN_COMBINATIONS[4]
  r_col_win = WIN_COMBINATIONS[5]
  l_diag_win = WIN_COMBINATIONS[6]
  r_diag_win = WIN_COMBINATIONS[7]


  if board[top_row_win[0]] == "X" && board[top_row_win[1]] == "X" && board[top_row_win[2]] == "X"
    "X"
  elsif board[mid_row_win[0]] == "X" && board[mid_row_win[1]] == "X" && board[mid_row_win[2]] == "X"
    "X"
  elsif board[bot_row_win[0]] == "X" && board[bot_row_win[1]] == "X" && board[bot_row_win[2]] == "X"
    "X"
  elsif board[l_col_win[0]] == "X" && board[l_col_win[1]] == "X" && board[l_col_win[2]] == "X"
    "X"
  elsif board[c_col_win[0]] == "X" && board[c_col_win[1]] == "X" && board[c_col_win[2]] == "X"
    "X"
  elsif board[l_diag_win[0]] == "X" && board[l_diag_win[1]] == "X" && board[l_diag_win[2]] == "X"
    "X"
  elsif board[r_diag_win[0]] == "X" && board[r_diag_win[1]] == "X" && board[r_diag_win[2]] == "X"
    "X"
      ## "O"  wins
  elsif board[top_row_win[0]] == "O" && board[top_row_win[1]] == "O" && board[top_row_win[2]] == "O"
    "O"
  elsif board[mid_row_win[0]] == "O" && board[mid_row_win[1]] == "O" && board[mid_row_win[2]] == "O"
    "O"
  elsif board[bot_row_win[0]] == "O" && board[bot_row_win[1]] == "O" && board[bot_row_win[2]] == "O"
    "O"
  elsif board[l_col_win[0]] == "O" && board[l_col_win[1]] == "O" && board[l_col_win[2]] == "O"
    "O"
  elsif board[c_col_win[0]] == "O" && board[c_col_win[1]] == "O" && board[c_col_win[2]] == "O"
    "O"
  elsif board[l_diag_win[0]] == "O" && board[l_diag_win[1]] == "O" && board[l_diag_win[2]] == "O"
    "O"
  elsif board[r_diag_win[0]] == "O" && board[r_diag_win[1]] == "O" && board[r_diag_win[2]] == "O"
    "O"
  end
end

def play(board)
  until over?(board)
    turn_count(board)
    turn(board)

  if full?(board)
        puts "Cat's Game!"
  elsif won?(board)
        puts "Congratulations #{winner(board)}!"
    end
  end
end
