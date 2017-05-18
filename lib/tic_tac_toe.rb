WIN_COMBINATIONS=[
  [0,1,2], # top row(h)
  [3,4,5], # mid row (h)
  [6,7,8], # bottom row (h)
  [0,4,8], # left top bottom right (oblique)
  [2,4,6], # right top bottom left (oblique)
  [0,3,6], # left row (v)
  [2,5,8], # right row (v)
  [1,4,7] # mid row (v)
]

board = [" "," "," "," "," "," "," "," "," "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  index=user_input.to_i - 1
end


def move(board,index,value)
board[index]=value
end


def position_taken?(board,index)
taken=nil
  if (board[index]== "" || board[index]==" " || board[index]==nil)
    taken=false
  else
    taken=true
  end
taken
end


def valid_move?(board,index)
  !(position_taken?(board,index)) && index.between?(0,8)
end


def turn(board)
  puts "Please enter 1-9:"
  user_input=gets.strip
  index=input_to_index(user_input)
if valid_move?(board,index)
    move(board,index,current_player(board))
    display_board(board)
  else
    turn(board)
end
end

def turn_count(board)
  counter=0
board.each do |turn|
  if turn=="X"||turn=="O"
    counter+=1
  end #end from if
end #end from do
return counter
end #end from def


def current_player(board)
  if turn_count(board)%2==0
    return "X"
  else
    return "O"
  end #end from if
end #end from def


def won?(board)
WIN_COMBINATIONS.find do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  pos_1 = board[win_index_1]
  pos_2 = board[win_index_2]
  pos_3 = board[win_index_3]

  if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
    win_combination
  elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
    win_combination
  end
end
end


def full?(board)
  board.all? do |element|
      element=="X"||element=="O"
    end
end


def draw?(board)
  draw=nil
  if !(won?(board)) && full?(board)
    draw=true
  else
    draw=false
  end
  draw
end


def over?(board)
  over=nil
  if won?(board) || draw?(board) || full?(board)
    over=true
  else
    over=false
  end
  over
end


#def winner(board)
#  result=nil
#  if won?(board)
#    won?(board).select do |pos|
#      if board[pos[0]] == "X"
#        result= "X"
#      elsif board[pos[0]] == "O"
#        result= "O"
#      end #1st if
#    end #do
#  end #2nd if
#result
#end #def

#changed winner board to this below:

def winner(board)
  if position = won?(board)
    board[position.first]
  end
end


def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cats Game!"
  end
end
