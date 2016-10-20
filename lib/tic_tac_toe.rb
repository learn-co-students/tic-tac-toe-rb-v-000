# Helper Method

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def position_taken?(board, index)
 !(board[index].nil? || board[index] == " ")
end

def input_to_index(input)
  input = input.to_i
  move = input - 1
end

def move(board, index, char)
    board[index] = char
end

def valid_move?(board, index)
  # is move present on the game board + is the position taken?
  if (index.between?(0, 8)) && (position_taken?(board, index) == false)
    return true
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.chomp
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |space|
    if space != " "
      counter += 1
    end
  end
  return counter
# returns number of turns that have been played
end

def current_player(board)
  if turn_count(board) % 2 == 0
    # X's turn
    return "X"
  else
    # O's turn
    return "O"
  end
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
# horizontal wins
 [0,1,2], # top row
 [3,4,5], # middle row
 [6,7,8], # bottom row
#vertical wins
 [0,3,6], # left column
 [1,4,7], # middle column
 [2,5,8], # right column
# diagonal wins
 [0,4,8], # top left to bottom right diagonal
 [2,4,6] # top right to bottom left diagonal
]

def won?(board)

 WIN_COMBINATIONS.each do | win_combination |
   win_index_1 = win_combination[0]
   win_index_2 = win_combination[1]
   win_index_3 = win_combination[2]

   position_1 = board[win_index_1]
   position_2 = board[win_index_2]
   position_3 = board[win_index_3]

   if position_1 == position_2 && position_2 == position_3 && position_1 != " "
     return win_combination
   end
 end
 return false
end


def full?(board)
 if board.include?(" ") || board.include?(nil)
  return false
 else
  return true
 end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
 win_combo = won?(board)
 if won?(board)
   return board[win_combo[0]]
 end
end


# PLAY
def play(board)

  until over?(board)
    turn(board)
  end

  if won?(board)
    if winner(board) == "X"
      puts "Congratulations X!"
    elsif winner(board) == "O"
      puts "Congratulations O!"
    end
  elsif draw?(board)
    puts "Cats Game!"
  end
end
