
# Define your WIN_COMBINATIONS constant
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

def play(board)
  while !over?(board) do
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end

# Define a method display_board that prints a 3x3 Tic Tac Toe Board

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


# code your input_to_index and move method here!
def input_to_index(input)
input.to_i - 1
end

def move(board, index, token)
  board[index] = token
end

# code your #position_taken? method here!

def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    return true
  elsif board[index] == " " || board[index] == "" || board[index] == nil
    return false
  else
    return false
  end
end

# code your #valid_move? method here
def valid_move?(board, index)
  if index.between?(0, 8) && !position_taken?(board, index)
    true
  else
    false || nil
  end
end

#turn
def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
#until ask for a new position until a valid move is received
  else
    turn(board)
  end
end

#turn_count
def turn_count(board)
 counter = 0
board.each do |element|
  if element == "X" || element == "O"
  counter += 1
    end
  end
  return counter
end

#current_player
def current_player(board)
  if turn_count(board) % 2 == 0
     "X"
  else
     "O"
  end
end

#won?
def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    board[win_combination[0]] == board[win_combination[1]] &&
    board[win_combination[1]] == board[win_combination[2]] &&
    position_taken?(board, win_combination[0])
  end
end

#full?
def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

#draw?
def draw?(board)
  #true if the board has not been won and is full
  !won?(board) && full?(board)
  #false if the board is not won and board is not full
  #false if the board is won
end

#over?
def over?(board)
  won?(board) || draw?(board)
end

#WINNER
def winner(board)
  if win_combination = won?(board)
  board[win_combination.first]
  end
end
