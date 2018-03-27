require "pry"

#lib

def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} \n"
    puts "-----------\n"
   puts " #{board[3]} | #{board[4]} | #{board[5]} \n"
    puts "-----------\n"
    puts " #{board[6]} | #{board[7]} | #{board[8]} \n"
end

#position_taken?
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

#valid_move?
def valid_move?(board,index)
  if position_taken?(board,index) == FALSE && index.between?(0, 8) == TRUE
    TRUE
  else
    FALSE
  end
end

#input to index 
def input_to_index(input)
  index = "#{input}".to_i - 1
end

#turn_count
def turn_count(board)
  board.count{|occupied|occupied != " "}
end

#current_player
def current_player(board)
  if turn_count(board) % 2 == 0
    current_player = "X"
  else
    current_player = "O"
  end
end

#move
def move(board, index, char)
  board[index] = char
end

#turn
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  char = "#{current_player(board)}"
  if valid_move?(board,index) == true
    move(board, index, char)
    puts display_board(board)
  else
    puts "Your entry is not valid"
    puts turn(board)
  end
end

#Game Status

#WIN_COMBINATIONS

WIN_COMBINATIONS = [
  [0,1,2], #top row 
  [3,4,5], #middle row 
  [0,4,8], #top left to lower right diagonal 
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [6,4,2], #bottom left to top right diagonal
  [6,7,8] #bottom row 
  
  ]
  
#won?
  
def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
        board[combo[1]] == board[combo[2]] &&
        position_taken?(board, combo[1])
  end
end
    
#full?

def full?(board)
  board.all?{|played| played != " "}
end

#draw?

def draw?(board)
  full?(board) && !won?(board)
end 

#over?

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

#winner

def winner(board)
  if winner_array = won?(board)
      board[winner_array[0]]
  end
end

#play
def play(board)
  #while over?(board) == false
  until over?(board) || won?(board)
  turn(board)
  end
  if won?(board) == true
      puts "Congratulations #{winner(board)}!"
  elsif draw?(board) == true
      puts "Cat's Game!"
    end
end
