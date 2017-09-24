WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6] # Middle row
]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input = user_input.to_i
  index = user_input - 1
end

#move
def move(board, index, character)
  board[index]=character
end

def valid_move?(board,index)
  if position_taken?(board,index)

  else index.between?(0,8)
  end
end

# re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
def position_taken?(board,index_number)
 board[index_number] == " "
board[index_number] != ""
board[index_number] == "nil"
board[index_number] == "X"
board[index_number] == "X" || board[index_number] == "O"
end

#turn
def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.chomp
  index = input_to_index(user_input)
  character = current_player(board)
  if valid_move?(board,index)
    move(board,index,character)
  else
    puts "Please enter 1-9:"
    user_input = gets.chomp
  end
  display_board(board)
end

def turn_count(board)
counter = 0
  board.each do |token|
    if token != " "
      counter += 1
    end
  end
  counter
end

def current_player(board)
if turn_count(board).even?
  "X"
else turn_count(board).odd?
"O"
end
end
def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination # return the win_combination indexes that won.
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    else
      false
    end
  end
  end

def full?(board)
  board.none? do |index|
    index == " "
end
end

def draw?(board)
  if full?(board) == true && won?(board) == nil
    true
  elsif won?(board) == false && full?(board) == nil
    false
  elsif won?(board) != nil
    false
  end
end

def over?(board)
  if won?(board)
    true
  elsif draw?(board) == true
    true
  end
end

def winner(board)
  if won?(board)
    win = won?(board)
    board[win[0]]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
