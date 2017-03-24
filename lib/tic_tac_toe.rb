
def display_board(board)
 puts " #{board[0]} | #{board[1]} | #{board[2]} "
 puts "------------"
 puts " #{board[3]} | #{board[4]} | #{board[5]} "
 puts "------------"
 puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
def valid_move?(board,index)
  index.between?(0,8) && !position_taken?(board,index)
end

def position_taken?(board,index)
 board[index] == "X" || board[index] == "O"
end
def input_to_index(input)
 return input.to_i - 1
end
def move(board,index, token)
  board[index] = token
end

def turn(board)
  puts "Please enter 1-9:"
  num = gets.chomp
  index = input_to_index(num)
  if valid_move?(board,index)
     move(board,index, current_player(board))
     display_board(board)
  else
    turn(board)
   end
end

def turn_count(board)
  pos = 0
  board.each do |token|
    if token == "X" || token == "O"
     pos+=1
    end
  end
  return pos
end

def current_player(board)
  if turn_count(board)%2 == 0
    return "X"
  else
    return "O"
  end
end

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [6,4,2],
  [2,5,8],
  [0,3,6],
  [1,4,7]
]
def won?(board)
   WIN_COMBINATIONS.detect{|win| board[win[0]] ==  board[win[1]] && board[win[1]] ==  board[win[2]] && position_taken?(board,win[2])}
end
def full?(board)
  board.all? do |token|
    token == "O" || token == "X"
  end
end

def draw?(board)
   !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if won?(board) != nil
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
    puts "Cats Game!"
  end
end
