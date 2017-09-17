# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # First diagonal
  [2,4,6]  # Second diagonal
]

# Define a method display_board that prints a 3x3 Tic Tac Toe Board
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

def move(board, user_input, character)
  board[user_input] = character
end

# code your #position_taken? method here!
def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else
    true
  end

end

# code your #valid_move? method here
def valid_move?(board, index)
  if index.between?(0, 8) && position_taken?(board, index) == false
    true
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index) == false
    turn(board)
  end
  character = current_player(board)
  move(board, index, character)
  display_board(board)
end

# Define your play method below
def turn_count(board)
  counter = 0
  board.each do |element|
    if element == "X" || element == "O"
      counter += 1
    end
  end
 return counter
end

def current_player(board)
  if turn_count(board) % 2  == 0
    "X"
  else
    "O"
  end
end

def won?(board)

  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    end
    if position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  false
end

def full?(board)
  board.all? do |element|
    element == "X" || element == "O"
  end
end

def draw?(board)
  won?(board) == false && full?(board)

end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    array = won?(board)
    index1 = array[0]
    character = board[index1]
    if character == "X"
      "X"
    elsif character == "O"
      "O"
    else
      false
    end
  else
    nil
  end
end

def play(board)
  while over?(board) == false
    turn(board)
  end
  if draw?(board)
    puts "Cat's Game!"
  else
    puts "Congratulations #{winner(board)}!"
  end
end
