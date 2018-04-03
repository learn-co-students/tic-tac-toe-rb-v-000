# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=
[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

#has the game been won by either player?  
def won?(board)
  WIN_COMBINATIONS.each do |wc_oa|     
    #win comb outer array wc_oa
   w_x = wc_oa.all?{|i| board[i] =="X"}
   w_o = wc_oa.all?{|i| board[i] =="O"}
     if w_x == true || w_o == true
       return wc_oa
     end
  end
  return nil
end

#are all the slots full?
def full?(board)
  board.all?{|i| i=="X"||i=="O"}
end

#are there no more moves?
def draw?(board)
  full?(board) && won?(board)==nil
end

#has the game been won? or is it a draw?
def over?(board)
   won?(board) != nil || draw?(board)
end

#who won the game?
def winner(board)
  if won?(board) != nil
    arr_1 = won?(board)
    x = arr_1[0]
    return board[x]
  else
    return nil
  end
end

# Define display_board that accepts a board and prints
# out the current state.
def display_board(board_1)
  
  puts " #{board_1[0]} | #{board_1[1]} | #{board_1[2]} "
  puts "-----------"
  puts " #{board_1[3]} | #{board_1[4]} | #{board_1[5]} "
  puts "-----------"
  puts " #{board_1[6]} | #{board_1[7]} | #{board_1[8]} "
  
end


#TURN 

def turn(board)
puts "Please enter 1-9:"
index_1 = gets.strip
index_2 =input_to_index(index_1)
  if valid_move?(board,index_2)
  move(board,index_2,current_player(board))
  display_board(board)
  else
  turn(board)
  end
end


#returns correct index
def input_to_index(number)
int_input = number.to_i
int_input = int_input - 1
end

#assigns X or O based on move
def move(board,index,char)
  board[index] = char
end

#counter for the number of turns
def turn_count(board)
counter=0
board.each do |i|
  if i == "X" || i == "O"
  counter = counter + 1
  else
  counter
  end
end
  counter
end

#returns the current player
def current_player(board)
  i = turn_count(board)
  if i % 2 == 0
    cp = "X"
  else
    cp = "O"
  end
  cp
end


#checks if the index is valid
def valid_move?(board,index)
  if index.between?(0,8) == true && !position_taken?(board,index) == true
    x = true
  else 
    x = false
  end
  x
end

#play method

def play(board)
  while !over?(board)
    turn(board)
  end
    if won?(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cat's Game!"
    end
end