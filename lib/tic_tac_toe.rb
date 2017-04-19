require "pry"

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
  integer = input.to_i
  integer - 1
end


def move(board, index, player)
  board[index] = player
end


def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0, 8)
    true
  else !(index.between?(1, 9)) && position_taken?(board, index) == true
    false
  end
end


def turn(board)
  puts "Please enter 1-9:"
  input = input_to_index(gets.chomp)
  # binding.pry
  if valid_move?(board, input) == false
    turn(board)
  else
    move(board, input, current_player(board))
    display_board(board)
  end
end


def turn_count(board)
  counter = 0
  board.each do |location|
    if !(location == "" || location == " ")
      counter += 1
    end
  end
  return counter
end


def current_player(board)
  num_of_turns = turn_count(board)
  if num_of_turns % 2 == 0
    player = "X"
  else
    player = "O"
  end
end


def won?(board)
  # binding.pry
  WIN_COMBINATIONS.detect do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
  end
end


def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end


def draw?(board)
  return !won?(board) && full?(board)
end


def over?(board)
  if draw?(board) || won?(board)
    return true
  end
end


def winner(board)
  win = won?(board)
  if win == nil
    return nil
  elsif board[win[0]] == "X" || board[win[0]] == "O"
    return board[win[0]]
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
  else draw?(board)
    puts "Cats Game!"
  end
end
