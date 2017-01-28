# Helper Method

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# code your input_to_index and move method here!
def input_to_index(input)
  input.to_i - 1
end

def move(board, index, character)
  board[index] = character
  return board
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# code your #valid_move? method here
def valid_move?(board, index)
  !(position_taken?(board, index) || index<0 || index>8)
end

def turn(board)

  loop do
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(board, index)
      board = move(board, index, current_player(board))
      display_board(board)
      break
    end
  end
end

def turn_count(board)
  count = 0
  board.each do |item|
    if item == "X" || item == "O"
      count += 1
    end
  end
  return count
end

def current_player(board)
  return turn_count(board)%2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.each_with_index do |win_combination, index|

    position_1 = board[win_combination[0]] # load the value of the board at win_index_1
    position_2 = board[win_combination[1]] # load the value of the board at win_index_2
    position_3 = board[win_combination[2]] # load the value of the board at win_index_3

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return WIN_COMBINATIONS[index] # return the win_combination indexes that won
    end
  end
  return false
end

def full?(board)
  board.detect{|character| character == " " || character == nil?} == nil
end

def draw?(board)
  !(won?(board)) && full?(board)

end

def over?(board)
  draw?(board) || won?(board) || full?(board)
end

def winner(board)
  array = won?(board)
  if array
     return board[array[0]]
  else
    return nil
  end
end

def play(board)
  until over?(board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end

end
