require 'pry'

board = [" "," "," "," "," "," "," "," "," "]

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

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won?(board)
  winning_combo = false
  if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    return false
  else
    WIN_COMBINATIONS.each do |wins|
      #wins = first thing in WIN_C
      #wins = 2nd thing in WIN_C
      char1 = "X"
      char2 = "O"
        if board[wins[0]] == char1 && board[wins[1]] == char1 && board[wins[2]] == char1 || board[wins[0]] == char2 && board[wins[1]] ==char2 && board[wins[2]] == char2
          winning_combo = wins
      end
    end
    winning_combo
  end
end

def full?(board)
  board.none?{|spaces| spaces == " "}
end

def draw?(board)
  if full?(board)== true && won?(board)== false
    return true
  end
end

def over?(board)
  if won?(board) != false
    return true
  elsif draw?(board) == true
    return true
  elsif full?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  won?(board)
  if won?(board) != false
    winner = won?(board)
    board[winner[0]]
  else
    return nil
  end
end

def input_to_index(user_input)
  num = user_input.to_i
  index = num-1
end

def move(array, index, value = "X")
  array[index] = value
end

def valid_move?(board, index)
  if !position_taken?(board, index) && index.between?(0,8)
      return true
    else
      return false
  end
end

def move(array, index, value )
  array[index] = value
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets
  index_input = input_to_index(input)
  until valid_move?(board, index_input) === true
    puts "Please enter 1-9:"
    input = gets
    index_input = input_to_index(input)
  end
  move(board, index_input, current_player(board))
  display_board(board)
end

def current_player(board)
  if turn_count(board)%2 == 0
    return "X"
  else
    return "O"
  end
end



# until the game is over
#   take turns
# end
#
# if the game was won
#   congratulate the winner
# else if the game was a draw
#   tell the players it has been a draw
# end
def play(board)
  until over?(board)
    turn(board)
  end
  if winner(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end

def turn_count(board)
  counter = 0
  tcount = 0
  board.each do |brd|
    if board[counter] == "X" || board[counter] == "O"
      tcount += 1
    else

    end
    counter += 1
  end
  tcount
end


def current_player(board)
  if turn_count(board)%2 == 0
    return "X"
  else
    return "O"
  end
end
