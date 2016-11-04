WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # First column
  [1,4,7],  # Second column
  [2,5,8],  # Third column
  [0,4,8],  # First diagonal
  [2,4,6]   # Second diagonal
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input="X")
  user_input.to_i - 1
end

def move(board, index, character)
  board[index] = character
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
    if position_taken?(board, index)
      false
    elsif index.between?(0, 8)
      true
    else false
end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)

  if valid_move?(board, index)
    move(board, index, "X")
  else
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
   board.count { |index| index != " " }
end

def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    return "O"
end
end

def won?(board)
  WIN_COMBINATIONS.any? do |combo|
    if board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]] && position_taken?(board, combo[0])
      return combo
    end
    end
end

def full?(board)
  board.all? do |index|
    index != " " && index != nil
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
end

def over?(board)
  if won?(board) == true || full?(board) == true || draw?(board) == true
    return true
  end
end

def winner(board)
  if won?(board)
   board[won?(board)[0]]
 end
end
