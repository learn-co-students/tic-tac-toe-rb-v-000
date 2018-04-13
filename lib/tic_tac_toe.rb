
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
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

def turn(board)
puts "Please enter 1-9:"
input = gets.chomp.to_i
index = input_to_index(input)

 if valid_move?(board, index)==true
    move(board, index, current_player = "X")
    display_board(board)
  else puts "Please select a different move"
    turn(board)
  end
end


def play(board)
  turn_count = 0
  while turn_count < 9
    turn(board)
    turn_count+=1
  end
end

def move(board, index, current_player)
  board[index] = current_player
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def position_taken?(board, index)
  board[index] != " "
end

def turn_count(board)
  turns = 0
  board.each do |token|
    if token == "X" || token == "O"
      turns += 1
    end
  end
  turns
end

def current_player(board)
  turn_count(board) % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  if board.include?(" ")
    false
  else
    true
  end
end

def draw?(board)
  (full?(board) && !won?(board))
end

def over?(board)
  (full?(board)||won?(board)||draw?(board))
end

def winner(board)
 !won?(board)
     nil
  if won?(board)
    index = won?(board)
     if board[index[0]]=="X"
       return "X"
     else
       return "O"
     end
  end
end
