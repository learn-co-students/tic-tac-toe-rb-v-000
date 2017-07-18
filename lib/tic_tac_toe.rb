WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
        #defines a contant WIN_COMBINATIONS with arrays for each win Combination
  [0,3,6],
  [1,4,7],
  [2,5,8],

  [0,4,8],
  [2,4,6]
]

def display_board(board) #define a dispaly board method that print arbitrary arragements of the board
puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts "-----------"
puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts "-----------"
puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1    #to_i means to convert a user input to integer (whole numbers)
end                     #substract 1 from the users_input
                                    #returns -1 for strings without integers

def move(board, index, character)
  board[index] = character  #check!
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  else           #return true\flse The `#position_taken?` method will be responsible
  return true               #for evaluating the position selected by the user against the Tic Tac Toe
end               #board and checking to see whether or not that index on the board array is occupied.
  end               #If the user would like to fill out position 1, our `#position_taken?` method will
                 # check to see if that board index is vacant or if it contains an "X" or an "O".
                 #If the position is free, the method should return `false` (i.e. "not taken"), otherwise it will return `true`.
def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board,index)
    return true
  else
    return false
 end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  character = current_player(board)
  if valid_move?(board,index)
    move(board,index,character)
  else
    turn(board)
  end
  display_board(board)
end

def current_player(board)

  if turn_count(board) % 2 == 0
     "X"
  else "O"
  end
end

def turn_count(board)
  board.count do |character|
    character != " "
  end
end


def won?(board)
  if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    return false
  elsif board == ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
    return false
    end


  WIN_COMBINATIONS.each do |win_combination|
    if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
      return win_combination
    elsif board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
      return win_combination
    end
end
end

def full?(board)
  board.all? {|element| element == "X" || element == "O"}
end

def draw?(board)
  if !won?(board) && full?(board)
    puts "Draw"
    return true
  end
end

def over?(board)
  if !won?(board) || draw?(board) || full?(board)
    true
  end
end

def winner(board)
  WIN_COMBINATIONS.each do |combo|

    win1 = combo[0]
    win2 = combo[1]
    win3 = combo[2]

    position1 = board[win1]
    position2 = board[win2]
    position3 = board[win3]

  if position1 == "X" && position2 == "X" && position3 == "X"
    return "X"
  elsif position1 == "O" && position2 == "O" && position3 == "O"
    return "O"
  end
end
    return nil
end

def play(board)
  number_of_turns = 0
  until number_of_turns == 9
  number_of_turns += 1
  turn(board)
end
if won?(board)
    puts "Congratulations #{winner(board)}!"
   elsif draw?(board)
     puts "Cats Game!"
   end
end
