WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} )"
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} )"
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} )"
end

def move(board, location, character)
  board[location.to_i-1]=character
end

def position_taken?(board, position)
      if board[position] == " " || board[position] == "" || board[position] == nil
    return false
  end
    true
end

def valid_move?(board, position)
  position = (position.to_i-1)
  if position.between?(0, 8) && position_taken?(board, position) == false
      true
    else
      false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  position = gets.chomp
  turn_count(board)
  character = current_player(board)
  if valid_move?(board, position)
    move(board, position, character)
  else
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
  turn_number=0
  board.each do |turn|
    if turn == "X" || turn == "O"
    turn_number += 1
      else
    end
  end
  return turn_number
end

def current_player(board)
  turn_count(board)%2==0? "X" : "O"
end

def won?(board)
  win_combination = WIN_COMBINATIONS.detect do |win|
    win.all? {|i| board[i]=="X"} || win.all? {|i| board[i]=="O"}
  end
    win_combination unless win_combination == nil
end

def full?(board)
  board.all?{|i| i == "X" || i == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if wins = won?(board)
    board[wins[0]]
  end
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
