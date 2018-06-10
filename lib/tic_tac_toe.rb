
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

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

def move(board, index, current_player)
  board[index] = current_player
end


def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn_count(board)
  counter = 0
  board.each do |position_count|
    if position_count == "X" || position_count =="O"
      counter+=1
    end
  end
  counter 
end 

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end 

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
current_player = current_player(board)
  if valid_move?(board, index)
    move(board, index, current_player)
    display_board(board)
  else
    turn(board)
  end 
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

def won?(board)
WIN_COMBINATIONS.detect do  |win_combo|
  board[win_combo[0]] == board[win_combo[1]] && board[win_combo[1]]==board[win_combo[2]] && (board[win_combo[1]]=="X" || board[win_combo[1]]=="O")
end
end 

def full?(board)
board.none? do |empty|
  empty =="" || empty ==" "
end
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
    nil 
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