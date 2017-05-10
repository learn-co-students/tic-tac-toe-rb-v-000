#Helper Methods:

#constant with a nested array with winning combinations for tic tac toe
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

#Display Board
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#Input to Index to take player's number and translate it to an index to match
#the board
user_input = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
def input_to_index(user_input)
  index = (user_input).to_i - 1
end

#Move
def move(board, index, piece)
  board[index] = piece
end

#Position Taken?
def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  else board[index] == "X" || board[index] == "O"
    true
  end
end

#Valid Move?
def valid_move?(board, index)
  if !position_taken?(board, index) && index.between?(0,8)
    true
  end
end

#Turn
def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
  if valid_move?(board, index) == true
    move(board, index, current_player(board))
    display_board(board)
  else
    puts "Invalid entry. Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    until valid_move?(board, index) == true
      move(board, index, current_player(board))
      display_board(board)
    end
  end
end

#Turn count
def turn_count(board)
  count = 0
  board.each do |index|
    if index != " "
      count += 1
    end
  end
  count
end

#Current player
def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

#won
def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
  if (board[win_combo[0]]) == "X" && (board[win_combo[1]]) == "X" && (board[win_combo[2]]) == "X"
    return win_combo
  elsif (board[win_combo[0]])  == "O" && (board[win_combo[1]])  == "O" && (board[win_combo[2]]) == "O"
    return win_combo
  end
end
 false
end

#full
def full?(board)
  board.none? do |i|
    i == " " || i.nil?
  end
end

#Draw
def draw?(board)
  !won?(board) && full?(board)
end

#Over
def over?(board)
  full?(board)
end

#Winner
def winner(board)
  if draw?(board) || !full?(board) && !won?(board)
    return nil
  elsif (board[won?(board)[0]] == "X")
    return "X"
  else (board[won?(board)[0]] == "O")
    return "O"
  end
end

def play(board)
  while !over?(board) && !won?(board)
    puts "Please enter your turn."
    gets.chomp
  end
turn(board)
  if won?(board)
    
    "Congratulations! You are the winner #{winner(board)}!"
  else draw?(board)
    "You both win! Not really, it's a cat's game."
  end
end
