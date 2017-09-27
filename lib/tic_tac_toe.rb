#a constant that contains all winning combinations
WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row

  [0,4,8],  #first diagonal
  [2,4,6],  #second diagonal

  [0,3,6],  # Left column
  [1,4,7],  # Middle column
  [2,5,8]  # Bottom column
]

#method will print current representation of board
def display_board(board)

  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "

end

# method that will convert the input move to board index
def input_to_index(userInput)
  return userInput.to_i - 1
end

#this method will make the players move on the board
def move(board, index, value)
  board[index] = value
  return board
end

#let's a user know if the position they entered has been taken
def position_taken?(board,number)
  if board[number] == " " || board[number] == "" || board[number] == nil
    return false
  else
    return true
  end
end

#this method ensures the move is within the range of the board
def valid_move?(board,number)
  if number.between?(0,8) && position_taken?(board,number) == false
    return true
  else
    return false
  end
end

#this method does a single turn
def turn(board)

  puts "Please enter 1-9:"
  input = gets.strip

  index = input_to_index(input)
  isValid = valid_move?(board,index)

  if isValid == true
    move(board, index, current_player(board))
  else
    puts "You have entered an invalid move"
    turn(board)
  end

  display_board(board)

end

#calculates turn count
def turn_count(board)
  counter = 0
  board.each{
    |turn|
    if (turn == "X" || turn == "O")
      counter +=1
    end
  }
  return counter
end

#determines whoe the player is based on turn count
def current_player(board)
  count = turn_count(board)
  return count.odd? ? "O" : "X"
end

def won?(board)
  WIN_COMBINATIONS.each do |winCombo|
      posArray = [] #reset the posArray

      winCombo.each do |position|
        posArray << board[position]
      end #end of a specific win combo loop

      if posArray[0] == posArray[1] && posArray[1] == posArray[2] && posArray[0] != " "
        return winCombo
      end

  end #end of win combinations loop

  return false
end #end of def


def full?(board)
  if board.include?(" ")
    return false
  else
    return true
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if !won?(board)
    return nil
  else
    return board[won?(board)[0]]
  end
end

#this is the main tic tac toe method
def play(board)

  while !over?(board)
      turn(board)
  end

  if won?(board)
      winPlayer = winner(board)
      puts "Congratulations #{winPlayer}!"
  elsif draw?(board)
      puts "Cat's Game!"
  end
end
