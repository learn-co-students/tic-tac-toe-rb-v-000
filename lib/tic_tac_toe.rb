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
  "#{input}".to_i - 1
end

def update_array_at_with(board, index, char)
  board[index] = char
end

def move(board, index, char)
  update_array_at_with(board, index, char)
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board,index)
  if index.between?(0,8) && position_taken?(board,index)==false
    return true
  else
    return false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board,index)
    move(board,index,char="X")
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  counter = turn_count(board)
  counter % 2 == 0 ? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.detect do |i|
    board[i[0]]==board[i[1]] && board[i[0]]==board[i[2]] && position_taken?(board,i[0])
  end
end

def full?(board)
  board.all? do |i|
    i=="X" || i=="O"
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  board[won?(board)[0]]if won?(board)
end

def play(board)
  counter = 0
  until over?(board)
    turn(board)
    counter += 1
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else draw?(board)
    puts "Cat's Game!"
  end
end
