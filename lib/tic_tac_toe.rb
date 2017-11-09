WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(index)
  index.to_i - 1
end

def valid_move?(board, index)
  !position_taken?(board, index) && index.between?(0, 8)
end

def won?(board)
  WIN_COMBINATIONS.detect do |win|
    board[win[0]] == board[win[1]] && board[win[1]] == board[win[2]] && position_taken?(board, win[0])
  end
end

def full?(board)
  board.any? {|move| move == " "} == false
end

def draw?(board)
  if won?(board) && full?(board)
    false
  elsif full?(board)
    true
  end
end

def over?(board)
  if won?(board) && !full?(board) || !won?(board) && full?(board) || won?(board) && full?(board)
    true
  end
end

def move(board, index, character)
  board[index] = character
end


def turn(board)
  puts "Please enter 1-9:"
  index = gets.strip
  index = input_to_index(index)
  if valid_move?(board, index)
    move(board, index, character)
    display_board(board)
  else
  puts "Please enter 1-9:"
  turn(board)
end

def position_taken?(board, index)
  !(board[index] == " " || board[index] == "" || board[index] == nil)
end

def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
    end
  end
  counter
end

def current_player(board)
  turn = turn_count(board)
  if turn % 2 == 0
    return "X"
  else
    return "O"
  end
end

def winner(board)
  if winner = won?(board)
    board[winner[0]]
  end
end

def play(board)
  while !over(board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
