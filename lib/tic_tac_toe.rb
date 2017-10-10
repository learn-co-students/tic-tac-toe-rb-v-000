WIN_COMBINATIONS = [
  [0,1,2], #top row win
  [3,4,5], #middle row win
  [6,7,8], #bottom row win
  [0,3,6], #left row win
  [1,4,7], #middle row win
  [2,5,8], #right row win
  [0,4,8], #left diagonal
  [2,4,6] #right diagonal
]

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

def move(array, index, char)
  array[index] = char
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end


def turn_count(board)
counter = 0
board.each do |char|
  if char != " "
  counter += 1
end
end
counter
end


def current_player(board)
if turn_count(board) == 0 || turn_count(board) % 2 == 0
  "X"
else
  "O"
end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win|
    board[win[0]] == board[win[1]] && board[win[1]] == board[win[2]] && position_taken?(board,win[0])
end
end


def full?(board)
  board.all? do |index|
    if index != " "
        true
    elsif
      index  == " "
        false
    end
  end
end



def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end


def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end


def winner(board)
  if win = won?(board)
  board[win.first]
  end
end


def play(board)
  until over?(board)
  turn(board)
end
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  elsif draw?(board)
    puts "Cat's Game!"
end
end
