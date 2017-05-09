# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #first vertical column
  [1,4,7], #second vertical column
  [2,5,8], #third vertical column
  [0,4,8], #diagonal top left to bottom right
  [2,4,6] #diagonal top right to bottom left
]
# sets up a blank board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
# turns a player's input into an index number
def input_to_index(number)
  number = number.to_i
  index = number - 1
  return index
end

# sets up player's token corresponding with their index
def move(array, index, character)
  array[index] = character
end

# returns if the chosen position is already taken or empty
def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
  elsif board[index] == "X" || board[index] == "O"
      true
  end
end

# checks to make sure the move is valid
def valid_move?(board, index)
  if index.between?(0, 8) && position_taken?(board, index) == false
    true
  elsif index.between?(0, 8) && position_taken?(board, index) == true
    false
  else index < 0 || index > 8
    false
  end
end

# gets the user input and makes sure it is valid using #valid_move
def turn(board)
  puts "Please enter 1-9:"
  moveit_integer = gets.strip
  moveit = input_to_index(moveit_integer)
  if valid_move?(board, moveit)
    move(board, moveit, current_player(board))
  else
    turn(board)
end
display_board(board)
end

def turn_count(board) #define a variable turn_count with an argument of the board
  counter = 0 #define a counter with a starting number of 0
  board.each do |boardplace| #setup an iteration on the board with a new variable of boardplace
    if boardplace != " " #if in the iteration boardplace is NOT an empty space then...
      counter += 1 #increase the counter by 1 and assign it the new value
  end
end
return counter #return the counter's value
end

def current_player(board) #def a variable current_player with an argument of the board
  if turn_count(board).even? #using the .even? method
  # if turn_count(board) % 2 == 0 #using the % operater
    return "X"
  elsif turn_count(board).odd? #using the .odd? method
  # elsif turn_count(board) % 2 != 0
    return "O"
    end
  end

# check to see if the player won
  def won?(board)
    WIN_COMBINATIONS.each do |win_combination| #call the WIN_COMBINATIONS nested array & for each nest add it to new var win_combination
        win_index_1 = win_combination[0] #the first combination of win goes into a new var win_index_1
        win_index_2 = win_combination[1] #repeat but now second win
        win_index_3 = win_combination[2] #repeat again for third win

        position_1 = board[win_index_1] # board at index1
        position_2 = board[win_index_2] # board at index2
        position_3 = board[win_index_3] # board at index3

        if (position_1 == "X" && position_2 == "X" && position_3 == "X")
          return win_combination     # return the win_combination indexes that won.
        elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
          return win_combination
        end
      end
      return false
    end

# checks to see if the board is full
def full?(board)
  board.all? {|i| i == "X" || i == "O"} #iterate over the board adding it to i and check if i is either equal to X or O, or both
end
# checks to see if the game is a draw
def draw?(board)
  !won?(board) && full?(board) #game has not been won and the board is full return true
end

# checks to see if the has been won or is a draw or is a full board
def over?(board)
  won?(board) || draw?(board) || full?(board) #has been won OR is a draw OR is a full board return true
end

# declares which player won, either X or O
def winner(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return "X"
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return "O"
    else
      false
    end
  end
end

def play(board)
    until over?(board)
    turn(board)
    end
    if won?(board)
      puts "Congratulations #{winner(board)}!"
    else
      puts "Cats Game!"
  end
end
