#winning combinations for the board
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,4,8], [2,4,6], [0,3,6], [1,4,7], [2,5,8]]

#displays the current state of the board


def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#converts the users input to an index

def input_to_index(input)
  input.to_i - 1
end

#takes in three arguments and gives player the ability to make a move 

def move(board, index, character)
  board[index] = character
end

#This lets the program know if a position is taken by a character or is an empty space on the board 

def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    true
    
  elsif board[index] != " " || board[index] != ""
    false 
  end 
end

#This allows the player to make their move in the correct spot 

def valid_move?(board, index)
  if position_taken?(board, index) 
    false
    
  elsif index < 0 
    false 
  
  elsif board[index] == " "
    true 
  end 
end

#This asks users to pick their move and if they don't the program will continue to wait or if taken will varify if the move can be made

def turn(board)
  puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    character = current_player(board)
    
    if valid_move?(board, index)
      move(board, index, character)
      display_board(board)
    else 
      puts "Try again..."
      turn(board)
    end 
end

#This counts the total number of turns taken, but breaks out of the loop once it reaches 9 turns taken 
def turn_count(board)
  counter = 0 
  board.each do |space|
    if space == "X" || space == "O"
      counter += 1 
    end 
  end 
  return counter 
end 

#This determines which player's turn it is, either X or O 
def current_player(board)
  if turn_count(board) % 2 == 0   
    return "X"
  else 
    return "O"
  end 
end 

#This method looks at the indecies within the winning combos to make sure they are matching to declare a winner 
def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    index_1 = win_combo[0]
    index_2 = win_combo[1]
    index_3 = win_combo[2]
    
    if position_taken?(board, index_1) && board[index_1] == board[index_2] && board[index_2] == board[index_3] 
      return win_combo
    end 
  end 
  false 
end

#This tell us whether the board is full or not
def full?(board)
  if board.include?(" ") || board.include?("")
    return false 
  
  else 
    return true 
  end
end 

#This tells us whether the board is full or not and if the game ended in a draw 
def draw?(board)
  if !won?(board) && full?(board)
    return true 
  end 
end 

#This lets us know if the game has ended due to a full board, tie game, or someone has won 
def over?(board)
  if won?(board) || full?(board) || draw?(board) 
    return true 
  end 
end 

#This checks to see if X or O has won the game and tells us who is the winner
def winner(board)
  winner = nil 
  WIN_COMBINATIONS.each do |token|
    if token.all? {|index| board[index] == "X"}
      winner = "X"
      
    elsif token.all? {|index| board[index] == "O"}
      winner = "O"
    end 
  end 
  winner 
end 

#This is my play method. Currently sloppy code. Find a way to make small inner method to clean it up. 
def play(board)
  
    if winner(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cat's Game!"
    end 
  
  
  until over?(board)
    turn(board)
    
    if winner(board)
      puts "Congratulations #{winner(board)}!"
    
    elsif draw?(board)
      puts "Cat's Game!"
    end 
  end 
end 
board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
play(board)
