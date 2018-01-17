def turn_count(board)
  turns_played = 0
  board.each do |space|
    if space == "X" || space == "O"
      turns_played += 1
    end
  end
  return turns_played
end

def current_player(board)
  turns_played = turn_count(board)
  #if turns_played == 0 || turns_played % 2 == 0
  #  "X"
  #elsif turns_played % 2 != 0
  #  "O"
  #end
  return turns_played.even? ? "X" : "O"
end
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# code your input_to_index and move method here!
def input_to_index(answer)
  index = answer.to_i - 1
end

def move(board, index, team)
  board[index] = team
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  #require 'pry'
  #binding.pry
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def valid_move?(board,index)
  if index.between?(0, 8) && position_taken?(board, index) == false
    true
  end
end
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

# Define won?, full?, draw?, over?, and winner below
def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end

def play(board)
  until over?(board)
    turn(board)
    #require 'pry'
    #binding.pry
  end
  if won?(board)
    winner = winner(board)
    puts "Congratulations #{winner}!"
  elsif draw?(board) == true
    puts "Cat's Game!"
  end
end
