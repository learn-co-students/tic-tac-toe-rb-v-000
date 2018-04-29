#Code your helper methods here
#Run the tests for these methods by typing:
#rspec spec/01_tic_tac_toe_spec.rb

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

board = [" "," "," "," "," "," "," "," "," "]

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

def move(board, position, player)
   board[position] = player
end

def position_taken?(board, index)
  board[index] != " "
end

def valid_move?(board, user_index)
  user_index.between?(0,8) && !position_taken?(board, user_index)
end

def turn(board)
  puts "Please enter your move: 1 - 9"
    user_input = gets.strip
    user_index = input_to_index(user_input)
  if valid_move?(board, user_index)
    move(board, user_index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |token|
    if token == "X" || token == "O"
    counter += 1
    end
  end
  counter
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    location1 = win_combination[0]
    location2 = win_combination[1]
    location3 = win_combination[2]
    board[location1] == board[location2] && board[location2] == board[location3] && board[location1] != " "
  end
end

def full?(board)
  board.none? {|space| space == " "}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  win_combination = won?(board)
 if win_combination
    win_location = win_combination[0]
    board[win_location]
  end
end

def play(board)
    until over?(board)
      turn(board)
    end
    if won?(board)
      puts "Congratulations #{winner(board)}!"
    else
      puts "Cat's Game!"
  end
end
