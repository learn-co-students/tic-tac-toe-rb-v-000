WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
  ]
board = [" "," "," "," "," "," "," "," "," "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)  #Get user move, -1 for proper array location
  user_input.to_i - 1
end

def move(board, position, character)
  board[position] = character             #set array location = to player char
end

def valid_move?(board, index)
  if position_taken?(board, index)
    return false
  elsif index >=0 && index <= 8
    return true
  end
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.chomp
  index = input_to_index(input)

  if valid_move?(board, index)
    move(board, index, token = current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |value|
    if value == "X" || value == "O"
    counter +=1
end #if
end  #do
   return counter
end  #method

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
end #if
end #method

def won?(board)
  top_row_win = WIN_COMBINATIONS[0]
  mid_row_win = WIN_COMBINATIONS[1]
  bot_row_win = WIN_COMBINATIONS[2]
  left_row_win = WIN_COMBINATIONS[3]
  mid_col_win = WIN_COMBINATIONS[4]
  rgt_col_win = WIN_COMBINATIONS[5]
  lef_di_win = WIN_COMBINATIONS[6]
  rgt_di_win = WIN_COMBINATIONS[7]

  if board[top_row_win[0]] == "X" && board[top_row_win[1]] == "X" && board[top_row_win[2]] == "X" ||
    board[top_row_win[0]] == "O" && board[top_row_win[1]] == "O" && board[top_row_win[2]] == "O"
  return top_row_win

elsif board[mid_row_win[0]] == "X" && board[mid_row_win[1]] == "X" && board[mid_row_win[2]] == "X" ||
  board[mid_row_win[0]] == "O" && board[mid_row_win[1]] == "O" && board[mid_row_win[2]] == "O"
  return mid_row_win

elsif board[bot_row_win[0]] == "X" && board[bot_row_win[1]] == "X" && board[bot_row_win[2]] == "X" ||
  board[bot_row_win[0]] == "O" && board[bot_row_win[1]] == "O" && board[bot_row_win[2]] == "O"
  return bot_row_win

elsif board[left_row_win[0]] == "X" && board[left_row_win[1]] == "X" && board[left_row_win[2]] == "X" ||
  board[left_row_win[0]] == "O" && board[left_row_win[1]] == "O" && board[left_row_win[2]] == "O"
  return left_row_win

elsif board[mid_col_win[0]] == "X" && board[mid_col_win[1]] == "X" && board[mid_col_win[2]] == "X" ||
  board[mid_col_win[0]] == "O" && board[mid_col_win[1]] == "O" && board[mid_col_win[2]] == "O"
  return mid_col_win

elsif board[rgt_col_win[0]] == "X" && board[rgt_col_win[1]] == "X" && board[rgt_col_win[2]] == "X" ||
  board[rgt_col_win[0]] == "O" && board[rgt_col_win[1]] == "O" && board[rgt_col_win[2]] == "O"
  return rgt_col_win

elsif board[lef_di_win[0]] == "X" && board[lef_di_win[1]] == "X" && board[lef_di_win[2]] == "X" ||
  board[lef_di_win[0]] == "O" && board[lef_di_win[1]] == "O" && board[lef_di_win[2]] == "O"
  return lef_di_win

elsif board[rgt_di_win[0]] == "X" && board[rgt_di_win[1]] == "X" && board[rgt_di_win[2]] == "X" ||
  board[rgt_di_win[0]] == "O" && board[rgt_di_win[1]] == "O" && board[rgt_di_win[2]] == "O"
  return rgt_di_win

  else
  false

  end #if

end  #method

def full?(board)
  if board.any? {|space| space == " "}
    return false
  else
    return true
  end #if
end #method

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
  won?(board)
  return false

  end  #if
end  #method

def over?(board)
  if full?(board) || draw?(board) || won?(board)
    true
  end  #if
end  #method

def winner(board)
winny = []
  if won?(board)
winny << won?(board)
  return board[winny[0][0]]
  end
end

def play(board)
  until over?(board)
turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
end
end
