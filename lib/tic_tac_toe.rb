
board = ["   ", "   ", "   ", "   ", "   ", "   ", "   ", "   ","   "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


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

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, token)
  board[index] = token
  if turn_count(board).even?
    token = "X"
  elsif turn_count(board).odd?
    token = "O"
  end
end

def position_taken?(board, index)
if board[index] == "X" || board[index] == "O"
true
  else board[index] == "   " || board[index] == " " || board[index] == nil
    false
end
end

def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board,index)
    true
  else
    nil
end
end



def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    if turn_count(board).even?
      token = "X"
    elsif turn_count(board).odd?
      token = "O"
    end
    index = input_to_index(input)
    if valid_move?(board, index)
      move(board, index, token)
      display_board(board)
    else
      turn(board)
    end
end


def turn_count(board)
  counter = 0
board.each do |turn|
  if turn != " "
  counter += 1
end
end
counter
end


def current_player(board)
  if turn_count(board).even?
  "X"
elsif turn_count(board).odd?
    "O"
  else
    nil
end
end

def won?(board)
winning_combination = WIN_COMBINATIONS.select do |array|
    win_index_1 = array[0]
    win_index_2 = array[1]
    win_index_3 = array[2]
    if board[win_index_1] == "X" && board[win_index_2] == "X" && board[win_index_3] == "X"
      array
    elsif board[win_index_1] == "O" && board[win_index_2] == "O" && board[win_index_3] == "O"
      array
    else
      false
    end
  end
  winning_combination[0]
end


def full?(board)
  board.none?{|position| position == " "}
end


def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board)
  board[won?(board)[0]]
  else
  end
end


def play(board)
  #input = gets.strip
  while !over?(board)
    turn(board)
  end
if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
