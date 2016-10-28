require 'pry'

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index (num_str)
  position = num_str.to_i
  ind = position - 1
end

def move (board, ind, char)
  board[ind] = char
end

def valid_move? (board, index)
  if (index.between?(0, 8)) && !(position_taken?(board, index))
    value = true
  else
    value = false
  end
  value
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


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

def won? (board)
  win_output = false

  WIN_COMBINATIONS.each do |winning_way|
    if winning_way.all? { |win_index| board[win_index] == "X" }
      win_output = winning_way
      break
    end
  end

  WIN_COMBINATIONS.each do |winning_way|
    if winning_way.all? { |win_index| board[win_index] == "O"}
      win_output = winning_way
      break
    end
  end
  win_output
end

def full? (board)
  board.all? { |e| e == "X" || e == "O" }
end

def draw? (board)
  won = won?(board)
  full = full?(board)
  won == false && full
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  winning_char = nil
  if won?(board).is_a?(Array)
    winning_char = board[won?(board)[0]]
  end
  winning_char
end


def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)

  if valid_move?(board, index)

    move(board, index, current_player(board))
    display_board(board)

  else
    turn(board)
  end
end

def turn_count(board)
  count = 0
  board.each do |idx|
    if idx != " "
      count += 1
    end
  end
  count
end

def current_player(board)
  player_char = "X"
  if turn_count(board) % 2 == 1
    player_char = "O"
  end
  player_char
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
