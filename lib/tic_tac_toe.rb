def display_board (board)
  puts    " #{board[0]} | #{board[1]} | #{board[2]} "
  puts    "-----------"
  puts    " #{board[3]} | #{board[4]} | #{board[5]} "
  puts    "-----------"
  puts    " #{board[6]} | #{board[7]} | #{board[8]} "
end# Define display_board that accepts a board and prints
# out the current state.
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
       board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O" ||
       board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X"
    end
end

def full? (board)
    board.all? do |space|
      space == "O" || space == "X"
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
end

def over?(board)
  if draw?(board) ||full?(board) || won?(board)
    return true
  end
end

def winner(board)
  if draw?(board) || !won?(board)
    return nil
  end
   index = won?(board)
  return board[index[1]]
end

def input_to_index (input)
  return input.to_i - 1
end

def valid_move? (board, index)
  index.between?(0,9) && position_taken?(board, index) == false
end

def position_taken?(board, index)
    if board[index] == " " || board[index] == "" || board[index] == nil
      return false
    end
  else
    return true
end

def move (board, index, value)
    board[index] = value
    board
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index) == true
     move(board, index, current_player(board))
     display_board(board)
   else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
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

def play(board)
    until over?(board)
      current_player(board)
      turn(board)
    end
    if won?(board)
      puts "Congratulations #{winner(board)}!"
        end
    if draw?(board)
      puts "Cats Game!"
    end

end
