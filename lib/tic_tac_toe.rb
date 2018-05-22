require 'set'
# Helper Method
def position_taken?(board, index)
  board[index] != " " && board[index] != "" && !!board[index]
end

def turn_count(board)
  turn = 0
  board.each do |content|
    if content == "X" || content == "O"
      turn += 1
    end
  end
  return turn
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def play(board)
  until over?(board) do
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end


def won?(board, who = false)
  moves = Hash.new
  moves["X"] = Set[]
  moves["O"] = Set[]
  index = 0
  board.each do |space|
    if space == "X" || space == "O"
      moves[space].add(index)
    end
    index += 1
  end
  WIN_COMBINATIONS.each do |combination|
    combo = Set.new(combination)
    if combo.subset?(moves["X"])
      return who ? "X" : combination
    elsif combo.subset?(moves["O"])
      return who ? "O" : combination
    end
  end
  return nil
end

def draw?(board)
  full?(board) && !won?(board)
end

def full?(board)
  board.reject{|i| i == "X" || i =="O"}.length == 0
end



def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  won?(board, true)
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
  [2,4,6]
]
