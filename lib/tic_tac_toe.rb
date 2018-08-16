# Helper methods
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def is_win_combination?(board, win_combination)
  position_1 = win_combination[0]
  position_2 = win_combination[1]
  position_3 = win_combination[2]
  if position_taken?(board, position_1) && position_taken?(board, position_2) && position_taken?(board, position_3)
    return board[position_1] == board[position_2] && board[position_1] == board[position_3]
  end
end

# WIN_COMBINATIONS: defines a constant WIN_COMBINATIONS with arrays for each win combination
WIN_COMBINATIONS = [
  [0,1,2], # top row win combination
  [3,4,5], # middle row win combination
  [6,7,8], # bottom row win combination
  [0,3,6], # left column win combination
  [1,4,7], # middle column win combination
  [2,5,8], # right column win combination
  [0,4,8], # left diagonal win combination
  [2,4,6]  # right diagonal win combination
]

# display_board: prints arbitrary arrangements of the board
def display_board(board)
    return board
end

def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# input_to_index: converts user_input to an integer
def input_to_index(user_input)
  user_input.to_i - 1 # user_input converted to an integer
end

# move: does not allow for a default third argument
def move(board)
end

def move(board, index, player)
  board[index] = player # player plays a move
end

# position_taken? returns true/false based on position in board
def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false #board[index] is not " " or "" or nil because there's an "X" or "O"
  else
    return true #board[index] is " " or "" or nil
  end
end

# valid_move: returns true/false based on position
def valid_move?(board, index)
  if !position_taken?(board, index) && (index).between?(0, 8)
    return true
  end
end


# turn: makes valid moves, asks for input again after a failed validation
def turn(board)
    puts "Please enter 1-9:" #get the user input
    user_input = gets.strip
    index = input_to_index(user_input) # input to index
    value = current_player(board)

  if valid_move?(board, index)
    move(board,index,value)
    display_board(board)
  else
    puts "Oops, invalid move! Please try again."
    turn(board)
  end
end

# turn_count
def turn_count(board)
  count = 0

  board.each do |play|
    break if count == 8
    if play == "X" || play == "O"
      count += 1
    end
  end

  count
end

# current_player

def current_player(board)
  if turns_played = turn_count(board)
    return turns_played.even? ? "X" : "O"
  end
end

# won

def won?(board)
  if board.none?{|cell| cell == "X" || cell == "O"}
    return false
  end
  WIN_COMBINATIONS.find{|win_combination| is_win_combination?(board, win_combination)}
end

# full

def full?(board)
  if board.all?{|cell| cell == "X" || cell == "O"}
    return true
  else
    return false
  end
end

# draw

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

# over

def over?(board)
  if draw?(board) || won?(board)
    return true
  else
    return false
  end
end

# winner

def winner(board)
  if draw?(board) || !over?(board)
     return nil
   end
   win_combination = won?(board)
   board[win_combination[0]] == "X" ? "X" : "O"
 end

# play

def play(board)
  until over?(board)
    turn(board)
  end

  if draw?(board)
    puts "Cat's Game!"
  elsif won?(board)
    puts "Congratulations #{winner(board)}!"
  end
end
