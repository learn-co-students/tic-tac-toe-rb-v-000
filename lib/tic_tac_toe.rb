
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [2,4,6],
  [0,4,8],
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

def input_to_index(input)
  input.to_i - 1
end

def player_move(board, index, token)
 board[index] = token
end


def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
 end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    token = current_player(board)
player_move(board, index, token)
     display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |boards|
    if boards == "X" || boards == "O"
     counter += 1
      puts "#{counter}"
    end
  end
counter
end

def current_player(board)
  loop do 
   if turn_count(board).even? 
      return "X"
    else
     return "O"
    end
 end
end


def won?(board)
 WIN_COMBINATIONS.find do |i| 
   board[i[0]] == board[i[1]] && board[i[0]] == board[i[2]] && position_taken?(board, i[0])
end  
end

def full?(board) 
 board.each do |letter| 
   if letter == " " 
    return false 
    end 
     end
     end 
     
def draw?(board)
!won?(board) && full?(board)
  end
 
 def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  won?(board) && board[won?(board)[0]]
end 

#def play(board)
 # go = 0
  #until go == 9
  #go += 1
  #turn(board)
#if over?(board) == false
 # turn(board)
## if won?(board) 
  #puts "Congratulations you are the winner"
#else
#  puts "This game ended in a draw."
#end
#end

