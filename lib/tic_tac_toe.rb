require 'pry'
#constants
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

#Helper Methods
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

def move(board,position,character)
  board[position] = character
end

def position_taken? (board,index)
  if board[index] == " " || board[index] == "" || board[index] ==nil
    false
  else
    true
  end
end

def valid_move?(board,index)
  if index.between?(0,8) && !position_taken?(board,index)
    true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board,index)
      move(board,index,current_player(board))
    else turn(board)
  end
  display_board(board)
end

def turn_count(board)
  counter=0
  board.collect do |board|
    if board =="X" || board =="O"
      counter+=1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board)%2 == 0
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_index|
    board[win_index[0]] == board[win_index[1]] && board[win_index[1]] == board[win_index[2]] && position_taken?(board, win_index[0])
  end
end

def full?(board)
  board.all? do |board_index|
    board_index == "X" || board_index == "O"
  end
end

def draw?(board)
  if won?(board)==nil && full?(board) == true
    return true
  end
end

def over?(board)
  #binding.pry
  if full?(board) == true && draw?(board)== true || won?(board) != nil
    return true
  end
end

#binding.pry
def winner(board)
won?(board)
if won?(board) != nil
board[won?(board)[0]]
    end
  end

#Game Loop
def play(board)

  until over?(board)
  turn(board)
  end

  if draw?(board)
  puts "Cats Game!"
  else won?(board)
    puts "Congratulations #{winner(board)}!"
  end
end
