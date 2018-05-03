# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row - horizontal
  [3,4,5], #middle row - horizontal
  [6,7,8], #bottom row - horizontal
  [0,3,6], #left column - vertical
  [1,4,7], #middle column - vertical
  [2,5,8], #right column - vertical
  [0,4,8], #diagonal 1
  [2,4,6]  #diagonal 2
]

#Define a method that prints the current board representation based on the board argument passed to the method.
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#converts user input to the board multiple times
def input_to_index(user_input)
  user_input.to_i - 1
end

#player moves
def move(board, index, current_player)
  board[index] = current_player
end

#Is space open for player to make a move?
def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

#Is player's move on the board and to an available space?
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

#each player turn
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

#how may turns have been played?
def turn_count(board)
  turns = 0
  board.each do |spaces|
    if spaces == "X" || spaces == "O"
      turns +=1
    end
  end
  return turns
end

#is it "X"'s turn or "O"'s?
def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

#is there a win?
def won?(board)
  WIN_COMBINATIONS.detect do | win_combination |
    location1 = win_combination[0]
    location2 = win_combination[1]
    location3 = win_combination[2]

    board[location1] == board[location2] &&
    board[location2] == board[location3] &&
    board[location1] != " "
#make sure any one of them is not empty
  end
end

#does every element in the board contains either an "X" or an "O"?
def full?(board)
  board.none? { | position | position == " "}
end

#is the board full, but not won?
def draw?(board)
  full?(board) && !won?(board)
end

#is the game over?
def over?(board)
  won?(board) || draw?(board)
end

#who is the winner?
def winner(board)
  win_combination = won?(board) #=> example: [0,4,8]
  if win_combination
  winning_location = win_combination[0] #=> 0
  board[winning_location] #=> "O"
  end
end

#play the game
def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
    else draw?(board
      puts "Game Over!"
end
end
