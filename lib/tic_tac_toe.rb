# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8], #last row
  [0,3,6],
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #diagional 1
  [2,4,6], #diagonal 2
]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
  win_index_1 = combination[0]
  win_index_2 = combination[1]
  win_index_3 = combination[2]

  position_1 = board[win_index_1] # load the value of the board at win_index_1
  position_2 = board[win_index_2] # load the value of the board at win_index_2
  position_3 = board[win_index_3] # load the value of the board at win_index_3

  if position_1 == "X" && position_2 == "X" && position_3 == "X" && position_taken?(board, win_index_1)
     return combination # return the win_combination indexes that won.
   elsif position_1 == "O" && position_2 == "O" && position_3 == "O" && position_taken?(board, win_index_1)
      return combination
   end
end
return false
end

def full?(board)
  board.each do |space|
if space == " "
      return false
    end
  end
end

def draw?(board)
    if full?(board) && won?(board) == false
      return true
    end
end

def over?(board)
    if full?(board) || won?(board)
      return true
    else
      return false
    end
  end

def winner(board)
  if won?(board) == false
    return nil
  else
    board[won?(board)[0]]
  end
end

def display_board(board)
  puts " #{board [0]} " "|" " #{board [1]} " "|" " #{board [2]} "
  puts "-----------"
  puts " #{board [3]} " "|" " #{board [4]} " "|" " #{board [5]} "
  puts "-----------"
  puts " #{board [6]} " "|" " #{board [7]} " "|" " #{board [8]} "
end

def input_to_index(input)
  input = input.to_i - 1
end

def move (array, index, value)
  array[index] = value
end

def turn_count(board)
  counter = 0
  board.each do |token|
    if token == "X" || token == "O"
      counter += 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  value = current_player(board)
  if valid_move?(board, index)
    move(board, index, value)
    display_board(board)
  else
    turn(board)
  end
end

def play(board)
  until won?(board) || over?(board) || draw?(board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
    #puts "Congratulations #{board[won?(board)[0]]}!"
  else draw?(board)
    puts "Cat's Game!"
  end
end
