def display_board(board)
  puts " #{board[0]} "+"|"+" #{board[1]} "+"|"+" #{board[2]} "
  puts "-----------"

  puts " #{board[3]} "+"|"+" #{board[4]} "+"|"+" #{board[5]} "

  puts "-----------"
  puts " #{board[6]} "+"|"+" #{board[7]} "+"|"+" #{board[8]} "

end

def input_to_index(number)
number.to_i-1
end
def move(array,index,character)
array[index]=character
end
def position_taken? ( board , index )

if (board[index]==" ")||(board[index]=="")||(board[index]==nil)
  false
elsif (board[index]== "X")||(board[index]=="O")
   true
end
end
def valid_move?(board,index)
  if (index>=0) && (index<=8) && (index % 1==0) && !(position_taken?(board,index))
  true
else
  false
  end

end
def turn(board)
  puts "Please enter 1-9:"
  index=input_to_index(gets.strip)
  until valid_move?(board, index)
  puts "Please enter 1-9:"
  index=input_to_index(gets.strip)
  end

move(board,index,current_player(board))
display_board(board)

end
def turn_count(board)
tcounter=0
counter=0
while counter<=8
   if board[counter]=="X" || board[counter]=="O"
    tcounter +=1
  end
 counter +=1
end

tcounter
end

def current_player(board)
if turn_count(board) % 2==0
  current_player="X"
else
  current_player="O"
end
end
WIN_COMBINATIONS =[
[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[2,4,6]
  ]
def won? (board)
  false
WIN_COMBINATIONS.any? do |win_combination|

  if position_taken?(board,win_combination[0]) &&
    board[win_combination[0]]==board[win_combination[1]] &&
    board[win_combination[0]] == board[win_combination[2]]
  return win_combination
 end
end
end

def full? (board)
false
board.all? do |position|
  if position =="X"||position=="O"
    true
  end
end
end
def draw?(board)
  false
if full?(board)&&!won?(board)
  true
end
end
def over?(board)
  false
  if won?(board)||full?(board)
    true
  end
end
def winner(board)
  if won?(board)
    board[won?(board)[0]]
  else
    nil
  end
end
def play(board)
  while !over? (board)
    turn(board)
 end
    if won?(board)
      puts "congratulations ${winner(board)}, you are the winner"
    elsif draw?(board)
      puts "This game is a draw"
    end
end
