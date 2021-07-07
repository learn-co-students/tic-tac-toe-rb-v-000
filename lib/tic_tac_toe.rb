def display_board(board) #OK
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

WIN_COMBINATIONS = [ #OK
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

def input_to_index(input) #OK
  input.to_i - 1
end


def position_taken?(board,index) #OK
  if board[index] == " " || board[index] == ""
    false
  else
    true
  end
end

def valid_move?(board,index) #OK
 if index.between?(0,8) && !position_taken?(board,index)
   true
 else
   false
 end
end

def move(board,index,character) #OK
  board[index] = character
end

def turn(board)
  puts "Enter 1-9"
  input = gets.strip
  index = input_to_index(input)
  display_board(board)
end

def turn_count(board)
  count = 0
  board.all? do |squares|
    if squares != "" && squares != " "
      count += 1
  end
end
end
