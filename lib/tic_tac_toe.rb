# Helper Method
#notes on these helper methods, and my original solutions  are on my game_status.rb file
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top_row_win
  [3,4,5], #middle_row_win
  [6,7,8], #bottom_row_win
  [0,3,6], #first_column_win
  [1,4,7], #second_column_win
  [2,5,8], #last_column_win
  [0,4,8], #down_diagonal_win
  [2,4,6] #up_diagonal_win
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end


def move(board, index, character)
  board[index] = character
end


def position_taken?(board, index)
  if (board[index] == " " || board[index] == "" || board[index] == nil)
    taken = false
  else
    taken = true
    end
end


def valid_move?(board,index)
  if (position_taken?(board, index)==false && index.between?(0,8))
    then true
  end
end

#order doesn't matter in methods. it reads every method at once
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  character = current_player(board)
  if valid_move?(board, index)
    move(board, index, character)
    display_board(board)
  else
    turn(board)
  end
end


def turn_count(board)
  num_turns = 0
  board.each do |turns|
      if turns == "X" || turns =="O"
        num_turns += 1
        end
    end
    num_turns

end


def current_player(board)
  num_turns = turn_count(board)
 if num_turns % 2 == 0
   "X"
  else
    "O"
  end
end
#detect returns the first for which the block is true
#ALL of the following conditions must be true
# 1. value at board position [winning index 0] == the same at board[winning index 1]
#2. value at board position [winning index 1] == the same at board[winning index 2]
# the position at the first winning index IS taken (NOT EMPTY)

def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    board[win_combo[0]] == board[win_combo[1]] &&
    board[win_combo[1]] == board[win_combo[2]] &&
    position_taken?(board, win_combo[0])
  end
end

def full?(board)
  board.all? {|value| value == "X" || value == "O"}
end


#the formal solution relies only on a single comparative line of logic
def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if win_combo = won?(board)
    board[win_combo.first]
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
