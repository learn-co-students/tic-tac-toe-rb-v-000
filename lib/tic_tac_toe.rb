#board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #left column
  [1, 4, 7], #middle column
  [2, 5, 8], #right column
  [0, 4, 8], #UL to LR diagonal
  [6, 4, 2]  #LL to UR diagonal
  ]
  
def input_to_index(input)
  move = input.to_i - 1 #gets user input, less one (1) to refer to array index
 end 

def move(board, index, current_player = "X")
  board[index] = current_player
end

def position_taken?(board, index)
  board[index] != "" && board[index] != " "
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(board, index) == true
      move(board, index, value = "X")
    else
      turn(board)
    end

def turn_count(board)
end

def current_player(board)
  if turn_count(board).even
    return "X"
  else
    return "0"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do | win_combination |
    board[win_combination[0]] == board[win_combination[1]] && board[win_combination[0]] == board[win_combination[2]] && position_taken?(board, win_combination[0]) # checks if is "X" or "O" that occupies [0], which tells you implicitly which player occupies rest of WIN_COMBINATION that wins
  end
end

def full?(board)
  if board.include?("") || board.include?(" ")
    false
 end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]] #returns the first instance of the winning player "X" or "O"
  else
    nil
  end
end
end

def play(board)
  turn = 0
  while turn < 9
    turn(board)
    turn += 1
  end
end
