require "pry"

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, position, char)
  board[position] = char
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if index.between?(0, 8)
      if !(position_taken?(board, index))
        true
      else
        false
      end
  else
    false
  end
end

def turn_count(board)
  turn_counter = 0
  board.each do |space|
    if space == "X" || space == "O"
      turn_counter += 1
    end
  end
  turn_counter
end

def turn(board)
  puts "Please enter 1-9:"
  plays = gets.strip
  index = input_to_index(plays)
  if valid_move?(board, index)
    if turn_count(board).odd?
      char = "O"
    else
      char = "X"
    end
    move(board, index, char)
    display_board(board)
  else
    turn(board)
  end
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    board[win_combination[0]] == board[win_combination[1]] &&
    board[win_combination[1]] == board[win_combination[2]] &&
    position_taken?(board, win_combination[0])
  end
end

def full?(board)
  board.none? do |index|
    index === nil || index === " "
  end
end

def draw?(board)
  if !(won?(board)) && full?(board)
    true
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  end
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
