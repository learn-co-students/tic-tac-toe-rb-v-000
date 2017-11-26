def play(board)
  until over?(board) || won?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
end
end
# input = gets  THIS IS NOT NEEDED BECAUSE TURN(BOARD) ALREADY GETS INPUT, BOOM!


WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.find {|win_combination| board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]] && position_taken?(board, win_combination[0])}
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i-1
end

def move(board, index, current_player)
    board[index] = current_player
end
#why do i need a 0 in place of the default argument? Is it inherently needed or is it needed for the running of the Flatiron project itself?
def position_taken?(board, index)
  board[index] == "X" || board[index] == "O"
end

def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0,8)#why do we need validmove in the first place? #why did we have to add thiis between aprt?
    true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets
  index = input_to_index(input)
  if valid_move?(board,index)
    player = current_player(board)
    move(board, index, player)#this is all i need to execute,pass move
    display_board(board)#this is how you call more than one method for the same if statement $why did i have to involve all of thee helper methods in this if statement
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0 #return coutner
  board.each do |position|  #board = [" ", "O", "X", " ", " ", etc.. " "]
  if position == "X" || position == "O"
    counter +=1 #counter = counter + 1
  end
end #end of each
counter
end

def current_player(board)
  if turn_count(board) == 0 || turn_count(board) % 2 == 0
    return "X"
  elsif turn_count(board) % 2 == 1
    return "O"
  end
end


def full?(board)
  # is to check if there are any empty spaces
  board.all? do |position|
  position == "X" || position =="O" # Will evaluate to true for 1, true for 3
end
end

def draw?(board)
  !won?(board) && full?(board)
end


def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if win_combo = won?(board) # win_combo is equal to [0,1,2]
    # we have the board that gives us our "X" and "O"
    # won?(board) is the array returned by the method call
    return board[win_combo[0]]
  end
end
