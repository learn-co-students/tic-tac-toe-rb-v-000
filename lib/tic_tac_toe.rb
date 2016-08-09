# Define display_board that accepts a board and prints
# out the current state.
board = ["   ","   ","   ","   ","   ","   ","   ","   ","   "]


def display_board(board)
  rows = [" #{board[0]} | #{board[1]} | #{board[2]} ", "-----------", " #{board[3]} | #{board[4]} | #{board[5]} ", "-----------", " #{board[6]} | #{board[7]} | #{board[8]} "]

  puts "#{rows[0]}"
  puts "#{rows[1]}"
  puts "#{rows[2]}"
  puts "#{rows[3]}"
  puts "#{rows[4]}"

end

def input_to_index(input)
  index = input.to_i - 1
end


def move(board, index, character)
  board[index] = character
  board
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def between?(index)
  index >= 0 && index <= 8
end

def valid_move?(board, index)
  if !position_taken?(board, index) && between?(index)
    true
  else
    nil
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input.to_i - 1
  input_to_index(input)
  if valid_move?(board, index)
    move(board, index, character = "X")
    display_board(board)
  else
    turn(board)
  end
end


def turn_count(board)
  counter = 0
  board.each{|spot|
    if spot == "X" || spot == "O"
      counter += 1
    end}
  return counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [0,4,8],
  [1,4,7],
  [2,5,8],
  [2,4,6]
]




def won?(board)
  if WIN_COMBINATIONS.find do |win_combination|
      if win_combination.all? do |index| board[index] == "X"
      end
        return win_combination
      elsif win_combination.all? {|index| board[index] == "O" }
       return win_combination
      end
    end
  else
    false
  end
end

def full?(board)
  if board.any? { |space| space == " "}
    return false
  else
    return true
  end
end

def draw?(board)
  if won?(board)
    return false
  elsif !full?(board)
    return false
  else
    return true
  end
end

def over?(board)
  if won?(board)
    return true
  elsif draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if WIN_COMBINATIONS.find do |win_combination|
      if win_combination.all? { |index| board[index] == "X" }
        return "X"
      elsif win_combination.all? {|index| board[index] == "O" }
       return "O"
      end
    end
  else
    nil
  end
end


def play(board)
  until over?(board) do
    turn_count(board)
      if current_player == "X"
        turn(board)
      elsif current_player == "O"
        turn(board, character = "O")
      end
  end
  if won?(board)
    puts "Congratulations, #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
