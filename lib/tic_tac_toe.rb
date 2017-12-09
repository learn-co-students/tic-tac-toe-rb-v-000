# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #first column
  [1,4,7], #second column
  [2,5,8], #third column
  [0,4,8], #diagonal top left to bottom right
  [2,4,6]  #diagonal top right to bottom left
]

# Define display_board that accepts a board and prints
# out the current state.
board = [" "," "," "," "," "," "," "," "," "]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#gets user input 1-9 and converts to 0-8
def input_to_index(user_input)
  user_input.to_i - 1
end

#the move method accepts 3 arguments:
def move(board,index,value)
  board[index] = value
end

# #if the position is free, should return 'false'. if position is taken, return 'true'.
# def position_taken?(board,index)
#   if board[index] == " " || board[index] == "" || board[index] == nil
#     false
#   else board[index] == "X" || board[index] == "O"
#     true
#   end
# end
# #shorter solution:
def position_taken?(board, index)
  !(board[index] == "" || board[index] == " ")
end

def valid_move?(board,index)
  !position_taken?(board,index) && index.between?(0,8)
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

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board,index)
    move(board,index,current_player(board))
    display_board(board)
  else
    turn(board)
  end
end


def current_player(board)
  turn_count(board) % 2 == 0 ? "X":"O"
end

def won?(board)
    WIN_COMBINATIONS.find do |win_combo|
      board[win_combo[0]] == board[win_combo[1]] &&
      board[win_combo[0]] == board[win_combo[2]] &&
      position_taken?(board, win_combo[0])
    end
end
      # previously:
      # if   == "X" &&
      #     board[win_combo[1]] == "X" &&
      #     board[win_combo[2]] == "X" ||
      #     board[win_combo[0]] == "O" &&
      #     board[win_combo[1]] == "O" &&
      #     board[win_combo[2]] == "O"
def full?(board)
  board.all? do |index| index == "X" || index == "O"
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if won?(board) != nil
    winner = board[won?(board)[0]]
  end
end

def play(board)
  until over?(board) == true || draw?(board) == true || won?(board)
    turn(board)
  end
  if draw?(board) == true
       puts "Cat's Game!"
  else won?(board)
     puts "Congratulations #{winner(board)}!"
  end
end
