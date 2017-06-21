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

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  index = input.to_i - 1
end

def move(board, index, character)
  board[index] = character
end

def position_taken?(board, index)
  taken = nil
  if board[index] == " " || board[index] == "" || board[index] == nil
    taken = false
  else
    taken = true
  end
end

def valid_move?(board, index)
  valid = nil
  if index.between?(0, 8) == true && position_taken?(board, index) == false
    valid = true
  else
    valid = false
  end
end

def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    valid_move?(board, index)
  if valid_move?(board, index)
    character = current_player(board)
    move(board, index, character)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  board.count("X") + board.count("O")
end

def current_player(board)
  character = nil
  if turn_count(board).even?
    character = "X"
  else turn_count(board).odd?
    character = "O"
  return character
end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|

    position_1 = board[win_combination[0]]
    position_2 = board[win_combination[1]]
    position_3 = board[win_combination[2]]

    (position_taken?(board, win_combination[0]) &&
    position_taken?(board, win_combination[1]) &&
    position_taken?(board, win_combination[2])) &&
    (position_1 == position_2 && position_2 == position_3)
  end
end

def full?(board)
  board.all? do |position|
  position == "X" || position == "O"
 end
end

def draw?(board)
  !(won?(board)) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
  win_combination = []
  win_combination = won?(board)
  return board[win_combination[0]]
else
  return nil
end
end

def play(board)
  display_board(board)
until over?(board)
    turn(board)
    won?(board)
    draw?(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
