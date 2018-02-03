
WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #horizontal middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #left column
  [1, 4, 7], #middle column
  [2, 5, 8], #right column
  [0, 4, 8], #left diagonal
  [2, 4, 6]  #right diagonal
  ]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#################################################

def input_to_index(inp)
  inp.to_i-1
end

#################################################

def move(board,po,ch)
board[po]=ch
display_board(board)
end



#################################################

def position_taken?(board,idx)
  board[idx].eql?("X")||board[idx]=="O"
end

#################################################

def valid_move?(board,idx)
  (0..8)===idx && !(position_taken?(board,idx))
end

#################################################

def turn(board)
  puts "Please choose btwn 1-9"
  inp=input_to_index(gets.strip)
  !(valid_move?(board,inp)) ? turn(board) : move(board,inp,current_player(board))
  display_board(board)
end

#################################################

def turn_count(board)
   board.count("X")+board.count("O")
end

def current_player(board)
  turn_count(board).even? ? ("X") : ("O")
end

####################################################

def won?(board)
  WIN_COMBINATIONS.find do |idx|
    if idx.all? {|i| board[i] == "X" } == true
      idx
    elsif idx.all? {|i| board[i] == "O" } == true
      idx
    end
  end
end

#################################################

def full?(board)
board.all? {|i| i == "X" || i == "O" }
end

###################################################

def draw?(board)
  won?(board)==nil&&full?(board)==true
end

###################################################

def over?(board)
  draw?(board)||won?(board)
end

###################################################

def winner(board)

     board[won?(board)[0]] if  won?(board)
end

###################################################

def play(board)

until over?(board)
    turn(board)
  end
draw?(board) ? (puts "Cat's Game!") :  (puts "Congratulations #{winner(board)}!" )
end
