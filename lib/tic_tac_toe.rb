#WIN_COMBINATIONS here
WIN_COMBINATIONS = [
  [0, 1, 2], #top row win
  [3, 4, 5], #middle row win
  [6, 7, 8], #bottom row win
  [0, 4, 8], #diagonal win
  [2, 4, 6], #diagonal win
  [0, 3, 6], #left column win
  [1, 4, 7], #middle column win
  [2, 5, 8]  #right column win 
]

#DISPLAY_BOARD here
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#MOVE here
#try ternary format
def move(board, location, current_player)
  board[location.to_i - 1] = current_player
end

#POSITION_TAKEN here
#try ternary format
def position_taken?(board, position)
  board[position] != " " && board[position] != "" && board[position] != nil
end

#VALID_MOVE here
def valid_move?(board, position)
#try ternary format
  position.to_i.between?(1,9) && !position_taken?(board, position.to_i-1)
end

#TURN here
def turn(board)
  puts "Please enter 1-9:"
  position = gets.strip
  if valid_move?(board, position)
    move(board, position, current_player(board))
  else
    turn(board)
  end
  display_board(board)
end

#TURN_COUNT here
def turn_count(board) #method
  turns = 0 #counter for loop/turns
  board.each do |letter| #each iterator cycles through board array and temporarily assigns each element = to 'letter'
    if (letter == "X" || letter == "O") #counter increases by one if condition is met
        turns += 1
    end
  end
  turns #default output for .each is the board array, this tells the method to output the counter value instead
end

#CURRENT_PLAYER here
def current_player(board)
#try ternary format
  #turn_count(board).even? == false ? "O" : "X" #if odd next player is O, if even next player is X
  turn_count(board) % 2 == 0 ? "X" : "O"
end

#WON? here
def won?(board)
  WIN_COMBINATIONS.each do |win_combination| #iterates over the 8 arrays in win combinations

  win_index_1 = win_combination[0] #assigns each element in the win combination to a variable
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1] #assigns each previous variable to a specific location on the board array for comparison
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]

  if ((position_1 == "X") && (position_2 == "X") && (position_3 == "X")) || ((position_1 == "O") && (position_2 == "O") && (position_3 == "O"))
    return [win_index_1, win_index_2, win_index_3]
  end
  end
return false
end

#FULL? here
def full?(board)
#should return true if board is full
  board.all? do |position|  #all? iterator checks all elements in array to see if all return true
    if (position == "X") || (position == "O")
      true
    else
      false
    end
  end
end

#DRAW? here
def draw?(board)
#should return true if the board has not been won and is full and vice-versa, should return false if board is won
  if (full?(board) == true) && (won?(board) == false) #must use 'false' wrt to won?(board) as it spits out an array when it is true
    true
  elsif (won?(board) != false)
    false
  else
    false
  end
end

#OVER? here
def over?(board)
#returns true if game is over (draw / win)
#try ternary format
  won?(board) != false || draw?(board) == true
end

#WINNER here
def winner(board)
#should return X or O as winner
  if (won?(board) != false) #if there is a winner
    character = won?(board)[0] #assigns 'character' variable to first element of winning array
    winner = board[character] #assigns 'winner' variable to the same position on the actual board
    if winner == "X"
      return "X"
    elsif winner == "O"
      return "O"
    else
      nil
    end
  end
end

#PLAY here
def play(board)
  until over?(board) #until over?(board) is true, turn(board)
    turn(board)
  end
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end