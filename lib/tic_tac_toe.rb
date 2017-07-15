WIN_COMBINATIONS = [
  [0,1,2], #top row horizontal, WIN_COMBINATIONS[0] IN OTHER WORDS THIS IS THE SAME AS COMBO[0]
  [3,4,5], #middle row horizontal COMBO[0] == 3
  [6,7,8], #bottom row horizontal
  [0,3,6], #left-side vertical
  [1,4,7], #middle vertical
  [2,5,8], #right-side vertical
  [2,4,6], #diagonal win 1
  [0,4,8], #diagonal win 2
]

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
def display_board (board)
  first_row = " #{board [0]} | #{board [1]} | #{board [2]} "
  puts first_row
  divider_line = "-----------"
  puts divider_line
  second_row = " #{board [3]} | #{board [4]} | #{board [5]} "
  puts second_row
  puts divider_line
  third_row = " #{board [6]} | #{board [7]} | #{board [8]} "
  puts third_row
end

def input_to_index (input)
  board_position = input.to_i - 1
end

def move (board, index, character)
  board[index] = character
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  elsif board [index] == "X" || board[index] == "O"
    return true
  end
end

def valid_move?(board,index)
  if !position_taken?(board,index) && index.between?(0,8)
    return true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.chomp
  index = input_to_index(input)
  character = current_player(board)
  if valid_move?(board,index)
  puts move(board,index,character)
else !valid_move?(board,index)
  puts "Please choose another number from 1 to 9."
  turn(board)
  end
  display_board(board)
end

def turn_count(board)
  counter = 0
  board.each do |move|
    if move == "X" || move == "O"
    counter += 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.find do |combo|
    if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
      true
    elsif board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
      true
    else
      false
    end
  end
end

def full?(board)
  board.none? do |check|
    if check == " "
    true
    end
  end
end

def draw?(board) #This will return true if the board is full and there is no win
  if full?(board) && !won?(board)
    true
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  end
end

def winner(board)
  WIN_COMBINATIONS.find do |combo|
    if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
    return "X"
    elsif board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
    return "O"
    end
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    winning_token = winner(board).to_s
    puts "Congratulations " + winning_token + "!"
  else draw?(board)
    puts "Cats Game!"
  end
end
