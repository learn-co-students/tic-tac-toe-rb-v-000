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

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board,index,player)
  board[index] = player if !position_taken?(board,index)
end

def position_taken?(board,index)
  ["X","O"].include? board[index]
end

def valid_move?(board,index)
  index.between?(0,8) && !position_taken?(board,index)
end

def turn(board)
  puts "Please enter 1-9:"
  index = input_to_index(gets.strip)
  if valid_move?(board,index)
    move(board,index,current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  board.select{|i| ["X","O"].include? i}.length
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def won?(board)
  x_pos = board.each_index.select{|x| board[x]=="X"}
  o_pos = board.each_index.select{|o| board[o]=="O"}
  combo = WIN_COMBINATIONS.select do |win|
    win.all?{|i| x_pos.include? i} || win.all?{|i| o_pos.include? i}
  end
  combo.empty? ? false : combo[0]
end

def full?(board)
  board.all?{|i| ["X","O"].include? i}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  return nil if !combo = won?(board)
  x_pos = board.each_index.select{|x| board[x]=="X"}
  o_pos = board.each_index.select{|o| board[o]=="O"}
  if    combo.all?{|i| x_pos.include? i} then "X"
  elsif combo.all?{|i| o_pos.include? i} then "O"
  else nil
  end
end

def play(board)
  turn(board) until over?(board)
  won?(board) ? puts("Congratulations #{winner(board)}!") : puts("Cat's Game!")
end