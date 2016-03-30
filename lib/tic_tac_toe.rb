require 'pry'

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


def move(board, location, current_player = "X")
  board[location.to_i-1] = current_player
end

def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def valid_move?(board, position)
  position.to_i.between?(1,9) && !position_taken?(board, position.to_i-1)
end

def turn(board)
  valid = false
  while !valid
    puts 'Please enter 1-9:'
    user_position = gets.chomp
    valid = valid_move?(board, user_position)
  end
  move(board, user_position, current_player(board))
  display_board(board)
end

def current_player(board)
  if turn_count(board).even?
    'X'
  else
    'O'
  end
end

def turn_count(board)
  board.each_index.count { |i| position_taken?(board, i) }
end


def play(board)
  until over?(board) do
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end

def won?(board)
   WIN_COMBINATIONS.detect do |combinations|
     if combinations.all? {|position| board[position] == "X"}
      return combinations
     elsif combinations.all? {|position| board[position] == "O"}
      return combinations
     else
      false
     end
  end
end

def full?(board)
  board.each_index do |place|
    if !position_taken?(board,place)
      false
      break
    else
      true
    end
  end
end

def draw?(board)
  if full?(board)
    true
    if won?(board)
      false
    else
      true
    end
  else
    false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board)
    if board[won?(board)[0]] == "X"
      return "X"
    else
      "O"
    end
  end
end
