WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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
  board[index] != " " && board[index] != "" && board[index] != nil
end

def valid_move?(board, index)
  position_taken?(board, index) == false && index.between?(0, 8) == true
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  character = current_player(board)
  if valid_move?(board, index) == false
    turn(board)
  else move(board, index, character)
    display_board(board)
  end
end

def turn_count(board)
  turn_x = 0
  turn_o = 0
  board.each do |turn|
    if turn == "X"
      turn_x += 1
    elsif turn == "O"
      turn_o += 1
      end
    end
  turn_x + turn_o
end

def current_player(board)
  if turn_count(board).even?
    return "X"
  elsif turn_count(board).odd?
    return "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |win_array|
    board_row = board[win_array[0]] + board[win_array[1]] + board[win_array[2]]
    if board_row == "XXX" || board_row == "OOO"
      return win_array
    end
  end
else return false
end

def full?(board)
  board.all? do |spot|
    spot == "X" || spot == "O"
  end
end

def draw?(board)
  if !won?(board) == true && full?(board) == true
    return true
  else
    return false
  end
end

def over?(board)
  if full?(board) == true || draw?(board) == true || won?(board) != false
    return true
  end
end

def winner(board)
  letter = won?(board)
  if letter
    return board[letter[0]]
  end
end

def play(board)
  until over?(board) == true
    turn(board)
  end
    if won?(board) != false
      puts "Congratulations #{winner(board)}!"
    else if draw?(board) == true
      puts "Cats Game!"
    end
  end
end
