# Define the variable board below.
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #center column
  [2,5,8], #right column
  [0,4,8], #right diagonal
  [2,4,6], #left diagonal
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# code your input_to_index and move method here!
def input_to_index(user_input)
  index = (user_input.to_i) - 1
  return index
end

def move(board, index, character)
  board[index] = character
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  else
    return true
  end
end

def valid_move?(board, index)
  if position_taken?(board, index)
    return false
  elsif index > 8 || index < 0
    return false
  else
    return true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
    until valid_move?(board, index) == true
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
    end
  move(board, index, character = "X")
  display_board(board)
end

def turn_count(board)
counter = 0
  board.each do |index|
    if index != " "
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination # return the win_combination indexes that won.
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      else
    end
  end
end

def full?(board)
  board.none? {|index| index == " "}
end

def draw?(board)
  if won?(board) || !full?(board)
    return false
  else
    return true
  end
end


def over?(board)
  if draw?(board)
    return true
  elsif won?(board)
    return true
  elsif !full?(board)
    return false
  end
end

def winner(board)
  if won?(board)
    WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return "X" # return the win_combination indexes that won.
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return "O"
      else
      end
    end
  else
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
end
