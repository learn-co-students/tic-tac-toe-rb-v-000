#Helper Methods

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],  # Top row win
  [3,4,5],  # Middle row win
  [6,7,8],  # Bottom row win
  [0,3,6],  # Left vertical win
  [1,4,7],  # Middle vertical win
  [2,5,8],  # right vertical win
  [0,4,8],  # Left diagonal win
  [2,4,6] # right diagonal win
]

#Define Display_Board Method
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
board = [" ", " ", " " , " ", " ", " ", " ", " ", " "]
display_board(board)

#Define Input_To_Index Method
def input_to_index(user_input)
user_input.to_i - 1
end

#Define Move Method
def move(board, index, current_player = "X")
  board[index] = current_player
end

#Define Position_Taken? Method
def position_taken?(board,index)
!(board[index] ==" " || board[index] =="" || board[index] ==nil)
end

#Define Valid_Move? Method
def valid_move?(board,index)
  index.between?(0,8) && !position_taken?(board, index)
end

#Define Turn Method
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

#Turn_Count Method
def turn_count(board)
  #board = ["O", " ", " ", " ", "X", " ", " ", " ", "X"]
  counter = 0
  board.each do |position|
  #check and see if token is equal to X or O
  #position == like "X"
    if !(position == " ")
      counter += 1
    end
  end
  counter
end

#Current_Player Method
def current_player(board)
  count = turn_count(board)
  if count % 2 == 0
    current_player = "X"
  else
    current_player = "O"
  end
end

#Won? Method
def won?(board)
  #checks the win_index on each WIN_COMBINATIONS
  WIN_COMBINATIONS.each do |win_index|
    #checks if win_index on board index are all X or all O
    if win_index.all?{|index| board[index] == "X"} || win_index.all?{|index| board[index] == "O"}
      #returns the winning combination (win_index)
      return win_index
    else
      #returns NOT won if no winning combination on board
      win_index.all?{|index| board[index] == " "}
    end
  end
  nil
end

#Full? Method
def full?(board)
  #checks if board is NOT empty
  if !board.include?(" ")
    true
  else
    false
  end
end

#Draw? Method
def draw?(board)
  #checks if board is NOT won AND board is full
  if !won?(board) && full?(board)
    true
  else
    #checks is board is NOT won AND board is NOT full OR board is won
     !won?(board) && !full?(board) || won?(board)
    false
  end
end

#Over? Method
def over?(board)
  #checks if board is won OR board is a draw OR board is full
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

#Winner Method
def winner(board)
  #checks if board is won
  if won?(board)
  #gets win_combo from board that is won
	win_combo = won?(board)
  #index = first array in win_combo out of the 3
  index=win_combo[0]
  #returns either X or O from the board index
  board[index]
  end
end

#Play Method
def play(board)
#Take turns
  turn(board)
  #Is game over?
  if !over?(board)
    turn(board)
  else
    over?(board)
  end

def game_over(board)
# Is game is won?
    won?(board)

#Declare winner
      winner(board)
#Is game a draw?
    draw?(board)

end
end



  #check if game is over
  #board(over?)

  #if game is not over continue turn
  #board(turn)

  #if game is over check if game is won
  #board(won?)

  #if game is over check if game is a draw
  #board(draw?)
