#define a constant WIN_COMBINATIONS eual to a nested array with index values for
#the various win combinations in tic tac toe

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Vertical column
  [1,4,7], # 2nd vertical column
  [2,5,8], # 3rd vertical column
  [0,4,8], # Diagonal
  [2,4,6] # Diagonal
]

#show empty board
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

#define a method which shows current status of the board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#write a method to convert the user input to the index
def input_to_index(user_input)
  user_input.to_i - 1
end

#takes the index where the player would like to play and "X" or "O"
def move(board, index, current_player)
  board[index] = current_player
end

#position_taken? method evaluates if the index the user selected is occupied.
#if false(free space) the method returns "not taken"
#otherwise it returns true (position occupied)
def position_taken?(board, index)
  board[index] != " " && board[index] !=""
end

#valid_move checks if the move is valid(true)and false or nil if not
#the submitted position has to be present on the board and also free
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

#build a method #turn which encapsulates a single complete turn
def turn(board)
  puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(board, index) == true
    move(board, index, current_player(board))
    display_board(board)
  else
    puts "That is an invalid move, please enter 1-9:"
    turn(board)
  end
end

def turn_count(board)
  turns = 0
    board.each do |space|
      if space == "X" || space == "O"
        turns += 1
      end
    end
  return turns
end

def current_player(board)
  turns = turn_count(board)
  if turns % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.find do |combo|
    board[combo[0]]==board[combo[1]] && board[combo[0]]==board[combo[2]] &&
      position_taken?(board, combo[0])
    end
end

def full?(board)
  board.all?{|p| p!= " "}
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
end

def winner(board)
  index = []
  if won?(board)
    index = board[won?(board)[0]]
    if index == "X"
      return "X"
    else
      return "O"
      end
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
