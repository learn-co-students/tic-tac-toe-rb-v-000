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
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, mark)
  board[index] = mark
end

def position_taken? (board, index)
  board[index] != " "
end

def valid_move? (board, index)
  index.between?(0,8)  && !position_taken?(board,index)
end

def turn(board)
  puts "Please enter 1-9:"
  index = input_to_index(gets)
  if !valid_move?(board, index)
    turn(board)
  end
  move(board,index, current_player(board))
  display_board(board)
end

def turn_count(board)
  count = 0
  board.each { |val|
    if val!=" "
      count+=1
    end
  }
  return count
end

def current_player(board)
  turn_count(board)%2 == 0 ? "X" : "O"
end

def won? (board)
  WIN_COMBINATIONS.find do | combo |
    position_taken?(board,combo[0]) && board[combo[0]]==board[combo[1]] && board[combo[1]]==board[combo[2]]
  end
end

def full?(board)
  (0..8).all? { | idx | position_taken?(board,idx)}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner (board)
  combo = won?(board)
  return combo==nil ? nil : board[combo[0]]
end

def play(board)
  while !over?(board) do
    turn(board)
  end
  if winner(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
